<?php
  $db_host = "localhost";
  $db_user = "root";
  $db_pass = "";
  $db_select = "team1";

  // //依個人電腦sql調整
  // $dsn = "mysql:host=".$db_host.";dbname=".$db_select;
  $dsn="mysql:host=localhost;port=3306;dbname=team1";

  // //建立PDO物件，並放入指定的相關資料
  // $pdo = new PDO($dsn, $db_user, $db_pass);
  $pdo = new PDO($dsn, $db_user);
?>