<?php
include("head.php");
include 'LoginCheck.php';

//建立SQL
$sql = "SELECT * FROM product";

//執行
$statement = $Util->getPDO()->prepare($sql);

//給值
$statement->execute();
$data = $statement->fetchAll();

?>
<title>商品管理</title>
</head>

<body>
    <?php
    include '../../app/pages/BackendPage/base.html';
    ?>
    <div class="content">
        <!-- update-button -->
        <div class="update_btn">
            <button><a href="update.php"><i class="fas fa-upload"></i>上架商品</a></button>
        </div>
        <!-- table -->
        <div class="col-lg-9">
            <div class="table-responsive">
                <!-- <button class="update_btn mb-3 ml-3"><i class="fas fa-upload"></i>上架商品</button> -->
                <table>
                    <thead>
                        <tr>
                            <th>商品名稱</th>
                            <th>商品圖示</th>
                            <th>商品分類</th>
                            <th>商品金額</th>
                            <th>商品點數</th>
                            <th>詳細</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($data as $index => $row) {
                        ?>
                            <tr>
                                <td><?= $row["product_name"] ?></td>
                                <td>
                                    <?php
                                    if ($row["product_price"] == 100 && $row["product_points"] == 0) {
                                    ?>
                                        <img src="../../upload/<?= $row['product_img'] ?>" alt="">
                                    <?php
                                    } else {
                                    ?>
                                        <img src="<?= $row['product_img'] ?>" alt="">
                                    <?php
                                    }
                                    ?>
                                </td>
                                <td>
                                    <?php
                                    $series = $row["product_series"];
                                    switch ($series) {
                                        case '1':
                                            $series = "工程系";
                                            break;
                                        case '2':
                                            $series = "RV休旅系";
                                            break;
                                        case '3':
                                            $series = "計程車系";
                                            break;
                                        case '4':
                                            $series = "巴士系";
                                            break;
                                        case '5':
                                            $series = "警車系";
                                            break;
                                        case '6':
                                            $series = "消防救護系";
                                            break;
                                        case '7':
                                            $series = "轎車系";
                                            break;
                                        default:
                                            $series = "PREMIUM系";
                                            break;
                                    }

                                    ?><?= $series ?></td>
                                <td><?= $row["product_price"] ?></td>
                                <td><?= $row["product_points"] ?></td>
                                <td><a href="ProductUpdate.php?PID=<?= $row["product_id"] ?>">查看</a></td>
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