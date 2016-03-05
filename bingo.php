<?php

require_once('lib.php');

extract($_REQUEST);

if (isset($seed) && is_numeric($seed))
{
    $board = generate_board($seed);
    output_json(['board' => $board]);
}

//output_json(['r' => rand(1, 5)]);