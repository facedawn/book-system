<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="css/Home.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <title>管理员主页</title>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<header id="header"></header>
<body style=" background-repeat:no-repeat ;
      background-size:100% 100%;
      background-attachment: fixed;">
<div class="content">
    <div class="container">
        <div class="owl-carousel slide-one-item">
            <div class="d-md-flex testimony-29101 align-items-stretch">
                <div class="image" style=" margin-left: 5%;margin-right: 5%;">
                    <img src="img/BriefHistoryTime.jpg" style="width: 100%; max-height: 500px">
                </div>
                <div class="text" style="background-color: rgba(255,255,255,0.7);border-radius: 10px">
                    <h3 style="color: #0f6674; font-family: 'Heiti SC',serif">书籍概要：</h3>
                    <p style="color: #000000;font-family: 'Heiti SC',serif">《时间简史》讲述是探索时间和空间核心秘密的故事，是关于宇宙本性的最前沿知识，包括我们的宇宙图像、空间和时间、膨胀的宇宙不确定性原理、基本粒子和自然的力、黑洞、黑洞不是这么黑、时间箭头等内容。第一版中的许多理论预言，后来在对微观或宏观宇宙世界观测中得到证实。</p>
                    <p style="color: #000000;font-family: 'Heiti SC',serif">&ldquo;宇宙正在以我们不可思议的方式运行着，这个是“时间简史”这本书的魅力所在。！ &rdquo;</p>
                </div>
            </div>  <!-- .item -->

            <div class="d-md-flex testimony-29101 align-items-stretch">
                <div class="image" style="margin-left: 5%;margin-right: 5%;">
                    <img src="img/Threebody.jpg" style="width: 100%; max-height: 500px">
                </div>
                <div class="text" style="background-color: rgba(253,253,253,0.7);border-radius: 10px">
                    <h5 style="color: #0f6674; font-family: 'Heiti SC',serif;opacity: 1">书籍概要：</h5>
                    <p style="color: #000000;font-family: 'Heiti SC',serif">&ldquo;文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……
                        四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……
                        人类的末日悄然来临。&rdquo;</p>
                    <p style="color: #000000;font-family: 'Heiti SC',serif">&ldquo;在普遍性、娱乐性、文学性这‘三体’重力绝妙平衡的拉格朗日点上诞生的、奇迹性的‘超级不可能科幻小说’！ &rdquo;</p>
                </div>
            </div>  <!-- .item -->
        </div>
    </div>
</div>
</body>
<style>
</style>
<script>
    $(function () {
        $('#header').load('admin_header.html');
    })

    $(function (){
        $('.slide-one-item').owlCarousel({
            center: false,
            autoplayHoverPause: true,
            items: 1,
            loop: true,
            stagePadding: 0,
            margin: 0,
            smartSpeed: 1500,
            autoplay: true,
            pauseOnHover: false,
            dots: true,
            nav: true,
        });
    })
</script>
</html>