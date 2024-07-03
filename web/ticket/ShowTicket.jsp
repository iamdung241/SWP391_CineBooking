<%-- 
    Document   : ShowTicket
    Created on : 24 thg 6, 2024, 21:15:24
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="/views/homepage/./Header.jsp"></jsp:include>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4 class="card-title">Ticket Details</h4>
                        </div>
                        <div class="card-body">
                            <p><strong>Ticket Code:</strong> ${ticket.code}</p>
                            <p><strong>Movie:</strong> ${movie.movie_name}</p>
                            <p><strong>Date watch:</strong> ${show.date} | <strong>Time:</strong> ${show.showtiming}:00</p>
                            <p><strong>Room:</strong> ${show.room_name}</p>
                            <p><strong>Seat:</strong>
                                <c:forEach items="${ticket.seat}" var="ts">
                                    ${ts.seat_name}
                                </c:forEach>
                            </p>
                            <p><strong>Combo:</strong><br> 
                                <c:forEach items="${ticket.combo}" var="tc">
                                    ${tc.concessions_name} - Sl : ${tc.quantity} <br>
                                </c:forEach>
                            </p>
                            <p><strong>Total Price:</strong> ${ticket.totalprice} VND</p>
                            <hr>
                            <p><strong>User:</strong> ${user.fullname}</p>
                            <p><strong>Date book:</strong> ${ticket.date_book}</p>
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
