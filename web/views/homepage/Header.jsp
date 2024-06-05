<%-- 
    Document   : Header
    Created on : May 20, 2024, 9:01:05 AM
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
        <title>Play Show</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="css/global.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <section id="header">
            <nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                <div class="container-xl">
                    <a class="navbar-brand fs-2 p-0 fw-bold text-white m-0 me-5" href="/CineBooking/home" style="color: red"><i class="fa fa-youtube-play me-1 col_red"></i> Play Show </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mb-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/CineBooking/home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CineBooking/views/homepage/About.jsp">About </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CineBooking/concession">Concession</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CineBooking/showtiming">Showtimings</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/CineBooking/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <c:if test="${sessionScope.user == null}">
                                    <a class="nav-link" href="login.jsp">Account</a>
                                </c:if>       
                                <c:if test="${sessionScope.user != null}">
                                    <a class="nav-link" href="/views/homepage/Home.jsp">Account</a>
                                </c:if>  
                            </li>		
                        </ul>
                        <ul class="navbar-nav mb-0 ms-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle dropdown_search" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-search"></i>
                                </a>
                                <ul class="dropdown-menu drop_1 drop_o p-3" aria-labelledby="navbarDropdown" data-bs-popper="none">
                                    <li>
                                        <div class="input-group p-2">
                                            <input type="text" class="form-control border-0" placeholder="Search Here">
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary bg-transparent border-0 fs-5" type="button">
                                                    <i class="fa fa-search col_red"></i> </button>
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="nav-item">
                                <c:if test="${sessionScope.user == null}">

                                    <a class="nav-link" href="login.jsp"><i class="fa fa-user fs-4 align-middle me-1 lh-1 col_red"></i> Login </a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <a class="nav-link" href="logout"><i class="fa fa-user fs-4 align-middle me-1 lh-1 col_red"></i> Logout </a>

                                </c:if>  
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
    </body>
</html>