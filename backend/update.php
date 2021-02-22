<?php include("head.php") ?>
<title>上架頁</title>
</head>

<body>
    <?php
        include './API/LoginCheck.php';
        include '../app/pages/BackendPage/base.html';
    ?>
    <div class="content">
        <div class="block-responsive">
            <main>
                <div class="update mb-3">
                    <p>商品名稱：</p>
                    <input type="text">
                </div>
                <div class="update mb-3">
                    <p>商品名稱(英)：</p>
                    <input type="text">
                </div>
                <div class="update mb-3">
                    <p>商品金額：</p>
                    <input type="text">
                </div>
                <div class="update mb-3">
                    <p>商品分類：</p>
                    <input type="text">
                </div>
                <div class="update mb-3">
                    <p>商品分類二：</p>
                    <input type="text">
                </div>
                <div class="update">
                    <p>商品描述：</p>
                    <input type="textarea">
                </div>
            </main>
            <div class="img-preview">
                <img src="../app/assets/img/pic/userPic03.png">
            </div>
        </div>
    </div>
</body>

</html>