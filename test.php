<?php

require_once('inc/lib.php');

$seed = make_seed();

try
{
    $board = generate_board($seed);
    var_dump($board);
}
catch (Exception $e)
{
    var_dump($e->getMessage());
}
