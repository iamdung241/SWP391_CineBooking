<%-- 
    Document   : Seat
    Created on : May 28, 2024, 2:18:03 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat</title>
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div style="background-color: black" class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
            </div>
            <div style="padding-top: 120px" class="container">   
                <h1 style="color: red" class="text-center">
                    Seat Booking 
                </h1>
                <div style="padding-top: 20px" class="row">
                    <div class="col-7">
                        <div class="mx-2">
                            <p style="background: red" class="text-center text-white">Screen</p>   
                        </div>
                        <div class="row">
                            <c:forEach items="${listS}" var="s">
                                <div style="margin-left: 18px" class="col-2 my-2">          
                                    <div class="text-center" style="border: 1px solid; border-radius: 5px; background-color: black"><a style="color: white; text-decoration: none" href="#">${s.getSeat_name()}</a></div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-5">
                        <div>Movie: </div>
                        <div>Time: </div>
                        <div>Total: </div>
                        <div>Selected Seats: </div>
                    </div>
                </div>
        </div>
        </div>
            <div style="margin-top: 60px">
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>   
                </div>
    </body>
</html>
