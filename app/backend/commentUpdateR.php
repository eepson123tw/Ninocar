<?php
include 'LoginCheck.php';

//取得POST過來的值
$CID = $_POST["CID"]; //留言編號
$commentType = $_POST["commentType"]; //留言狀態

//返回訊息文字
$message = "修改成功!";

//建立SQL
$sql = "UPDATE `team1`.`comment` set `comment_type` = ? WHERE `comment_id` = ?";
