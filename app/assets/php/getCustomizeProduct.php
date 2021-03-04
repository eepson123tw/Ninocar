<?php
  include("./Conn.php")//建立資料庫連線
  $workName = $_POST['workName'];

  if($workName > 0){
    $workName = $_POST['workName'];


    //建立SQL，將試著將資料寫入資料庫
    $sql = 'INSERT INTO product(product_name, product_img, product_series, product_spec, product_seriesid, product_price, product_des, product_type) VALUES ("天栗鼠計程車", "./assets/img/pic/model01.png", 8, 5, 1, 450, "這是一隻天栗鼠，這不是一隻天栗鼠，這到底是不是一隻天栗鼠？", 0)';

    $statement = $pdo->prepare($sql);
    $statement->bindValue(1, $workName);
    $statement->execute();

    // header('Location:./topic.php'); //跳轉到哪
  }
?>

<html>
<body>
<form class="giveName" methods="POST">
                        <div class="giveName_left">
                            <p class="description">幫您的作品取個名字</p>
                            <input type="text" class="typeWorkName" name='workName'>
                            <div class="nameTip">
                                <p>餘20字</p>
                                <button class="btn btn--link randomName h5">隨機取名</button>
                            </div>

                            <input type="checkbox" name="" value="">公開此作品

                            <p class="description">使用者暱稱</p>
                            <input type="text" class="typeNickName" name='userName'>
                            <p class="notice">使用者暱稱將會被引用於網站相關留言及連結</p>
                        </div>
                        <div class="giveName_right">
                            <p class="description">描述您的創作靈感</p>
                            <textarea name="" id="" cols="50" rows="10" placeholder="這是我的第一個作品" class="typeInspiration" name='inspiration'></textarea>
                            <p>餘100字</p>
                        </div>
                        <button class="finish">完成</button>
                    </form>
</body>
</html>

