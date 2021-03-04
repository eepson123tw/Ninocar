<?php

$db_host = "127.0.0.1";
// $db_host = "localhost";
$db_user = "root";
$db_pass = "";
$db_select = "team1";

//建立資料庫連線物件
$dsn = "mysql:host=".$db_host.";dbname=".$db_select;

//建立PDO物件，並放入指定的相關資料
$pdo = new PDO($dsn, $db_user, $db_pass);


    $sql = "SELECT * FROM product";

    $statement = $pdo->prepare($sql);
    $statement->execute();

    //抓出全部且依照順序封裝成一個二維陣列
    $data = $statement->fetchAll();
    if($data){
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }
   
?>