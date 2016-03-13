<?php

set_time_limit(0);

require_once('inc/lib.php');

$seed = make_seed();

try
{
    $board = generate_board($seed);
}
catch (Exception $e)
{
    var_dump($e->getMessage());
}
