<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<script src="/library/js/jquery.min.js"></script>
<script src="/library/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="/library/js/jquery-3.2.1.js"></script>
<header class="header-area overlay">
    <div class="square_box box_three"></div>
    <div class="square_box box_four"></div>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container">
            <a href="reader_main.html" class="navbar-brand">E-Book-Library</a>

            <button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#main-nav">
                <span class="menu-icon-bar"></span>
                <span class="menu-icon-bar"></span>
                <span class="menu-icon-bar"></span>
            </button>

            <div id="main-nav" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="dropdown">
                        <a href="reader_books.html" class="nav-item nav-link active">图书查询</a>
                    </li>

                    <li><a href="reader_lend_list.html" class="nav-item nav-link">借阅日志</a></li>
                    <li><a href="reader_info.html" class="nav-item nav-link">个人中心</a></li>
                </ul>

            </div>
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="UserDropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown"
                           style="height: 50px">
                            <img alt="" class="img-circle" src="img/book1.jpg" width="30px" height="30px"/>
                            <span style="color: #FFFFFF;font-size: 18px">
                                <i>${USER_SESSION.user_name}</i>
                            </span>
                        </a>
                        <div class="dropdown-menu pull-right"
                             style="background-color: rgba(255,255,255,0.5);width: 320px;overflow: hidden">
                            <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                                <div style="text-align: center">
                                    <img class="img-circle" src="img/book1.jpg"
                                         style="width: 38px;height: 38px;"/>
                                </div>
                                <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                                    <span id="userMail">${USER_SESSION.user_email}</span>
                                </div>
                            </div>

                            <div id="Box" class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                                <div onclick="passwordChange()" class="col-md-4 text-center grid">
                                    <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                                    <p style="padding: 0;margin-top: 6px;margin-bottom: 10px;font-size: 12px">密码修改</p>
                                </div>
                                <div class="col-md-4 text-center grid">
                                    <i class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                                    <p style="padding: 0;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                        消息</p>
                                </div>
                                <div onclick="sign_out()" class="col-md-4 text-center grid">
                                    <i  class="fa fa-sign-out" style="font-size: 25px;line-height: 45px;"></i><p style="padding: 0;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    退出登录</p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

