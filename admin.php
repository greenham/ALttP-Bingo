<?php

require_once('inc/lib.php');

$goals = get_goals();

?>

<!DOCTYPE html>
<html>
<head>
    <title>A Link to the Past Bingo Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" type="image/ico" href="/favicon.ico">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> <!-- jquery -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="assets/style/styles.css">
</head>
<body>
    <div id="wrap">
        <div id="main">
            <div class="container" id="pageContent">
                <table cellpadding="10">
                    <thead>
                        <tr>
                            <th>Goal</th>
                            <th>Difficulty</th>
                            <th>Flute</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <? foreach($goals as $goal): ?>
                            <tr data-id="<?= $goal->id; ?>">
                                <td>
                                    <input type="text" name="name" value="<?= $goal->name; ?>" size="30">
                                </td>
                                <td>
                                    <input type="number" name="difficulty" value="<?= $goal->difficulty; ?>" min="1" max="25">
                                </td>
                                <td>
                                    <input type="number" name="nearest_flute_location" value="<?= $goal->nearest_flute_location; ?>" min="1" max="8">
                                </td>
                                <td>
                                    <button class="save-goal-btn">Save</button>
                                </td>
                            </tr>
                        <? endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
