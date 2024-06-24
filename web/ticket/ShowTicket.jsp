<%-- 
    Document   : ShowTicket
    Created on : 24 thg 6, 2024, 21:15:24
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4 class="card-title">Ticket Details</h4>
                        </div>
                        <div class="card-body">
                            <p><strong>Ticket Code:</strong> ${ticket.code}</p>
                            <p><strong>Movie:</strong> ${movie.movie_name}</p>
                            <p><strong>Date watch:</strong> ${show.date} | <strong>Time:</strong> ${show.showtiming}:00</p>
                            <p><strong>Room:</strong> ${show.room_name}</p>
                            <p><strong>Seat:</strong> ${ticket.seat}</p>
                            <p><strong>Combo:</strong> ${ticket.combo}</p>
                            <p><strong>Total Price:</strong> ${ticket.totalprice} VND</p>
                            <hr>
                            <p><strong>User:</strong> ${user.fullname}</p>
                            <p><strong>Date book:</strong> ${ticket.date}</p>
                            <p><strong>Payment:</strong> ${ticket.payment}</p>
                        </div>
                        <div class="card-footer text-center">
                            <a href="/CineBooking/home" class="btn btn-primary">Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
