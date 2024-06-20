<%-- 
    Document   : ListMovie
    Created on : Jun 11, 2024, 10:41:18 AM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Movie</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/bootstrap.bundle.min.js"></script>
        <style>
            .bookTicket {
                color: #fff;
                background-color: rgb(244, 187, 68);
                font-size: 17px;
                border-radius: 7px;
                padding: 6px;
            }
            #nameMovie {
                font-size: 19px;
                font-weight: bold;
            }
            .film{
                border: 8px solid #000;
                border-radius: 10px;
            }
            .titleList{
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-top: 60px;
                border-bottom: 3px solid #241d1e;
                margin-bottom: 35px;
            }
            .bookTicket:hover {
                color: #000;
            }
            .information {
                font-size: 14px;
                color: grey;
            }
            .viewDetail{
                color: #000;
                background-color: #fff;
                font-size: 17px;
                border-radius: 5px;
                padding: 6px;
                border: solid 1px grey;
            }
            .viewDetail:hover {
                background-color: rgb(244, 187, 68); 
                color: #000;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div style="background-color: #000" class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
            </div>
            <section style="padding-top: 40px"  id="spec" class="p_3">
                <div class="container-xl">
                    <div class="titleList">
                        <a style="color: black; font-weight: bold; font-size: 42px; padding-left: 30px" href="listmovie">Now Showing</a>
                        <a style="color: black; font-size: 22px; padding-right: 30px; text-decoration: underline" href="comingsoon" >Coming Soon</a>
                    </div>
                
                    <div style="padding-top: 20px" class="row spec_1">
                        <c:forEach items="${listM}" var="m">
                            <div class="col-md-3 mb-4">
                                <div class="spec_1im clearfix position-relative">
                                    <div class="spec_1imi clearfix film">
                                        <a href="moviedetail?ID=${m.getMovie_id()}">
                                            <img height="330px" src="${m.getPost_img()}" class="w-100" alt="abc">
                                        </a>
                                    </div>
                                </div>
                                <br/>
                                <div style="padding-left: 15px" class="spec_1im1 clearfix">
                                    <ul >
                                        <li>
                                            <a style="color: #000" id="nameMovie" class="text-white" href="moviedetail?ID=${m.getMovie_id()}">
                                                ${m.getMovie_name()}
                                            </a>
                                        </li>
                                        <li class="information">
                                            Duration: ${m.getDuration()} minutes
                                        </li>
                                        <li class="information">
                                            Age: ${m.getAge()}
                                        </li>
                                        <li class="information">
                                            Category: ${m.getType_name()}
                                        </li>
                                        <li style="padding-top: 10px; padding-left: 25px">
                                            <a class="bookTicket" href="bookticket?movieID=${m.getMovie_id()}">Book Tickets</a>
                                            <a style="margin-left: 3px" class="viewDetail" href="moviedetail?ID=${m.getMovie_id()}"><i class='bx bx-calendar-exclamation'></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        </div>
    </body>
</html>
