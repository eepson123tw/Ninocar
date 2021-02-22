<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../dist/assets/css/all.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../../dist/assets/css/pages/backend.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js' integrity='sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.12/vue.js' integrity='sha512-YXLGLsQBiwHPHLCAA9npZWhADUsHECjkZ71D1uzT2Hpop82/eLnmFb6b0jo8pK4T0Au0g2FETrRJNblF/46ZzQ==' crossorigin='anonymous'></script>
<script src="../assets/js/all.js"></script>
<title>上架頁</title>
</head>

<body>
    <?php
        include './API/LoginCheck.php';
        include '../pages/BackendPage/base.html';
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
                <img src="../assets/img/pic/userPic03.png">
            </div>
        </div>
    </div>
</body>

</html>