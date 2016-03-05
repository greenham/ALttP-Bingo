<?php

require_once('lib.php');

extract($_REQUEST);

if (!isset($seed) || !is_numeric($seed))
{
    $seed = make_seed();
}

try
{
    $board = generate_board($seed);
    output_json(['board' => $board, 'seed' => $seed]);
}
catch (Exception $e)
{
    output_json(['error' => $e->getMessage()]);
}
