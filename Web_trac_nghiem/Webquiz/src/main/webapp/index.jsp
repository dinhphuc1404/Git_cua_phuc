<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/view/head.jsp"/>
    <title>Website thi trắc nghiệm online</title>
    <style>
        .run {
            height: 18%;
            position: relative;
        }
        .honour_bottom{
            position: sticky;
            top:10px;
        }

        .content_top{
            /*color: #271717;*/
           text-align: center;
            /*font-style: italic;*/
            /*background: #d8eac3;*/
            background: linear-gradient(
                to right,
            #ffb703 40%,
            #01ef96 50%,
            #fb8500 70%
            );
            background-size: 200% auto;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: bold;
            animation: flow 2s linear infinite;
        }
        @keyframes flow {
            to{
                background-position: 200% center;
            }
        }

        .custom-loader1 {
            margin-left: 63px;
            margin-bottom: 20px;
            --s: 40px;
            height: calc(var(--s)*0.9);
            width: calc(var(--s)*5);
            --v1:transparent,#000 0.5deg 108deg,#0000 109deg;
            --v2:transparent,#000 0.5deg  36deg,#0000  37deg;
            -webkit-mask:
                    conic-gradient(from 54deg  at calc(var(--s)*0.68) calc(var(--s)*0.57),var(--v1)),
                    conic-gradient(from 90deg  at calc(var(--s)*0.02) calc(var(--s)*0.35),var(--v2)),
                    conic-gradient(from 126deg at calc(var(--s)*0.5)  calc(var(--s)*0.7) ,var(--v1)),
                    conic-gradient(from 162deg at calc(var(--s)*0.5)  0                  ,var(--v2));
            -webkit-mask-size: var(--s) var(--s);
            -webkit-mask-composite: xor,destination-over;
            mask-composite: exclude,add;
            -webkit-mask-repeat:repeat-x;
            background:linear-gradient(#f1d531    0 0) left/0% 100% #42e695  no-repeat;
            animation: p10 2s infinite linear;
        }
        @keyframes p10 {
            90%,100% {background-size:100% 100%}
        }

        .custom-loader2 {
            margin-bottom: 20px;
            width:60px;
            height:20px;
            border:1px solid #43F487;
            border-right-color: transparent;
            padding:1.5px;
            background:
                    repeating-linear-gradient(90deg,#43F487 0 5px,#0000 0 7.5px)
                    left/0% 100% no-repeat content-box content-box;
            position: relative;
            animation:p5 2s infinite steps(6);
        }
        .custom-loader2::before {
            content:"";
            position: absolute;
            top:-1px;
            bottom:-1px;
            left:100%;
            width:5px;
            background:
                    linear-gradient(
                            #0000   calc(50% - 3.5px),#43F487 0 calc(50% - 2.5px),
                            #0000 0 calc(50% + 2.5px),#43F487 0 calc(50% + 3.5px),#0000 0) left /100% 100%,
                    linear-gradient(#43F487 calc(50% - 2.5px),#0000        0 calc(50% + 2.5px),#43F487 0) left /1px 100%,
                    linear-gradient(#0000        calc(50% - 2.5px),#43F487 0 calc(50% + 2.5px),#0000        0) right/1px 100%;
            background-repeat:no-repeat;
        }
        @keyframes p5 {
            100% {background-size:120% 100%}
        }

        .slider{
            background: #eff5f5;
            width: 731px;
            height: 570px;
            overflow: hidden;
        }
        .slides{
            width: 500%;
            height: 100px;
            display: flex;
        }
        .slides input{
            display: none;
        }
        .slide{
            width: 20%;
            transition: 2s;
        }
        .slide img{
            margin-left: 235px;
            width: 270px;
            height: 275px;
        }
        .navigation-manual{
            margin-left: 120px;
            position: absolute;
            width: 500px;
            margin-top: 173px;
            display: flex;
            justify-content: center;
        }
        .manual-btn{
            margin-top: 224px;
            border: 2px solid #42e695;
            padding: 5px;
            border-radius: 10px;
            cursor: pointer;
            transition: 1s;
        }
        .manual-btn:not(:last-child){
            margin-right: 20px;
        }
        .manual-btn:hover{
            background: #42e695;
        }

        #radio1:checked ~ .first{
            margin-left: 0;
        }
        #radio2:checked ~ .first{
            margin-left: -20%;
        }
        #radio3:checked ~ .first{
            margin-left: -40%;
        }
        #radio4:checked ~ .first{
            margin-left: -60%;
        }
        .navigation-auto{
            margin-left: 120px;
            position: absolute;
            width: 500px;
            margin-top: 220px;
            display: flex;
            justify-content: center;
        }
        .navigation-auto div{
            margin-top: 277px;
            border: 2px solid #42e695;
            padding: 5px;
            border-radius: 10px;
            cursor: pointer;
            transition: 1s;
        }
        .navigation-auto div:not(:last-child){
            margin-right: 20px;
        }
        #radio1:checked ~ .navigation-auto .auto-btn1{
            background: #42e695;
        }
        #radio2:checked ~ .navigation-auto .auto-btn2{
            background: #42e695;
        }
        #radio3:checked ~ .navigation-auto .auto-btn3{
            background: #42e695;
        }
        #radio4:checked ~ .navigation-auto .auto-btn4{
            background: #42e695;
        }

        body .credit{
            position: absolute;
            bottom: 20px;
            left: 20px;
            color: inherit;
        }
        body .options{
            margin-left: 56px;
            display: flex;
            flex-direction: row;
            align-items: stretch;
            overflow: hidden;
            min-width: 600px;
            max-width: 900px;
            width: calc(100% - 100px);
            height: 440px;
        }
        body .options .option{
            position: relative;
            overflow: hidden;
            min-width: 60px;
            margin: 10px;
            background: var(--optionBackground, var(--defaultBackground, #e6e9ed));
            background-size: auto 120%;
            background-position: center;
            cursor: pointer;
            transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
        }
        body .options .option.active{
            flex-grow: 10000;
            transform: scale(1);
            max-width: 600px;
            margin: 0px;
            border-radius: 40px;
            background-size: auto 100%;
        }
        body .options .option.active .shadow{
            box-shadow: inset 0 -120px 120px -120px black,
            inset 0 -120px 120px -100px black;
        }
        body .options .option.active .label {
            bottom: 20px;
            left: 20px;
        }
        body .options .option.active .label .info > div {
            left: 0px;
            opacity: 1;
        }
        body .options .option:not(.active) {
            flex-grow: 1;
            border-radius: 30px;
        }
        body .options .option:not(.active) .shadow {
            bottom: -40px;
            box-shadow: inset 0 -120px 0px -120px black, inset 0 -120px 0px -100px black;
        }
        body .options .option:not(.active) .label {
            bottom: 10px;
            left: 10px;
        }
        body .options .option:not(.active) .label .info > div {
            left: 20px;
            opacity: 0;
        }
        body .options .option .shadow{
            position: absolute;
            bottom: 0px;
            left: 0px;
            height: 120px;
            transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
        }
        body .options .option .label{
            display: flex;
            position: absolute;
            right: 0px;
            height: 40px;
            transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
        }
        body .options .option .label .icon img{
            min-width: 20px;
            max-width: 20px;
        }
        body .options .option .label .icon {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            min-width: 40px;
            max-width: 40px;
            height: 40px;
            border-radius: 100%;
            background-color: #212123;
            color: var(--defaultBackground);
        }
        body .options .option .label .info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-left: 3px;
            color: white;
            white-space: pre;
        }
        body .options .option .label .info > div {
            position: relative;
            transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95), opacity 0.5s ease-out;
        }
        body .options .option .label .info .main {
            font-weight: bold;
            font-size: 1.2rem;
        }
        body .options .option .label .info .sub {
            transition-delay: 0.1s;
        }
        .backgroud{
            background: #eff5f5;
        }
        .img_book{
            /*width: 370px;*/
            transform: translateX(0px);
            animation: float 6s ease-out infinite;
        }
        @keyframes float {
            0%{
                transform: translateY(0px);
            }
            50%{
                transform: translateY(-60px);
            }
            100%{
                transform: translateY(0px);
            }
        }
    </style>

