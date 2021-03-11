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
                    <thead>
                        <tr>
                            <th>留言時間</th>
                            <th>留言板編號</th>
                            <th>會員編號</th>
                            <th>留言內容</th>
                            <th>留言狀態</th>
                            <th>查看</th>
                        </tr>
                    </thead>
                    <form method="post" action="commentUpdate.php" enctype="multipart/form-data">
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
                                    <td><a href="commentUpdate.php?CID=<?= $row["comment_id"] ?>">查看</a></td>
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