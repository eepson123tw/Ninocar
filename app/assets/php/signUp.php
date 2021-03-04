<?php
// require_once("phpmailer/PHPMailerAutoload.php");


try {
  include("./Lib/UtilClass.php");
  $Util = new UtilClass();

  // include("./Lib/MemberClass.php");
  // $Member = new MemberClass();

  //建立SQL
  $data = json_decode(file_get_contents("php://input"));
  // print_r($data);
  $mem_email = $data->account;
  $mem_password = $data->password;


  $sql = "INSERT INTO member(member_account, member_pwd, member_name, member_signdate) VALUES (?,?,'匿名',NOW())";
  $statement = $Util->getPDO()->prepare($sql);


  $statement->bindValue(1, $mem_email);
  $statement->bindValue(2, $mem_password);
  $statement->execute();
  //  echo "Connected Successfully";
} catch (PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

try {
  $sql = "SELECT member_id FROM member WHERE  member_account = ? and member_pwd = ?";
  $statement = $Util->getPDO()->prepare($sql);


  $statement->bindValue(1, $mem_email);
  $statement->bindValue(2, $mem_password);
  $statement->execute();
  $data = $statement->fetchAll();
  echo json_encode($data, JSON_UNESCAPED_UNICODE);
} catch (PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}



try {
  require_once("./PHPMailer/PHPMailerAutoload.php");
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

  $mail->Subject = "註冊成功"; //信件主旨

  $mail->Body = "恭喜註冊成功！";   //信件內容

  $mail->IsHTML(true);

  // 收件人

  $mail->AddAddress($mem_email, "新會員"); //此為收件者的電子信箱及顯示名稱

  // 顯示訊息

  if (!$mail->Send()) {

    echo "Mail error: " . $mail->ErrorInfo;
  } else {

    //   echo "Mail sent";
  }
} catch (PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
