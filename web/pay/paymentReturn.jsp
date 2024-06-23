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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hóa Đơn Thanh Toán</h1>
        Showtime : ${sessionScope.showtime}<br>
        Seat : ${sessionScope.seat}<br>
        Combo
        <c:forEach items="${sessionScope.combo}" var="c">
            <span>${c.concessions_name}</span>
            <span>${c.quantity}</span><br>
        </c:forEach>
        <br>    
        Total price: ${sessionScope.price} VND<br>  
        <span>Tình trạng thanh toán : ${rs}</span><br>
        <button onclick="location.href='${sessionScope.urlback}'">Back</button>
    </body>
</html>
