<%-- 
    Document   : ShowTicket
    Created on : 24 thg 6, 2024, 21:15:24
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .notification {
                margin-top: 1px;
                padding: 15px;
                background-color: #e9f7ef;
                border: 1px solid #d4edda;
                border-radius: 5px;
            }
            .notification p {
                margin: 10px 0;
                font-size: 16px;
                color: #155724;
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
            .details-row {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }
            .details-col {
                width: 48%;
            }
            .highlight {
                color: green;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/views/homepage/./Header.jsp"></jsp:include>
            <div class="container mt-2">
                <div style="padding-top: -100px"  class="row justify-content-center">
                    <div class="col-md-10">
                        <div  class="card">
                            <div class="card-header text-center">
                                <h4 style="color: red; font-size: 20px" class="card-title highlight">Ticket Details and Important Information</h4>
                            </div>
                            <div class="card-body">
                                <div class="qr-poster">
                                    <div class="col-md-6">
                                        <img class="img-fluid" src="${movie.post_img}" alt="Movie Poster"/>
                                </div>
                                <div class="col-md-6 text-center">
                                    <p class="highlight">QR Code</p>
                                    <img src="generateQR?text=${ticket.code}" style="width: 200px; height: 200px;" class="img-fluid"/>
                                </div>
                            </div>
                            <hr>
                            <div class="details-row">
                                <div class="details-col">
                                    <p><span class="highlight">Theater:</span> ${ticket.theaterName}</p>
                                    <p><span class="highlight">Ticket Code:</span> ${ticket.code}</p>
                                    <p><span class="highlight">Movie:</span> ${movie.movie_name}</p>
                                    <p><span class="highlight">Date:</span> ${show.date}</p>
                                    <p><span class="highlight">Time:</span> ${show.showtiming}:00</p>
                                    <div class="details-col">
                                        <p><span class="highlight">Customer:</span> ${user.fullname}</p>

                                    </div>
                                </div>
                                <div class="details-col">
                                    <p><span class="highlight">Room:</span> ${show.room_name}</p>
                                    <p><span class="highlight">Seat:</span>
                                        <c:forEach items="${ticket.seat}" var="ts">
                                            ${ts.seat_name}
                                        </c:forEach>
                                    </p>
                                    <p><span class="highlight">Combo:</span><br>
                                        <c:forEach items="${ticket.combo}" var="tc">
                                            ${tc.concessions_name} - Qty: ${tc.quantity} <br>
                                        </c:forEach>
                                    </p>
                                    <p><span class="highlight">Total Price:</span> ${ticket.totalprice} VND</p>
                                    <div class="details-col">
                                        <p><span class="highlight">Booking Date:</span> ${ticket.date_book}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="notification">
                                <p class="highlight">Important Information:</p>
                                <p>Please arrive at the cinema at least 10 minutes before the showtime for check-in.</p>
                                <p>The check-in counter will open 1 hour before the showtime and close 1 hour after the showtime starts.</p>
                                <p>For movies rated 16 and above, please bring your ID card for age verification.</p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="/CineBooking/home" class="btn btn-primary">Back to Home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
