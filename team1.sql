-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2021 年 03 月 16 日 10:06
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `team1`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL COMMENT '管理員編號',
  `admin_name` varchar(10) DEFAULT '管理員' COMMENT '管理員名稱',
  `admin_account` varchar(15) NOT NULL COMMENT '管理員帳號',
  `admin_pwd` varchar(15) NOT NULL COMMENT '管理員密碼',
  `admin_photo` varchar(200) DEFAULT NULL COMMENT '大頭貼',
  `admin_signdate` datetime NOT NULL COMMENT '註冊日期（管理員）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_account`, `admin_pwd`, `admin_photo`, `admin_signdate`) VALUES
(1, '管理員', 'ninocar', 'ninocar', NULL, '2021-03-12 15:52:54');

-- --------------------------------------------------------

--
-- 資料表結構 `board`
--

CREATE TABLE `board` (
  `board_id` int(11) NOT NULL COMMENT '留言板編號',
  `board_date` date NOT NULL COMMENT '發佈日期',
  `board_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '留言板狀態（0：預設 1：封鎖）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `board`
--

INSERT INTO `board` (`board_id`, `board_date`, `board_type`) VALUES
(1, '2021-03-12', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `collection`
--

CREATE TABLE `collection` (
  `product_id` int(11) NOT NULL COMMENT '商品編號',
  `collect_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '啟用狀態（0：預設 1：擁有）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL COMMENT '留言編號',
  `board_id` int(11) NOT NULL COMMENT '留言板編號',
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `comment_content` varchar(30) NOT NULL COMMENT '留言內容',
  `comment_date` datetime NOT NULL COMMENT '留言時間',
  `comment_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '留言狀態（0：正常 1：封鎖）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `comment`
--

INSERT INTO `comment` (`comment_id`, `board_id`, `member_id`, `comment_content`, `comment_date`, `comment_type`) VALUES
(1, 1, 1, '被檢舉留言', '2021-03-12 15:52:54', 0),
(2, 1, 3, '正常留言', '2021-03-12 15:52:54', 0),
(3, 1, 2, '測試留言', '2021-03-12 15:52:54', 0),
(4, 1, 3, '妨礙觀感', '2021-03-12 15:52:54', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL COMMENT '折價券編號',
  `coupon_name` varchar(10) NOT NULL COMMENT '折價券名稱',
  `coupon_des` varchar(50) NOT NULL COMMENT '折價券內容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_des`) VALUES
(0, '註冊新會員', '全項商品不限金額結帳九折優惠'),
(1, '黃金會員', '宅配享一次免運優惠'),
(2, '白金會員', '結帳享買一送一'),
(3, '生日優惠', '全項商品不限金額結帳五折優惠');

-- --------------------------------------------------------

--
-- 資料表結構 `customize`
--

