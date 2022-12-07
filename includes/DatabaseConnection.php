<?php
$pdo = new PDO('mysql:host=localhost;dbname=fitin;charset=utf8', 'fitin', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);