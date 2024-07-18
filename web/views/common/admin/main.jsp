<%-- 
    Document   : main
    Created on : 6 thg 7, 2024, 01:33:53
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                transition: background-color 0.3s;
            }

            .sidebar a:hover {
                background-color: #495057;
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
        <div class="sidebar">
            <h3 class="text-center text-logo">
                <a class="nav-link active" href="/CineBooking/home">
                <i class="fas fa-film"></i> Admin Dashboard
                </a>
            </h3>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="/CineBooking/dashboard">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/CineBooking/revenue/film">
                        <i class="fas fa-chart-line"></i> Film Revenue
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/CineBooking/revenue/concession">
                        <i class="fas fa-chart-line"></i> Concession Revenue
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/movie">
                        <i class="fas fa-video"></i> Manage Film
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/views/dashboard/manageuser.jsp"><i class="fas fa-users"></i> Users </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/admin/concession">
                        <i class="fas fa-concierge-bell"></i> Concessions
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/CineBooking/showtimeControl">
                        <i class="fa-solid fa-clock"></i> Showtime
                    </a>
                </li>
            </ul>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