</head>
<body style="max-width: 1620px">
<jsp:include page="/view/header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="honour">
                <div class="gold_pound">
                    <i class="fa-solid fa-award"></i>
                    <p>Điểm tích lũy </p>
                </div>
                <div class="div_group">
                    <ul class="list-group">
                        <c:forEach var="member" items="${memberList}">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span><c:out value="${member.name}"></c:out></span>
                                <span class="badge badge-primary badge-pill test1">
                                        ${member.point}
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div>
                <br>
                <div class="gold_pound" style="border-radius: 15px">
                    <i class="fa-solid fa-book-open"></i>
                    <p>Sách là ngọn đèn sáng bất diệt của trí tuệ con người  </p>
                </div>
                <div class="img_book">
                    <br><br>
                    <img src="/static/img/sach_2.jpg" style="width: 355px; border: 0">
                </div>
            </div>
            <div class="run">
                <div class="honour honour_bottom">
                    <div class="gold_pound">
                        <i class="fa-regular fa-envelope"></i>
                        <p>Hỗ trợ trực tuyến</p>
                    </div>
                    <div class="div_group_call">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a class="d-flex justify-content-between align-items-center" href="https://web.skype.com/chat/" target="_blank">
                                    ONLINE
                                    <span class="badge badge-primary badge-pill test1">Phuc</span>
                                </a>
                            </li>
                            <li class="list-group-item">
                                <a class="d-flex justify-content-between align-items-center" href="https://web.skype.com/" target="_blank">
                                    HOTLINE
                                    <span class="badge badge-primary badge-pill test1">0935338475</span>
                                </a>
                            </li>
                            <li class="list-group-item">
                                <a class="d-flex justify-content-between align-items-center" href="https://www.facebook.com/profile.php?id=100026751636172" target="_blank">
                                    FANPAGE
                                    <span class="badge badge-primary badge-pill test1">Nhóm 3</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
