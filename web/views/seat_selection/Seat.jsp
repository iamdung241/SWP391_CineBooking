<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                background-color: yellow; /* Màu nền khi ghế được chọn */
            }
            .seat:hover {
                background-color: turquoise; /* Màu khi di chuột vào seat */
                cursor: pointer;
            }
            .card-title {
                font-size: 1rem; /* Adjust the font size for better readability */
                margin-bottom: 0.5rem; /* Adjust margin for better spacing */
            }
            .seat-container {
                display: flex;
                flex-wrap: wrap;
                width: 100%; /* Đảm bảo không bị tràn ra ngoài */
            }
            .seat-wrapper {
                margin: 5px; /* Khoảng cách giữa các ghế */
                display: inline-block;
                width: 60px; /* Kích thước của mỗi ghế */
                height: 30px;
                border: 5px solid; /* Kích thước viền ngoài */
                border-radius: 8px;
                box-sizing: border-box;
            }
            .seat {
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                text-align: center;
            }
            .seat-booked {
                background-color: red; /* Màu nền khi ghế đã được đặt */
            }
            .legend-container {
                margin-top: 20px;
                display: flex;
                justify-content: center; /* Canh giữa các mục trong container */
            }

            .legend-item {
                display: flex;
                align-items: center; /* Căn giữa nội dung theo chiều dọc */
                justify-content: center; /* Căn giữa nội dung theo chiều ngang */
                width: 120px; /* Thay đổi kích thước để hiển thị đủ thông tin */
                height: 50px; /* Kích thước của mỗi mục */
                border: 5px solid;
                border-radius: 5px;
                margin-right: 20px;
                text-align: center;
                color: black;
                font-size: 14px; /* Kích thước chữ */
                box-sizing: border-box; /* Đảm bảo border và padding được tính vào tổng kích thước */
            }

            .legend-item.vip {
                border-color: blue;
            }

            .legend-item.premium {
                border-color: green;
            }

            .legend-item.standard {
                border-color: gray;
            }

        </style>
        <script type="text/javascript">
            var ws;
            function connect() {
                ws = new WebSocket("ws://localhost:̣̣̣̣̣̣̣̣9999̣̣̣̣̣̣/CineBooking/seatStatus");
                ws.onmessage = function (event) {
                    var message = event.data;
                    // Handle seat status update
                    var parts = message.split(" ");
                    var seatId = parts[1];
                    var status = parts[2];
                    var show = parts[3];
                    var showS = ${showtime.showtime_id};
                    if (parseInt(show) === showS) {
                        var seatElement = document.getElementById(seatId);
                        console.log("seat:" + seatId + " , status:" + status + " , show:" + show);
                        if (status === "selected" && !seatElement.classList.contains("reved")) {
                            seatElement.classList.add('active');
                            seatElement.classList.add('reved');
                        } else {
                            seatElement.classList.remove('active');
                            seatElement.classList.remove('reved');
                        }
                    }

                };
            }

            function toggleSeat(seatId) {
                var seatElement = document.getElementById(seatId);
                var status = seatElement.classList.contains('active') ? "available" : "selected";
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "toggleSeat", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log(xhr.responseText);
                    }
                };
                xhr.send("seatId=" + seatId + "&status=" + status + "&show=" + ${showtime.showtime_id});
            }

            window.onload = connect;

            // Function to handle seat click events
            function handleSeatClick(event) {
                const seat = event.target.closest('.seat');
                if (seat && !seat.classList.contains('booked')) {
                    seat.classList.toggle('active');
                    seat.style.backgroundColor = seat.classList.contains('active') ? 'yellow' : '';
                    // Get selected seats
                    const selectedSeats = Array.from(document.querySelectorAll('.cinema-seats .seat.active'))
                            .map(activeSeat => activeSeat.textContent.trim());

                    // Calculate total price 
                    const totalPrice = Array.from(document.querySelectorAll('.cinema-seats .seat.active'))
                            .reduce((total, activeSeat) => {
                                const price = parseInt(activeSeat.querySelector('.seat-price').value);
                                return total + price;
                            }, 0);

                    // Format the total price
                    const formattedTotalPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(totalPrice);

                    document.getElementById("selected-seats").textContent = selectedSeats.join(", ");
                    document.getElementById("ghe").value = selectedSeats.join(",");
                    document.getElementById("selected-seat-count").textContent = selectedSeats.length;
                    document.getElementById("total-price").textContent = new Intl.NumberFormat().format(totalPrice);
                }
            }

            // Add event listener to all seat elements
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll('.cinema-seats .seat').forEach(seat => {
                    seat.addEventListener('click', handleSeatClick);
                });
            });

            // Function to redirect with parameters
            function redirectWithParams() {
                const selectedSeats = document.getElementById("ghe").value;
                if (selectedSeats) {
                    const totalPrice = document.getElementById("total-price").textContent;
                    const showtimeId = "${showtime.showtime_id}";

                    const url = "ConcessionBooking?showtime=" + showtimeId + "&seats=" + selectedSeats + "&price=" + encodeURIComponent(totalPrice);
                    window.location.href = url;
                } else {
                    window.alert("Please choose seat first!");
                }
            }
        </script>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div style="background-color: black" class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div style="padding-top: 120px" class="container">   
                    <h1 style="color: red" class="text-center">Seat Booking</h1>
                    <div style="padding-top: 20px" class="row">
                        <div class="col-6">
                            <div style="text-align: center">
                                <div>
                                    <img style="weight: 100px; height: 60px" src="/CineBooking/img/screen.JPG" alt="imageSrc">
                                </div>
                                <div style="margin-top: 20px" class="row cinema-seats">
                                    <div style="margin-left: 150px; padding-right: 240px" class="seat-container">
                                    <c:forEach items="${listSeat}" var="s">
                                        <div id="${s.seat_name}" onclick="toggleSeat('${s.seat_name}')" 
                                             class="seat-wrapper" 
                                             style="border-color:
                                             <c:choose>
                                                 <c:when test="${s.getPrice() == 120000}">
                                                     blue
                                                 </c:when>
                                                 <c:when test="${s.getPrice() == 100000}">
                                                     green
                                                 </c:when>
                                                 <c:otherwise>
                                                     gray
                                                 </c:otherwise>
                                             </c:choose>;
                                             ">
                                            <div class="seat ${s.getStatus().equals('Booked') ? 'seat-booked' : ''}">
                                                <label style="color: black; font-size: 12px; margin: 0; padding: 0; text-decoration: none;">
                                                    <input class="seat-price" type="hidden" value="${s.getPrice()}">
                                                    ${s.getSeat_name()}
                                                </label>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div style="margin-left: 50px; padding-left: 10px" class="col-5">
                        <div style="background-color: rgb(240,240,240); padding-bottom: 100px">
                            <div style="padding-left: 30px">
                                <h2 style="text-align: center; color: red; padding-top: 10px">Ticket Information</h2>
                                <span style="font-size: 21px; font-weight: bold; color: green">${showtime.theaterName}</span>
                                <br/>
                                <div>
                                    <span style="padding-right: 90px; font-size: 18px"><span style="font-weight: bold">Room: </span><span style="color: green">${room.getRoom_name()}</span></span><br>
                                    <span style="padding-right: 70px; font-size: 18px"><span style="font-weight: bold">Showtiming: </span><span style="color: green"> ${showtime.getShowtiming()}:00</span></span><br>
                                    <span style="padding-right: 70px; font-size: 18px"><span style="font-weight: bold"> Date:<span style="color: green"> ${showtime.date}</span> </span></span>
                                </div>
                                <hr/>
                                <div>
                                    <h4><i class='bx bx-movie-play'></i><span style="color: green"> ${movie.getMovie_name()} </span></h4>
                                </div> 
                                <div>
                                    <span style="font-weight: bold; font-size: 19px">Selected Seats: <span style="color: green" id="selected-seats"></span><input type="hidden" id="ghe"></span>
                                </div>
                                <div>
                                    <span style="font-weight: bold; font-size: 19px">Quantity: <span style="color: green" id="selected-seat-count"></span></span>
                                </div>
                                <div>
                                    <h5><i class='bx bx-money-withdraw'></i> Total price: <span id="total-price" style="color: green"><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VNĐ"/></span>VNĐ</h5> 
                                </div>
                                <hr/>
                                <div style="text-align: center; padding-top: 20px">
                                    <a style="border-style: solid; border-radius: 10px; text-align: center; padding: 15px; background-color: black; color: white" href="${urlbackBooking}"><i class='bx bx-left-arrow'></i> Back</a>
                                    <a style="border-style: solid; border-radius: 10px; text-align: center; padding: 15px; background-color: red; color: white" id="payment-link" href="#" onclick="redirectWithParams()">Next<i class='bx bx-right-arrow'></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="legend-container">
                <div class="legend-item vip">
                    <div>
                        VIP<br>120.000 VND
                    </div>
                </div>
                <div class="legend-item premium">
                    <div>
                        Premium<br>100.000 VND
                    </div>
                </div>
                <div class="legend-item standard">
                    <div>
                        Standard<br>80.000 VND
                    </div>
                </div>
            </div>

        </div>

        <div style="margin-top: 60px">
            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>   
        </div>
    </body>
</html>
