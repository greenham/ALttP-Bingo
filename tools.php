<?php

require_once('inc/lib.php');

$password = "testing123";
$salted = salt_password($password);

echo 'password: ' . $salted['salted'];
echo "\r\n";
echo 'salt: ' . $salted['salt'];
