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
        case 'logout':
            $destroyed = session_destroy();
            if ($destroyed === true)
            {
                output_json(['success' => true]);
            }
            else
            {
                output_json(['error' => "Unable to log out. YOU'RE MINE"]);
            }
            exit;
            break;
    }
}

$goals = get_goals();
$stats = get_goal_stats();

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
        body { background: url('assets/images/debut_dark.png'); }
    </style>
</head>
<body>
    <div class="container well">
        <span class="pull-right" id="top-nav-links">
            <a href="#" class="btn btn-sm btn-default" id="toggle-more-stats-link"><i class="glyphicon glyphicon-tasks"></i> Toggle Stats</a> <a href="#" class="btn btn-sm btn-default logout-link"><i class="glyphicon glyphicon-log-out"></i> Logout</a>
        </span>

        <h2>A Link to the Past Bingo Goals<?= isset($stats['total_goals']) ? " <small>Current Total: {$stats['total_goals']}</small>":''; ?></h2>

        <p class="clearfix"><br></p>

        <div id="stats" class="text-right">
            <?php
                if (!empty($stats))
                {
                    ?>
                    <div id="more-stats" class="row text-center" style="display: none;">
                        <div class="col-md-6">
                            <div id="difficulty-distribution"></div>
                        </div>
                        <div class="col-md-6">
                            <div id="flute-location-distribution"></div>
                        </div>
                    </div>
                    <?
                }
            ?>
        </div>

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
                    <td><input type="number" name="exclusion_group" value="" min="1" max="8" class="form-control input-sm"></td>
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
                            <input type="number" name="exclusion_group" value="<?= $goal->exclusion_group; ?>" min="1" max="8" class="form-control input-sm">
                        </td>
                        <td>
                            <button class="save-goal-btn btn btn-sm btn-default"><i class="glyphicon glyphicon-floppy-disk"></i> Save</button><button class="delete-goal-btn btn btn-xs btn-danger pull-right" title="Delete Goal"><i class="glyphicon glyphicon-trash"></i></button>
                        </td>
                    </tr>
                <? endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

<script type="text/javascript" src="//www.gstatic.com/charts/loader.js"></script>
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

    $('.logout-link').on('click', function (e) {
        if (!confirm("Are you sure you want to log out?")) {
            return false;
        }
        $.post('sgqf.php', {action: 'logout'}, function(data, textStatus, xhr) {
            if (data.success) {
                window.location.href = 'login.php';
            } else if (data.error) {
                alert(data.error);
            }
        });
    });

    $('#toggle-more-stats-link').on('click', function (e) {
        $('#more-stats').toggle();
    });

    <? if (!empty($stats)): ?>

    make_charts();

    function make_charts()
    {
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);
        function drawCharts()
        {
            <? if (!empty($stats['difficulties'])): ?>
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Difficulty');
            data.addColumn('number', 'Frequency');

            data.addRows([
                <? foreach($stats['difficulties'] as $difficulty => $count): ?>
                    ['<?= $difficulty; ?>', <?= $count; ?>],
                <? endforeach; ?>
                ['', 0]
            ]);

            var options = {
                title: 'Difficulty Distribution',
                hAxis: {
                  title: 'Difficulty'
                },
                vAxis: {
                  title: 'Frequency'
                },
                width: 500,
                height: 250
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('difficulty-distribution'));

            chart.draw(data, options);
            <? endif; ?>

            <? if (!empty($stats['exclusion_groups'])): ?>
            var data = google.visualization.arrayToDataTable([
              ['Difficulty', 'Count']<? foreach($stats['exclusion_groups'] as $location => $count): ?>, ['<?= $location; ?>', <?= $count; ?>]<? endforeach; ?>
            ]);
            var options = {
              title: 'Location Distribution',
              width: 500,
              height: 250
            };
            var chart = new google.visualization.PieChart(document.getElementById('flute-location-distribution'));
            chart.draw(data, options);
            <? endif; ?>
        }
    }

    <? endif; ?>

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
