<%-- 
    Document   : Seat
    Created on : May 28, 2024, 2:18:03 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat</title>
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <style>
            .seat.active {
                background-color: green; /* Màu nền khi ghế được chọn */
            }
            .seat:hover {
                background-color: red; /* Màu khi di chuột vào seat */
                cursor: pointer;
            }
            .card-title {
                font-size: 1rem; /* Adjust the font size for better readability */
                margin-bottom: 0.5rem; /* Adjust margin for better spacing */
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div style="background-color: black" class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div style="padding-top: 120px" class="container">   
                    <h1 style="color: red" class="text-center">
                        Seat Booking 
                    </h1>
                    <div style="padding-top: 20px" class="row">
                        <div class="col-6">
                            <div style="text-align: center">
                                <div>
                                    <img style="weight: 100px; height: 60px" src="/CineBooking/img/screen.JPG" alt="imageSrc">
                                </div>

                                <div style="margin-top: 20px" class="row cinema-seats">
                                <c:forEach items="${listSeat}" var="s">
                                    <div style="margin-left: 18px" class="col-2 my-2">          
                                        <div class="text-center seat ${s.getStatus().equals('Booked') ? 'booked' : ''}" style="border: 1px solid; border-radius: 5px; background-color: ${s.getStatus().equals('Booked') ? 'red' : 'black'}" >
                                            <label style="color: white; text-decoration: none">
                                                <input class="seat-price" type="hidden" value="${s.getPrice()}">
                                                ${s.getSeat_name()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>  
                    <div style="margin-left: 50px; padding-left: 10px" class="col-5">
                        <div style="background-color: rgb(240,240,240); padding-bottom: 100px">
                            <div style="padding-left: 30px">
                                <h2 style="text-align: center; color: red; padding-top: 10px">Movie Ticket</h2>
                                <span style="font-size: 21px; font-weight: bold; color: green">PlayShow Cinema</span>
                                <br/>
                                <div>
                                    <span style="padding-right: 90px; font-size: 18px" ><span style="font-weight: bold">Room: &nbsp</span><span style="color: green">${room.getRoom_name()}</span></span><br>
                                    <span style="padding-right: 70px; font-size: 18px"><span style="font-weight: bold">Showtiming:&nbsp </span> <span style="color: green"> ${showtime.getShowtiming()}:00</span></span><br>
                                    <span style="padding-right: 70px; font-size: 18px"><span style="font-weight: bold"> Date:&nbsp<span style="color: green"> ${showtime.date}</span> </span></span>
                                </div>
                                <hr/>
                                <div><h4><i class='bx bx-movie-play'></i><span style="color: green"> ${movie.getMovie_name()} </span></h4></div> 
                                <div><span style="font-weight: bold; font-size: 19px">Selected Seats: &nbsp<span style="color: green" id="selected-seats"></span><input type="hidden" id="ghe"></span></div>
                                <div><span style="font-weight: bold; font-size: 19px">Quality: &nbsp<span style="color: green" id="selected-seat-count"></span> </span></div>
                                <div><h5><i class='bx bx-money-withdraw'></i> Total price: <span id="total-price" style="color: green"></span><h5></div>
                                            <hr/>
                                            <div style="text-align: center; padding-top: 20px">
                                                <a style="border-style: solid; border-radius: 10px; text-align: center; padding: 15px; background-color: black; color: white" href="/CineBooking/home"><i class='bx bx-left-arrow'></i> Back</a>
                                                <a style="border-style: solid; border-radius: 10px; text-align: center; padding: 15px; background-color: red; color: white" id="payment-link" href="#" onclick="redirectWithParams()">Next<i class='bx bx-right-arrow'></i></a>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div style="margin-top: 60px">
                                                <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>   
                                                </div>
                                                <script>
                                                    function redirectWithParams() {
                                                        // Lấy giá trị của input
                                                        const selectedSeats = document.getElementById("ghe").value;
                                                        if(selectedSeats){
                                                        const totalPrice = document.getElementById("total-price").textContent;
                                                        // Lấy giá trị của showtime từ URL
                                                        const showtimeId = "${showtime.showtime_id}";

                                                        // Tạo URL chuyển hướng với tham số
                                                        const url = "ConcessionBooking?showtime=" + showtimeId + "&seats=" + selectedSeats + "&price=" + totalPrice;
                                                        // Chuyển hướng đến URL đã tạo
                                                        window.location.href = url;
                                                      }else {
                                                        window.alert("Please choose seat first!");
                                                      }
                                                      
                                                    }
                                                    //select seat 
                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        // Function to handle seat click events
                                                        function handleSeatClick(event) {
                                                            const seat = event.target.closest('.seat');
                                                            if (seat && !seat.classList.contains('booked')) {
                                                                seat.classList.toggle('active');
                                                                seat.style.backgroundColor = seat.classList.contains('active') ? 'green' : 'black';

                                                                // Get selected seats
                                                                const selectedSeats = Array.from(document.querySelectorAll('.cinema-seats .seat.active'))
                                                                        .map(activeSeat => activeSeat.textContent.trim());

                                                                //calculate total price 
                                                                const totalPrice = Array.from(document.querySelectorAll('.cinema-seats .seat.active'))
                                                                        .reduce((total, activeSeat) => {
                                                                            const price = parseInt(activeSeat.querySelector('.seat-price').value);
                                                                            return total + price;
                                                                        }, 0);

                                                                document.getElementById("selected-seats").textContent = selectedSeats.join(", ");
                                                                document.getElementById("ghe").value=selectedSeats.join(",");
                                                                document.getElementById("selected-seat-count").textContent = selectedSeats.length;
                                                                document.getElementById("total-price").textContent = totalPrice;
                                                            }
                                                        }

                                                        // Add event listener to all seat elements
                                                        document.querySelectorAll('.cinema-seats .seat').forEach(seat => {
                                                            seat.addEventListener('click', handleSeatClick);
                                                        });
                                                    });
                                                    //set quality of concession
                                                    function increaseQuantity(concessionID) {
                                                        var quantityInput = document.getElementById("quantity_" + concessionID);
                                                        quantityInput.value = parseInt(quantityInput.value) + 1;
                                                    }
                                                    function decreaseQuantity(concessionID) {
                                                        var quantityInput = document.getElementById("quantity_" + concessionID);
                                                        var currentQuantity = parseInt(quantityInput.value);
                                                        if (currentQuantity >= 1) {
                                                            quantityInput.value = currentQuantity - 1;
                                                        }
                                                    }

//                                                    //countdown
//                                                    document.getElementById('timer').innerHTML = 05 + ":" + 00;
//                                                    startTimer();
//
//                                                    function startTimer() {
//                                                        var presentTime = document.getElementById('timer').innerHTML;
//                                                        var timeArray = presentTime.split(/[:]+/);
//                                                        var m = timeArray[0];
//                                                        var s = checkSecond((timeArray[1] - 1));
//                                                        if (s === 59) {
//                                                            m -= 1;
//                                                        }
//                                                        if (m < 0) {
//                                                            return;
//                                                        }
//                                                        document.getElementById('timer').innerHTML = m + ":" + s;
//                                                        console.log(m);
//                                                        setTimeout(startTimer, 1000);
//                                                    }
//                                                    function checkSecond(sec) {
//                                                        if (sec < 10 && sec >= 0) {
//                                                            sec = "0" + sec;
//                                                        } // add zero in front of numbers < 10
//                                                        if (sec < 0) {
//                                                            sec = "59";
//                                                        }
//                                                        return sec;
//                                                    }
                                            </script>
                                            </body>
                                            </html>