<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>QR Code Scanner</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/html5-qrcode.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="css/global.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.min.css">
        <style>
            .detail {
                margin-top: 100px;
                margin-bottom: 30px;
            }
            .navbarDetail {
                background-color: #000;
            }
            .nameDetail {
                font-size: 30px;
                font-weight: bold;
                margin-left: 20px;
            }
            ul {
                font-family: sans-serif;
            }
            span {
                font-weight: bold;
                font-size: 17px;
            }
            .bookTicket {
                color: rgb(240, 240, 240);
                background-color: red;
                padding: 5px;
                font-size: 15px;
                border-radius: 5px;
                margin-left: 7px;
            }
            .bookTicket:hover {
                color: #000; /* Text color on hover */
            }
            .dropdown-menu {
                background-color: #fff;
                border-radius: 10px;
            }

            .dropdown-item {
                color: #000;
                font-weight: bold;
                font-size: 18px;
            }

            .dropdown-item:hover {
                color: #fff;
            }
            .navbar-logo {
                height: 60px;
                width: 170px;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <section id="header">
                <nav style="background-color: #000 ; padding-top: 5px; padding-bottom: 5px" class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                    <div class="container-xl">
                        <a class="navbar-brand fs-2 p-0 fw-bold text-white m-0 me-5" href="#"><img class="navbar-logo" src="/CineBooking/img/movieLogo.PNG"/></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <ul class="navbar-nav mb-0 ms-auto">
                                <li class="nav-item">
                                    <c:if test="${sessionScope.user == null}">
                                        <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/login.jsp"><i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1 "></i> Login </a>
                                    </c:if>
                                    <c:if test="${sessionScope.user != null}">
                                        <div class="nav-item dropdown">
                                            <a style="color: #fff; font-size: 15px" class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1"></i>
                                                Welcome ${sessionScope.user.fullname} !
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="/CineBooking/OrderHistory">Order History</a></li>
                                                <li><a class="dropdown-item" href="/CineBooking/ViewTask">View Task</a></li>
                                                <li><a class="dropdown-item" href="logout">Logout</a></li>
                                            </ul>
                                        </div>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </section>
            <section id="exep" class="p_3 bg-light">
                <div class="container-xl detail" style="margin-top: 10px">
                    <div class="row g-4 mb-4 mt-0">
                        <div class="col-12 mt-2">
                            <h4>Detail Task</h4>

                            <div class="card mb-4 h-100">
                                <div class="card-body">
                                        <div class="form-group">
                                            <label for="title">Title</label>
                                            <input class="form-control" type="text" id="title" name="title" required="required" value="${task.title}" readonly/>
                                        </div>
                                        <input type="hidden" value="${task.id}" name="id"/>
                                        <div class="form-group">
                                            <div class="form-group mt-3 mb-3">
                                                <label for="desc">Descripton</label>
                                                <textarea class="form-control" id="desc" name="description" rows="10" readonly>${task.description}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group mt-3 mb-3">
                                                    <label for="desc">Status</label>
                                                    <select class="form-control" name="status" id="status" disabled>
                                                        <option value="PENDING" ${task.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                                        <option value="CONFIRM" ${task.status == 'CONFIRM' ? 'selected' : ''}>CONFIRM</option>
                                                        <option value="FINISHED" ${task.status == 'FINISHED' ? 'selected' : ''}>FINISHED</option>
                                                        <option value="CANCEL" ${task.status == 'CANCEL' ? 'selected' : ''}>CANCEL</option>
                                                    </select>
                                                </div>
                                            </div>    
                                            <div class="form-group">
                                                <a class="btn btn-primary" href="/CineBooking/ViewTask">Back</a>
                                            </div>
                                        </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
        </script>
    </body>
</html>
