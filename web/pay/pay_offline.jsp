<%-- 
    Document   : pay_offline
    Created on : 1 Aug 2024, 18:18:07
    Author     : Son
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán hóa đơn</title>
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
            .payment-section {
                margin-left: 70px;
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            .payment-section .col-md-5 {
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .payment-section .form-control {
                margin-bottom: 10px;
                font-size: 1.2rem;
                height: calc(1.5em + 1rem + 2px);
            }
            .payment-section label {
                font-size: 1.2rem;
            }
            .payment-section button {
                font-size: 1rem;
                padding: 0.4rem 1rem;
            }
            .card-title {
                font-size: 2rem;
            }
            .card-body p {
                font-size: 1.2rem;
            }
            .card {
                width: 100%;
            }
            .container {
                margin-top: 20px;
                margin-bottom: 20px;
            }
            .input-short {
                width: 80%; 
                margin-left: auto; 
                margin-right: auto; 
            }
            .insufficient-funds {
                color: red;
                font-size: 1.2rem;
                margin-top: 10px;
                display: none; 
            }
        </style>
    </head>
    <body>
        <jsp:include page="/views/homepage/./Header.jsp"></jsp:include>
        <div class="container mt-5 mb-5">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4 class="card-title highlight">Ticket Booking Information</h4>
                        </div>
                        <div class="card-body">
                            <div class="details-row">
                                <div class="details-col">
                                    <p><span class="highlight">Ticket Code:</span> ${ticket.code}</p>
                                    <p><span class="highlight">Movie:</span> ${movie.movie_name}</p>
                                    <p><span class="highlight">Date:</span> ${show.date}</p>
                                    <p><span class="highlight">Time:</span> ${show.showtiming}:00</p>
                                    <p><span class="highlight">Room:</span> ${show.room_name}</p>
                                </div>
                                <div class="details-col">
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
                                    <p><span class="highlight">Booking Date:</span> ${ticket.date_book}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="payment-section">
                        <div class="col-md-12">
                            <label for="Cprice">Amount received:</label>
                            <input class="form-control input-short" type="number" id="Cprice" oninput="calculateChange()"/>
                            <label for="total">Return amount:</label>
                            <input class="form-control input-short" type="text" id="total" readonly/>
                            <div class="insufficient-funds" id="insufficientFunds">Not enough</div>
                            <br/>
                            <form action="payoff" method="post">
                                <button type="submit" class="btn btn-success">Payment confirmation</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/views/homepage/./Footer.jsp"></jsp:include>
        <script>
            const totalCost = parseInt('${ticket.totalprice}');

            function calculateChange() {
                const customerPrice = document.getElementById('Cprice').value;
                const change = customerPrice - totalCost;
                document.getElementById('total').value = change;
                const insufficientFunds = document.getElementById('insufficientFunds');
                if (change < 0) {
                    insufficientFunds.style.display = 'block';
                } else {
                    insufficientFunds.style.display = 'none';
                }
    }
        </script>
    </body>
</html>
