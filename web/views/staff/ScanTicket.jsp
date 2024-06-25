<%-- 
    Document   : MovieDetail
    Created on : May 21, 2024, 9:33:45 AM
    Author     : thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .detail{
                margin-top: 100px;
                margin-bottom: 30px;
            }
            .navbarDetail{
                background-color: #000;
            }
            .nameDetail{
                font-size: 30px;
                font-weight: bold;
                margin-left: 20px;
            }
            ul{
                font-family: sans-serif;
            }
            span{
                font-weight: bold;
                font-size: 17px;
            }
            .bookTicket {
                color: rgb(240,240,240);
                background-color: red;
                padding: 5px;
                font-size: 15px;
                border-radius: 5px;
                margin-left: 7px;
            }
            .bookTicket:hover {
                color: #000; /* Text color on hover */
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100 navbarDetail">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <section id="exep" class="p_3 bg-light">
                    <div class="container-xl detail">
                        <div class="row exep1">
                            <div class="col-4">
                                <form action="scanticket" method="get">
                                    <label for="code">Enter Ticket Code:</label>
                                    <br/>
                                    <input type="text" id="code" name="code" required />
                                    <button type="submit" class="bookTicket">Search</button>
                                </form>
                            </div>
                            <div class="col-7">
                                <div class="ticketDetail">
                                <c:if test="${param.code != null}">
                                    <c:choose>
                                        <c:when test="${ticket != null}">
                                            <div class="exep1r">
                                                <p class="mb-0 nameDetail">Code: ${ticket.getCode()} / Status: ${ticket.getStatus()}</p>                                       
                                            </div>
                                            <hr style="background-color: #000"/>
                                            <div>
                                                <ul>
                                                    <li>
                                                        <span>Showtime:</span>&nbsp&nbsp ${ticket.getShowtime()}
                                                    </li>
                                                    <li>
                                                        <span>Seat:</span>&nbsp&nbsp ${ticket.getSeat()}
                                                    </li>
                                                        <li>
                                                            <span>Combo:</span>&nbsp&nbsp ${ticket.getCombo()}
                                                        </li>
                                                    <li>
                                                        <span>Date:</span>&nbsp&nbsp ${ticket.getDate_book()}
                                                    </li>
                                                    <hr style="background-color: #000"/>
                                                    <li>
                                                        <c:if test="${ticket.getStatus() == 'Nocheck'}">
                                                            <form action="scanticket" method="post">
                                                                <input type="hidden" name="code" value="${ticket.getCode()}" />
                                                                <button type="submit" class="bookTicket">Accept</button>
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${ticket.getStatus() == 'Checked'}">
                                                            <button class="bookTicket">View</button>
                                                        </c:if>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Ticket not found</p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${message != null}">
                                    <p>${message}</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
    </body>
</html>
