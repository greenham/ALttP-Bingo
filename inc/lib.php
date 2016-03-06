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

    $result = $db->query("SELECT * FROM `bingo_goals`");
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

function get_goal_stats()
{
    $db = init_db();

    $stats = [];
    $difficulties = 25;
    $flute_locations = 8;

    $select[] = "COUNT(*) AS `total_goals`";
    for($i = 1; $i <= $difficulties; $i++) {
        $select[] = "SUM(CASE WHEN (`difficulty` = {$i}) THEN 1 ELSE 0 END) AS `{$i}_difficulty_count`";
    }

    for($i = 1; $i <= $flute_locations; $i++)
    {
        $select[] = "SUM(CASE WHEN (`nearest_flute_location` = {$i}) THEN 1 ELSE 0 END) AS `{$i}_flute_location_count`";
    }

    $stats_sql = "SELECT ";
    $stats_sql .= implode(', ', $select);
    $stats_sql .= " FROM `bingo_goals`";

    $result = $db->query($stats_sql);
    if (!$result)
    {
        error_log("Invalid query: " . mysql_error());
        return $stats;
    }

    return $result->fetch_assoc();
}

function generate_board($seed, $mode = 'normal', $size = 5)
{
    srand($seed);

    $board = [[]];

    $goals = get_goals_by_difficulty();

    // generate a magic square of difficulty ratings
    $magic_square = magic_square($size);

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

    $transform = rand(0,4);
    switch ($transform)
    {
        case 1:
            $board = reflect_diaganol_tlbr($board);
            break;
        case 2:
            $board = reflect_diaganol_trbl($board);
            break;
        case 3:
            $board = rotate_clockwise($board);
            break;
        case 4:
            $board = rotate_counterclockwise($board);
            break;
    }

    return $board;
}

/*
## PHP Magic Square (2014)
## Author:  Siamak Aghaeipour Motlagh
## Email:   siamak.aghaeipour@gmail.com
## Website: http://blacksrc.com
*/
function magic_square($size = 5, $randomize = true)
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

function reflect_diaganol_tlbr($board)
{
    // change x,y -> y,x for everything except the tlbr diag (0,0, 1,1, 2,2, 3,3, 4,4)
    $swapped = [];
    for ($x = 0; $x < 5; $x++)
    {
        for ($y = 0; $y < 5; $y++)
        {
            if ($x != $y && !in_array("{$x}{$y}", $swapped) && !in_array("{$x}{$y}", $swapped))
            {
                $first = $board[$x][$y];
                $second = $board[$y][$x];

                $board[$x][$y] = $second;
                $board[$y][$x] = $first;

                // don't swap this combo again
                $swapped[] = "{$x}{$y}";
                $swapped[] = "{$y}{$x}";
            }
        }
    }

    return $board;
}

function reflect_diaganol_trbl($board)
{
    $swaps = [
        [[0,3], [1,4]],
        [[0,2], [2,4]],
        [[0,1], [3,4]],
        [[1,2], [2,3]],
        [[1,1], [3,3]],
        [[0,0], [4,4]],
        [[1,0], [4,3]],
        [[2,1], [3,2]],
        [[2,0], [4,2]],
        [[3,0], [4,1]],
    ];

    foreach ($swaps as $swap)
    {
        $first = $board[$swap[0][0]][$swap[0][1]];
        $second = $board[$swap[1][0]][$swap[1][1]];
        $board[$swap[0][0]][$swap[0][1]] = $second;
        $board[$swap[1][0]][$swap[1][1]] = $first;
    }

    return $board;
}

function rotate_clockwise($board)
{
    $new_board = [];
    $row_count = 0;
    for ($y = 0; $y < 5; $y++)
    {
        $new_row = [];
        for ($x = 4; $x >= 0; $x--)
        {
            $new_row[] = $board[$x][$y];
        }
        $new_board[$row_count] = $new_row;
        $row_count++;
    }
    return $new_board;
}

function rotate_counterclockwise($board)
{
    $new_board = [];
    $row_count = 0;
    for ($y = 4; $y >= 0; $y--)
    {
        $new_row = [];
        for ($x = 0; $x < 5; $x++)
        {
            $new_row[] = $board[$x][$y];
        }
        $new_board[$row_count] = $new_row;
        $row_count++;
    }
    return $new_board;
}
