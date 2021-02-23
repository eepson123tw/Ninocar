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
                <form method="post" action="ProductCreateR.php" enctype="multipart/form-data">
                    <div class="update mb-3">
                        <p>商品名稱：</p>
                        <input type="text">
                    </div>
                    <div class="update mb-3">
                        <p>商品名稱(英)：</p>
                        <input type="text">
                    </div>
                    <div class="update mb-3">
                        <p>商品主圖：</p>
                        <input type="file" name="file[]" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品金額：</p>
                        <input type="text">
                    </div>
                    <div class="update mb-3">
                        <p>商品點數：</p>
                        <input type="text">
                    </div>
                    <div class="update mb-3">
                        <p>商品分類：</p>
                        <select name="" id="">
                            <option value="">請選擇</option>
                            <option value="0">轎車系</option>
                            <option value="1">工程系</option>
                            <option value="2">RV休旅系</option>
                            <option value="3">計程車系</option>
                            <option value="4">巴士系</option>
                            <option value="5">警車系</option>
                            <option value="6">消防系</option>
                            <option value="7">救護系</option>
                            <option value="8">PREMIUM系</option>
                        </select>
                    </div>
                    <div class="update mb-3">
                        <p>商品分類二：</p>
                        <select name="" id="">
                            <option value="">請選擇</option>
                            <option value="0">一般商品</option>
                            <option value="1">熱門商品</option>
                            <option value="2">本月主打</option>
                            <option value="3">最新商品</option>
                            <option value="4">點數限定</option>
                            <option value="5">客製化商品</option>
                        </select>
                    </div>
                    <div class="update mb-3">
                        <p>商品去背：</p>
                        <input type="file" name="file[]" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品封面：</p>
                        <input type="file" name="file[]" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品（後）：</p>
                        <input type="file" name="file[]" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品（前）：</p>
                        <input type="file" name="file[]" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品（盒）：</p>
                        <input type="file" name="file[]" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品年份：</p>
                        <input type="text">
                    </div>
                    <div class="update mb-3">
                        <p>商品尺寸：</p>
                        <input type="text">
                    </div>
                    <div class="update">
                        <p>商品描述：</p>
                        <textarea name="" id="" cols="30" rows="10"></textarea>
                    </div>
                </form>
            </main>
            <div class="img-preview">
                <img src="../app/assets/img/pic/userPic03.png">
            </div>
        </div>
    </div>
</body>

</html>