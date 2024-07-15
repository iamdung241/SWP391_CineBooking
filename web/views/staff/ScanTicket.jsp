<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>QR Code Scanner</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/html5-qrcode.min.js"></script>
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
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100 navbarDetail">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
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
                                                    <p class="mb-0 nameDetail">Code: ${ticket.getCode()} / Status: <span style="color: red; font-size: 30px;">${ticket.getStatus()}</span></p>  
                                                    </c:if>
                                                    <c:if test="${ticket.getStatus() == 'Checked'}">
                                                    <p class="mb-0 nameDetail">Code: ${ticket.getCode()} / Status: <span style="color: green; font-size: 30px">${ticket.getStatus()}</span></p>  
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
                                                        <span>Date:</span> ${ticket.getShowtime().getShowtiming()}:00
                                                    </li>
                                                    <li>
                                                        <span>Showtime:</span> ${ticket.getShowtime().getShowtiming()}:00
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
                                                        <span>Total price:</span> ${ticket.getTotalprice()} VNĐ
                                                    </li>
                                                    <hr style="background-color: #000"/>
                                                    <li>
                                                        <c:if test="${ticket.getStatus() == 'Nocheck'}">
                                                            <c:choose>
                                                                <c:when test="${showAcceptButton}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <form action="scanticket" method="post">
                                                                        <input type="hidden" name="code" value="${ticket.getCode()}" />
                                                                        <button type="submit" class="bookTicket">Accept</button>
                                                                    </form>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>

                                                    </li>
                                                </ul>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Ticket not found</p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${message != null}">
                                    <p>${message}</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>


        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>

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
