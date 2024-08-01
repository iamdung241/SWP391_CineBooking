<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>QR Code Scanner</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/html5-qrcode.min.js"></script>
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
            .detail {
                margin-top: 100px;
                margin-bottom: 30px;
            }
            .navbarDetail {
                background-color: #000;
            }
            .nameDetail {
                font-size: 30px;
                font-weight: bold;
                margin-left: 20px;
            }
            ul {
                font-family: sans-serif;
            }
            span {
                font-weight: bold;
                font-size: 17px;
            }
            .bookTicket {
                color: rgb(240, 240, 240);
                background-color: red;
                padding: 5px;
                font-size: 15px;
                border-radius: 5px;
                margin-left: 7px;
            }
            .bookTicket:hover {
                color: #000; /* Text color on hover */
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
            <section id="header">
                <nav style="background-color: #000 ; padding-top: 5px; padding-bottom: 5px" class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                    <div class="container-xl">
                        <a class="navbar-brand fs-2 p-0 fw-bold text-white m-0 me-5" href="#"><img class="navbar-logo" src="/CineBooking/img/movieLogo.PNG"/></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <ul class="navbar-nav mb-0 ms-auto">
                                <li class="nav-item">
                                    <c:if test="${sessionScope.user == null}">
                                        <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/login.jsp"><i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1 "></i> Login </a>
                                    </c:if>
                                    <c:if test="${sessionScope.user != null}">
                                        <div class="nav-item dropdown">
                                            <a style="color: #fff; font-size: 15px" class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
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
            <section id="exep" class="p_3 bg-light">
                <div class="container-xl detail">
                    <div class="row exep1">
                        <div class="col-4">
                            <form id="scanForm" action="scanticket" method="get">
                                <label for="code">Enter Ticket Code:</label>
                                <br/>
                                <input type="text" id="code" name="code" required />
                                <button type="submit" class="bookTicket">Search Code</button>
                            </form>
                            <jsp:include page="QRCode.jsp"></jsp:include>
                            </div>
                            <div class="col-7">
                                <div class="ticketDetail row">
                                <c:if test="${param.code != null}">
                                    <c:choose>
                                        <c:when test="${ticket != null}">
                                            <div class="exep1r">
                                                <c:if test="${ticket.getStatus() == 'Nocheck'}">
                                                    <p class="mb-0 nameDetail">Code: <span style="color: red; font-size: 30px">${ticket.getCode()}</span> / Status: <span style="color: red; font-size: 30px;">${ticket.getStatus()}</span></p>
                                                    </c:if>
                                                    <c:if test="${ticket.getStatus() == 'Checked'}">
                                                    <p class="mb-0 nameDetail">Code: <span style="color: red; font-size: 30px">${ticket.getCode()}</span> / Status: <span style="color: green; font-size: 30px">${ticket.getStatus()}</span></p>
                                                    </c:if>
                                            </div>
                                            <hr style="background-color: #000"/>
                                            <div class="col-4">
                                                <img border="2px" width="200px" height="250px" src="${ticket.getMovieImage()}" alt="movieImage"/>
                                            </div>
                                            <div class="col-7">
                                                <ul>
                                                    <li>
                                                        <span>Movie:</span> ${ticket.getMovieName()}
                                                    </li>
                                                    <li>
                                                        <span>Date:</span> ${ticket.getShowtime().getDate()}
                                                    </li>
                                                    <li>
                                                        <span>Showtime:</span> ${ticket.getShowtime().getShowtiming()}:00
                                                    </li>
                                                    <li>
                                                        <span>Age:</span> ${ticket.getShowtime().getMovieAge()}
                                                    </li>
                                                    <li>
                                                        <span>Seat:</span>
                                                        <c:forEach items="${ticket.seat}" var="ts">
                                                            ${ts.seat_name}
                                                        </c:forEach>
                                                    </li>
                                                    <li>
                                                        <c:if test="${not empty ticket.combo}">
                                                            <span>Combo:</span><br>
                                                            <c:forEach items="${ticket.combo}" var="tc">
                                                                ${tc.concessions_name} - <span style="font-weight: bold">Quantity :</span> ${tc.quantity} <br>
                                                            </c:forEach>
                                                        </c:if>
                                                    </li>
                                                    <li>
                                                        <span>Date Booked:</span> ${ticket.getDate_book()}
                                                    </li>
                                                    <li>
                                                        <span>Total price:</span> <fmt:formatNumber value="${ticket.totalprice}" type="number" groupingUsed="true"/> VNĐ
                                                    </li>
                                                    <hr style="background-color: #000"/>
                                                    <li>
                                                        <c:if test="${ticket.getStatus() == 'Nocheck'}">
                                                            <c:if test="${showAcceptButton}">
                                                                <form action="scanticket" method="post">
                                                                    <input type="hidden" name="code" value="${ticket.getCode()}" />
                                                                    <button type="submit" class="bookTicket">Accept</button>
                                                                </form>
                                                            </c:if>
                                                        </c:if>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p style="font-family: Arial, sans-serif; font-size: 24px; color: #D8000C; background-color: #FFBABA; padding: 20px; border: 1px solid #D8000C; border-radius: 10px; width: fit-content; margin: 20px auto; text-align: center; box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);">
                                                Ticket not found
                                            </p>

                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${message != null}">
                                    <p style="font-weight: bolder; color: green; font-weight: 30px; align-items: center">${message}</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function onScanSuccess(qrCodeMessage) {
                document.getElementById('code').value = qrCodeMessage;
                document.getElementById('scanForm').submit();
            }

            function onScanError(errorMessage) {
                // Handle scan error if needed
            }

            var html5QrcodeScanner = new Html5QrcodeScanner("reader", {fps: 10, qrbox: 250});
            html5QrcodeScanner.render(onScanSuccess, onScanError);
        </script>
    </body>
</html>
