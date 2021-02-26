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
                            <th>留言編號</th>
                            <th>留言板編號</th>
                            <th>會員編號</th>
                            <th>留言時間</th>
                            <th>留言狀態</th>
                            <th>詳細</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                        foreach($data as $index => $row){
                    ?>
                        <tr>
                            <td><?=$row["comment_id"] ?></td>
                            <td><?=$row["board_id"] ?></td>
                            <td><?=$row["member_id"] ?></td>
                            <td><?=$row["comment_date"] ?></td>
                            <td><?=$row["comment_type"] ?></td>
                            <td><a href="">查看</a></td>
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