<?php

require_once('inc/lib.php');

init_session();

if (!isset($_SESSION['admin']))
{
    header('Location: login.php');
}

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
        case 'create-goal':
            try
            {
                $new_goal = create_goal($_POST);
            }
            catch (Exception $e)
            {
                $new_goal === false;
                $error = $e->getMessage();
            }

            if ($new_goal !== false)
            {
                output_json(['success' => true, 'goal' => $new_goal]);
            }
            else
            {
                output_json(['error' => (isset($error) ? $error : "Unable to create new goal!")]);
            }
            exit;
            break;
        case 'delete-goal':
            $id = $_POST['id'];
            $deleted = delete_goal($id);
            if ($deleted === true)
            {
                output_json(['success' => true]);
            }
            else
            {
                output_json(['error' => "Unable to delete goal!"]);
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
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//bootswatch.com/darkly/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <style>
        body { background: url('/assets/images/debut_dark.png'); }
    </style>
</head>
<body>
    <div class="container well">
        <div id="stats" class="pull-right text-right">
            <?php
                $stats = get_goal_stats();

                if (!empty($stats))
                {
                    ?>Total Goals: <strong><?= $stats['total_goals']; ?></strong><?
                }
            ?>
        </div>

        <h2>A Link to the Past Bingo Goals</h2>

        <p class="clearfix"><br></p>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Goal</th>
                    <th>Difficulty</th>
                    <th>Nearest Flute</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="name" value="" size="20" placeholder="New Goal Name" class="form-control input-sm"></td>
                    <td><input type="number" name="difficulty" value="" min="1" max="25" class="form-control input-sm"></td>
                    <td><input type="number" name="nearest_flute_location" value="" min="1" max="8" class="form-control input-sm"></td>
                    <td><button id="add-goal-btn" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-plus"></i> Add Goal</button></td>
                </tr>
                <? foreach($goals as $goal): ?>
                    <tr data-id="<?= $goal->id; ?>">
                        <td>
                            <input type="text" name="name" value="<?= $goal->name; ?>" size="20" class="form-control input-sm">
                        </td>
                        <td>
                            <input type="number" name="difficulty" value="<?= $goal->difficulty; ?>" min="1" max="25" class="form-control input-sm">
                        </td>
                        <td>
                            <input type="number" name="nearest_flute_location" value="<?= $goal->nearest_flute_location; ?>" min="1" max="8" class="form-control input-sm">
                        </td>
                        <td>
                            <button class="save-goal-btn btn btn-sm btn-default">Save</button><button class="delete-goal-btn btn btn-xs btn-danger pull-right" title="Delete Goal"><i class="glyphicon glyphicon-trash"></i></button>
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
        var $btn = $(this);
        var btnText = lock_button($btn);

        var $goalRow = $btn.parents('tr');
        var goalId = $goalRow.data('id');
        var updateData = {action: 'update-goal', id: goalId};

        $.each($goalRow.children('td'), function(index, cell)
        {
            var $input = $(cell).find('input');
            updateData[$input.attr('name')] = $input.val();
        });

        $.post('sgqf.php', updateData, function(data, textStatus, xhr) {
            unlock_button($btn, btnText);

            if (data.error)
            {
                // highlight/flash row
                $goalRow.effect("highlight", {color: "#FF4040"});
                alert(data.error);
                return false;
            }

            // highlight/flash row
            $goalRow.effect("highlight", {color: "#93DB70"});
        });
    });

    $('#add-goal-btn').on('click', function (e) {
        var $btn = $(this);
        var btnText = lock_button($btn);

        var $goalRow = $btn.parents('tr');
        var createData = {action: 'create-goal'};

        $.each($goalRow.children('td'), function(index, cell)
        {
            var $input = $(cell).find('input');
            createData[$input.attr('name')] = $input.val();
        });

        $.post('sgqf.php', createData, function(data, textStatus, xhr) {
            unlock_button($btn, btnText);

            if (data.error)
            {
                alert(data.error);
                return false;
            }

            // just reload the page for now
            alert('Goal added! Page will refresh now.');
            location.reload();

            // @todo add new row after the input row, then clear the input row
            /*$newRow = $goalRow.clone();
            $newRow.attr('data-id', data.new_goal.id);
            $newRow.find('#add-goal-btn')*/

        });
    });

    $('.delete-goal-btn').on('click', function (e) {
        if (!confirm("Are you SURE you want to remove this goal?")) {
            return false;
        }

        var $btn = $(this);
        var btnText = lock_button($btn);

        var $goalRow = $btn.parents('tr');
        var goalId = $goalRow.data('id');
        var deleteData = {action: 'delete-goal', id: goalId};

        $.post('sgqf.php', deleteData, function(data, textStatus, xhr) {
            unlock_button($btn, btnText);

            if (data.error)
            {
                alert(data.error);
                return false;
            }

            // remove this row
            $goalRow.effect("highlight", {color: "#FF4040"}).fadeOut('slow', function (e) {
                $(this).remove();
            });
        });
    });

    function lock_button($btn)
    {
        var originalText = $btn.html();
        $btn.html('...').attr('disabled', 'disabled');
        return originalText;
    }

    function unlock_button($btn, originalText)
    {
        $btn.html(originalText).removeAttr('disabled');
    }
});
</script>

</html>
