<?php

require_once('inc/lib.php');

if (isset($_POST['action']))
{
    $action = $_POST['action'];
    unset($_POST['action']);

    switch ($action)
    {
        case 'update-goal':
            $id = $_POST['id'];
            unset($_POST['id']);

            $updated = update_goal($id, $_POST);
            if ($updated === true)
            {
                output_json(['success' => true]);
            }
            else
            {
                output_json(['error' => "Unable to update goal!"]);
            }
            exit;
            break;
    }
}

$goals = get_goals();

?>

<!DOCTYPE html>
<html>
<head>
    <title>A Link to the Past Bingo Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" type="image/ico" href="/favicon.ico">
    <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Goal</th>
                    <th>Difficulty</th>
                    <th>Flute</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="name" value="" size="30"></td>
                    <td><input type="number" name="difficulty" value="" min="1" max="25"></td>
                    <td><input type="number" name="nearest_flute_location" value="" min="1" max="8"></td>
                    <td><button class="add-goal-btn btn btn-primary">Add</button></td>
                </tr>
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
                            <button class="save-goal-btn btn btn-default">Save</button>
                        </td>
                    </tr>
                <? endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

<script>
$(function() {
    $('.save-goal-btn').on('click', function (e) {
        var $goalRow = $(this).parents('tr');
        var goalId = $goalRow.data('id');
        var updateData = {action: 'update-goal', id: goalId};

        $.each($goalRow.children('td'), function(index, cell)
        {
            var $input = $(cell).find('input');
            updateData[$input.attr('name')] = $input.val();
        });

        $.post('sgqf.php', updateData, function(data, textStatus, xhr) {
            if (data.error)
            {
                alert(data.error);
                return false;
            }

            // highlight/flash row
            alert('Updated!');
        });
    });
});
</script>

</html>
