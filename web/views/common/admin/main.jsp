<%-- 
    Document   : main
    Created on : 6 thg 7, 2024, 01:33:53
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account, dal.TheaterDAO, model.Theater"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Dashboard</title>
        <!-- Bootstrap CSS -->
        <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/views/dashboard/managetheater.jsp">
                        <i class="fas fa-users"></i> Manage Theaters
                    </a>
                </li>
                <li　class="nav-item">
                    <a class="dropdown-item" href="/CineBooking/logout">
                        <i class="fas fa-users"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
        <%} else if(roleID == 2){
                TheaterDAO thd = new TheaterDAO();
                Vector<Theater> listTheater = thd.getAllTheaters();
                String thName = "";
                for(Theater th : listTheater){
                    if(theaterID == th.getId()){
                        thName = th.getName();
                    }
                }
        %>
        <div class="sidebar">
            <h3 class="text-center text-logo">
                <a class="nav-link active" href="/CineBooking/movie">
                    <i class="fas fa-film"></i> Manager</br>
                    <i style="font-size: 75%"><%= thName %></i> 
                </a>
            </h3>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/movie">
                        <i class="fas fa-video"></i> Manage Film
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/views/dashboard/managestaff.jsp">
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
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/ManagerAssignment">
                        <i class="fa-regular fa-rectangle-list"></i> Staff assignment
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

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
    </body>
</html>