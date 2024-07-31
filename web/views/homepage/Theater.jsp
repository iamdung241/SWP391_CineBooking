<%-- 
    Document   : Cinema
    Created on : Jul 30, 2024, 3:31:32 AM
    Author     : DungTT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Play Show</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <style>
            .movieImage {
                border-radius: 10px;
            }
            .showtime {
                width: 30px;
                height: 30px;
                border: solid 1px;
                border-radius: 10px;
                padding: 10px;
                margin-right: 10px;
                margin-top: 10px;
                background-color: #000;
                color: #fff;
            }
            .showRoom {
                width: 30px;
                height: 30px;
                border: solid 1px;
                border-radius: 10px;
                padding: 10px;
                margin-right: 10px;
                margin-top: 10px;
                background-color: red;
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
                background-color: #000;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div style="background-color: #000">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
            </div>
            <div style="margin-left: 100px">
                <a class="boxes" id="dateContainer">
                </a>
                <hr style="background-color: #000;"/>
            </div>

            <h3 style="color: red; margin-left: 500px; font-size: 50px">${theater.name}</h3>    


        <section style="padding-top: 50px" id="exep" class="p_3 ">
            <div class="container-xl detail">
                <div class="row exep1">
                    <c:forEach items="${listMovieTheater}" var="m">
                        <div class="col-3">
                            <div class="exep1l">
                                <div class="grid clearfix ">                                
                                    <img style="margin-bottom: 20px; border: 5px solid #000; border-radius: 15px;" height="350px" src="${m.getPost_img()}" class="w-100 film" alt="abc">
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="exep1r">
                                <a href="moviedetail?ID=${m.getMovie_id()}"><p style="font-weight: bold; font-size: 35px" class="mb-0 nameDetail">${m.getMovie_name()}</p></a>                                       
                            </div>
                            <div>
                                <p><i class='bx bxs-purchase-tag-alt'></i>${m.getType_name()}&nbsp&nbsp / &nbsp <i class='bx bxs-time' ></i> ${m.getDuration()} minutes</p>
                            </div> 
                            <hr/>
                            <div class="container mt-4">
                                <c:choose>
                                    <c:when test="${empty m}">
                                        <h5 style="color: red; font-style: italic;">You have to select a date first.</h5>
                                    </c:when>

                                    <c:otherwise>
                                        <!-- Display showtimes if a date is selected -->
                                        <c:forEach items="${m.getListShowtime()}" var="s">
                                            <div style="padding: 15px">
                                                <!-- Check if the user is logged in -->
                                                <c:if test="${sessionScope.user == null}">
                                                    <a class="showtime" href="login.jsp">
                                                        ${s.getShowtiming()}:00 &nbsp|&nbsp ${s.room_name}
                                                    </a>
                                                </c:if>
                                                <c:if test="${sessionScope.user != null}">
                                                    <a class="showtime" href="seat?showtimeID=${s.getShowtime_id()}&theaterID=${s.theaterID}&roomID=${s.room_id}&movieID=${m.getMovie_id()}&date=${selectedDate}">
                                                        ${s.getShowtiming()}:00 &nbsp|&nbsp ${s.room_name}
                                                    </a>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <hr style="background-color: #000;"/>
                    </c:forEach>                   
                </div>    
            </div>
        </section>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>

            <script>
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
                        dateElement.href = 'theater?service=search&theaterID=${theater.id}&date=' + formattedDateForLink;
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