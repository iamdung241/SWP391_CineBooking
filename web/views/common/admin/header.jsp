<%-- 
    Document   : header
    Created on : 9 Jul 2024, 23:36:39
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">Admin Dashboard</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="/CineBooking/dashboard">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CineBooking/revenue/film">Film Revenue</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CineBooking/revenue/concession">Concession Revenue</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CineBooking/movie">Manage Film</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CineBooking/views/dashboard/manageuser.jsp">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CineBooking/admin/concession">Concessions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CineBooking/showtimeControl">Showtime</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
</html>
