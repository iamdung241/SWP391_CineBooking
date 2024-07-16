<%-- 
    Document   : OrderHistory
    Created on : Jul 7, 2024, 7:18:57 PM
    Author     : Tran Anh Vu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>My Profile</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/font-awesome.min.css" rel="stylesheet">
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                font-family: 'Overpass', sans-serif;
                background-color: #000;
                color: black;
            }

            .main_1 {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
                background-color: #000;
                box-shadow: 0 2px 5px rgba(255, 255, 255, 0.1);
            }

            .main-content {
                margin-top: 100px;
                padding: 20px;
            }

            .user-profile {
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
                color: black;
            }

            .user-profile-nav h4 {
                font-size: 1.75em;
                margin-bottom: 20px;
                color: black;
            }

            .menu-nav a {
                display: block;
                margin-bottom: 10px;
                color: black;
                text-decoration: none;
                font-size: 1.1em;
                transition: color 0.3s;
            }

            .menu-nav a:hover {
                color: #007bff;
                text-decoration: underline;
            }

            .user-profile-info {
                border-radius: 12px;
                box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
                color: black;
            }

            .user-profile-info h3 {
                margin-bottom: 20px;
                font-size: 2em;
                color: black;
            }

            .icon {
                font-size: 1.5em;
                margin-right: 10px;
                color: #007bff;
            }

            .header {
                background-image: linear-gradient(to right, #000, #333);
                color: white;
                box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            }

            .header h1 {
                margin: 0;
                font-size: 2.5em;
                text-align: center;
            }

            .card-title {
                color: #007bff;
                font-weight: bold;
            }

            .card-text strong {
                color: #007bff;
            }

            .container {
                max-width: 1200px;
            }

            .details-row {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .details-col {
                flex: 1;
                min-width: 200px;
                margin: 10px 0;
            }

            .qr-poster {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }

            .qr-poster img {
                max-width: 100%;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="header main_1 clearfix">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
            </div>
            <div class="main-content container">
                <c:if test="${sessionScope.user != null}">
                    <div class="user-profile">
                        <div class="row justify-content-between user-profile-container">
                            <div class="col-lg-3 user-profile-nav">
                                <h4><i class="fa fa-user icon"></i>My Profile</h4>
                                <div class="menu-nav">
                                    <a href="changepassword.jsp?userID=${sessionScope.user.account_id}" class="menu-nav-item user-info"><i class="fa fa-lock icon"></i>Change Password</a>
                                    <a href="OrderHistory?userID=${sessionScope.user.account_id}" class="menu-nav-item buy-history"><i class="fa fa-history icon"></i>Order History</a>
                                </div>
                            </div>
                            <div class="col-sm-8 user-profile-info">
                                <div class="user-profile-desc">
                                    <h3 class="text-center"><i class="fa fa-info-circle icon"></i>Order History</h3>
                                    <div class="container overflow-auto" style="max-height: 500px">
                                        <c:forEach var="ticket" items="${tickets}">
                                            <div class="card mb-5 border-danger">
                                                <div class="card-body">
                                                    <h5 class="card-title">Ticket Code: ${ticket.code}</h5>
                                                    <div class="qr-poster">
                                                        <div class="col-md-6">
                                                            <img style="border-style: solid; border-width: 10px" height="350px" src="${ticket.movieImage}" alt="abc">
                                                        </div>
                                                        <div class="col-md-6 text-center">
                                                            <p><strong>QR Code</strong></p>
                                                            <img src="generateQR?text=${ticket.code}" style="width: 200px; height: 200px;" class="img-fluid"/>
                                                        </div>
                                                    </div>
                                                    <div class="details-row">
                                                        <div class="details-col">
                                                            <p class="card-text"><strong>Movie:</strong> ${ticket.movieName}</p>
                                                            <p class="card-text"><strong>Showtime:</strong> ${ticket.showtime.showtiming}:00</p>
                                                        </div>
                                                        <div class="details-col">
                                                            <p class="card-text"><strong>Room:</strong> ${ticket.showtime.room_name}</p>
                                                            <p class="card-text"><strong>Date:</strong> ${ticket.showtime.date}</p>
                                                        </div>
                                                        <div class="details-col">
                                                            <p class="card-text"><strong>Total Price:</strong> ${ticket.totalprice} VND</p>
                                                            <p class="card-text"><strong>Status:</strong> ${ticket.status}</p>
                                                        </div>
                                                        <div class="details-col">
                                                            <p class="card-text"><strong>Date Booked:</strong> ${ticket.date_book}</p>
                                                            <p class="card-text"><strong>Seats:</strong>
                                                                <c:forEach items="${ticket.seat}" var="s">
                                                                    ${s.seat_name}
                                                                </c:forEach>
                                                            </p>
                                                            <c:if test="${ticket.combo != null}">
                                                                <p class="card-text"><strong>Combos:</strong>
                                                                    <c:forEach items="${ticket.combo}" var="tc">
                                                                        ${tc.concessions_name}/SL: ${tc.quantity} <br>
                                                                    </c:forEach>
                                                                </p>        
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <a class="container btn btn-primary mb-3" href="customerController?userID=<%= request.getParameter("userID")%>" id="back">Back</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        </div>
    </body>
</html>
