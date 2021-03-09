<?php


try {
    include("./Lib/Conn.php");
    $Util = new UtilClass();


    $mem_id =  $_POST['ID'];  

  //更新會員累積消費


      // 更新會員擁有點數

    $sql_member_point= "SELECT sum(order_gain) FROM `order` WHERE member_id=? GROUP BY member_id";
    $member_point=$Util->getPDO()->prepare( $sql_member_point);
    $member_point->bindValue(1,$mem_id);
    $member_point->execute();
    $member_current_point = $member_point ->fetch();

    if( $member_current_point){

        print_r ($$member_current_point[0]);

    }

        //抓出全部且依照順序封裝成一個二維陣列
        $data = $statement->fetchAll();
        if($data){
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }
} catch (PDOException $e) {
   echo "Connection failed: " . $e->getMessage();
  }
?>