<%-- 
    Document   : Cinema
    Created on : May 19, 2024, 7:01:32 PM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Play Show</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <style>
            .movieImage {
                border-radius: 10px;
            }
            .showtime {
                width: 30px;
                height: 30px;
                border: solid 1px;
                border-radius: 10px;
                padding: 10px;
                margin-right: 10px;
                margin-top: 10px;
                background-color: #000;
                color: #fff;
            }
            .showRoom {
                width: 30px;
                height: 30px;
                border: solid 1px;
                border-radius: 10px;
                padding: 10px;
                margin-right: 10px;
                margin-top: 10px;
                background-color: red;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main_blog_dt clearfix">
                    <section id="center" class="center_blog">
                        <div class="container-xl">
                            <div class="row center_o1">
                                <div class="col-md-12">
                                    <h2 class="text-white">Cinema</h2>
                                    <h6 class="mb-0 mt-3 fw-normal col_red"><a class="text-light" href="/CineBooking/home">Home</a> <span class="mx-2 text-muted">/</span> Cinema</h6>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        
        <section id="exep" class="p_3 bg-light">
            <div class="container-xl detail">
                <div class="row exep1">
                    <c:forEach items="${listM}" var="m">
                        <div class="col-4">
                            <div class="exep1l">
                                <div class="grid clearfix ">                                
                                    <img style="margin-bottom: 20px; border: 5px solid #000; border-radius: 15px;" height="350px" src="${m.getPost_img()}" class="w-100 film" alt="abc">
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="exep1r">
                                <a href="moviedetail?ID=${m.getMovie_id()}"><p style="font-weight: bold; font-size: 35px" class="mb-0 nameDetail">${m.getMovie_name()}</p></a>                                       
                            </div>
                            <div>
                                <p><i class='bx bxs-purchase-tag-alt' ></i>${m.getType_name()}&nbsp&nbsp / &nbsp <i class='bx bxs-time' ></i> ${m.getDuration()} minutes</p>
                            </div> 
                            <hr/>
                            <div>
                                <c:forEach items="${m.getListShowtime()}" var="s"> 
                                    <div style="padding: 15px">
                                            <a class="showtime" href="showtiming?showtimeID=${s.getShowtime_id()}">${s.getShowtiming()}:00</a>       
                                    </div>                                     
                                            <c:if test="${selectedShowtimeID != null && selectedShowtimeID == s.getShowtime_id()}">
                                        <div>
                                            <c:forEach items="${listRoom}" var="r">
                                                <div style="margin: 40px ">
                                                    <c:if test="${sessionScope.user == null}">
                                                       <a class="showRoom" href="login.jsp"> Room: ${r.getRoom_name()}</a>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user != null}">
                                                       <a class="showRoom" href="seat?roomID=${r.getRoom_id()}"> Room: ${r.getRoom_name()}</a>
                                                    </c:if>
                                                    </div>
                                            </c:forEach>
                                        </div>  
                                            </c:if>       
                                                         
                                </c:forEach>
                            </div>
                        </div>
                        <hr/>
                    </c:forEach>               
                </div>    
            </div>
        </section>
    <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>

    <script>
        window.onscroll = function () {
            myFunction()
        };

        var navbar_sticky = document.getElementById("navbar_sticky");
        var sticky = navbar_sticky.offsetTop;
        var navbar_height = document.querySelector('.navbar').offsetHeight;

        function myFunction() {
            if (window.pageYOffset >= sticky + navbar_height) {
                navbar_sticky.classList.add("sticky")
                document.body.style.paddingTop = navbar_height + 'px';
            } else {
                navbar_sticky.classList.remove("sticky");
                document.body.style.paddingTop = '0'
            }
        }
    </script>

</body>

</html>