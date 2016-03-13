<?php

set_time_limit(0);

require_once('inc/lib.php');

extract($_REQUEST);

if (!isset($seed) || !is_numeric($seed))
{
    $seed = make_seed();
}

try
{
    $board = generate_board($seed);
    output_json(['board' => $board, 'seed' => $seed, 'version' => BINGO_VERSION]);
}
catch (Exception $e)
{
    output_json(['error' => $e->getMessage()]);
}
