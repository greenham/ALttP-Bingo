<?php

require_once('inc/db.php');

const BINGO_VERSION = "2.0";

function init_db()
{
    global $db_config;

    extract($db_config);

    $db = mysqli_connect($host, $user, $pass, $name);

    if (!$db)
    {
        error_log("Error: Unable to connect to MySQL.");
        error_log("Debugging errno: " . mysqli_connect_errno());
        error_log("Debugging error: " . mysqli_connect_error());
        throw new Exception("Unable to connect to to MySQL: " . mysqli_connect_error());
    }

    return $db;
}

function make_seed()
{
    return mt_rand(100000, 999999);
}

function output_json($data)
{
    $callback = (isset($_GET['callback']) ? $_GET['callback'] : null);
    if ($callback === null)
    {
        header('Content-Type: application/json');
        echo json_encode($data);
        return true;
    }

    header('Content-Type: application/javascript');
    echo $callback . '(' . json_encode($data) . ')';

    return true;
}

function get_goals()
{
    $db = init_db();

    $result = $db->query("SELECT * FROM `goals`");
    if (!$result)
    {
        error_log("Invalid query: " . mysql_error());
        return false;
    }

    $goals = [];
    while ($goal = $result->fetch_object())
    {
        $goals[] = $goal;
    }

    $result->free();

    return $goals;
}

function get_goals_by_difficulty()
{
    $goals = get_goals();
    $goals_grouped = [];

    foreach($goals as $goal)
    {
        $goals_grouped[$goal->difficulty][$goal->id] = $goal;
    }

    return $goals_grouped;
}

function generate_board($seed, $mode = 'normal', $size = 5)
{
    srand($seed);

    $board = [[]];

    $goals = get_goals_by_difficulty();

    // generate a magic square of difficulty ratings
    $magic_square = magic_square($size);

    // @TODO: Populate the board in a more random order instead of L-to-R

    for ($x = 0; $x < $size; $x++)
    {
        for ($y = 0; $y < $size; $y++)
        {
            $difficulty = $magic_square[$x][$y];

            // get a random goal with this difficulty
            $goal = $goals[$difficulty][array_rand($goals[$difficulty])];

            // add it to the board
            $board[$x][$y] = $goal;

            // remove it from the pool
            unset($goals[$difficulty][$goal->id]);
        }
    }

    return $board;
}

/*
## PHP Magic Square (2014)
## Author:  Siamak Aghaeipour Motlagh
## Email:   siamak.aghaeipour@gmail.com
## Website: http://blacksrc.com
*/
function magic_square($size = 5)
{
    if ($size %2 != 0)
    {
        $first = ($size - 1) / 2;
        $min = 2;
        $max = $size * $size;
        $row = 0;
        $col = $first;
        $mt[$row][$col] = 1;
        for ($i = $min; $i <= $max; $i++)
        {
            // save the current point
            $lrow = $row;
            $lcol = $col;

            // find the next point
            $row = $row - 1;
            $col = $col - 1;
            if ($row < 0)
                $row = $size-1;
            if ($col < 0)
                $col = $size-1;

            // if it was not null
            if (isset($mt[$row][$col]))
            {
                $row = $lrow+1;
                $col = $lcol;
            }

            // fill the array
            $mt[$row][$col] = $i;
        }

        // sort the arrays
        ksort($mt);
        for ($i = 0; $i < $size; $i++) {
            ksort($mt[$i]);
        }

        return $mt;
    } else {
        throw new Exception('The algorithm is not ready for even numbers yet!');
    }
}
