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
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main_2 clearfix">
                <jsp:include page="/views/homepage/HotFilm.jsp"></jsp:include>
                </div>
            </div>

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
                    <div class="col-md-3">
                        <jsp:include page="/views/homepage/TypeList.jsp"></jsp:include>
                        </div>
                        <div class="col-md-9">
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
        </script>
    </body>
</html>