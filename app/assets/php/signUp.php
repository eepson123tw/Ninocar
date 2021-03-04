<?php
// require_once("phpmailer/PHPMailerAutoload.php");


 try
 {
    include("./Lib/UtilClass.php");
    $Util = new UtilClass();

    // include("./Lib/MemberClass.php");
    // $Member = new MemberClass();

    //建立SQL
    $data = json_decode(file_get_contents("php://input"));
    // print_r($data);
    $mem_email = $data -> account;
    $mem_password = $data -> password;


    $sql = "INSERT INTO member(member_account, member_pwd, member_name, member_signdate) VALUES (?,?,'匿名',NOW())";
    $statement = $Util->getPDO()->prepare($sql);


    $statement->bindValue(1, $mem_email);
    $statement->bindValue(2, $mem_password);
    $statement->execute();
     echo "Connected Successfully";
 }
 catch(PDOException $e)
 {
     echo "Connection failed: ".$e->getMessage();
 }
 
?>