CREATE TABLE `customize` (
  `customize_id` int(11) NOT NULL COMMENT '客製商品編號',
  `board_id` int(11) NOT NULL COMMENT '留言板編號',
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `product_spec` tinyint(4) NOT NULL DEFAULT 5 COMMENT '特殊分類（0：一般商品 1：熱門商品  2：本月主打 3：最新商品 4:點數限定  5:客製化商品 ）',
  `product_name` varchar(20) NOT NULL COMMENT '商品名稱',
  `product_img` varchar(500) NOT NULL COMMENT '商品圖（主）',
  `product_price` int(11) DEFAULT NULL COMMENT '商品價格',
  `product_points` int(11) DEFAULT NULL COMMENT '點數售價',
  `customize_part` varchar(500) DEFAULT NULL COMMENT '客製配件',
  `product_des` varchar(200) NOT NULL COMMENT '商品描述',
  `product_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品狀態（0：預設 1：封鎖 2：刪除）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `detail`
--

CREATE TABLE `detail` (
  `order_id` int(11) NOT NULL COMMENT '訂單編號',
  `product_id` int(11) NOT NULL COMMENT '商品編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `member_name` varchar(20) NOT NULL COMMENT '會員姓名',
  `member_account` varchar(65) NOT NULL COMMENT '會員帳號（信箱）',
  `member_pwd` varchar(15) NOT NULL COMMENT '會員密碼',
  `member_gender` int(11) NOT NULL DEFAULT 0 COMMENT '性別（0：預設 1：男 2：女）',
  `member_phone` int(11) DEFAULT NULL COMMENT '聯絡號碼',
  `member_address` varchar(200) DEFAULT NULL COMMENT '聯絡地址',
  `member_cost` int(11) DEFAULT NULL COMMENT '累積消費',
  `member_photo` varchar(200) DEFAULT NULL COMMENT '大頭貼',
  `member_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '會員等級（0：預設一般 1：黃金 2：白金）',
  `member_points` int(11) DEFAULT NULL COMMENT '會員點數',
  `member_birthday` date DEFAULT NULL COMMENT '會員生日',
  `member_signdate` datetime NOT NULL COMMENT '註冊日期',
  `member_upgradedate` datetime DEFAULT NULL COMMENT '最後升等日期',
  `member_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '會員狀態（0：開通 1：封鎖）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`member_id`, `member_name`, `member_account`, `member_pwd`, `member_gender`, `member_phone`, `member_address`, `member_cost`, `member_photo`, `member_level`, `member_points`, `member_birthday`, `member_signdate`, `member_upgradedate`, `member_type`) VALUES
(1, '匿名', 'jackjohnton789@gmail.com', '1234567', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-12 15:52:54', NULL, 0),
(2, '匿名', 'snake830102@gmail.com', '1234567', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-12 15:52:54', NULL, 0),
(3, 'eepson123', 'eepson123@gmail.com', '1234567', 0, NULL, NULL, NULL, NULL, 0, NULL, '2021-02-03', '2021-03-12 15:52:54', '2021-03-16 13:54:17', 0),
(5, 'sdasdasd', 'silvia.huang@gmail.com', '1234567', 0, NULL, NULL, NULL, NULL, 0, NULL, '2020-03-04', '2021-03-16 13:52:18', '2021-03-16 13:52:18', 0),
(6, '汪汪', 'yubi840528@gmail.com', 'wang275186', 0, NULL, NULL, NULL, NULL, 0, NULL, '2010-10-19', '2021-03-16 13:52:29', '2021-03-16 13:52:29', 0),
(7, '匿名', 'chiwei991814@gmail.com', 'Love6671', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-16 13:52:29', '2021-03-16 13:52:29', 0),
(8, '匿名', 'huhantin@gmail.com', 'qweasdzxc', 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-16 14:07:08', '2021-03-16 14:07:08', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `member_coupon`
--

CREATE TABLE `member_coupon` (
  `member_cid` int(11) NOT NULL COMMENT '（無意義）',
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `coupon_id` int(11) NOT NULL COMMENT '折價券編號',
  `type_date` datetime NOT NULL COMMENT '啟用日期',
  `dead_date` datetime NOT NULL COMMENT '到期日期',
  `coupon_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '折價券狀態（0：預設 1：啟用）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `member_coupon`
--

INSERT INTO `member_coupon` (`member_cid`, `member_id`, `coupon_id`, `type_date`, `dead_date`, `coupon_type`) VALUES
(15, 5, 0, '2021-03-16 13:52:18', '2021-03-19 13:52:18', 1),
(16, 7, 0, '2021-03-16 13:52:29', '2021-03-19 13:52:29', 1),
(17, 6, 0, '2021-03-16 13:52:29', '2021-03-19 13:52:29', 1),
(19, 8, 0, '2021-03-16 14:07:08', '2021-03-19 14:07:08', 1),
(20, 5, 3, '2021-03-16 15:55:41', '2022-03-11 15:55:41', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL COMMENT '訂單編號',
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `order_cost` int(11) NOT NULL COMMENT '訂單金額',
  `order_points` int(11) NOT NULL COMMENT '訂單點數',
  `order_gain` int(11) NOT NULL COMMENT '獲得點數',
  `pay_type` tinyint(4) NOT NULL COMMENT '付款方式（0： 貨到付款 1：綠界金流(線上刷卡)  2：門市結帳 3：ATM轉帳  ）',
  `order_type` tinyint(4) NOT NULL COMMENT '訂單狀態（0：成立 1：取消）',
  `deliver_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '貨物狀態（0：處理中 1：出貨中 2：已送達）',
  `order_date` datetime NOT NULL COMMENT '訂單日期',
  `type_date` datetime DEFAULT NULL COMMENT '貨物狀態日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL COMMENT '商品編號',
  `product_name` varchar(20) NOT NULL COMMENT '商品名稱',
  `product_ename` varchar(45) DEFAULT NULL COMMENT '商品英文名稱（可不填）',
  `product_img` varchar(500) NOT NULL COMMENT '商品圖（主右）',
  `product_series` tinyint(4) NOT NULL COMMENT '商品分類（1：工程系 2：RV休旅系 3：計程車系 4:巴士系 5:警車系 6：消防救護系 7：轎車系 8：PREMIUM系）',
  `product_spec` tinyint(4) NOT NULL DEFAULT 0 COMMENT '特殊分類（0：一般商品 1：熱門商品  2：本月主打 3：最新商品 4:點數限定 5:客製化商品 ）',
  `product_seriesid` int(11) NOT NULL COMMENT '分類編號',
  `product_price` int(11) DEFAULT NULL COMMENT '商品價格',
  `product_points` int(11) DEFAULT NULL COMMENT '點數售價',
  `product_des` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `product_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品狀態（0：預設 1：封鎖,未上架 2：刪除）',
  `product_img1` varchar(500) DEFAULT NULL COMMENT '商品圖（去背）',
  `product_img2` varchar(500) DEFAULT NULL COMMENT '商品圖（cover）',
  `product_img3` varchar(500) DEFAULT NULL COMMENT '商品圖（back）',
  `product_img4` varchar(500) DEFAULT NULL COMMENT '商品圖（front）',
  `product_img5` varchar(500) DEFAULT NULL COMMENT '商品圖（box）',
  `product_size` varchar(45) DEFAULT NULL,
  `product_year` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_ename`, `product_img`, `product_series`, `product_spec`, `product_seriesid`, `product_price`, `product_points`, `product_des`, `product_type`, `product_img1`, `product_img2`, `product_img3`, `product_img4`, `product_img5`, `product_size`, `product_year`) VALUES
(1, '三菱夫桑 姬巴士', 'MITSUBISHI AEROQUEEN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-1.png', 4, 0, 1, 330, 0, '專為女性設計的貼心旅遊巴士，主要行走九州地區觀光景點', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-1.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-1.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-1.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-1.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-1.png', '1/156', '2010'),
(2, '豐田考斯特幼稚園巴士', 'Toyota COASTER    ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-2.png', 4, 1, 2, 200, 0, '以安全設計的新型COASTER幼稚園巴士', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-2.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-2.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-2.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-2.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-2.png', '1/89', '2020'),
(3, '雙層倫敦巴士', 'LONDON DOUBLE ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-3.png', 4, 4, 3, 0, 200, '經典雙層倫敦巴士，遊走於倫敦街頭，帶您一看英國的歷史古蹟', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-3.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-3.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-3.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-3.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-3.png', '1/89', '1980'),
(4, '三菱夫桑路線公車', 'MITSUBISHI FUSO ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-4.png', 4, 1, 4, 200, 0, '各大城市皆可以看得見的FUSO公車原車型喔', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-4.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-4.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-4.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-4.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-4.png', '1/141', '2000'),
(5, '日野塞萊加巴士', 'HINO SELEGA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-5.png', 4, 0, 5, 200, 0, '以創建高品質和精緻的大型日野巴士。 其舒適度與安全性皆讓人印象深刻。', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-5.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-5.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-5.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-5.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-5.png', '1/156', '2000'),
(6, '三菱夫桑阪急巴士', 'MITSUBISHI AEROSTAR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-6.png', 4, 4, 6, 0, 200, '運行於大阪地區的巴士，阪急巴士以米色和藍色配色而聞名，同時也是一款環保低排放巴士', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-6.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-6.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-6.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-6.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-6.png', '1/156', '2015'),
(7, '豐田油電新加坡計程車', 'Prius Singapore', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-7.png', 3, 0, 1, 150, 0, '在新加坡街道上出現的豐田PRIUS計程車，以油電混合為主的計程車環保又舒適', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-7.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-7.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-7.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-7.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-7.png', '1/64', '2015'),
(8, '皇冠香港計程車', ' TOYOTA  HONG KONG', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-8.png', 3, 0, 2, 150, 0, '走行香港本島的計程車，紅色的車身，加上外來語迪士，是他的特色', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-8.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-8.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-8.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-8.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-8.png', '1/64', '2010'),
(9, '可樂娜澳門計程車', 'TOYOTA COLLORA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-9.png', 3, 0, 3, 150, 0, '外表看似警車，但在澳門是大街小巷可以看到車影的計程車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-9.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-9.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-9.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-9.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-9.png', '1/64', '2010'),
(10, '日本池田計程車', 'TOYOTA JAPAN B', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-10.png', 3, 1, 4, 150, 0, '走行日本的計程車，典雅的黑色車身讓客人賓至如歸', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-10.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-10.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-10.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-10.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-10.png', '1/64', '1990'),
(11, '日本國民計程車', 'TOYOTA JAPAN W', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-11.png', 3, 0, 5, 150, 0, '日本常見的計程車，穿梭在日本國內街頭，大街小巷', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-11.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-11.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-11.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-11.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-11.png', '1/64', '1990'),
(12, '台灣計程車', 'TOYOTA TAIWAN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-12.png', 3, 3, 6, 150, 0, '走行台灣大街小巷計程車，黃色車身是最明顯的招牌', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-12.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-12.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-12.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-12.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-12.png', '1/64', '2010'),
(13, '本田CRV', 'HONDA CR-V', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-13.png', 2, 4, 1, 0, 150, '安全、舒適是CRV的長久基礎優勢，重視家庭帶來嶄新價值', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-13.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-13.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-13.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-13.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-13.png', '1/61', '2000'),
(14, '三菱帕加洛', 'MITSUBISHI PAJERO JR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-14.png', 2, 4, 2, 0, 150, '簡潔且實用的越野SUV，專注越野能耐的休旅車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-14.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-14.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-14.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-14.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-14.png', '1/56', '1996'),
(15, '鈴木居米', 'SUZUKI JIMNY', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-15.png', 2, 0, 3, 150, 0, '走越野感風格的小型4WD，復古且方正的JIMNY登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-15.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-15.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-15.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-15.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-15.png', '1/64', '2019'),
(16, '馬自達CX5', 'MAZDA CX5', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-16.png', 2, 3, 4, 150, 0, '設計及質感上展現超越以往的CX5，魂動設計，秉持「less is more」的日式哲學', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-16.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-16.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-16.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-16.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-16.png', '1/64', '2018'),
(17, '速霸陸森林人', 'SUBARU FORESTER', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-17.png', 2, 3, 5, 150, 0, '以運動為主打的跨界休旅車，車名「Forester」，源自英語「森林孕育之人」意義喔', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-17.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-17.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-17.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-17.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-17.png', '1/64', '2018'),
(18, '小松製作挖土機', ' KOMATSU EXCAVATOR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-18.png', 1, 1, 1, 150, 0, '重量級40頓的挖土機，在各大工事場地都能看見它的身影喔\n開啟螢幕閱讀器支援功能', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-18.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-18.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-18.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-18.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-18.png', '1/64', '2009'),
(19, '災害用挖土機', 'EXCAVATOR GRAPPLE', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-19.png', 1, 0, 2, 150, 0, '以災難防治為主軸設計的挖土機，換上抓斗，方便抓緊形體有限的物品。', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-19.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-19.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-19.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-19.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-19.png', '1/122', '2017'),
(20, '大型鏟土車', 'TEREX  LOADER', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-20.png', 1, 0, 3, 150, 0, '用於露天採礦，大量儲存和大型土石工程的裝載機。', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-20.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-20.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-20.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-20.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-20.png', '1/132', '1980'),
(21, '豐田堆高機', 'TOYOTA FD200', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-21.png', 1, 4, 4, 0, 200, '豐田第一款工作用堆高機，堅固耐用', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-21.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-21.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-21.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-21.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-21.png', '1/120', '1980'),
(22, '一汽解放J6', 'FAW JIEFANG J6', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-22.png', 1, 0, 5, 150, 0, '中國一汽汽車產的砂石車輛，後斗有著載運龐大的砂石卡車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-22.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-22.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-22.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-22.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-22.png', '1/100', '2000'),
(23, '小松製作推土機', 'CATERPILLAR TRACK', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-23.png', 1, 3, 6, 150, 0, '重量級40頓的挖土機，在各大工事場地都能看見它的身影喔', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-23.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-23.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-23.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-23.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-23.png', '1/139', '2007'),
(24, '台灣水泥預拌車', 'T\'CEMENT MIXER CAR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-24.png', 1, 3, 7, 150, 0, '台灣水泥預拌車登場，亮眼造型奔馳於國道5號', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-24.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-24.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-24.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-24.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-24.png', '1/150', '2007'),
(25, '日產福卡車', 'NISSAN FUGA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-25.png', 7, 1, 1, 150, 0, '日產高規格經典房車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-25.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-25.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-25.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-25.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-25.png', '1/67', '2010'),
(26, '豐田皇冠車', 'TOYOTA CROWN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-26.png', 7, 0, 2, 150, 0, '豐田皇冠第五代轎車登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-26.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-26.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-26.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-26.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-26.png', '1/66', '2010'),
(27, '馬自達MX-5', 'MAZDA MX-5', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-27.png', 7, 2, 3, 150, 0, '馬自達第一款敞篷車登場', 1, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-27png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-27.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-27.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-27.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-27.png', '1/67', '2010'),
(28, '豐田凱美瑞', 'TOYOTA CAMRY', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-28.png', 7, 2, 4, 150, 0, '平價省油的都市轎車', 1, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-28.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-28.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-28.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-28.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-28.png', '1/67', '2010'),
(29, '凌志IS 350', 'LEXUS IS 350 F SPORT', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-29.png', 7, 2, 5, 150, 0, '凌志高性能轎跑車', 1, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-29.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-29.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-29.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-29.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-29.png', '1/67', '2010'),
(30, '豐田皇冠', 'TOYOTA athlete', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-30.png', 7, 1, 6, 150, 0, '豐田豪華舒適的高級房車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-30.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-30.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-30.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-30.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-30.png', '1/65', '2010'),
(31, '日產天際線', 'NISSAN SKYLINE', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-31.png', 7, 3, 7, 150, 0, '日產高級轎跑車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-31.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-31.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-31.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-31.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-31.png', '1/65', '2010'),
(32, '豐田救護車', 'TOYOTA HIMEDIC', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-32.png', 6, 0, 1, 250, 0, '豐田多功能救護車登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-32.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-32.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-32.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-32.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-32.png', '1/64', '2010'),
(33, '日產救護車', 'NISSAN HIMEDIC CAR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-33.png', 6, 0, 2, 250, 0, '穿梭日本街頭的日產高規格救護車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-33.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-33.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-33.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-33.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-33.png', '1/65', '2000'),
(34, '機場化學消防車', 'TOKYU FIRE TRUCK', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-34.png', 6, 0, 3, 250, 0, '機場專用救援化學消防車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-34.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-34.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-34png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-34.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-34.png', '1/65', '2010'),
(35, '日野消防車', 'HINO FIRECAR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-35.png', 6, 4, 4, 0, 250, '日野小型化學消防車登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-35.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-35.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-35.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-35.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-35.png', '1/64', '1980'),
(36, '豐田救護消防車', 'TOYOTA FIRECAR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-36.png', 6, 0, 5, 250, 0, '日本多功能救護消防兩用車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-36.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-36.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-36.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-36.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-36.png', '1/65', '2010'),
(37, '日野消防車', 'HINO FIRECAR', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-37.png', 6, 3, 6, 250, 0, '日野老式兩階段消防車登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-37.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-37.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-37.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-37.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-37.png', '1/64', '1970'),
(38, '福斯皮卡麵包車', 'VOLKSWAGEN PICKUP', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-38.png', 8, 0, 1, 450, 0, '經典福斯改裝廂式多功能麵包車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-38.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-38.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-38.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-38.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-38.png', '1/65', '1970'),
(39, '日產天際線賽車式樣', 'Nissan Skyline', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-39.png', 8, 1, 2, 500, 0, 'Silhouette，不管是外型，力量，在在都展現著獨特囂張的美學。', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-39.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-39.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-39.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-39.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-39.png', '1/65', '1980'),
(40, '豐田86GRMN', 'TOYOTA 86GRMN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-40.png', 8, 0, 3, 500, 0, 'GAZOO RACING 所推出的限量特仕版86，日本全國限量 100 台', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-40.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-40.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-40.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-40.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-40.png', '1/59', '2018'),
(41, '藍寶堅尼Countach', 'LAMBORGHINI LP500S', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-41.png', 8, 0, 4, 500, 0, '中置引擎超級跑車，有著跨時空的前衛感', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-41.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-41.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-41.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-41.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-41.png', '1/141', '1970'),
(42, '凱迪拉克·埃爾多拉多', ' CADILLAC ELDORADO', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-42.png', 8, 4, 5, 0, 400, '凯迪拉克經典寬大奢華的夢幻車型', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-42.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-42.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-42.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-42.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-42.png', '1/64', '1970'),
(43, '速霸陸挑戰仕樣', 'SUBARU WRX ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-43.png', 8, 1, 6, 450, 0, '2014年 NURBURGRING 耐久賽冠軍車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-43.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-43.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-43.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-43.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-43.png', '1/156', '2010'),
(44, '法拉利 512BB', 'FERRARI 512BB', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-44.png', 8, 4, 7, 0, 400, '1970 FERRARI 旗艦超級跑車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-44.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-44.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-44.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-44.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-44.png', '1/62', '1970'),
(45, '奧斯頓馬丁DB5', 'Aston Martin DB5', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-45.png', 8, 0, 8, 450, 0, 'DB5是知名電影007的座駕', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-45.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-45.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-45.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-45.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-45.png', '1/56', '1970'),
(46, '保時捷911 卡雷雅RS2.7', 'PORSCHE 911 ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-46.png', 8, 3, 9, 500, 0, '975公斤車重配上210匹馬力輸出，成為該時期最具代表性的輕量化超跑', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-46.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-46.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-46.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-46.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-46.png', '1/62', '1970'),
(47, '法拉利 德斯塔羅薩', ' FERRARI TESTAROSSA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-47.png', 8, 3, 10, 500, 0, '1980 FERRARI 經典超級跑車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-47.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-47.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-47.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-47.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-47.png', '1/61', '1980'),
(48, '三菱EVO III', 'MITSUBISHI  EVOLUTION', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-48.png', 8, 3, 11, 500, 0, '第三代EVO引擎性能及空氣動力學提升再進化', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-48.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-48.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-48.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-48.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-48.png', '1/61', '1990'),
(49, '保時捷911 德國警車', 'PORSCHE Germany \n ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-49.png', 5, 1, 1, 350, 0, '1970年代經典保時捷警車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-49.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-49.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-49.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-49.png', '', '1/65', '1970'),
(50, '豐田LAND CRUISER 英國警車', 'TOYOTA LAND ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-50.png', 5, 0, 2, 350, 0, '豐田越野SUV英國警察仕樣', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-50.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-50.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-50.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-50.png', '', '1/60', '2010'),
(51, '道奇 美國紐澤西州警車', 'DODGE  AMERCIAN ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-51.png', 5, 0, 3, 350, 0, '美國紐澤西州警察初登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-51.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-51.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-51.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-51.png', '', '1/65', '1980'),
(52, '豐田 PRIUS 香港警車', 'TOYOTA  HONG KONG ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-52.png', 5, 4, 4, 0, 200, '香港油電混合警車初登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-52.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-52.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-52.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-52.png', '', '1/64', '2010'),
(53, '豐田威爾法 西班牙警車', 'TOYOTA  SPAIN ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-53.png', 5, 2, 5, 350, 0, '多功能西班牙巡邏警車登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-53.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-53.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-53.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-53.png', '', '1/64', '2010'),
(54, '馬自達日本警車', 'MAZDA  JAPAN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-54.png', 5, 2, 6, 350, 0, '1980年世界上第一輛RE警車登場', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-54.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-54.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-54.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-54.png', '', '1/66', '1980'),
(55, '速霸陸義大利警車', 'SUBARU ITALY ', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-55.png', 5, 2, 7, 350, 0, '義大利第一輛速霸陸警車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background55.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-55.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-55.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-55.png', '', '1/62', '2015'),
(56, '日產波蘭警車', 'NISSAN POLAND', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-56.png', 5, 2, 8, 350, 0, '波蘭多功能警察車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-56.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-56.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-56.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-56.png', '', '1/62', '2010'),
(57, '雪佛蘭美國道路警車', 'CHEVROLET USA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-57.png', 5, 2, 9, 500, 0, '美國高速道路警車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-57.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-57.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-57.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-57.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-57.png', '1/61', '2010'),
(58, '三菱英國警察車', 'MITSUBISHI UK', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-58.png', 5, 2, 10, 450, 0, '英國漢柏賽郡巡邏警車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-58.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-58.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-58.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-58.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-58.png', '1/61', '2010'),
(59, '本田NSX日本警察車', 'NSX JAPAN POLICE', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-59.png', 5, 2, 11, 450, 0, '日本櫪木縣警察仕樣', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-59.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-59.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-59.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-59.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-59.png', '1/56', '1990'),
(60, '藍寶堅尼美國高速警車', '\nLamborghini USA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-60.png', 5, 2, 12, 450, 0, '美國州際公路巡邏警察車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-60.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-60.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-60.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-60.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-60.png', '1/56', '2020'),
(61, '五十鈴交通宣導車', 'ISUZU PROPAGANDA', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-61.png', 5, 2, 13, 450, 0, '街道交通安全宣導告示', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-61.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-61.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-61.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-61.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-61.png', '1/56', '2020'),
(62, '豐田油電英國警車', 'TOYOTA UK', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-62.png', 5, 2, 14, 450, 0, '油電混合環保警車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-62.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-62.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-62.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-62.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-62.png', '1/61', '2010'),
(63, '豐田越野大腳警車', 'TOYOTA JAPAN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-63.png', 5, 2, 15, 450, 0, '日本高地巡邏警車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-63.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-63.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-63.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-63.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-63.png', '1/61', '2000'),
(64, '台灣三菱EVO警車', 'MITSUBISHI TAIWAN', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/right-mini/right-64.png', 5, 2, 16, 450, 0, '台灣警察式樣車', 0, 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/nobg-mini/no-background-64.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/cover-mini/cover-64.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/back-mini/back-64.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/front-mini/front-64.png', 'https://raw.githubusercontent.com/WeiLin18/nino-pic/master/box-mini/box-64.png', '1/56', '2010'),
(65, '蓮霧箱型車', 'CUSTOMIZED PRODUCT', '', 8, 5, 22432, 400, NULL, 'sfdfasdasd', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '天竺鼠消防車', 'CUSTOMIZED PRODUCT', '', 8, 5, 111220, 450, NULL, '123', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '天竺鼠消防車', 'CUSTOMIZED PRODUCT', '', 8, 5, 333323, 470, NULL, '123', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '犀牛消防車', 'CUSTOMIZED PRODUCT', '', 8, 5, 113121, 470, NULL, 'aaa', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '天竺鼠公車', 'CUSTOMIZED PRODUCT', '', 8, 5, 11112, 350, NULL, 'aaa asdf sd sdf sdf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '天竺鼠轎車', 'CUSTOMIZED PRODUCT', '', 8, 5, 112221, 450, NULL, 'sad fasd sdf asdf ', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '白襪貓警車', 'CUSTOMIZED PRODUCT', '', 8, 5, 113213, 270, NULL, 'd d asdf asdf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `reply`
--

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL COMMENT '回覆編號',
  `comment_id` int(11) NOT NULL COMMENT '留言編號',
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `reply_content` varchar(100) NOT NULL COMMENT '回覆內容',
  `reply_date` date NOT NULL COMMENT '回覆時間',
  `reply_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '回覆狀態（0：預設 1：封鎖）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 資料表索引 `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`board_id`);

--
-- 資料表索引 `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `board_id` (`board_id`),
  ADD KEY `member_id2` (`member_id`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- 資料表索引 `customize`
--
ALTER TABLE `customize`
  ADD PRIMARY KEY (`customize_id`),
  ADD KEY `board_id2` (`board_id`),
  ADD KEY `member_id4` (`member_id`);

--
-- 資料表索引 `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id4` (`product_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- 資料表索引 `member_coupon`
--
ALTER TABLE `member_coupon`
  ADD PRIMARY KEY (`member_cid`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id5` (`member_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `member_id3` (`member_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理員編號', AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customize`
--
ALTER TABLE `customize`
  MODIFY `customize_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客製商品編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號', AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member_coupon`
--
ALTER TABLE `member_coupon`
  MODIFY `member_cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '（無意義）', AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '訂單編號', AUTO_INCREMENT=9847073;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品編號', AUTO_INCREMENT=73;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `reply`
--
ALTER TABLE `reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回覆編號';

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- 資料表的限制式 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`),
  ADD CONSTRAINT `member_id2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `customize`
--
ALTER TABLE `customize`
  ADD CONSTRAINT `board_id2` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`),
  ADD CONSTRAINT `member_id4` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `product_id4` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- 資料表的限制式 `member_coupon`
--
ALTER TABLE `member_coupon`
  ADD CONSTRAINT `coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`),
  ADD CONSTRAINT `member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `member_id5` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `reply`
--
ALTER TABLE `reply`
  ADD CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  ADD CONSTRAINT `member_id3` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
