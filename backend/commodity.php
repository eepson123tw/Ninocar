<?php include("head.php") ?>
<title>商品管理</title>
</head>

<body>
    <?php
        include './API/LoginCheck.php';
        include '../app/pages/BackendPage/base.html';
    ?>
    <div class="content">
        <!-- update-button -->
        <div class="update_btn">
            <button><a href="./update.php"><i class="fas fa-upload"></i>上架商品</a></button>
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
                            <th>商品系列</th>
                            <th>商品金額</th>
                            <th>詳細</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>車</td>
                            <td>
                                <img src="../app/assets/img/pic/model.png" alt="">
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <img src="../app/assets/img/pic/model.png" alt="">
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <img src="../app/assets/img/pic/model.png" alt="">
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>