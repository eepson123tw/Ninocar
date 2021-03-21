<?php
include("head.php");
include 'logincheck.php';

//建立SQL
$sql = "SELECT * FROM member";

//執行
$statement = $Util->getPDO()->prepare($sql);

//給值
$statement->execute();
$data = $statement->fetchAll();

?>
<title>會員管理</title>
</head>
<script>
    //會員名字搜尋
    $(document).on('click', '.searchButton', function() {
        let textbox = $('.searchTerm').val();
        console.log(textbox);
        $.ajax({
            url: "searchMember.php",
            method: "POST",
            data: {
                'textbox': textbox
            },
            dataType: "text",
            success: function(response) {
                //更新html內容
                document.getElementsByClassName('tbody')[0].innerHTML = response;
                // window.location.reload();
            },
            error: function(exception) {
                alert("發生錯誤: " + exception.status);
            }
        });
    });

    //封鎖 解鎖
    $(document).on('click', '.alert', function() {
        let MID = $(this).parents('tr').children('input')[0].value;
        console.log(MID);
        if (confirm("確定封鎖該會員?")) {
            $.ajax({
                url: "sendBan.php",
                method: "POST",
                data: {
                    'MID': MID,
                },
                dataType: "text",
                success: function(response) {
                    //更新html內容
                    window.location.reload();
                },
                error: function(exception) {
                    alert("發生錯誤: " + exception.status);
                }
            });
        } else {
            return false;
        }
    });
    $(document).on('click', '.return', function() {
        let MID = $(this).parents('tr').children('input')[0].value;
        // console.log(MID);
        if (confirm("確定恢復狀態?")) {
            $.ajax({
                url: "sendUnlock.php",
                method: "POST",
                data: {
                    'MID': MID,
                },
                dataType: "text",
                success: function(response) {
                    //更新html內容
                    window.location.reload();
                },
                error: function(exception) {
                    alert("發生錯誤: " + exception.status);
                }
            });
        } else {
            return false;
        }
    });
</script>

