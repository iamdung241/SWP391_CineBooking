<%-- 
    Document   : SelectedConcession
    Created on : 14/06/2024 9:40 
    Author     : HuyTQ
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                                <p class="mb-1">${c.price}</p>
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
                                <h4 class="card-title">Order</h4>
                                <h5>Movie: ${movie.movie_name}</h5>
                                <h5>Date: ${show.date} | ${show.showtiming}:00</h5>
                                <h5>Room: ${room.room_name}</h5>
                                <h5>Seat: <span style="color: green">${seat}</span></h5>
                                <ul id="orderSummary" class="list-group mb-3 order">
                                    <!-- Order items will be dynamically added here -->
                                </ul>
                                <h5>Total Price: <span id="totalPrice" class="total-price">${totalprice}</span></h5>
                                <button id="backButton" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</button>
                                <button id="payButton" class="btn btn-primary" onclick="pay()"><i class="fas fa-credit-card"></i> Pay</button>
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
                        let name = item.innerText.trim();
                        let quantity = item.querySelector('.badge').innerText;
                        // Create an object for each item
                        orderData.push({name: name, quantity: quantity});
                    });

                    // Prepare the query string
                    let queryString = orderData.map(item => 'name=' + item.name).join('&');
                    const show = "${show.showtime_id}";
                    const totalPrice = document.getElementById("totalPrice").innerHTML;
                    const seat = "${seat}";
                    const url = "paymentServlet?" + "showtime=" + show + "&total=" + totalPrice + "&seat=" + seat + "&" + queryString;
                    window.location.href = url;
                }
                let totalPrice = parseFloat('${totalprice}');
                const totalPriceE = parseFloat('${totalprice}');
                const orderSummary = document.getElementById('orderSummary');
                const totalPriceElement = document.getElementById('totalPrice');
                function updateQuantity(name, price, change) {
                    const quantityElement = document.getElementById('quantity-' + name);
                    let quantity = parseInt(quantityElement.innerText);
                    quantity += change;
                    if (quantity < 0)
                        quantity = 0;
                    quantityElement.innerText = quantity;

                    // Update total price
                    totalPrice += price * change;
                    if (totalPrice <= totalPriceE)
                        totalPrice = totalPriceE;
                    totalPriceElement.innerText = totalPrice;

                    // Update order summary
                    let item = document.getElementById('order-item-' + name);
                    if (quantity === 0) {
                        if (item)
                            orderSummary.removeChild(item);
                    } else {
                        if (!item) {
                            item = document.createElement('li');
                            item.id = 'order-item-' + name;
                            item.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');
                            item.innerText = name;
                            item.innerHTML += `<span class="badge badge-primary badge-pill">1</span>`;
                            orderSummary.appendChild(item);
                        } else {
                            item.querySelector('.badge').innerText = quantity;
                        }
                    }
                }
        </script>
    </body>
</html>
