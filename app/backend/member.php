<?php
include("head.php");
include 'LoginCheck.php';

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
</script>

<body>
    <?php
    include '../../app/pages/BackendPage/base.html';
    ?>
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
                <!-- <button class="update_btn mb-3 ml-3"><i class="fas fa-upload"></i>上架商品</button> -->
                <table>
                    <thead>
                        <tr>
                            <th>會員編號</th>
                            <th>會員等級</th>
                            <th>會員姓名</th>
                            <th>會員狀態</th>
                            <th>註冊日期</th>
                            <th>詳細</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <?php
                        foreach ($data as $index => $row) {
                        ?>
                            <tr>
                                <td><?= $row["member_id"] ?></td>
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
                                <td><?= $row["member_name"] ?></td>
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
                                <td><a href="memberDetail.php?MID=<?= $row["member_id"] ?>">查看</a></td>
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