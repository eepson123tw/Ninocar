<?php
class UtilClass{

    //取得欲放置的檔案路徑
    function getFilePath()
    {
        //Web根目錄真實路徑
        $ServerRoot = $_SERVER["DOCUMENT_ROOT"];
        return $ServerRoot . "/T1/upload/";
    }

    //取得PDO物件
    function getPDO(){
        // $db_host = "127.0.0.1";
        $db_host = "localhost";
        $db_user = "root";
<<<<<<< HEAD
        $db_pass = "za0000";
=======
        $db_pass = "password";
>>>>>>> gulp
        $db_select = "team1";

        //建立資料庫連線物件
        $dsn = "mysql:host=" . $db_host . ";dbname=" . $db_select;

        //建立PDO物件，並放入指定的相關資料
        // $pdo = new PDO($dsn, $db_user, $db_pass); 心如
        $pdo = new PDO($dsn, $db_user); 

        return $pdo;
    }
}
?>
