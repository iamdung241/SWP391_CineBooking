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
                    cursor: pointer; /* Biến con trỏ thành hình bàn tay khi di chuột vào */
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
                        <div class="mx-2">
                            <p style="background: red; border-radius: 7px" class="text-center text-white">Screen</p>   
                        </div> 
                        <div style="text-align: center">
                            <div ><span style=" padding-right: 20px"><i style="color: red" class='bx bxs-square-rounded'></i> Booked</span><i style="color: black" class='bx bxs-square-rounded'></i> UnBooked</div>
                        </div>
                        <div class="row cinema-seats">
                            <c:forEach items="${listSeat}" var="s">
                                <div style="margin-left: 18px" class="col-2 my-2">          
                                    <div class="text-center seat ${s.getStatus().equals('Booked') ? 'booked' : ''}" style="border: 1px solid; border-radius: 5px; background-color: ${s.getStatus().equals('Booked') ? 'red' : 'black'}" >
                                        <label style="color: white; text-decoration: none">${s.getSeat_name()}</label>
                                    </div>
                                </div>
                            </c:forEach>
                           
                        </div>
                    </div>
                    <div style="background-color: rgb(240,240,240); margin-left: 50px" class="col-5">
                        <h2 style="text-align: center; color: red; padding-top: 10px">Movie Ticket</h2>
                        <span style="font-size: 21px">PlayShow Cinema</span>
                        <br/>
                        <span>
                            <span style="padding-right: 90px; font-size: 18px" ><span style="font-weight: bold">Room: &nbsp</span><span style="color: green">${room.getRoom_name()}</span></span>
                        <span style="padding-right: 70px; font-size: 18px"><span style="font-weight: bold">Showtiming: </span></span> 
                        <span style="padding-right: 70px; font-size: 18px"><span style="font-weight: bold"> Date: </span>
                            
                        </span>
                            
                    </span>
                        <hr/>
                        <div ><h4><i class='bx bx-movie-play'></i><span style="color: green"> ${movie.getMovie_name()} </span></h4></div> 
                        <div><span style="font-weight: bold; font-size: 19px">Selected Seats: &nbsp<span style="color: green" id="selected-seats"></span></span></div>
                        <div><span style="font-weight: bold; font-size: 19px">Quality: &nbsp<span style="color: green" id="selected-seat-count"></span> </span></div>
                        <div><h5><i class='bx bx-money-withdraw'></i> Total price: <h5></div>
                        <hr/>
                        <a style="border-style: solid; border-radius: 10px; text-align: center; padding: 15px; background-color: red; color: white" id="payment-link" href="#" ">Proceed to Payment</a>
                       
                    </div>
                </div>
        </div>
        </div>
                    <div style="margin-top: 60px">
                    <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>   
                </div>
                <script>
                   $(".cinema-seats .seat").on("click", function () {
                       if (!$(this).hasClass("booked")) {
                    $(this).toggleClass("active"); //chọn ghế
                    var color = $(this).hasClass("active") ? "green" : "black"; //chọn ghế chuyển thành green 
                    $(this).css("background-color", color);
                    // Lấy thông tin ghế đã chọn
                    var selectedSeats = $(".cinema-seats .seat.active").map(function() {
                        return $(this).text(); // Lấy số ghế đã chọn
                    }).get();

                    // Hiển thị thông tin ghế đã chọn
                    $("#selected-seats").text(selectedSeats.join(", "));
                    //hiển thị ra số lượng ghế đã chọn
                    $("#selected-seat-count").text(selectedSeats.length);
                        }
                    });
                </script>
    </body>
</html>
