<%-- 
    Document   : AddShowtime
    Created on : Jul 3, 2024, 1:46:08 PM
    Author     : thanh
--%>

\<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Head -->
    <head>
        <!-- Page Meta Tags-->
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="">

        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/./assets/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/./assets/images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/./assets/images/favicon/favicon-16x16.png">
        <link rel="mask-icon" href="${pageContext.request.contextPath}/./assets/images/favicon/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/libs.bundle.css" />


        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/theme.bundle.css" />
        <title>Manage Showtime</title>
        <!-- Fix for custom scrollbar if JS is disabled-->
        <noscript>
        <style>
            /**
            * Reinstate scrolling for non-JS clients
            */
            .simplebar-content-wrapper {
                overflow: auto;
            }
        </style>
        </noscript>

        <script>
            function validateShowtime() {
                var showtime = document.getElementById("showtime").value;
                var showtimeErr = document.getElementById("showtimeErr");
                var validShowtimes = [7, 10, 13, 16, 19, 22];

                if (validShowtimes.includes(parseInt(showtime))) {
                    showtimeErr.textContent = "";
                    return true;
                } else {
                    showtimeErr.textContent = "Showtime must be one of the following values: 7, 10, 13, 16, 19, or 22";
                    return false;
                }
            }

            function validateDate() {
                var cur = document.getElementById("date").value;
                var curDate = new Date(cur);
                var dateErr = document.getElementById("dateErr");

                var today = new Date();
                today.setHours(0, 0, 0, 0);
                var fiveDaysLater = new Date();
                fiveDaysLater.setDate(today.getDate() + 5);
                fiveDaysLater.setHours(23, 59, 59, 999); //set date đến cuối ngày 
                if (curDate >= today && curDate <= fiveDaysLater) {
                    dateErr.textContent = "";
                    return true;
                } else {
                    dateErr.textContent = "Date must be from today to 5 days later.";
                    return false;
                }
            }
            
            var movieList = [];
            <c:forEach var="movie" items="${listMovie}">
            movieList.push("${movie.getMovie_name()}".trim());
            </c:forEach>
            console.log(movieList);
            function validateMovie() {
                var movieInput = document.getElementById("movie").value.trim();
                var movieErr = document.getElementById("movieErr");
                var isValid = false;
                isValid = movieList.some(function (movie) {
                    return movie.toLowerCase() === movieInput.toLowerCase();
                });
                if (!isValid) {
                    movieErr.textContent = "You must enter a correct movie name that is currently showing.";
                } else {
                    movieErr.textContent = "";
                }
                return isValid;
            }

            function validateRoom() {
                var dropdown = document.querySelector('select[name="room"]');
                const roomErr = document.getElementById("roomErr");
                if (dropdown.value === "all") {
                    roomErr.textContent = "Please choose the room.";
                    return false; // Prevent form submission
                }
                roomErr.textContent = "";
                return true;
            }
        </script>
    </head>
    <body class="">

        <!--Header-->
        <jsp:include page="../common/admin/header.jsp"></jsp:include>
            <!-- Page Content -->
            <main id="main">

                <!-- Breadcrumbs-->
                <div class="bg-white border-bottom py-3">
                    <div class="container-fluid d-flex justify-content-between align-items-start align-items-md-center flex-column flex-md-row">
                        <nav class="mb-0" aria-label="breadcrumb">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="./index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manage Showtime</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Content-->
                <section class="container-fluid">

                    <!-- Page Title-->
                    <!-- / Page Title-->

                    <!-- Middle Row Widgets-->
                    <div class="row g-4 mb-4 mt-0">
                        <!-- Latest Orders-->
                        <div class="col-12">
                            <div class="card mb-4 h-100">
                                <div class="card-header justify-content-between align-items-center d-flex">
                                    <h6 class="card-title m-0">Add Showtime</h6>
                                    <a class="btn btn-sm btn-primary" href="showtimeControl"><i class="align-bottom"></i>Back</a>
                                </div>
                                <div class="container">
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger">
                                        <strong>Error!</strong> ${errorMessage}
                                    </div>
                                </c:if>
                                <form action="addNewShowtime" method="post">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <td>ID</td>
                                                <td><input type="text" class="form-control" readonly=""/></td>
                                            </tr>
                                            <tr>
                                                <td>Showtime</td>
                                                <td>
                                                    <input type="text" id="showtime" name="showtime" class="form-control" required onblur="validateShowtime()"/>
                                                    <span class="text-danger" id="showtimeErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Date</td>
                                                <td>
                                                    <input type="date" id="date" name="date" class="form-control" required onblur="validateDate()"/>
                                                    <span class="text-danger" id="dateErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Movie name</td>
                                                <td>
                                                    <input type="text" id="movie" name="movie" class="form-control" required onblur="validateMovie()"/>
                                                    <span class="text-danger" id="movieErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Room</td>
                                                <td>
                                                   <select name="room" class="form-control text-center" onblur="validateRoom()">
                                                        <option value="all">Choose the room</option>    
                                                        <c:forEach items="${listRoom}" var="r">
                                                            <option value="${r.getRoom_id()}">${r.getRoom_name()}</option>
                                                        </c:forEach>    
                                                    </select>
                                                    <span class="text-danger" id="roomErr"></span>  
                                                </td>
                                            </tr>

                                        </table>
                                    </div>

                                    <div class="container-fluid d-flex justify-content-end">
                                        <button type="submit" class="btn btn-success" id="addButton">Add</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Latest Orders-->

                </div>
                <!-- / Middle Row Widgets-->


                <!-- Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>


                    <!-- Sidebar Menu Overlay-->
                    <div class="menu-overlay-bg"></div>

                </section>
                <!-- / Content-->

            </main>
            <!-- /Page Content -->

            <!-- Page Aside-->
        <jsp:include page="../common/admin/aside.jsp"></jsp:include>
            <!-- Theme JS -->
            <!-- Vendor JS -->
            <script src="${pageContext.request.contextPath}/./assets/js/vendor.bundle.js"></script>

        <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>        
    </body>

</html>
