<%-- 
    Document   : BookTicket
    Created on : Jun 1, 2024, 2:51:17 PM
    Author     : thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Ticket</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="css/global.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/bootstrap.bundle.min.js"></script>
        <style>
            .navbarDetail{
                background-color: #000;
            }
            .nameDetail{
                font-size: 50px;
                font-weight: bold;
                margin-left: 20px;
            }
            .detail{
                
                margin-bottom: 30px;
            }
            .showRoom {
                width: 30px;
                height: 30px;
                border: solid 1px;
                border-radius: 10px;
                padding: 15px;
                margin-right: 10px;
                background-color: red;
                color: #fff;

            }
            .showtime {
                width: 30px;
                height: 30px;
                border: solid 1px;
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 20px;
                background-color: #000;
                color: #fff;
            }
            .boxes {
                text-align: center;
                padding-top: 30px;
                display: flex;
                flex-direction: row;
                font-family: Arial, Helvetica, sans-serif;
                font-weight: bold;
                margin-left: 30px;
            }
            
            .box {
                margin-top: 60px;
                border: 1px solid black;
                border-radius: 10px;
                font-size: 19px;
                margin-right: 20px;
                text-align: center;
                padding: 10px;
            }
            .date {
               display: inline-block;
           }
           .date:hover {
                color: red;
            }
            hr {
                background-color: black;
                color: black;
            }
        </style>
    </head>

    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100 navbarDetail">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="d-flex justify-content-center mb-3">
                    <a class="boxes" id="dateContainer">
                    </a>
                </div>
                <hr style="color: black;background-color: black">
                <section style="padding-top: 1px" id="exep" class="p_3 bg-light">
                    <div class="container-xl detail">
                        <div class="row exep1">
                            <div class="col-5">
                                <div class="exep1l">
                                    <div class="grid clearfix">     
                                        <img style="border-style: solid; border-width: 10px" height="450px" src="${movie.getPost_img()}" class="w-100" alt="abc">
                                    <span style="border-style: solid; background-color: black; color: #fff; padding: 11px"><i style="color:green; font-size: 28px" class='bx bx-error'></i>&nbsp${movie.getAge()}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-7">
                            <div class="exep1r">
                                <a href="moviedetail?ID=${movie.getMovie_id()}">
                                    <p class="mb-0 nameDetail">${movie.getMovie_name()}</p>         
                                </a> 
                            </div>
                            <hr/>
                            <div>
                                <p><i class='bx bxs-purchase-tag-alt' ></i>${movie.getType_name()}&nbsp&nbsp / &nbsp <i class='bx bxs-time' ></i> ${movie.getDuration()} minutes</p>
                            </div>
                            <div style="margin-top: 40px">
                                <c:forEach items="${movie.getListShowtime()}" var="s"> 
                                    <a class="showtime" href="bookticket?movieID=${movie.getMovie_id()}&showtimeID=${s.getShowtime_id()}" onclick="showRooms(${s.getShowtime_id()})"> ${s.getShowtiming()} : 00</a>
                                </c:forEach>
                            </div>
                            <c:if test="${sessionScope.user != null}"> 
                                <div id="room-selection" style="margin-top: 30px;">
                                    <c:forEach items="${listRoom}" var="room">                    
                                        <c:forEach var="s" items="${movie.getListShowtime()}">
                                            <c:if test="${room.getRoom_id() == s.getRoom_id()}">
                                                <div style="margin-top: 30px" id="rooms-showtime-${s.getShowtime_id()}" class="room-list">
                                                    <a  class="showRoom" href="seat?roomID=${room.getRoom_id()}&movieID=${movie.getMovie_id()}&showtimeID=${s.getShowtime_id()}">${room.getRoom_name()}</a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user == null}"> 
                                <div id="room-selection" style="margin-top: 30px;">
                                    <c:forEach items="${listRoom}" var="room">                    
                                        <c:forEach var="s" items="${movie.getListShowtime()}">
                                            <c:if test="${room.getRoom_id() == s.getRoom_id()}">
                                                <div style="margin-top: 30px" id="rooms-showtime-${s.getShowtime_id()}" class="room-list">
                                                    <a class="showRoom" href="login.jsp?returnUrl=bookticket?movieID=${movie.getMovie_id()}&showtimeID=${s.getShowtime_id()}">${room.getRoom_name()}</a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <input type="hidden" id="selectedShowtime" value="${selectedShowtimeId}">
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
            <script>
                // Function to show rooms for a specific showtime
                function showRooms(showtimeId) {
                    var rooms = document.getElementsByClassName('room-list');
                    var roomElements = document.querySelectorAll(`#rooms-showtime-${showtimeId}`);
                    roomElements.forEach(function (roomElement) {
                        roomElement.style.display = 'block';
                    });
                    console.log('Showing rooms for showtime:', showtimeId); // Debugging line
                }

                // Show the rooms when the page loads if a showtime is already selected
                window.onload = function () {
                    var selectedShowtimeId = document.getElementById('selectedShowtime').value;
                    if (selectedShowtimeId) {
                        showRooms(selectedShowtimeId);
                        console.log('Page loaded with selected showtime:', selectedShowtimeId); // Debugging line
                    }
                };
                //lấy ra 7 ngày tiếp theo tính từ ngày hiện 
                function displayNextWeek() {
                    var dateContainer = document.getElementById('dateContainer');
                    var currentDate = new Date();
                    var selectedDate = "${selectedDate}";

                    for (var i = 0; i < 7; i++) {
                        var date = new Date(currentDate.getTime() + i * 24 * 60 * 60 * 1000);
                        var weekday = date.toLocaleDateString('en-US', {weekday: 'long'});
                        var day = date.getDate().toString().padStart(2, '0');
                        var month = (date.getMonth() + 1).toString().padStart(2, '0');
                        var year = date.getFullYear();
                        var formattedDate = day + '/' + month + '-' + weekday;
                        var formattedDateForLink = year + "-" + month + "-" + day;

                        var box = document.createElement('div');
                        box.classList.add('box');

                        var dateElement = document.createElement('a');
                        dateElement.classList.add('date');
                        dateElement.textContent = formattedDate;
                        dateElement.href = 'bookticket?date=' + formattedDateForLink + '&movieID=${movie.getMovie_id()}';
                        if (selectedDate === formattedDateForLink) {
                            dateElement.style.color = 'red'; // Highlight the selected date
                        }
                        box.appendChild(dateElement);
                        dateContainer.appendChild(box);
                    }
                }

                displayNextWeek();
        </script>
    </body>
</html>
