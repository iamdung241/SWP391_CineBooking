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
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Arial', sans-serif;
            }

            .bookTicket {
                color: #fff;
                background-color: red;
                font-size: 17px;
                border-radius: 7px;
                padding: 6px;
                text-decoration: none;
            }

            .bookTicket:hover {
                color: #000;
            }

            #nameMovie {
                font-size: 20px;
                font-weight: bold;
                color: #000;
                text-decoration: none;
            }

            .film {
                border: 8px solid #000;
            }

            .error-message {
                color: red;
                margin-top: 10px;
                text-align: center;
                font-size: 30px;
                font-weight: bold;
            }

            .viewDetail {
                color: #000;
                background-color: #fff;
                font-size: 17px;
                border-radius: 5px;
                padding: 6px;
                border: solid 1px grey;
                text-decoration: none;
            }

            .viewDetail:hover {
                background-color: red;
                color: #000;
            }

            .main_1 {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                width: 100%;
            }

            .main_2 {
                margin-top: 100px; /* Adjust based on the height of the header */
                width: 100%;
            }

            .container-xl {
                max-width: 1140px;
                margin: 0 auto;
            }

            .row {
                margin-left: 0;
                margin-right: 0;
            }

            .spec_1im {
                padding: 10px;
                background: #f8f9fa;
                border: 1px solid #dee2e6;
                border-radius: 5px;
            }

            .spec_1im1 ul {
                list-style: none;
                padding: 0;
            }

            .spec_1im1 li {
                margin-bottom: 5px;
            }

            .spec_1im1 li a {
                text-decoration: none;
            }

            .spec_1im1 li a:hover {
                text-decoration: underline;
            }
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                padding-top: 50px; /* Adjust according to your navbar height */
            }
            .filmContainer {
                position: relative; /* Ensure relative positioning */
            }
            .filmItem {
                margin-bottom: 30px;
                background-color: #ffffff;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
                display: none; /* Hide all film items initially */
            }
            .filmItem.active {
                display: block; /* Display only the active film item */
            }
            .filmImage {
                max-width: 100%;
                height: auto;
                display: block;
                margin-left: auto;
                margin-right: auto;
                border: 8px solid #000;
                border-radius: 10px; /* Rounded corners for the film image */
                margin-bottom: 20px;
            }
            .movieTitle {
                font-size: 30px; /* Adjusted font size */
                font-weight: bolder; /* Adjusted font weight */
                color: #000000;
                margin-left: 10px; /* Align to the left */
            }
            .movieInfo {
                color: #333333;
                font-size: 16px;
                line-height: 1.6;
            }
            .movieActions {
                margin-top: 20px;
                text-align: center;
            }
            .movieActions a {
                text-decoration: none;
                color: #ffffff;
                padding: 10px 20px;
                margin-right: 10px;
                border-radius: 5px;
                font-weight: bold;
            }
            .movieActions .watchTrailer {
                background-color: #dc3545; /* Bootstrap danger color */
            }
            .movieActions .bookTicket {
                background-color: #007bff; /* Bootstrap primary color */
            }
            #nextButton {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                padding: 10px;
                background-color: rgba(0,0,0,0.5); /* Semi-transparent background */
                color: #ffffff;
                border: none;
                border-radius: 50%;
                font-weight: bold;
                cursor: pointer;
                z-index: 1000; /* Ensure button appears above other content */
            }
            #nextButton:hover {
                background-color: rgba(0,0,0,0.7); /* Darker shade on hover */
            }
            #prevButton {
                position: absolute;
                top: 50%;
                left: 10px;
                transform: translateY(-50%);
                padding: 10px;
                background-color: rgba(0,0,0,0.5); /* Semi-transparent background */
                color: #ffffff;
                border: none;
                border-radius: 50%;
                font-weight: bold;
                cursor: pointer;
                z-index: 1000; /* Ensure button appears above other content */
            }
            #prevButton:hover {
                background-color: rgba(0,0,0,0.7); /* Darker shade on hover */
            }
            .mb-4 {
                margin-top: 2px; /* Adjust margin top for the header */
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>

                <div style="margin-top: 20px" class="container-fluid">
                    <div class="text-center mb-4">
                        <!-- Stylish and decorative font -->
                        <h1 style="font-size: 40px; font-weight: bolder; font-family: 'Rowdies', cursive; color: #333;">Hot Films This Month</h1>
                    </div>
                    <div class="filmContainer">

                    <c:forEach items="${topMovie}" var="topMovie" varStatus="loop">
                        <div class="filmItem ${loop.index == 0 ? 'active' : ''}">
                            <section id="exep" class="p-3 bg-light">
                                <div class="container-xl detail">
                                    <div class="row exep1">
                                        <div class="col-3">
                                            <div class="exep1l">
                                                <div class="grid clearfix">
                                                    <img style="border-style: solid; border-width: 10px" src="${topMovie.getPost_img()}" class="filmImage" alt="Movie Poster">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="exep1r">
                                                <p class="mb-0 movieTitle">${topMovie.getMovie_name()}</p>                                       
                                            </div>
                                            <hr style="background-color: #000"/>
                                            <div>
                                                <ul>
                                                    <li>
                                                        <strong>Duration:</strong> ${topMovie.getDuration()} minutes
                                                    </li>
                                                    <li>
                                                        <strong>Date published:</strong> ${topMovie.getDate_published()}
                                                    </li>
                                                    <li>
                                                        <strong>Category:</strong> ${topMovie.getType_name()}
                                                    </li>
                                                    <li>
                                                        <strong>Description:</strong> ${topMovie.getDecription()}
                                                    </li>
                                                    <hr style="background-color: #000"/>
                                                    <li>
                                                        <a class="bookTicket" href="movietrailer?trailer=${topMovie.trailer}&ID=${topMovie.getMovie_id()}"><i class="fa fa-youtube-play me-1"></i> Watch Trailer</a>
                                                        <a class="bookTicket" href="bookticket?movieID=${topMovie.getMovie_id()}">Book Tickets</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </c:forEach>
                    <button id="prevButton">&lt;</button>
                    <button id="nextButton">&gt;</button>
                </div>
            </div>

 <jsp:include page="/views/homepage/TheaterList.jsp"></jsp:include>
            <section id="spec" class="p_3">
                <div class="container-xl">
                    <div class="text-center" style="padding-top: 2px">
                        <h1 class="mb-0 font_50" style="font-size: 40px; font-weight: bolder; font-family: 'Rowdies', cursive; color: #333;">Now Showing</h1>
                    </div>   
                   
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <form action="movieController" method="GET" class="input-group" id="searchForm">
                                    <input type="text" name="keyword" class="form-control" placeholder="Search by film name" style="margin-right: 5px; border-color: red"
                                           value="${keyword != null ? keyword : ''}">
                                    <button class="btn btn-outline-secondary" type="submit">Search</button>
                                    <input type="hidden" name="service" value="search" id="serviceInput">
                                    <select name="dateFilter" class="form-select ml-3" style="width: 200px; border-color: red" id="dateSelect">
                                        <option value="all">All</option>
                                        <option value="upcoming">Upcoming Film</option>
                                        <option value="nowshowing">Now Showing Film</option>
                                    </select>
                                </form>
                            </div>
                        </div>
                    </div>
                    <p class="error-message">${requestScope.resultNull}</p>
                    <div class="row mt-4">
                        <div class="col-md-2">
                            <jsp:include page="/views/homepage/TypeList.jsp"></jsp:include>
                            </div>
                            <div class="col-md-10">
                                <div class="row spec_1">
                                <c:forEach items="${listM}" var="m">
                                    <div class="col-md-3 mb-4">
                                        <div class="spec_1im clearfix position-relative">
                                            <div class="spec_1imi clearfix film">
                                                <a href="moviedetail?ID=${m.getMovie_id()}">
                                                    <img width="240px" height="270px" src="${m.getPost_img()}" class="w-100" alt="abc">
                                                </a>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="spec_1im1 clearfix">
                                            <ul>
                                                <li>
                                                    <a id="nameMovie" href="moviedetail?ID=${m.getMovie_id()}">
                                                        ${m.getMovie_name()}
                                                    </a>
                                                </li>
                                                <li class="col_black">
                                                    <strong>Duration:</strong> ${m.getDuration()} minutes
                                                </li>
                                                <li class="col_black">
                                                    <strong>Age:</strong> ${m.getAge()}
                                                </li>
                                                <li class="col_black">
                                                    <strong>Category:</strong> ${m.getType_name()}
                                                </li>
                                                <li style="padding-top: 10px">
                                                    <a style="text-decoration: none" class="bookTicket" href="bookticket?movieID=${m.getMovie_id()}">Book Tickets</a>
                                                    <a class="viewDetail" style="margin-left: 3px" href="moviedetail?ID=${m.getMovie_id()}"><i class='bx bx-calendar-exclamation'></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>

            <script>
                window.onscroll = function () {
                    myFunction();
                };

                var navbar_sticky = document.getElementById("navbar_sticky");
                var sticky = navbar_sticky.offsetTop;
                var navbar_height = document.querySelector('.navbar').offsetHeight;

                function myFunction() {
                    if (window.pageYOffset >= sticky + navbar_height) {
                        navbar_sticky.classList.add("sticky");
                        document.body.style.paddingTop = navbar_height + 'px';
                    } else {
                        navbar_sticky.classList.remove("sticky");
                        document.body.style.paddingTop = '0';
                    }
                }
                document.getElementById('dateSelect').addEventListener('change', function () {
                    document.getElementById('serviceInput').value = 'filter';
                    document.getElementById('searchForm').submit();
                });

                // Function to set the selected option in the dropdown
                function setSelectedOption() {
                    const urlParams = new URLSearchParams(window.location.search);
                    const dateFilter = urlParams.get('dateFilter');
                    if (dateFilter) {
                        const selectElement = document.getElementById('dateSelect');
                        selectElement.value = dateFilter;
                    }
                }

                // Call the function to set the selected option when the page loads
                window.onload = setSelectedOption;
                const filmItems = document.querySelectorAll('.filmItem');
                const nextButton = document.getElementById('nextButton');
                const prevButton = document.getElementById('prevButton');
                let currentIndex = 0;

                function showFilm(index) {
                    filmItems[currentIndex].classList.remove('active');
                    currentIndex = index;
                    filmItems[currentIndex].classList.add('active');
                }

                nextButton.addEventListener('click', () => {
                    showFilm((currentIndex + 1) % filmItems.length);
                });

                prevButton.addEventListener('click', () => {
                    showFilm((currentIndex - 1 + filmItems.length) % filmItems.length);
                });

                setInterval(() => {
                    showFilm((currentIndex + 1) % filmItems.length);
                }, 7500);
            </script>
    </body>
</html>