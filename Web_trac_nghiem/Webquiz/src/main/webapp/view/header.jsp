<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/12/2022
  Time: 8:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<style>--%>
<%--    ul>li>a{--%>
<%--        color: #fff !important;--%>
<%--    }--%>
<%--    ul>li>a :hover{--%>
<%--        color: #000 !important;--%>
<%--    }--%>
<%--</style>--%>
<style>
    .logo{
        background-color: #30aac1;
        display: flex;
        height: 56px;
        padding:0 20px;
    }
    .trong{
        width: 50%;
    }
    .full_intro{
        color: white;
        width: 50%;
        display: flex;
        justify-content: flex-end;
    }

    .search_lable {
        /* padding: 0 20px 16px; */
       padding:0px !important;
        margin-right: 7px !important;
    }
    .div_timkiem{
        display: flex;
        align-items: center;

    }
    .btn-logout{
        border: none !important;
        background-color: #80e0d2!important;
    }
    li.logout {
        display: flex;
        justify-content: flex-end;
    }
    .login {
        margin-left: 30px;
        display: flex;
        align-items: center;
    }
    i.fa-solid.fa-right-to-bracket {
        /* display: flex; */
        padding-right: 5px;
    }
    a.login_dn {
        color: white;
        margin-bottom: 3px;
    }
    /*.navbar__item-list{*/
    /*    position: fixed;*/
    /*    top : 0;*/
    /*    right: 0;*/
    /*    left: 0;*/
    /*    z-index: 2;*/
    /*}*/
    ul.navbar__item-list {
        margin: 0 !important;
    }
    ul>li>a.color_banner{
        color: white;
    }

    .custom-loader {
        width: 60px;
        height: 60px;
        color:#2AF435;
        background:
                conic-gradient(from  165deg at top   ,#0000, currentColor 1deg 30deg,#0000 31deg) top,
                conic-gradient(from   75deg at left  ,#0000, currentColor 1deg 30deg,#0000 31deg) left,
                conic-gradient(from  -15deg at bottom,#0000, currentColor 1deg 30deg,#0000 31deg) bottom,
                conic-gradient(from -105deg at right ,#0000, currentColor 1deg 30deg,#0000 31deg) right;
        background-size: 100% 50%,50% 100%;
        -webkit-mask:radial-gradient(circle 5px,#0000 90%,#000);
        background-repeat: no-repeat;
        animation:sh2 1.5s infinite linear;
    }
    .custom-loader:before {
        content: "";
        position: absolute;
        inset:0;
        background:inherit;
        transform: rotate(45deg);
    }

    @keyframes sh2{
        100%{transform: rotate(1turn)}
    }

</style>
<%--<script>--%>
<%--    var index = 1;--%>
<%--    function changeImage(){--%>
<%--        var imgs = ["/static/img/tracnghemtructuyen.png","/static/img/banner4.png","/static/img/banner2.jpg"];--%>
<%--        document.getElementById("img").src = imgs[index];--%>
<%--        index++;--%>
<%--        if(index==3){--%>
<%--            index = 0;--%>
<%--        }--%>
<%--    }--%>
<%--    setInterval(changeImage,3000);--%>
<%--</script>--%>
<div class="header">
<%--    <div class="banner">--%>
<%--        <div class="sologan">--%>
<%--            <h1>TRẮC NGHIỆM ONLINE</h1>--%>
<%--            <h4>ĐA DẠNG - THÔNG MINH - CHÍNH XÁC</h4>--%>
<%--        </div>--%>
    <img id="img" onclick="changeImage()" src="/static/img/tracnghemtructuyen.png" style="width: 100% ;height: 330px; object-fit: cover" >
</div>
<div class="nav_bar">

    <div class="logo">

        <div class="trong">
            <img src="/icon/logo.png" style="height: 56px; margin-left: 70px;">
        </div>
        <div class="full_intro">

            <div class="div_timkiem">
                <div class="search_lable">
                    <i class="fa-solid fa-magnifying-glass" style="color: white"></i>
                </div>
                <div class="search_b">
                    <form action="/exam_list" method="get">
                        <input type="hidden" name="action" value="sa">
                        <input class="search_input" type="text" name="search" placeholder="Tìm kiếm đề thi...">
                        <button class="btn_search"type="submit" class="btn-success">Tìm</button>
                    </form>
                </div>
            </div>
            <div class="login">
                  <i class="fa-solid fa-phone-volume" style="color: #00FF00"></i>
                    <a href="#" class="login_dn">&ensp;0935338475 </a>
            </div>
            <div class="custom-loader"></div>
            <div class="login">
                <c:if test="${sessionScope.account == null}">
                    <i class="fa-solid fa-right-to-bracket"></i>
                    <a href="/user/DangNhapDangKi.jsp" class="login_dn">Đăng Nhập </a>
                </c:if>
            </div>
            <div class="logout_dx">
                <li class="">
                    <c:if test="${sessionScope.account != null}">
                        <span> Chào bạn ${sessionScope.user.name}</span>
                    </c:if>
                </li>
                <li class="logout">
                    <c:if test="${sessionScope.account != null}">
                        <button type="submit" class="btn-logout">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <a href="/userServlet?action=logout" style="color: white">Đăng xuất</a>
                        </button>
                    </c:if>
                </li>
            </div>
        </div>


    </div>

</div>
<div >
    <ul class="navbar__item-list navbar_color "  >
        <li class="navbar__item-sectors">
            <a href="/" class="color_banner">
                <i class="fa-solid fa-house"></i>
                Trang chủ
            </a>
        </li>
        <li class="navbar__item-sectors">
            <a href="#" class="color_banner">
                <i class="fa-solid fa-book"></i>
                Khối A
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list" style="padding: 0">
                    <li class="sector-detail__item">
                            <a  href="/exam_list?action=list_exam&sj_id=1"  class="sector-detail__item-link color_banner">Toán</a>
                    </li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=2"  class="sector-detail__item-link color_banner">Vật Lý</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=3"  class="sector-detail__item-link color_banner" >Hóa Học</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#" class="color_banner">
                <i class="fa-solid fa-book"></i>
                Khối B
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list"  style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=1" class="sector-detail__item-link color_banner">Toán</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=8" class="sector-detail__item-link color_banner">Sinh Học</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=3"  class="sector-detail__item-link color_banner">Hóa Học</a></li>
                </ul>
            </div>
        </li>

        <li class="navbar__item-sectors">
            <a href="#" class="color_banner">
                <i class="fa-solid fa-book"></i>
                Khối C
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list"  style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=9" class="sector-detail__item-link color_banner">Ngữ Văn</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=10" class="sector-detail__item-link color_banner">Lịch Sử</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=11"  class="sector-detail__item-link color_banner">Địa Lý</a></li>
                </ul>
            </div>
        </li>

        <li class="navbar__item-sectors">
            <a href="#" class="color_banner">
                <i class="fa-solid fa-book"></i>
                Khối D
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list" style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=9"  class="sector-detail__item-link color_banner">Ngữ Văn</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=1"  class="sector-detail__item-link color_banner">Toán</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=7" class="sector-detail__item-link color_banner">Tiếng Anh</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#" class="color_banner">
                <i class="fa-solid fa-book-open"></i>
                Tin Học
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list"  style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=6"  class="sector-detail__item-link color_banner">Tin Học Văn Phòng</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=6"  class="sector-detail__item-link color_banner">Tin Đại Cương</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=6"  class="sector-detail__item-link color_banner">IT</a></li>
                </ul>
            </div>
        </li>
        <c:if test="${sessionScope.account.idRole == 1}">
            <li class="navbar__item-sectors">
                    <a href="/admin/index.jsp" class="color_banner">
                        <i class="fa-solid fa-link"></i>
                        Tới trang quản lý
                    </a>
            </li>
        </c:if>
        <c:if test="${sessionScope.account.idRole == 3}">
            <li class="navbar__item-sectors">
                <a href="/teacher/index.jsp" class="color_banner">
                    <i class="fa-solid fa-link"></i>
                    Tới trang giáo viên
                </a>
            </li>
        </c:if>
    </ul>

</div>





