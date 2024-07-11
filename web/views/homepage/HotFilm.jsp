<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Hot Films</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Import Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
        <style>
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
        <div class="main clearfix">
            <div class="container-fluid">
                <div class="filmContainer">
                    <div class="text-center mb-4">
                        <!-- Stylish and decorative font -->
                        <h1 style="font-size: 40px; font-weight: bolder; font-family: 'Rowdies', cursive; color: #333;">Hot Films This Month</h1>
                    </div>
                    <c:forEach items="${topMovie}" var="m" varStatus="loop">
                        <div class="filmItem ${loop.index == 0 ? 'active' : ''}">
                            <section id="exep" class="p-3 bg-light">
                                <div class="container-xl detail">
                                    <div class="row exep1">
                                        <div class="col-3">
                                            <div class="exep1l">
                                                <div class="grid clearfix">
                                                    <img style="border-style: solid; border-width: 10px" src="${m.getPost_img()}" class="filmImage" alt="Movie Poster">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="exep1r">
                                                <p class="mb-0 movieTitle">${m.getMovie_name()}</p>                                       
                                            </div>
                                            <hr style="background-color: #000"/>
                                            <div>
                                                <ul>
                                                    <li>
                                                        <strong>Duration:</strong> ${m.getDuration()} minutes
                                                    </li>
                                                    <li>
                                                        <strong>Date published:</strong> ${m.getDate_published()}
                                                    </li>
                                                    <li>
                                                        <strong>Category:</strong> ${m.getType_name()}
                                                    </li>
                                                    <li>
                                                        <strong>Description:</strong> ${m.getDecription()}
                                                    </li>
                                                    <hr style="background-color: #000"/>
                                                    <li>
                                                        <a class="bookTicket" href="movietrailer?trailer=${m.trailer}&ID=${m.getMovie_id()}"><i class="fa fa-youtube-play me-1"></i> Watch Trailer</a>
                                                        <a class="bookTicket" href="bookticket?movieID=${m.getMovie_id()}">Book Tickets</a>
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
            <script>
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
        </div>
    </body>
</html>
