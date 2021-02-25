<?php
    include("head.php");
    include 'LoginCheck.php';

    //建立SQL
    $sql = "SELECT * FROM team1.product";

    //執行
    $statement = $Util->getPDO()->prepare($sql);

    //給值
    $statement->execute();
    $data = $statement->fetchAll();
?>
<title>上架頁</title>
</head>

<body>
    <?php
        include '../../app/pages/BackendPage/base.html';
    ?>
    <div class="content">
        <div class="block-responsive">
            <main>
                <form method="post" action="ProductCreateR.php" enctype="multipart/form-data">
                    <div class="update mb-3">
                        <p>商品名稱：</p>
                        <input type="text" name="name">
                    </div>
                    <div class="update mb-3">
                        <p>商品名稱(英)：</p>
                        <input type="text" name="ename">
                    </div>
                    <div class="update mb-3">
                        <p>商品主圖：</p>
                        <input type="file" name="img">
                    </div>
                    <div class="update mb-3">
                        <p>商品狀態：</p>
                        <select name="productType" id="">
                            <option value="0">預設</option>
                            <option value="1">未上架</option>
                            <option value="2">刪除</option>
                        </select>
                    </div>
                    <div class="update mb-3">
                        <p>商品金額：</p>
                        <input type="text" name="price">
                    </div>
                    <div class="update mb-3">
                        <p>商品點數：</p>
                        <input type="text" name="point">
                    </div>
                    <div class="update mb-3">
                        <p>商品分類：</p>
                        <select name="category" id="">
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
                        <p>商品分類編號：</p>
                        <input type="text" name="cateId">
                    </div>
                    <div class="update mb-3">
                        <p>商品分類二：</p>
                        <select name="category2" id="">
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
                        <input type="file" name="imgBg" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品封面：</p>
                        <input type="file" name="imgCover" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品（後）：</p>
                        <input type="file" name="imgBack" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品（前）：</p>
                        <input type="file" name="imgFront" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品（盒）：</p>
                        <input type="file" name="imgBox" multiple>
                    </div>
                    <div class="update mb-3">
                        <p>商品尺寸：</p>
                        <input type="text" name="size">
                    </div>
                    <div class="update mb-3">
                        <p>商品年份：</p>
                        <input type="text" name="year">
                    </div>
                    <div class="update mb-3">
                        <p>商品描述：</p>
                        <textarea name="des" id="" cols="30" rows="10"></textarea>
                    </div>

                    <div class="update mb-5">
                        <button type="submit" class="">送出</button>
                    </div>
                </form>
            </main>
            <div class="img-preview">
                <img src="../assets/img/pic/userPic03.png">
            </div>
        </div>
    </div>
</body>

</html>