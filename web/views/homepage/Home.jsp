<%-- 
    Document   : Home
    Created on : May 19, 2024, 6:28:04 PM
    Author     : thanh
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
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .bookTicket {
                color: #fff;
                background-color: rgb(244, 187, 68);
                font-size: 17px;
                border-radius: 7px;
                padding: 6px;
            }
            #nameMovie {
                font-size: 20px;
                font-weight: bold;
            }
            .film{
                border: 8px solid #000;
            }
            .error-message {
                color: red;
                margin-top: 10px;
                text-align: center;
                font-size: 30px;
                font-weight: bold;
            }
            .bookTicket:hover {
            color: #000;
            }
            .viewDetail{
                color: #000;
                background-color: #fff;
                font-size: 17px;
                border-radius: 5px;
                padding: 6px;
                border: solid 1px grey;
            }
            .viewDetail:hover {
                background-color: rgb(244, 187, 68); 
                color: #000;
            }
        </style>
    </head>
    <body>

        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
            </div>
                <div class="main_2 clearfix">
                    <section id="center" class="center_home">
                        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button  style="background-color: #fff" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
                                <button style="background-color: #fff" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2" class="" aria-current="true"></button>
                                <button style="background-color: #fff" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="img/poster1.jpg" class="d-block w-100" alt="..." width="1217px" height="609px">
                                    <div class="carousel-caption d-md-block">
                                        <h5 class="text-white-50 release ps-2 fs-6">NEW RELEASES</h5>
                                        <h1 class="font_80 mt-4">Olympus Has<br/> Fallen</h1>
                                        <p class="mt-4">Secret Service agent Mike Banning is trapped inside the White House after a terrorist attack and works with the national security agency to rescue the President from kidnappers.</p>
                                        <h5 class="mb-0 mt-4 text-uppercase"><a class="button" href="moviedetail?ID=2" id="embeddedLink"><i class="fa fa-youtube-play me-1"></i> View Detail</a></h5>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="img/poster2.jpg" class="d-block w-100" alt="..." width="1217px" height="609px">
                                    <div class="carousel-caption d-md-block">
                                        <h5 class="text-white-50 release ps-2 fs-6">NEW RELEASES</h5>
                                        <h1 class="font_80 mt-4">5 Centimeters <br/> per Second</h1>
                                        <p class="mt-4">Takaki tells the story of his life as cruel winters, cold technology, and finally, adult obligations and responsibility converge to test the delicate petals of love.</p>
                                        <h5 class="mb-0 mt-4 text-uppercase"><a class="button" href="moviedetail?ID=8"><i class="fa fa-youtube-play me-1"></i> View Detail</a></h5>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="img/poster3.jpg" class="d-block w-100" alt="..." width="1217px" height="609px">
                                    <div class="carousel-caption d-md-block">
                                        <h5 class="text-white-50 release ps-2 fs-6">NEW RELEASES</h5>
                                        <h1 class="font_80 mt-4">Spaceman</h1>
                                        <h1><br/></h1>
                                        <p class="mt-4">Half a year into his solo mission on the edge of the solar system, an astronaut concerned with the state of his life back on Earth is helped by an ancient creature he discovers in the bowels of his ship.</p>
                                        <h5 class="mb-0 mt-4 text-uppercase"><a class="button" href="moviedetail?ID=17"><i class="fa fa-youtube-play me-1"></i> View Detail</a></h5>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </section>
                </div>
            </div>

            <section id="spec" class="p_3">
    <div class="container-xl">
        <div class="row stream_1 text-center">
            <div class="col-md-12">
                <h1 class="mb-0 font_50" style="color: black">Now Showing</h1>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form action="movieController" method="GET" class="input-group" id="searchForm">
                        <input type="text" name="keyword" class="form-control" placeholder="Search by film name" style="margin-right: 5px;border-color: rgb(228, 155, 15)"
                               value="${keyword != null ? keyword : ''}">
                        <button class="btn btn-outline-secondary" type="submit">Search</button>
                        <input type="hidden" name="service" value="search" id="serviceInput">
                        <select name="dateFilter" class="form-select ml-3" style="width: 200px; border-color: rgb(228, 155, 15)" id="dateSelect">
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
            <div class="col-md-3">
                <jsp:include page="/views/homepage/TypeList.jsp"></jsp:include>
            </div>
            <div class="col-md-9">
                <div class="row spec_1">
                    <c:forEach items="${listM}" var="m">
                        <c:if test="${m.status eq 'on'}">
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
                                        <a style="color: #000" id="nameMovie" class="text-white" href="moviedetail?ID=${m.getMovie_id()}">
                                            ${m.getMovie_name()}
                                        </a>
                                    </li>
                                    <li class="col_black">
                                        Duration: ${m.getDuration()} minutes
                                    </li>
                                    <li class="col_black">
                                        Age: ${m.getAge()}
                                    </li>
                                    <li class="col_black">
                                        Category: ${m.getType_name()}
                                    </li>
                                    <li style="padding-top: 10px">
                                        <a class="bookTicket" href="bookticket?movieID=${m.getMovie_id()}">Book Tickets</a>
                                        <a style="margin-left: 3px" class="viewDetail" href="moviedetail?ID=${m.getMovie_id()}"><i class='bx bx-calendar-exclamation'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        </c:if>            
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        <script>
            window.onscroll = function () {
                myFunction()
            };

            var navbar_sticky = document.getElementById("navbar_sticky");
            var sticky = navbar_sticky.offsetTop;
            var navbar_height = document.querySelector('.navbar').offsetHeight;

            function myFunction() {
                if (window.pageYOffset >= sticky + navbar_height) {
                    navbar_sticky.classList.add("sticky")
                    document.body.style.paddingTop = navbar_height + 'px';
                } else {
                    navbar_sticky.classList.remove("sticky");
                    document.body.style.paddingTop = '0'
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
        </script>
    </body>

</html>