</header>
<style>
    @import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700,800');
    @import url('https://fonts.googleapis.com/css?family=Lobster');
    html {
        font-size: 62.5%;
    }
    body {
        font-family: 'Open Sans', sans-serif;
        font-size: 1.6rem;
        font-weight: 400;
        background: #000e29;
    }
    h1 {
        margin-bottom: 0.5em;
        font-size: 3.6rem;
    }
    p {
        margin-bottom: 0.5em;
        font-size: 1.6rem;
        line-height: 1.6;
    }
    .overlay::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        top: 0;
        background-color: rgba(0, 0, 0, .3);
    }
    .header-area {
        position: relative;
        height: 8vh;
        background: #5bc0de no-repeat fixed center center;
        background-size: cover;
    }
    .banner h1 {
        font-weight: 800;
    }
    .banner p {
        font-weight: 700;
    }
    .navbar {
        position: absolute;
        left: 0;
        top: 0;
        padding: 0;
        width: 100%;
        transition: background 0.6s ease-in;
        z-index: 99999;
    }
    .navbar .navbar-brand {
        font-family: 'Lobster', cursive;
        font-size: 2.5rem;
    }
    .navbar .navbar-toggler {
        position: relative;
        height: 50px;
        width: 50px;
        border: none;
        cursor: pointer;
        outline: none;
    }
    .navbar .navbar-toggler .menu-icon-bar {
        position: absolute;
        left: 15px;
        right: 15px;
        height: 2px;
        background-color: #fff;
        opacity: 0;
        -webkit-transform: translateY(-1px);
        -ms-transform: translateY(-1px);
        transform: translateY(-1px);
        transition: all 0.3s ease-in;
    }
    .navbar .navbar-toggler .menu-icon-bar:first-child {
        opacity: 1;
        -webkit-transform: translateY(-1px) rotate(45deg);
        -ms-sform: translateY(-1px) rotate(45deg);
        transform: translateY(-1px) rotate(45deg);
    }
    .navbar .navbar-toggler .menu-icon-bar:last-child {
        opacity: 1;
        -webkit-transform: translateY(-1px) rotate(135deg);
        -ms-sform: translateY(-1px) rotate(135deg);
        transform: translateY(-1px) rotate(135deg);
    }
    .navbar .navbar-toggler.collapsed .menu-icon-bar {
        opacity: 1;
    }
    .navbar .navbar-toggler.collapsed .menu-icon-bar:first-child {
        -webkit-transform: translateY(-7px) rotate(0);
        -ms-sform: translateY(-7px) rotate(0);
        transform: translateY(-7px) rotate(0);
    }
    .navbar .navbar-toggler.collapsed .menu-icon-bar:last-child {
        -webkit-transform: translateY(5px) rotate(0);
        -ms-sform: translateY(5px) rotate(0);
        transform: translateY(5px) rotate(0);
    }
    .navbar-dark .navbar-nav .nav-link {
        position: relative;
        color: #fff;
        font-size: 1.6rem;
    }
    .navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover {
        color: #fff;
    }
    .navbar .dropdown-menu {
        padding: 0;
        background-color: rgba(0, 0, 0, .9);
    }
    .navbar .dropdown-menu .dropdown-item {
        position: relative;
        padding: 10px 20px;
        color: #fff;
        font-size: 1.4rem;
        border-bottom: 1px solid rgba(255, 255, 255, .1);
        transition: color 0.2s ease-in;
    }
    .navbar .dropdown-menu .dropdown-item:last-child {
        border-bottom: none;
    }
    .navbar .dropdown-menu .dropdown-item:hover {
        background: transparent;
        color: #c0ca33;
    }
    .navbar .dropdown-menu .dropdown-item::before {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        top: 0;
        width: 5px;
        background-color: #c0ca33;
        opacity: 0;
        transition: opacity 0.2s ease-in;
    }
    .navbar .dropdown-menu .dropdown-item:hover::before {
        opacity: 1;
    }
    .navbar.fixed-top {
        position: fixed;
        -webkit-animation: navbar-animation 0.6s;
        animation: navbar-animation 0.6s;
        background-color: rgba(0, 0, 0, .9);
    }
    .navbar.fixed-top.navbar-dark .navbar-nav .nav-link.active {
        color: #c0ca33;
    }
    .navbar.fixed-top.navbar-dark .navbar-nav .nav-link::after {
        background-color: #c0ca33;
    }
    .content {
        padding: 120px 0;
    }
    @media screen and (max-width: 768px) {
        .navbar-brand {
            margin-left: 20px;
        }
        .navbar-nav {
            padding: 0 20px;
            background-color: rgba(0, 0, 0, .9);
        }
        .navbar.fixed-top .navbar-nav {
            background: transparent;
        }
    }
    @media screen and (min-width: 767px) {
        .banner {
            padding: 0 150px;
        }
        .banner h1 {
            font-size: 5rem;
        }
        .banner p {
            font-size: 2rem;
        }
        .navbar-dark .navbar-nav .nav-link {
            padding: 23px 15px;
        }
        .navbar-dark .navbar-nav .nav-link::after {
            content: '';
            position: absolute;
            bottom: 15px;
            left: 30%;
            right: 30%;
            height: 1px;
            background-color: #fff;
            -webkit-transform: scaleX(0);
            -ms-transform: scaleX(0);
            transform: scaleX(0);
            transition: transform 0.1s ease-in;
        }
        .navbar-dark .navbar-nav .nav-link:hover::after {
            -webkit-transform: scaleX(1);
            -ms-transform: scaleX(1);
            transform: scaleX(1);
        }
        .dropdown-menu {
            min-width: 200px;
            -webkit-animation: dropdown-animation 0.3s;
            animation: dropdown-animation 0.3s;
            -webkit-transform-origin: top;
            -ms-transform-origin: top;
            transform-origin: top;
        }
    }
    @-webkit-keyframes navbar-animation {
        0% {
            opacity: 0;
            -webkit-transform: translateY(-100%);
            -ms-transform: translateY(-100%);
            transform: translateY(-100%);
        }
        100% {
            opacity: 1;
            -webkit-transform: translateY(0);
            -ms-transform: translateY(0);
            transform: translateY(0);
        }
    }
    @keyframes navbar-animation {
        0% {
            opacity: 0;
            -webkit-transform: translateY(-100%);
            -ms-transform: translateY(-100%);
            transform: translateY(-100%);
        }
        100% {
            opacity: 1;
            -webkit-transform: translateY(0);
            -ms-transform: translateY(0);
            transform: translateY(0);
        }
    }
    @-webkit-keyframes dropdown-animation {
        0% {
            -webkit-transform: scaleY(0);
            -ms-transform: scaleY(0);
            transform: scaleY(0);
        }
        75% {
            -webkit-transform: scaleY(1.1);
            -ms-transform: scaleY(1.1);
            transform: scaleY(1.1);
        }
        100% {
            -webkit-transform: scaleY(1);
            -ms-transform: scaleY(1);
            transform: scaleY(1);
        }
    }
    @keyframes dropdown-animation {
        0% {
            -webkit-transform: scaleY(0);
            -ms-transform: scaleY(0);
            transform: scaleY(0);
        }
        75% {
            -webkit-transform: scaleY(1.1);
            -ms-transform: scaleY(1.1);
            transform: scaleY(1.1);
        }
        100% {
            -webkit-transform: scaleY(1);
            -ms-transform: scaleY(1);
            transform: scaleY(1);
        }
    }

    .nav li:hover ul{
        background-color: rgba(255,255,255,0.7);
        border-radius: 2px;
        display: block;
    }

    .text-center:hover {
        background-color: rgba(255,255,255,0.7);
        border-radius: 10px;
        cursor: pointer;
    }

    .UserDropdown:hover .dropdown-menu{
        display: block;
    }
    .square_box {
        position: absolute;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
        border-top-left-radius: 45px;
        opacity: 0.302;
    }

    .square_box.box_three {
        background-image: -moz-linear-gradient(-90deg, #290a59 0%, #3d57f4 100%);
        background-image: -webkit-linear-gradient(-90deg, #290a59 0%, #3d57f4 100%);
        background-image: -ms-linear-gradient(-90deg, #290a59 0%, #3d57f4 100%);
        opacity: 0.059;
        left: -80px;
        top: -60px;
        width: 500px;
        height: 500px;
        border-radius: 45px;
    }

    .square_box.box_four {
        background-image: -moz-linear-gradient(-90deg, #290a59 0%, #3d57f4 100%);
        background-image: -webkit-linear-gradient(-90deg, #290a59 0%, #3d57f4 100%);
        background-image: -ms-linear-gradient(-90deg, #290a59 0%, #3d57f4 100%);
        opacity: 0.059;
        left: 150px;
        top: -25px;
        width: 550px;
        height: 550px;
        border-radius: 45px;
    }
</style>

<script>
    jQuery(function($) {
        $(window).on('scroll', function() {
            if ($(this).scrollTop() >= 200) {
                $('.navbar').addClass('fixed-top');
            } else if ($(this).scrollTop() == 0) {
                $('.navbar').removeClass('fixed-top');
            }
        });

        function adjustNav() {
            var winWidth = $(window).width(),
                dropdown = $('.dropdown'),
                dropdownMenu = $('.dropdown-menu');

            if (winWidth >= 768) {
                dropdown.on('mouseenter', function() {
                    $(this).addClass('show')
                        .children(dropdownMenu).addClass('show');
                });

                dropdown.on('mouseleave', function() {
                    $(this).removeClass('show')
                        .children(dropdownMenu).removeClass('show');
                });
            } else {
                dropdown.off('mouseenter mouseleave');
            }
        }

        $(window).on('resize', adjustNav);

        adjustNav();
    });

    function passwordChange() {
        window.location.replace("reader_repasswd.html")
    }

    function sign_out(){
        window.location.replace("logout.html")
    }



</script>