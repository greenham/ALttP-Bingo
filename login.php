<?php

require_once('inc/lib.php');

init_session();

if (isset($_SESSION['admin']))
{
    header('Location: sgqf.php');
}

if (isset($_POST['action']))
{
    $action = $_POST['action'];
    unset($_POST['action']);

    switch($action)
    {
        case 'login':
            $result = check_user_login($_POST['username'], $_POST['password']);
            if ($result === true)
            {
                $_SESSION['admin'] = true;
                output_json(['success' => true]);
            }
            else
            {
                output_json(['error' => 'Invalid login']);
            }
            exit;
            break;
    }
}

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
        body {
          background: url('/assets/images/debut_dark.png');
        }

        .form-signin
        {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading, .form-signin .checkbox
        {
            margin-bottom: 10px;
        }
        .form-signin .checkbox
        {
            font-weight: normal;
        }
        .form-signin .form-control
        {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .form-signin .form-control:focus
        {
            z-index: 2;
        }
        .form-signin input[type="text"]
        {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }
        .form-signin input[type="password"]
        {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
        .account-wall
        {
            margin-top: 20px;
            padding: 40px 0px 20px 0px;
            background-color: #f7f7f7;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        }
        .login-title
        {
            color: #fff;
            font-size: 18px;
            font-weight: 400;
            display: block;
        }
        .profile-img
        {
            width: 96px;
            height: 96px;
            margin: 0 auto 10px;
            display: block;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
        }
        .need-help
        {
            margin-top: 10px;
        }
        .new-account
        {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">ALttP Bingo Admin</h1>
                <div class="account-wall">
                    <img class="profile-img" src="/assets/images/sausage-link.jpg" alt="">
                    <form class="form-signin">
                        <input name="username" type="text" class="form-control" placeholder="Username" required autofocus>
                        <input name="password" type="password" class="form-control" placeholder="Password" required>
                        <input name="action" type="hidden" value="login">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
$(function() {
    $('.form-signin').on('submit', function (e) {
        e.preventDefault();
        $form = $(this);
        $btn = $form.find('button[type="submit"]');
        $btn.attr('disabled', 'disabled');
        $.post('login.php', $(this).serialize(), function(data, textStatus, xhr) {
            $btn.removeAttr('disabled');
            if (data.success)
            {
                window.location.href = 'sgqf.php';
            }
            else if (data.error)
            {
                alert(data.error);
            }
        });
    });
});
</script>

</html>