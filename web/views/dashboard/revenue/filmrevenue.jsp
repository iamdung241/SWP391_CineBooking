<%-- 
    Document   : filmrevenue
    Created on : 8 Jul 2024, 21:30:41
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/libs.bundle.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/theme.bundle.css" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


        <title>Film Revenue</title>
        <style>
            body {
                display: flex;
                min-height: 100vh;
                background-color: #f8f9fa;
            }

            .sidebar {
                min-width: 250px;
                max-width: 250px;
                background-color: #343a40;
                color: #fff;
                padding-top: 20px;
            }

            .sidebar a {
                color: #fff;
                text-decoration: none;
                padding: 10px;
                display: block;
                transition: background-color 0.3s, color 0.3s;
            }

            .sidebar a:hover, .sidebar a.active {
                background-color: #495057;
                color: #ffc107;
            }

            .content {
                flex: 1;
                padding: 20px;
                background-color: #ffffff;
            }

            .admin {
                background-color: cadetblue;
            }

            .text-logo {
                color: #ffc107;
            }
        </style>
    </head>
    <body>
        <%
            Account as = (Account) session.getAttribute("user");
            int theaterID = as.getTheaterID();
            int roleID = as.getRole_id();
            if(roleID == 1){
        %>
        <div class="sidebar">
            <h3 class="text-center text-logo">
                <a class="nav-link active" href="/CineBooking/dashboard">
                    <i class="fas fa-film"></i> Admin Dashboard
                </a>
            </h3>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/dashboard">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/revenue/film">
                        <i class="fas fa-chart-line"></i> Film Revenue
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/revenue/concession">
                        <i class="fas fa-chart-line"></i> Concession Revenue
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/views/dashboard/manageuser.jsp">
                        <i class="fas fa-users"></i> Manage Users
                    </a>
                </li>
                <li　class="nav-item">
                    <a class="dropdown-item" href="/CineBooking/logout">
                        <i class="fas fa-users"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
        <%} else if(roleID == 2){%>
        <div class="sidebar">
            <h3 class="text-center text-logo">
                <a class="nav-link active" href="/CineBooking/movie">
                    <i class="fas fa-film"></i> Manager
                </a>
            </h3>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/movie">
                        <i class="fas fa-video"></i> Manage Film
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/views/dashboard/manageuser.jsp">
                        <i class="fas fa-users"></i> Manage Staffs
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/admin/concession">
                        <i class="fas fa-concierge-bell"></i> Manage Concessions
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/showtimeControl">
                        <i class="fa-solid fa-clock"></i> Manage Showtime
                    </a>
                </li>
                <li　class="nav-item">
                    <a class="dropdown-item" href="/CineBooking/logout">
                        <i class="fas fa-users"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
        <%}%>
        <section class="container-fluid">
            <form method="get" action="${pageContext.request.contextPath}/revenue/film">
                <div class="row align-items-center g-4">
                    <div class="col-6 col-md-3">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" id="startDate" name="startDate" class="form-control" value="${startDate != null ? startDate : defaultStartDate}">
                    </div>
                    <div class="col-6 col-md-3">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" id="endDate" name="endDate" class="form-control" value="${endDate != null ? endDate : defaultEndDate}">
                    </div>
                    <div class="col-12 col-md-2">
                        <label for=" " class="form-label">&nbsp;</label>
                        <button type="submit" class="btn btn-primary w-100">Filter</button>
                    </div>
                </div>
            </form>
            <br/>
            <br/>
            <div class="row g-4">       

                <!-- Total revenue-->
                <div class="col-12 col-sm-3 col-xxl-4">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Total Film Revenue</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center">${totalRevenue}</p>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
                <div class="col-12 col-sm-3 col-xxl-4">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Average Value</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center">${averageValue}</p>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
            <br/>
            <div class="row mb-4 mt-3">
                <jsp:include page="filmchart.jsp"></jsp:include>
            </div>

        </section>
    </body>
    <script>
        $(document).ready(function () {
            // Function to set active link based on current URL
            function setActiveLink() {
                var currentPath = window.location.pathname;
                $('.nav-link').each(function () {
                    if (this.pathname === currentPath) {
                        $('.nav-link').removeClass('active');
                        $(this).addClass('active');
                    }
                });
            }

            // Set active link on page load
            setActiveLink();

            // Set active link on click
            $('.nav-link').on('click', function () {
                $('.nav-link').removeClass('active');
                $(this).addClass('active');
            });
        });
    </script>
</html>
