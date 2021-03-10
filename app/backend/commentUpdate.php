<?php
include("LoginCheck.php");

//取得POST過來的值
$CID = $_POST["CID"];

//建立SQL
$sql = "UPDATE `team1`.`comment` set `comment_type` = 1 WHERE `comment_id` = ?";

//執行
$statement = $Util->getPDO()->prepare($sql);

//給值
$statement->bindValue(1, $CID);
$statement->execute();

require_once("../assets/php/PHPMailer/PHPMailerAutoload.php");

//取得POST過來的值
$MID = $_POST["MID"];

//建立SQL
$sql = "SELECT * FROM member WHERE `member_id` = ?";

//執行
$statement = $Util->getPDO()->prepare($sql);

//給值
$statement->bindValue(1, $MID);
$statement->execute();

$data = $statement->fetchAll();

foreach ($data as $index => $row) {

  $email = $row["member_account"];

  // 產生 Mailer 實體

  $mail = new PHPMailer();

  // 設定為 SMTP 方式寄信

  $mail->IsSMTP();

  // SMTP 伺服器的設定，以及驗證資訊

  $mail->Host = "smtp.gmail.com";

  $mail->Port = 465;

  $mail->SMTPAuth = true;

  $mail->SMTPSecure = 'ssl';

  $mail->SMTPDebug = SMTP::DEBUG_SERVER;

  $mail->SMTPOptions = array(
    'ssl' => array(
      'verify_peer' => false,
      'verify_peer_name' => false,
      'allow_self_signed' => true
    )
  );

  // 信件內容的編碼方式       

  $mail->CharSet = "utf-8";

  // 信件處理的編碼方式

  $mail->Encoding = "base64";

  // SMTP 驗證的使用者資訊

  $mail->Username = "ninocar2021@gmail.com";  //mail的帳號（需要完整的mail帳號，含@後都要填寫）

  $mail->Password = "team1ninocar";  //密碼

  // 信件內容設定  

  $mail->From = "ninocar2021@gmail.com"; //需要與上述的使用者資訊相同mail

  $mail->FromName = "NINO CAR"; //此顯示寄件者名稱

  $mail->Subject = "警告"; //信件主旨

  $mail->Body = "您的留言已被封鎖。<br/>請注意不要發布攻擊性言語或妨礙他人觀感的留言。<br/><br/>感謝配合。";   //信件內容

  $mail->IsHTML(true);


  // 收件人

  $mail->AddAddress($email, "會員"); //此為收件者的電子信箱及顯示名稱

  //寄送
  // $mail->Send()

  // 顯示訊息

  if (!$mail->Send()) {

    echo "Mail error: " . $mail->ErrorInfo;
  } else {

    echo "Mail sent";
  }
}

//導頁
echo "<script>alert('已寄出警告信!'); location.href = 'comment.php';</script>";
