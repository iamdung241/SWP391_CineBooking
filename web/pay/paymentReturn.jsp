<%-- 
    Document   : paymentReturn
    Created on : 20 thg 6, 2024, 15:50:55
    Author     : HuyTQ
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="/views/homepage/./Header.jsp"></jsp:include>
        <div class="container-fluid">
            <div class="row justify-content-center mt-3 mb-3">
                <div class="col-md-6 text-center">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-success">${rs}</h2>
                            <br>
                            <p class="text-success">${mail}</p>
                            <div class="mt-4">
                                <a href="/CineBooking/home" class="btn btn-primary">Back to Home</a>
                                <c:if test="${rs eq 'Thành công'}">
                                    <a href="/CineBooking/ShowTicket" class="btn btn-secondary">Show Ticket</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
