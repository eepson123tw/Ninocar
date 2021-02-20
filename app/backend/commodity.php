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
<title>商品管理</title>
</head>

<body>
    <?php
        include './API/LoginCheck.php';
        include '../pages/BackendPage/base.html';
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
                            <td>
                                <div>車</div>
                            </td>
                            <td>
                                <div class="product_img"><img src="../app/assets/img/pic/model.png" alt=""></div>
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <div class="product_img"><img src="../app/assets/img/pic/model.png" alt=""></div>
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <div class="product_img"><img src="../app/assets/img/pic/model.png" alt=""></div>
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <div class="product_img"><img src="../app/assets/img/pic/model.png" alt=""></div>
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <div class="product_img"><img src="../app/assets/img/pic/model.png" alt=""></div>
                            </td>
                            <td>一般商品</td>
                            <td>車系</td>
                            <td>$200</td>
                            <td><a href="">查看</a></td>
                        </tr>
                        <tr>
                            <td>車</td>
                            <td>
                                <div class="product_img"><img src="../app/assets/img/pic/model.png" alt=""></div>
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