<body>
     @@include('../../app/pages/BackendPage/base.html')
    <div class="content">
        <!-- update-button -->
        <div class="update_btn">
            <div class="wrap">
                <div class="search_bar">
                    <input type="text" class="searchTerm" placeholder="搜尋">
                </div>
                <button type="text" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
        <!-- table -->
        <div class="col-lg-9">
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>會員等級</th>
                            <th>會員姓名</th>
                            <th>會員狀態</th>
                            <th>註冊日期</th>
                            <th>封鎖</th>
                            <th>解鎖</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <?php
                        foreach ($data as $index => $row) {
                        ?>
                            <tr>
                                <td>
                                    <?php
                                    $level = $row["member_level"];
                                    switch ($level) {
                                        case '1':
                                            $level = "黃金";
                                            break;
                                        case '2':
                                            $level = "白金";
                                            break;
                                        default:
                                            $level = "一般";
                                            break;
                                    }
                                    ?>
                                    <?= $level ?>
                                </td>
                                <td><a href="memberDetail.php?MID=<?= $row["member_id"] ?>"><?= $row["member_name"] ?></a></td>
                                <td>
                                    <?php
                                    $type = $row["member_type"];
                                    switch ($type) {
                                        case '1':
                                            $type = "封鎖";
                                            break;
                                        default:
                                            $type = "開通";
                                            break;
                                    }
                                    ?>
                                    <?= $type ?></td>
                                <td><?= $row["member_signdate"] ?></td>
                                <input type="hidden" name="MID" value="<?= $row["member_id"] ?>" />
                                <td><button type="button" class="alert" id="<?= $row["member_id"] ?>"><i class="fas fa-ban"></i></button></td>
                                <td><button type="button" class="return" id="<?= $row["member_id"] ?>"><i class="fas fa-unlock"></i></button></td>
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

</html>/>
        </g>
        <g>
          <path d="M97.356,328.182a10.935,10.935,0,1,0,10.861,10.936A10.941,10.941,0,0,0,97.356,328.182Zm0,4.315a6.627,6.627,0,0,1,6.307,4.764.5.5,0,0,0-.254-.275,13.651,13.651,0,0,0-12.108,0,.5.5,0,0,0-.254.275A6.627,6.627,0,0,1,97.356,332.5Zm-6.447,7.925a.5.5,0,0,0,.414.37l1.209.169a3.555,3.555,0,0,1,2.991,3.011l.168,1.217a.5.5,0,0,0,.3.389A6.655,6.655,0,0,1,90.908,340.423Zm6.447.215a1.521,1.521,0,1,1,1.509-1.519A1.519,1.519,0,0,1,97.356,340.638Zm1.366,4.941a.5.5,0,0,0,.3-.389l.168-1.217a3.557,3.557,0,0,1,2.991-3.011l1.209-.169a.507.507,0,0,0,.416-.37A6.658,6.658,0,0,1,98.721,345.579Z" transform="translate(-23.492 -324.04)" fill="#3f1b0f" />
          <animateTransform attributeName="transform" dur="2s" type="rotate" values="-30 73.8 14.9;30 73.8 14.9;-30 73.8 14.9" additive="sum" repeatCount="indefinite"></animateTransform>
        </g>
      </svg>
      <h1 class="logo__h1">NiNO CAR</h1>
    </a>
    <!-- <h3>NINO CAR</h3> -->
  </div>
  <div class="right_area">
    <a href="logout.php" class="logout_btn">登出</a>
    <!-- <button type="submit" class="btn btn--small">登出</button> -->
  </div>
</header>
<!--header area end-->
<!--mobile navigation bar start-->
<div class="mobile_nav">
  <div class="nav_bar">
    <img src="../assets/img/pic/userPic03.png" class="mobile_profile_image" alt="">
    <!-- <i class="fa fa-bars nav_btn"></i> -->
    <input class="menu-btn" type="checkbox" id="menu-btn" />
    <label class="menu-icon nav_btn" for="menu-btn"><span class="navicon"></span></label>
  </div>
  <div class="mobile_nav_items">
    <a href="commodity.php"><i class="fas fa-car"></i><span>商品管理</span></a>
    <a href="order.php"><i class="fas fa-money-bill"></i><span>訂單管理</span></a>
    <a href="member.php"><i class="fas fa-user-alt"></i><span>會員管理</span></a>
    <a href="comment.php"><i class="fas fa-comment-dots"></i><span>留言管理</span></a>
  </div>
</div>
<!--mobile navigation bar end-->
<!--sidebar start-->
<div class="sidebar">
  <div class="profile_info">
    <img src="../assets/img/pic/userPic03.png" class="profile_image" alt="">
    <h4>管理員</h4>
  </div>
  <a href="commodity.php"><i class="fas fa-car"></i><span>商品管理</span></a>
  <a href="order.php"><i class="fas fa-money-bill"></i><span>訂單管理</span></a>
  <a href="member.php"><i class="fas fa-user-alt"></i><span>會員管理</span></a>
  <a href="comment.php"><i class="fas fa-comment-dots"></i><span>留言管理</span></a>
</div>
<!--sidebar end-->

<!-- <div class="content"></div> -->

<script type="text/javascript">
  $(document).ready(function () {
    $('.nav_btn').click(function () {
      $('.mobile_nav_items').toggleClass('active');
    });
  });
  $(".logo").attr("disabled",true).css("pointer-events","none");
</script>
    <div class="content">
        <!-- update-button -->
        <div class="update_btn">
            <div class="wrap">
                <div class="search_bar">
                    <input type="text" class="searchTerm" placeholder="搜尋">
                </div>
                <button type="text" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
        <!-- table -->
        <div class="col-lg-9">
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>會員等級</th>
                            <th>會員姓名</th>
                            <th>會員狀態</th>
                            <th>註冊日期</th>
                            <th>封鎖</th>
                            <th>解鎖</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <?php
                        foreach ($data as $index => $row) {
                        ?>
                            <tr>
                                <td>
                                    <?php
                                    $level = $row["member_level"];
                                    switch ($level) {
                                        case '1':
                                            $level = "黃金";
                                            break;
                                        case '2':
                                            $level = "白金";
                                            break;
                                        default:
                                            $level = "一般";
                                            break;
                                    }
                                    ?>
                                    <?= $level ?>
                                </td>
                                <td><a href="memberDetail.php?MID=<?= $row["member_id"] ?>"><?= $row["member_name"] ?></a></td>
                                <td>
                                    <?php
                                    $type = $row["member_type"];
                                    switch ($type) {
                                        case '1':
                                            $type = "封鎖";
                                            break;
                                        default:
                                            $type = "開通";
                                            break;
                                    }
                                    ?>
                                    <?= $type ?></td>
                                <td><?= $row["member_signdate"] ?></td>
                                <input type="hidden" name="MID" value="<?= $row["member_id"] ?>" />
                                <td><button type="button" class="alert" id="<?= $row["member_id"] ?>"><i class="fas fa-ban"></i></button></td>
                                <td><button type="button" class="return" id="<?= $row["member_id"] ?>"><i class="fas fa-unlock"></i></button></td>
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