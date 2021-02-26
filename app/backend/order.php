<?php
    include("head.php");
    include 'LoginCheck.php';

    //建立SQL
    $sql = "SELECT * FROM `order`";

    //執行
    $statement = $Util->getPDO()->prepare($sql);

    //給值
    $statement->execute();
    $data = $statement->fetchAll();

?>
<title>訂單管理</title>
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
                            <th>訂單編號</th>
                            <th>訂單日期</th>
                            <th>會員編號</th>
                            <th>訂單金額</th>
                            <th>訂單點數</th>
                            <th>詳細</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                        foreach($data as $index => $row){
                    ?>
                        <tr>
                            <td><?=$row["order_id"] ?></td>
                            <td><?=$row["order_date"] ?></td>
                            <td><?=$row["member_id"] ?></td>
                            <td><?=$row["order_cost"] ?></td>
                            <td><?=$row["order_points"] ?></td>
                            <td><a href="orderCheck.php?PID=<?=$row["order_id"] ?>">查看</a></td>
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