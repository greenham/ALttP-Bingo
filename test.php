<?php
require_once('inc/lib.php');

$board = generate_board(make_seed());
echo var_dump($board); die;