<%--                        <p> &emsp; Hệ thống thi và tạo đề thi trắc nghiệm online &emsp;tốt nhất. Hỗ trợ bạn các chức năng tốt nhất để &emsp;dễ dàng tạo và--%>
<%--                            quản lý ngân hàng câu hỏi, đề &emsp;thi trắc nghiệm.--%>
<%--                            Tổ chức các kỳ thi online, giao &emsp; bài tập về nhà trên mọi nền tảng Web.</p>--%>
                        <div class="custom-loader1"></div>
                    </div>
                </div>
                <div class="row">
                    <a href="#" class=" col-6" >
                        <div class="card card_mg"style="width: 194%;margin-top: 280px; margin-left: 88px">
                            <img class="card-img-top" src="/static/img/1_4.gif" style="height: 196px; width: 310px"
                                 alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Tính tương thích</h5>
                                <p>Website hoạt động được trên nhiều thiết bị. Người dùng có thể dùng trên PC, laptop, table, điện thoại.</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>


        </div>


        <div class="col-6 col-md-6" style="margin-bottom: 20px">
            <br>
            <div class="backgroud"><h1 class="content_top">Các môn nổi bật</h1></div>
            <div class="row">
                <a href="/exam_list?action=list_exam&sj_id=1" class="col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/Toan.png" style="height: 300px; object-fit: cover" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Toán Học</h5>
                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=3" class="col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/hóa.png" style="height: 300px; object-fit: cover"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Hóa Học</h5>
                        </div>
                    </div>
                </a>

                <a href="/exam_list?action=list_exam&sj_id=2" class=" col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/lý.png" style="height: 300px" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Vật Lý</h5>

                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=7" class=" col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/tiếng_anh.png"
                             style="height: 300px" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Tiếng Anh</h5>
                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=10" class="col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/lich_su.jpg" style="height: 300px"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Lịch sử</h5>

                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=11" class=" col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/dia_ly.jpg" style="height: 300px"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Địa lý</h5>
                        </div>
                    </div>
                </a>
            </div>
            <br>
            <div>
                <div class="backgroud" ><h1 class="content_top">Đến với website, chúng tôi có thể khiến bạn yên tâm về:</h1></div>
                <div class="row">
                    <a href="#" class=" col-6" >
                        <div class="card card_mg" style="width: 89%; margin-left: 48px">
                            <img class="card-img-top" src="/static/img/1_1.jpg" style="height: 196px; width: 310px"
                                 alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Tính chính xác</h5>
                                <p>Website hoạt động chính xác trong việc đưa tra kết quả của các thao tác đưa đến người dùng.</p>
                            </div>
                        </div>
                    </a>
                    <a href="#" class=" col-6" >
                        <div class="card card_mg" style="width: 89%; margin-left: 8px">
                            <img class="card-img-top" src="/static/img/1_2.gif" style="height: 196px; width: 310px"
                                 alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Tính hiệu quả</h5>
                                <p>Thao tác thực hiện nhanh chóng, hiệu quả, hỗ trợ học sinh, sinh viên, giáo viên trong việc dạy và học.</p>
                            </div>
                        </div>
                    </a>
