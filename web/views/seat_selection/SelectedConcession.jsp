<%-- 
    Document   : SelectedConcession
    Created on : 14/06/2024 9:40 
    Author     : HuyTQ
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Combo</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
        <style>
            .total-price {
                font-size: 1.5rem;
                font-weight: bold;
            }
            .quantity-buttons {
                display: flex;
                align-items: center;
            }
            .quantity-buttons button {
                margin: 0 5px;
            }
            #concessionsList::-webkit-scrollbar {
                display: none; /* Chrome, Safari, and Opera */
            }
        </style>
    </head>
    <body>
        <div style="background:none;padding: 0;margin: 0">
            <jsp:include page="/views/homepage/Header.jsp"/>
        </div>
        <div class="container mt-3">
            <div class="row">
                <!-- Left Column: List of Concessions -->
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Select Combos</h4>
                            <div id="concessionsList" class="list-group" style="height: 400px; overflow-y: scroll; -ms-overflow-style: none; scrollbar-width: none;">
                                <c:forEach items="${concessions}" var="c">
                                    <div class="list-group-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <img src="${c.image}" style="width: 50px;height: 50px"/>
                                                <h5 class="mb-1">${c.concessions_name}</h5>

                                                <p class="mb-1"><fmt:formatNumber value="${c.price}" type="number" groupingUsed="true" /> VNĐ</p> 

                                            </div>

                                            <div class="quantity-buttons">
                                                <button class="btn btn-outline-secondary minus-btn" onclick="updateQuantity('${c.concessions_name}', ${c.price}, -1, ${c.concessions_id})"><i class="fas fa-minus"></i></button>
                                                <span class="quantity" id="quantity-${c.concessions_name}">0</span>
                                                <button class="btn btn-outline-secondary plus-btn" onclick="updateQuantity('${c.concessions_name}', ${c.price}, 1, ${c.concessions_id})"><i class="fas fa-plus"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Order Summary and Buttons -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 style="color: red" class="card-title">Ticket Information</h4>
                            <h5> <span style="color: green">Showtime</span> ${show.date} | ${show.showtiming}:00</h5>
                            <h5> <span style="color: green">Room</span> ${room.room_name}</h5>
                            <h5><span style="color: green">Seat:</span> ${seat}</span></h5>
                            <ul id="orderSummary" class="list-group mb-3 order">
                                <!-- Order items will be dynamically added here -->
                            </ul>

                            <h5> <span style="color: green">Total price: </span> <span id="totalPrice" class="total-price">${totalprice}</span> VNĐ</h5>

                            <button id="backButton" class="btn btn-secondary" onclick="location.href = '${sessionScope.urlbackSeat}'"><i class="fas fa-arrow-left"></i> Back</button>
                            <button id="payButton" class="btn btn-primary" onclick="pay()"><i class="fas fa-credit-card"></i> Pay</button>
                            <h5 style="color: red; font-style: italic;">
                                You have <span id="timer">7:00</span> minutes to pay for this ticket. 
                                After that, if the transaction is unsuccessful, the ticket will be canceled.
                            </h5>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 10px">
            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>   
            </div>
            <script>
                function pay() {
                    let orderSummary = document.getElementById('orderSummary');
                    let items = orderSummary.querySelectorAll('li');
                    let orderData = [];
                    items.forEach(item => {
                        let name = item.id;
                        let quantity = item.querySelector('.badge').innerText;
                        // Create an object for each item
                        orderData.push({name: name, quantity: quantity});
                    });
                    // Prepare the query string
                    let queryString = orderData.map(item => 'name=' + item.name + "-" + item.quantity).join('&');
                    const show = "${show.showtime_id}";

                    const totalPrice = document.getElementById("totalPrice").innerText.replace(/\D/g, ''); // remove non-digit characters

                    const seat = "${seat}";
                    const url = "paymentServlet?" + "showtime=" + show + "&total=" + totalPrice + "&seat=" + seat + "&" + queryString;
                    window.location.href = url;
                }


                let totalPrice = parseInt('${totalprice}');
                const initialTotalPrice = parseInt('${totalprice}');
                const orderSummary = document.getElementById('orderSummary');
                const totalPriceElement = document.getElementById('totalPrice');


                function updateQuantity(name, price, change, id) {
                    const quantityElement = document.getElementById('quantity-' + name);
                    let quantity = parseInt(quantityElement.innerText);
                    quantity += change;
                    if (quantity < 0)
                        quantity = 0;
                    quantityElement.innerText = quantity;

                    // Update total price
                    totalPrice += price * change;

                    if (totalPrice < initialTotalPrice)
                        totalPrice = initialTotalPrice;
                    totalPriceElement.innerText = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(totalPrice);


                    // Update order summary
                    let item = document.getElementById(id);
                    if (quantity === 0) {
                        if (item)
                            orderSummary.removeChild(item);
                    } else {
                        if (!item) {
                            item = document.createElement('li');
                            item.id = id;
                            item.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');
                            item.innerText = name;
                            item.innerHTML += `<span class="badge badge-primary badge-pill">1</span>`;
                            orderSummary.appendChild(item);
                        } else {
                            item.querySelector('.badge').innerText = quantity;
                        }
                    }
                }
                function initializeCountdown(durationInMinutes) {
                    var timerDisplay = document.getElementById('timer');
                    var endTime = Date.now() + durationInMinutes * 60 * 1000; // Calculate end time

                    function updateTimer() {
                        var now = Date.now();
                        var remainingTime = endTime - now;
                        var minutes = Math.floor(remainingTime / (1000 * 60));
                        var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);
                        if (minutes < 10)
                            minutes = '0' + minutes;
                        if (seconds < 10)
                            seconds = '0' + seconds;

                        // Update the timer display
                        timerDisplay.textContent = minutes + ":" + seconds;

                        // If the countdown is finished, display a message and stop updating
                        if (remainingTime <= 0) {
                            timerDisplay.textContent = "00:00";
                            clearInterval(timerInterval);
                            // You can add additional actions here, e.g., redirecting to another page
                            // window.location.href = "cancelPage.html";
                        }
                    }

                    // Update the timer every second
                    var timerInterval = setInterval(updateTimer, 1000);

                    // Initialize the timer display
                    updateTimer();
                }

                // Initialize the countdown timer for 6 minutes and 30 seconds
                window.onload = function () {
                    initializeCountdown(7);
                };
        </script>
    </body>
</html>
