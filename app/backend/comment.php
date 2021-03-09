<?php
include("head.php");
include 'LoginCheck.php';

//建立SQL
$sql = "SELECT * FROM comment";

//執行
$statement = $Util->getPDO()->prepare($sql);

//給值
$statement->execute();
$data = $statement->fetchAll();

?>
<title>留言管理</title>
</head>

<body>
    <?php
    include '../../app/pages/BackendPage/base.html';
    ?>
    <div class="content">
        <!-- table -->
        <div class="col-lg-9">
            <div class="table-responsive">
                <!-- <button class="update_btn mb-3 ml-3"><i class="fas fa-upload"></i>上架商品</button> -->
                <table>
                    <form method="post" action="commentUpdate.php" enctype="multipart/form-data">
                        <thead>
                            <tr>
                                <th>留言時間</th>
                                <th>留言板編號</th>
                                <th>會員編號</th>
                                <th>留言內容</th>
                                <th>留言狀態</th>
                                <th>警告</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($data as $index => $row) {
                            ?>
                                <tr>
                                    <td><?= $row["comment_date"] ?></td>
                                    <td><?= $row["board_id"] ?></td>
                                    <td><?= $row["member_id"] ?></td>
                                    <td><?= $row["comment_content"] ?></td>
                                    <td>
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
                                        <?= $type ?></td>
                                    <input type="hidden" name="CID" value="<?= $row["comment_id"] ?>" />
                                    <input type="hidden" name="MID" value="<?= $row["member_id"] ?>" />
                                    <td><button type="submit" class="" onclick="return doSubmit();"><i class="fas fa-exclamation-circle"></i></button></td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </form>
                </table>
            </div>
        </div>
    </div>
</body>

</html>