<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../dist/assets/css/all.css">
<link rel="stylesheet" href="../../dist/assets/css/pages/backend.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js' integrity='sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.12/vue.js' integrity='sha512-YXLGLsQBiwHPHLCAA9npZWhADUsHECjkZ71D1uzT2Hpop82/eLnmFb6b0jo8pK4T0Au0g2FETrRJNblF/46ZzQ==' crossorigin='anonymous'></script>
<script src="../assets/js/all.js"></script>
<title>後台登入</title>
</head>

<body>
    <div id="app">
        <!-- your code here... -->
    </div>
    <div class="container">
        <div class="row">
            <div class="col-4 col-lg-4 login-body">

                <form class="text-center form-box" method="post" action="./API/LoginR.php">
                    <h1 class="title text-center mb-6 h1">後台入口</h1>

                    <div class="form-input mb-3">
                        <span><i class="fas fa-envelope"></i></span>
                        <input type="account" name="account" placeholder="帳號" value="pdo" tabindex="10" required>
                    </div>

                    <div class="form-input mb-6">
                        <span><i class="fas fa-key"></i></span>
                        <input type="password" name="pwd" placeholder="密碼" value="pdo" tabindex="10" required>
                    </div>

                    <div class="mb-5">
                        <button type="submit" class="btn">登入</button>
                    </div>

                    <a href="../../dist/index.html">回前台首頁</a>

                </form>
            </div>
        </div>

    </div>

</body>


<script>
    new Vue({
        el: '#app',
        data: {
            message: 'Hello, VueJS!',
        },
    });
</script>

</html>