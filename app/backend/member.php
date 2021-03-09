<?php
include("head.php");
include 'LoginCheck.php';

//建立SQL
$sql = "SELECT * FROM member";

//執行
$statement = $Util->getPDO()->prepare($sql);

//給值
$statement->execute();
$data = $statement->fetchAll();

?>
<title>會員管理</title>
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
                            <th>會員編號</th>
                            <th>會員等級</th>
                            <th>會員姓名</th>
                            <th>累積消費</th>
                            <th>註冊日期</th>
                            <th>詳細</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($data as $index => $row) {
                        ?>
                            <tr>
                                <td><?= $row["member_id"] ?></td>
                                <td>
                                    <?php
                                    $level = $row["member_level"];
                                    switch ($level) {
                                        case '1':
                                            $level = "黃金";
                                            break;
                                        case '2':
                                            $level = "白金";
                                            break;
                                        default:
                                            $level = "一般";
                                            break;
                                    }
                                    ?>
                                    <?= $level ?>
                                </td>
                                <td><?= $row["member_name"] ?></td>
                                <td><?= $row["member_cost"] ?></td>
                                <td><?= $row["member_signdate"] ?></td>
                                <td><a href="memberDetail.php?MID=<?= $row["member_id"] ?>">查看</a></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>