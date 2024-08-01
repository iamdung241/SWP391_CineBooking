<%-- 
    Document   : Cinema
    Created on : Jul 30, 2024, 3:31:32 AM
    Author     : DungTT
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
            .boxes {
                text-align: center;
                padding-top: 30px;
                display: flex;
                flex-direction: row;
                font-family: Arial, Helvetica, sans-serif;
                font-weight: bold;
                margin-left: 30px;
            }

            .box {
                border: 1px solid black;
                border-radius: 10px;
                font-size: 19px;
                margin-right: 20px;
                text-align: center;
                padding: 10px;
            }
            .date {
                display: inline-block;
            }
            .date:hover {
                color: red;
            }
            hr {
                background-color: #000;
            }
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
        <div class="main clearfix position-relative">
            <div style="background-color: #000">
                <section id="header">
                    <nav style="background-color: #000 ; padding-top: 5px; padding-bottom: 5px" class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                        <div class="container-xl">
                            <a class="navbar-brand fs-2 p-0 fw-bold text-white m-0 me-5" href="#"><img class="navbar-logo" src="/CineBooking/img/movieLogo.PNG"/></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mb-0">

                                    <li class="nav-item">
                                        <c:if test="${sessionScope.user == null}">
                                            <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/login.jsp">Account</a>
                                        </c:if>       
                                    </li>		
                                </ul>
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
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="/CineBooking/OrderHistory">Order History</a></li>
                                                    <li><a class="dropdown-item" href="/CineBooking/ViewTask">View Task</a></li>
                                                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </section>
            </div>
        </div>


        <div style="display: flex; align-items: center;">
            <h3 style="color: red; margin-left: 300px; font-size: 50px;">${theater.name}</h3>   
            <div style="margin-left: 100px">
                <a class="boxes" id="dateContainer">
                </a>
                <hr style="background-color: #000;"/>
            </div>
        </div>

        <section style="padding-top: 50px" id="exep" class="p_3 ">
            <div class="container-xl detail">
                <div class="row exep1">
                    <c:forEach items="${listMovieTheater}" var="m">
                        <div class="col-3">
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
                                <p><i class='bx bxs-purchase-tag-alt'></i>${m.getType_name()}&nbsp&nbsp / &nbsp <i class='bx bxs-time' ></i> ${m.getDuration()} minutes</p>
                            </div> 
                            <hr/>
                            <div class="container mt-4">
                                <c:choose>
                                    <c:when test="${empty m}">
                                        <h5 style="color: red; font-style: italic;">You have to select a date first.</h5>
                                    </c:when>

                                    <c:otherwise>
                                        <!-- Display showtimes if a date is selected -->
                                        <c:forEach items="${m.getListShowtime()}" var="s">
                                            <div style="padding: 15px">
                                                <!-- Check if the user is logged in -->
                                                <c:if test="${sessionScope.user == null}">
                                                    <a class="showtime" href="login.jsp">
                                                        ${s.getShowtiming()}:00 &nbsp|&nbsp ${s.room_name}
                                                    </a>
                                                </c:if>
                                                <c:if test="${sessionScope.user != null}">
                                                    <a class="showtime" href="seat?showtimeID=${s.getShowtime_id()}&theaterID=${u.theaterID}&roomID=${s.room_id}&movieID=${m.getMovie_id()}&date=${selectedDate}">
                                                        ${s.getShowtiming()}:00 &nbsp|&nbsp ${s.room_name}
                                                    </a>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <hr style="background-color: #000;"/>
                    </c:forEach>                   
                </div>    
            </div>
        </section>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>

            <script>
                // Set the current date and display it
                function displayCurrentDate() {
                    var dateContainer = document.getElementById('dateContainer');
                    var currentDate = new Date();
                    var day = currentDate.getDate().toString().padStart(2, '0');
                    var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
                    var year = currentDate.getFullYear();
                    var formattedDate = day + '/' + month + '-' + currentDate.toLocaleDateString('en-US', {weekday: 'long'});
                    var formattedDateForLink = year + "-" + month + "-" + day;

                    var box = document.createElement('div');
                    box.classList.add('box');

                    var dateElement = document.createElement('a');
                    dateElement.classList.add('date');
                    dateElement.textContent = formattedDate;
                    dateElement.href = 'ticketSeller?service=search&theaterID=${theater.id}&date=' + formattedDateForLink;
                    if ("${selectedDate}" === formattedDateForLink) {
                        dateElement.style.color = 'red'; // Highlight the selected date
                    }
                    box.appendChild(dateElement);
                    dateContainer.appendChild(box);
                }

                displayCurrentDate();
        </script>
    </body>
</html>
