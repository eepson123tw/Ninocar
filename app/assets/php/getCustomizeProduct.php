<?php
  include("./Lib/Conn.php");//建立資料庫連線
  $Util = new UtilClass();
  // $data = $_POST;

  //定義裝資料的陣列
  // $dataArr = array(
  //   ':workName' => $data['workName'],
  // );

  $workName = $_POST['workName'];


  //建立SQL，將試著將資料寫入資料庫
  $sql = 'INSERT INTO customize(product_id, board_id, member_id, product_name, product_img, product_price, product_des, product_type) VALUES (1, 9999, 1, :workName, "./assets/img/pic/model.png", 350, "好餓", 0)';
  $statement=$Util->getPDO()->prepare($sql);//目前只輸入一項資料($workName)
  $statement->execute();

?>


