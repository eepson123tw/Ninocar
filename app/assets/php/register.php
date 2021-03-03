<?php
require_once("phpmailer/PHPMailerAutoload.php");

include("./Lib/UtilClass.php");
$Util = new UtilClass();

include("./Lib/MemberClass.php");
$Member = new MemberClass();


if (isset($_POST['register'])) {

  $email = $_POST["account"];
  $password = $_POST["password"];
  $repassword = $_POST["repassword"];

  if ($password != $repassword) {
    $errorMsg = "密碼有異，請重新輸入";
  } else {

    //建立SQL
    $sql = "INSERT INTO member(member_account, member_pwd, member_name, member_signdate) VALUES (?,?,'匿名',NOW())";

    //執行
    $statement = $Util->getPDO()->prepare($sql);

    //給值
    $statement->bindValue(1, $_POST["account"]);
    $statement->bindValue(2, $_POST["password"]);
    $statement->execute();

    // 產生 Mailer 實體

    $mail = new PHPMailer();

    // 設定為 SMTP 方式寄信

    $mail->IsSMTP();

    // SMTP 伺服器的設定，以及驗證資訊

    $mail->Host = "smtp.gmail.com";

    $mail->Port = 465;

    $mail->SMTPAuth = true;

    $mail->SMTPSecure = 'ssl';

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

    $mail->AddAddress($email, "新會員"); //此為收件者的電子信箱及顯示名稱

    // 顯示訊息

    if (!$mail->Send()) {

      echo "Mail error: " . $mail->ErrorInfo;
    } else {

      echo "Mail sent";
    }
  }

  echo "<script>alert('註冊成功，請重新登入！'); location.href = '../../index-front.html';</script>";
}
