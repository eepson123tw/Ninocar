<?php
 
 
 include("./Lib/UtilClass.php");
 $Util = new UtilClass();
   

    
    $ord_id =  $_POST['ORDER_ID']; 
    $mem_id =  $_POST['ID']; 
    $ord_cost =  $_POST['ORDER_COST']; 
    $ord_points =  $_POST['ORDER_POINTS']; 
    $ord_gain =  $_POST['ORDER_GAIN']; 
    $pay_type =  $_POST['PAY_TYPE']; 

    $sql = "INSERT INTO `team1`.`order`(order_id,member_id,order_cost,order_points,order_gain,
    pay_type,order_type,deliver_type,order_date,type_date) VALUES (?,?,?,?,?,?,0,0,Now(),Now())";
    

    $statement=$Util->getPDO()->prepare($sql);
    $statement->bindValue(1, $ord_id);
    $statement->bindValue(2, $mem_id);
    $statement->bindValue(3, $ord_cost);
    $statement->bindValue(4, $ord_points);
    $statement->bindValue(5, $ord_gain);
    $statement->bindValue(6, $pay_type);
    
    $statement->execute();

    //抓出全部且依照順序封裝成一個二維陣列
    $data = $statement->fetchAll();
 




    echo'新增成功';
   
    



    
?>