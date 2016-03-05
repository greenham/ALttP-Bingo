<?php

require_once('config/db.php');

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
        return false;
    }

    return $db;
}

// seed with microseconds
function make_seed()
{
    list($usec, $sec) = explode(' ', microtime());
    return (float) $sec + ((float) $usec * 100000);
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

function generate_board($seed, $mode = 'normal')
{
    $db = init_db();
    if ($db === false) {
        return false;
    }

    // @TODO: caching
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

    $board = [];

    return $board;
}
