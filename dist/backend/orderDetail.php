<?php
include("head.php");
include 'logincheck.php';

//建立SQL---->訂單----------------------
$sql = "SELECT * FROM `team1`.`order` WHERE `order_id` = ?";
//執行
$statement = $Util->getPDO()->prepare($sql);
//給值
$statement->bindValue(1, $_GET["OID"]);
$statement->execute();
$data = $statement->fetchAll();

?>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>訂單詳細</title>
</head>

<body>

     @@include('../../app/pages/BackendPage/base.html')
  <div class="content">
    <div class="block-responsive">
      <?php
      foreach ($data as $index => $row) {
      ?>
        <main>
          <form method="post" action="orderUpdateR.php" enctype="multipart/form-data">
            <div class="update mb-4">
              <p>訂單日期：</p>
              <input disabled="disabled" type="text" name="date" id="name" value="<?= $row["order_date"] ?>">
            </div>
            <div class="update mb-4">
              <p>會員編號：</p>
              <input disabled="disabled" type="text" name="MID" value="<?= $row["member_id"] ?>">
            </div>
            <div class="update mb-4">
              <p>訂單金額：</p>
              <input disabled="disabled" type="text" name="price" value="<?= $row["order_cost"] ?>">
            </div>
            <div class="update mb-4">
              <p>訂單點數：</p>
              <input disabled="disabled" type="text" name="point" id="price" value="<?= $row["order_points"] ?>">
            </div>
            <div class="update mb-4">
              <p>貨物狀態：</p>
              <select name="deliverType" id="" value="">
                <?php
                $type = $row["deliver_type"];
                switch ($type) {
                  case '1':
                    $type = "出貨中";
                    break;
                  case '2':
                    $type = "已送達";
                    break;
                  default:
                    $type = "處理中";
                    break;
                }
                ?>
                <option value="<?= $row["deliver_type"] ?>"><?= $type ?></option>
                <option value="0">處理中</option>
                <option value="1">出貨中</option>
                <option value="2">已送達</option>
              </select>
            </div>
            <div class="update mb-4">
              <p>貨物狀態：</p>
              <select name="orderType" id="" value="">
                <?php
                $type = $row["order_type"];
                switch ($type) {
                  case '1':
                    $type = "取消";
                    break;
                  default:
                    $type = "成立";
                    break;
                }
                ?>
                <option value="<?= $row["order_type"] ?>"><?= $type ?></option>
                <option value="0">成立</option>
                <option value="1">取消</option>
              </select>
            </div>
            <input type="hidden" name="OID" value="<?= $row["order_id"] ?>" />

            <div class="update mb-5">
              <button type="submit" class="" onclick="return doSubmit();">送出</button>
            </div>
          </form>
        </main>
      <?php
      }
      ?>
    </div>
  </div>
</body>

</html>76,3.808,3,3.808Z" transform="translate(2931.234 1677.165)" fill="#3f1b0f" stroke="rgba(0,0,0,0)" stroke-miterlimit="10" stroke-width="1" />
          </g>
          <path d="M70.215,346.391c0,1.045.156,2.2-.3,2.786-.422.585-1.292.446-2.558.446s-2.068.139-2.49-.446c-.454-.591-.364-1.74-.364-2.786V330.422c0-1.4,1-2.284,3.178-2.284a4.18,4.18,0,0,1,3.892,1.958l7.2,9.927v-8.653c0-1.046-.112-2.2.342-2.785.419-.585,1.248-.447,2.511-.447s2.024-.139,2.446.447a5.163,5.163,0,0,1,.41,2.785v16c0,1.566-1.006,2.35-2.758,2.35a3.937,3.937,0,0,1-3.5-1.862l-8.01-10.545Z" transform="translate(2877.501 1345.877)" fill="#3f1b0f" />
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
    <div class="block-responsive">
      <?php
      foreach ($data as $index => $row) {
      ?>
        <main>
          <form method="post" action="orderUpdateR.php" enctype="multipart/form-data">
            <div class="update mb-4">
              <p>訂單日期：</p>
              <input disabled="disabled" type="text" name="date" id="name" value="<?= $row["order_date"] ?>">
            </div>
            <div class="update mb-4">
              <p>會員編號：</p>
              <input disabled="disabled" type="text" name="MID" value="<?= $row["member_id"] ?>">
            </div>
            <div class="update mb-4">
              <p>訂單金額：</p>
              <input disabled="disabled" type="text" name="price" value="<?= $row["order_cost"] ?>">
            </div>
            <div class="update mb-4">
              <p>訂單點數：</p>
              <input disabled="disabled" type="text" name="point" id="price" value="<?= $row["order_points"] ?>">
            </div>
            <div class="update mb-4">
              <p>貨物狀態：</p>
              <select name="deliverType" id="" value="">
                <?php
                $type = $row["deliver_type"];
                switch ($type) {
                  case '1':
                    $type = "出貨中";
                    break;
                  case '2':
                    $type = "已送達";
                    break;
                  default:
                    $type = "處理中";
                    break;
                }
                ?>
                <option value="<?= $row["deliver_type"] ?>"><?= $type ?></option>
                <option value="0">處理中</option>
                <option value="1">出貨中</option>
                <option value="2">已送達</option>
              </select>
            </div>
            <div class="update mb-4">
              <p>貨物狀態：</p>
              <select name="orderType" id="" value="">
                <?php
                $type = $row["order_type"];
                switch ($type) {
                  case '1':
                    $type = "取消";
                    break;
                  default:
                    $type = "成立";
                    break;
                }
                ?>
                <option value="<?= $row["order_type"] ?>"><?= $type ?></option>
                <option value="0">成立</option>
                <option value="1">取消</option>
              </select>
            </div>
            <input type="hidden" name="OID" value="<?= $row["order_id"] ?>" />

            <div class="update mb-5">
              <button type="submit" class="" onclick="return doSubmit();">送出</button>
            </div>
          </form>
        </main>
      <?php
      }
      ?>
    </div>
  </div>
</body>

</html>