<?php
  include("./Conn.php");//建立資料庫連線
  $workName = $_POST['workName'];
  $userNickName = $_POST['userNickName'];
  $inspiration = $_POST['inspiration'];
  $workPrice = $_POST['workPrice'];
  $workPostTime = $_POST['workPostTime'];
  $allIndex = $_POST['allIndex'];

  $Util = new UtilClass();


  if($workName){

    // $sql = 'SELECT * FROM product'; //圖片位置先寫死的，需再改
    $sql = 'INSERT INTO customize(product_id, board_id, member_id, product_name, product_img, product_price, product_des, product_type) VALUES ($allIndex, $workPostTime, ?, $workName, "./assets/img/pic/model.png", $workPrice, $inspiration, 0)';

    // $statement = $pdo->prepare($sql);
    $statement=$Util->getPDO()->prepare($sql);//目前只輸入一項資料($workName)
    $statement->execute();

    // header('Location:./topic.php'); //跳轉到哪
  }
?>
