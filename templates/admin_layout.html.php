<!DOCTYPE html>
<html lang="en">
<head>
    <title>FITIN - Admin/<?=$title?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A place to find local fitness groups">
    <meta name="keywords" content="fitness workout bootcamp social yoga meditation groups">
    <link rel="shortcut icon" href="/images/logo.svg">
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/styles.css" media="screen">
    <link rel="stylesheet" href="css/admin.css" media="screen">
    <link rel="stylesheet" href="css/stylesprint.css" media="print">
</head>
<body>
    <div id="side-nav" class="hide">
        <div class="header">
            <a href="index.php"><img src="images/logo.svg" alt=""></a>
        </div>
        <div class="user">
            <img src="images/users/<?=$user['image']?>" alt="">
            <h2><?=$user['firstname'] . ' ' . $user['lastname']?></h2>
            <p class="dim"><?=$user['email']?></p>
        </div>
        <div class="dashboard">
            <h2>Manage</h2>
            <ul>
                <?php if ($user['permissions'] > 1): ?>
                    <li><a href="index.php?admin/groups" class="<?php if ($title == "Groups") echo "active" ?>"><i class="fa fa-users" aria-hidden="true"></i>
                        Groups</a></li>
                    <li><a href="index.php?admin/events" class="<?php if ($title == "Events") echo "active" ?>"><i class="fa fa-calendar-o" aria-hidden="true"></i>
                        Events</a></li>
                    <li><a href="index.php?admin/achievements" class="<?php if ($title == "Achievements") echo "active" ?>"><i class="fas fa-star" aria-hidden="true"></i>
                        Achievements</a></li>
                    <li><a href="index.php?admin/user_achievements" class="<?php if ($title == "User Achievements") echo "active" ?>"><i class="fas fa-user-plus" aria-hidden="true"></i>
                    User Achievements</a></li>
                <?php endif; ?>
                <?php if ($user['permissions'] > 2): ?>
                    <li><a href="index.php?admin/users" class="<?php if ($title == "Users") echo "active" ?>"><i class="fa fa-user-plus" aria-hidden="true"></i>
                        Users</a></li>
                <?php endif; ?>
                <?php if ($user['permissions'] > 2): ?>
                    <li><a href="index.php?admin/categories" class="<?php if ($title == "Categories") echo "active" ?>"><i class="fas fa-stream" aria-hidden="true"></i>
                        Categories</a></li>
                <?php endif; ?>
            </ul>
        </div>
        <div class="dashboard">
            <h2>Main Site</h2>
            <ul>
                <li><a href="index.php"><i class="fa fa-home" aria-hidden="true"></i>
                    Home</a></li>
                <li><a href="index.php?group/list"><i class="fa fa-users" aria-hidden="true"></i>
                    Groups</a></li>
                <li><a href="index.php?logout"><i class="fa fa-sign-out" aria-hidden="true"></i>
                    Logout</a></li>
            </ul>
        </div>
    </div>
    <nav id="nav" class="center-links">
        <div class="container">
            <a href="javascript:void(0);" class="icon" onclick="navButton()">
                <i class="fa fa-bars"></i>
            </a>
        </div>
    </nav>

    <?=$output?>


    <!-- =======================================================================
    | JAVASCRIPT
    ======================================================================= -->
    <script src="https://kit.fontawesome.com/f4a104139c.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/admin.js"></script>
    <script src="js/form_submission.js"></script>
    <script src="js/fileInput.js"></script>
    <!-- <script src="js/map.js"></script> -->
</body>
</html>