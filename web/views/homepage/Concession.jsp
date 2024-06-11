<%-- 
    Document   : Concession
    Created on : May 21, 2024, 8:10:00 AM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Concession</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <style>
            .film{
                border: 2px solid #000;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
            </div>
            <div class="main_blog clearfix">
                    <section id="center" class="center_blog">
                        <div class="container-xl">
                            <div class="row center_o1">
                                <div class="col-md-12">
                                    <h2 class="text-white">Concession</h2>
                                    <h6 class="mb-0 mt-3 fw-normal col_red"><a class="text-light" href="home">Home</a> <span class="mx-2 text-muted">/</span>Concession</h6>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="main_2 clearfix">
                    <section id="spec" class="p_3">
                        <div class="container-xl">
                            <div class="row stream_1 text-center">
                                <div class="col-md-12">
                                    <h1 style="color: #000" class="mb-0 font_50">Now Showing</h1>
                                </div>
                            </div>
                            <div class="row spec_1 mt-4 ">
                            <c:forEach items = "${listC}" var = "c">
                                <div class="pe-0 col-3">
                                    <div class="spec_1im clearfix position-relative">
                                        <div class="spec_1imi clearfix film">
                                                <img width="160px" height="300px" src="${c.getImage()}" class="w-100" alt="abc">
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="spec_1im1 clearfix">
                                        <ul>
                                            <li style="font-weight: bold">
                                                    ${c.getConcessions_name()}
                                            </li>
                                            <li class="col_black">
                                                Price: ${c.getPrice()}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                </section>
            </div>
        </div>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
    </body>
</html>