<%--                    <a href="#" class=" col-6" >--%>
<%--                        <div class="card card_mg" style="width: 89%">--%>
<%--                            <img class="card-img-top" src="/static/img/1_3.jpg" style="height: 196px; width: 310px"--%>
<%--                                 alt="Card image cap">--%>
<%--                            <div class="card-body">--%>
<%--                                <h5 class="card-title">Tính tiện dụng</h5>--%>
<%--                                <p>Giao diện website được thiết kế đơn giản, dễ dàng quan sát, các tính năng đơn giản dễ sử dụng.</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                    <a href="#" class=" col-6" >--%>
<%--                        <div class="card card_mg" style="width: 89%">--%>
<%--                            <img class="card-img-top" src="/static/img/1_4.gif" style="height: 196px; width: 310px"--%>
<%--                                 alt="Card image cap">--%>
<%--                            <div class="card-body">--%>
<%--                                <h5 class="card-title">Tính tương thích</h5>--%>
<%--                                <p>Website hoạt động được trên nhiều thiết bị. Người dùng có thể dùng trên PC, laptop, table, điện thoại.</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </a>--%>
                </div>
            </div>
            <br>
            <div class="backgroud"><h1 class="content_top">Mọi người nói về chúng tôi</h1></div>
            <div><p style=" text-align: center;">luôn đồng hành và mang lại các trải nghiệm tốt nhất cho người dùng.</p></div>
            <div class="slider">
                <div class="slides">
                    <input type="radio" name="radio-btn" id="radio1">
                    <input type="radio" name="radio-btn" id="radio2">
                    <input type="radio" name="radio-btn" id="radio3">
                    <input type="radio" name="radio-btn" id="radio4">
                    <div class="slide first">
                        <img src="/static/img/slider_2.jpg" alt="">
                        <p style="width: 77%;margin-left: 81px;">Nhờ có website thi trắc nghiệm online có thể dễ dàng luyện thi trắc nghiệm online ở mọi lúc, mọi nơi chỉ cần một
                            thiết bị điện tử có kết nối Internet là được. Vì vậy, thay vì phải tốn thời gian, công sức và chi phí đến các lớp học, bạn
                            chỉ cần ngồi ở nhà đã có thể truy cập hàng ngàn câu hỏi trắc nghiệm miễn phí trên Website thi trắc nghiệm online</p>
                        <div><h4 style="text-align: center; margin-top: -14px">Bạn Phúc chia sẻ</h4>
                            <p style="text-align: center">Học sinh lớp 12</p></div>
                    </div>
                    <div class="slide">
                        <img src="/static/img/slider_7.jpg" alt="">
                        <p style="width: 77%;margin-left: 81px;">Hệ thống thi trắc nghiệm của nhóm 3 rất hay và tiện ích, giờ đây tôi có thể
                            tự ôn tập để nâng cao kiến thức của mình, web có chỉnh sửa khi bạn trả lời sai rất tiện lợi.
                            Thông qua bộ câu hỏi trắc nghiệm online, học sinh sẽ nắm được mình đã hiểu rõ được phần nào cũng như
                            chưa hiểu phần nào để có thể lên kế hoạch học tập cải thiện, nâng cao, lấp đầy những lỗ hổng kiến thức</p>
                        <div><h4 style="text-align: center; margin-top: -14px">Bạn Thịnh chia sẻ</h4>
                            <p style="text-align: center">Học sinh lớp 12</p></div>
                    </div>
                    <div class="slide">
                        <img src="/static/img/slider_6.jpg" alt="">
                        <p style="width: 77%;margin-left: 81px;">Nhờ quá trình dài tiếp xúc và làm quen với hình thức thi trắc nghiệm trực tuyến, tôi đã có kinh nghiệm quản
                            lý thời gian khi làm bài đối với từng môn học và từng loại câu hỏi; có kinh nghiệm phán đoán câu nào nên làm trước, câu nào nên
                            làm sau và kinh nghiệm về những lỗi sai thường gặp để sau đó tránh lặp lại chúng. Ngoài ra, chi tiết lời giải và đáp án sẽ có ngay
                            sau khi học sinh hoàn thành nộp bài sẽ giúp họ hiểu được câu hỏi và ghi nhớ kiến thức tốt hơn. </p>
                        <div><h4 style="text-align: center; margin-top: -14px">Bạn Cường chia sẻ</h4>
                            <p style="text-align: center">Học sinh lớp 12</p></div>
                    </div>
                    <div class="slide">
                        <img src="/static/img/slider_5.jpg" alt="">
                        <p style="width: 77%;margin-left: 81px;">Hệ thống thi trắc nghiệm của nhóm 3 rất hay, các chức năng dễ sử dụng
                            đặc biệt mình thích tính năng tạo đề thi bằng ma trận giúp tiết kiệm thời gian và phân bổ nội dung đề thi rất trực quan và chính xác.
                            Ngoài ra chức năng xuất file đề thi để thi offline mình cũng rất hay sử dụng để kết hợp thi trên lớp.</p>
                        <div><h4 style="text-align: center; margin-top: -14px">Bạn Nhân chia sẻ</h4>
                            <p style="text-align: center">Học sinh lớp 12</p></div>
                    </div>
                    <div class="navigation-auto">
                        <div class="auto-btn1"></div>
                        <div class="auto-btn2"></div>
                        <div class="auto-btn3"></div>
                        <div class="auto-btn4"></div>
                    </div>
                </div>
                <div class="navigation-manual">
                    <label for="radio1" class="manual-btn"></label>
                    <label for="radio2" class="manual-btn"></label>
                    <label for="radio3" class="manual-btn"></label>
                    <label for="radio4" class="manual-btn"></label>
                </div>
            </div>
            <br>
            <div class="backgroud"><h1 class="content_top">Đội ngũ phát triển website</h1></div>
            <br>
            <div style="background: #eff5f5">
                <div class="options">
                    <div class="option active" style="--optionBackground:url(/static/img/phuc.jpg);">
                        <div class="shadow"></div>
                        <div class="label">
