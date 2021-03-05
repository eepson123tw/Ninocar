<?php
  include("./Conn.php");//建立資料庫連線
  $workName = $_POST['workName'];
  $userNickName = $_POST['userNickName'];
  $inspiration = $_POST['inspiration'];

  $Util = new UtilClass();


  if($workName){

    // $sql = 'SELECT * FROM product';
    $sql = 'INSERT INTO product(product_name, product_img, product_series, product_spec, product_seriesid, product_price, product_des, product_type) VALUES ($workName, "./assets/img/pic/model01.png", 8, 5, 1, 450, $inspiration, 0)';

    // $statement = $pdo->prepare($sql);
    $statement=$Util->getPDO()->prepare($sql);//目前只輸入一項資料($workName)
    $statement->execute();

    // header('Location:./topic.php'); //跳轉到哪
  }
?>

<!-- <html>
<body>

</body>
</html> -->