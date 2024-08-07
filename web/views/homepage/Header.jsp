<%-- 
    Document   : Header
    Created on : May 20, 2024, 9:01:05 AM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Play Show</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="css/global.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
        <style>
            .dropdown-menu {
                background-color: #fff;
                border-radius: 10px;
            }

            .dropdown-item {
                color: #000;
                font-weight: bold;
                font-size: 18px;
            }

            .dropdown-item:hover {
                color: #fff;
            }
            .navbar-logo {
                height: 60px;
                width: 170px;
            }
        </style>
    </head>
    <body>
        <section id="header">
            <nav style="background-color: #000 ; padding-top: 5px; padding-bottom: 5px" class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                <div class="container-xl">
                    <a class="navbar-brand fs-2 p-0 fw-bold text-white m-0 me-5" href="#"><img class="navbar-logo" src="/CineBooking/img/movieLogo.PNG"/></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <c:if test="${sessionScope.user.getRole_id() != 5}">
                            <ul class="navbar-nav mb-0">
                                <li class="nav-item dropdown">
                                    <a style="color: #fff; font-size: 15px" class="nav-link dropdown-toggle" href='/CinemaBooking/home' id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Home</a>
                                    <ul style="border: none" class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="/CineBooking/listmovie">Now showing</a></li>
                                        <li><a class="dropdown-item" href="/CineBooking/comingsoon">Coming soon</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/views/homepage/About.jsp">About </a>
                                </li>
                                <li class="nav-item">
                                    <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/concession">Concession</a>
                                </li>
                                <li class="nav-item">
                                    <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/theaterx?service=searchAll">Theater</a>
                                </li>
                                <li class="nav-item">
                                    <c:if test="${sessionScope.user == null}">
                                        <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/login.jsp">Account</a>
                                    </c:if>       
                                    <c:if test="${sessionScope.user != null}">
                                        <a style="color: #fff; font-size: 15px" class="nav-link" href="customerController?userID=${sessionScope.user.account_id}">Profile</a>

                                    </c:if>  
                                </li>		
                            </ul>
                        </c:if>
                        <ul class="navbar-nav mb-0 ms-auto">
                            <li class="nav-item">
                                <c:if test="${sessionScope.user == null}">
                                    <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/login.jsp"><i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1 "></i> Login </a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <div class="nav-item dropdown">
                                        <a style="color: #fff; font-size: 15px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1"></i>
                                            Welcome ${sessionScope.user.fullname} !
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="/CineBooking/OrderHistory">Order History</a></li>
                                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                                        </ul>
                                    </div>
                                </c:if>


                            </li>
                            <li>

                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
    </body>
</html>