<%--                            <div class="icon">--%>
<%--                                <img src="/static/img/phuc.jpg" />--%>
<%--                            </div>--%>
                            <div class="info">
                                <div class="main">Nguyễn Đình Phúc (Leader)</div>
                                <div class="sub">Sinh viên Đại học Duy Tân</div>
                                <div class="sub"><a href="https://www.facebook.com/profile.php?id=100026751636172" target="_blank"><i class="fa-brands fa-facebook fa-lg" style="color: #1463eb;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="option" style="--optionBackground:url(/static/img/slider_2.jpg);">
                        <div class="shadow"></div>
                        <div class="label">
<%--                            <div class="icon">--%>
<%--                                <img src="/static/img/lý.png" />--%>
<%--                            </div>--%>
                            <div class="info">
                                <div class="main">Nguyễn B</div>
                                <div class="sub">Sinh viên Đại học Duy Tân</div>
                                <div class="sub"><a href="#"><i class="fa-brands fa-facebook fa-lg" style="color: #1463eb;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="option" style="--optionBackground:url(/static/img/slider_7.jpg);">
                        <div class="shadow"></div>
                        <div class="label">
<%--                            <div class="icon">--%>
<%--                                <img src="/static/img/hoa-hoc.png" />--%>
<%--                            </div>--%>
                            <div class="info">
                                <div class="main">Notita</div>
                                <div class="sub">Sinh viên Đại học Duy Tân</div>
                                <div class="sub"><a href="#"><i class="fa-brands fa-facebook fa-lg" style="color: #1463eb;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="option" style="--optionBackground:url(/static/img/slider_6.jpg);">
                        <div class="shadow"></div>
                        <div class="label">
<%--                            <div class="icon">--%>
<%--                                <img src="/static/img/tiếng_anh.png" />--%>
<%--                            </div>--%>
                            <div class="info">
                                <div class="main">Nguyễn Văn A</div>
                                <div class="sub">Sinh viên Đại học Duy Tân</div>
                                <div class="sub"><a href="#"><i class="fa-brands fa-facebook fa-lg" style="color: #1463eb;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="option" style="--optionBackground:url(/static/img/slide_5.png);">
                        <div class="shadow"></div>
                        <div class="label">
