<?php
 try
 {
    include("./Lib/Conn.php");
    $Util = new UtilClass();

    //建立SQL
    $data = json_decode(file_get_contents("php://input"));
    // print_r($data);
    $mem_email = $data -> account;
    $mem_password = $data -> password;
  

    $sql = "SELECT member_id FROM member WHERE  member_account = ? and member_pwd = ?";
    $statement = $Util->getPDO()->prepare($sql);

   
    $statement->bindValue(1, $mem_email);
    $statement->bindValue(2, $mem_password);
    $statement->execute();
    $data = $statement->fetchAll();

    // 確認是否為會員
    // $sql2 = "SELECT * FROM member WHERE  member_account = ? ";
    // $statement2 = $Util->getPDO()->prepare($sql);
    // $statement2->bindValue(1, $mem_email);
    // $statement2->execute();
    // $data2 = $statement2->fetchAll();

    
    if($data != [] ){
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }else{
        echo '帳號或密碼錯誤';
    }
 }
catch(PDOException $e)
{
    echo "Connection failed: ".$e->getMessage();
}
    // }else if($data == [] && $data2 != []){
    //     echo '帳號或密碼錯誤';
    // }else if($data2 == []){
    //     echo '此帳號未註冊';
    // }
    // $memberID = "";
    // $memberName = "";
    // foreach($data as $index => $row){
    //     $memberID = $row["member_id"];
    //     $memberName = $row["Account"];
    // }

    // //判斷是否有會員資料?
    // if($memberID != "" && $memberName != ""){
    //     include("./Lib/MemberClass.php");
    //     $Member = new MemberClass();
    
    //     //將會員資訊寫入session
    //     $Member->setMemberInfo($memberID, $memberName);

    //     //導回產品頁        
    //     echo "<script>alert('登入成功!'); location.href = 'Product.php';</script>"; 
    // }else{
    //     //跳出提示停留在登入頁
    //     echo "<script>alert('帳號或密碼錯誤!'); location.href = 'Login.php';</script>"; 
    // }

?>
