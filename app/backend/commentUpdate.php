<?php
include("head.php");
include 'LoginCheck.php';

//建立SQL---->留言----------------------
$sql = "SELECT * FROM `team1`.`comment` WHERE `comment_id` = ?";
//執行
$statement = $Util->getPDO()->prepare($sql);
//給值
$statement->bindValue(1, $_GET["CID"]);
$statement->execute();
$data = $statement->fetchAll();

?>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>留言詳細</title>
</head>

<body>
  <?php
  include '../../app/pages/BackendPage/base.html';
  ?>
  <div class="content">
    <div class="block-responsive">
      <?php
      foreach ($data as $index => $row) {
      ?>
        <main>
          <form method="post" action="commentUpdateR.php" enctype="multipart/form-data">
            <div class="update mb-4">
              <p>留言時間：</p>
              <input disabled="disabled" type="text" name="" id="" value="<?= $row["comment_date"] ?>">
            </div>
            <div class="update mb-4">
              <p>留言板編號：</p>
              <input disabled="disabled" type="text" name="" value="<?= $row["board_id"] ?>">
            </div>
            <div class="update mb-4">
              <p>會員編號：</p>
              <input disabled="disabled" type="text" name="" id="" value="<?= $row["member_id"] ?>">
            </div>
            <div class="update mb-4">
              <p>留言內容：</p>
              <input disabled="disabled" type="text" name="" id="" value="<?= $row["comment_content"] ?>">
            </div>
            <div class="update mb-4">
              <p>留言狀態：</p>
              <select name="memberType" name="commentType" id="" value="">
                <?php
                $type = $row["comment_type"];
                switch ($type) {
                  case '1':
                    $type = "封鎖";
                    break;
                  default:
                    $type = "正常";
                    break;
                }
                ?>
                <option value="<?= $type ?>"><?= $type ?></option>
                <option value="0">正常</option>
                <option value="1">封鎖</option>
              </select>

            </div>
            <input type="hidden" name="CID" value="<?= $row["comment_id"] ?>" />

            <div class="update mb-5">
              <button type="submit" class="" onclick="return doSubmit();">修改</button>
              <a href="sendAlert.php?MID=<?= $row["member_id"] ?>" class="ml-5" onclick="javascript: if(confirm('確定寄送警告信?')){ return true; } else { return false; }">警告</a>
            </div>
          </form>
        </main>
      <?php
      }
      ?>
    </div>
  </div>
</body>

</html>