<%--                            <div class="icon">--%>
<%--                                <img src="/static/img/lich_su.jpg" />--%>
<%--                            </div>--%>
                            <div class="info">
                                <div class="main">Xeko</div>
                                <div class="sub">Sinh viên Đại học Duy Tân</div>
                                <div class="sub"><a href="#"><i class="fa-brands fa-facebook fa-lg" style="color: #1463eb;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="col-3 col-md-3 ">
            <div class="honour">
                <div class="gold_pound">
                    <c:set var="role" scope="session" value="${sessionScope.account.idRole}"/>
                    <i class="fa-solid fa-user"></i>
                    <c:choose>
                        <c:when test="${role == 1}">
                        <p>ADMIN</p>
                    </c:when>
                        <c:when test="${role == 2}">
                            <p>Thành viên</p>
                        </c:when>
                        <c:when test="${role == 3}">
                            <p>Teacher</p>
                        </c:when>
                        <c:otherwise>
                            <p>Chào bạn</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="user_log">
                    <div class="div_cus">
                        <ul class="list-group">
                            <c:if test="${sessionScope.account == null}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">Đăng nhập vào thi để nâng cao kiến thức nào!<span class="custom-loader2"></span></li>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                            <li class="list-group-item d-flex justify-content-between align-items-center" style="margin-top: 17px">
                                <form action="/userServlet" method="post">
                                    <input type="hidden" name="action" value="infoUser">
                                    <input type="hidden" name="index" value="">
                                    <input type="hidden" name="check" value="">
                                    <input type="hidden" name="idUser" value="${sessionScope.user.userId}">
                                        <button class="btn_info" type="submit">
                                            <i class="fa-solid fa-gear"></i>
                                            <span>Thông tin cá nhân</span>

                                        </button>
                                </form>
                            </li>
                            </c:if>

                        </ul>
                    </div>
                </div>
                <div class="user_log">
                    <div class="div_thongke">
<%--                        <div class="div_cus-link"  style="text-decoration: none; color: black">--%>
<%--                            <i class="fa-solid fa-user-group"></i>--%>
<%--                            <p>Thành viên </p>--%>
<%--                        </div>--%>
                        <ul class="list-group">
<%--                            <li class="list-group-item d-flex justify-content-between align-items-center">--%>
<%--                                Tổng Thành Viên--%>
<%--                                <span class="badge badge-primary badge-pill test1">${memberList2.size()}</span>--%>
<%--                            </li>--%>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                               Thành viên mới nhất
                                <span class="badge badge-primary badge-pill test1">${newMember.name}</span>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <br><br><br><br>
            <div>
                <h5 style="font-style: italic; margin-left: 46px">Đề thi trắc nghiệm môn toán</h5>
               <img src="/static/img/Thiết-kế-không-tên-1-1.png" style="width: 100% ;height: 200px; object-fit: cover">
               <a href="/exam_list?action=list_exam&sj_id=1"  class="badge badge-primary badge-pill test1" style="font-style: italic; font-size: 20px; margin-left: 114px">*XEM NGAY*</a>
            </div>
            <br><br>
            <div>
                <h5 style="font-style: italic; margin-left: 46px">Đề thi trắc nghiệm môn lý</h5>
                <img src="/static/img/de_mon_ly.jpg" style="width: 100% ;height: 200px; object-fit: cover;margin-bottom: 5px;">
                <a href="/exam_list?action=list_exam&sj_id=2"  class="badge badge-primary badge-pill test1" style="font-style: italic; font-size: 20px; margin-left: 114px">*XEM NGAY*</a>
            </div>
            <br><br>
            <div>
                <h5 style="font-style: italic; margin-left: 46px">Đề thi trắc nghiệm môn ngữ văn</h5>
                <img src="/static/img/de_mon_van.jpg" style="width: 100% ;height: 200px; object-fit: cover;margin-bottom: 5px;">
                <a href="/exam_list?action=list_exam&sj_id=9"  class="badge badge-primary badge-pill test1" style="font-style: italic; font-size: 20px; margin-left: 114px">*XEM NGAY*</a>
            </div>
            <div class="row">
                <a href="#" class=" col-6" >
                    <div class="card card_mg" style="width: 194%;margin-top: 143px; margin-left: -32px">
                        <img class="card-img-top" src="/static/img/1_3.jpg" style="height: 196px; width: 310px"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Tính tiện dụng</h5>
                            <p>Giao diện website được thiết kế đơn giản, dễ dàng quan sát, các tính năng đơn giản dễ sử dụng.</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/view/footer.jsp"/>
<jsp:include page="/view/messenger.jsp"/>
<script src="https://tudongchat.com/js/chatbox.js"></script>
<script>
    const tudong_chatbox = new TuDongChat('rSEtL8F7tIDsy_hWm3BgC')
    tudong_chatbox.initial()
</script>
<script type="text/javascript">
    var couter = 1;
    setInterval(function(){
        document.getElementById('radio' + couter).checked = true;
        couter++;
        if(couter>4){
            couter=1;
        }
    },5000);

    $(".option").click(function () {
        $(".option").removeClass("active");
        $(this).addClass("active");
    });
</script>
</body>
</html>
