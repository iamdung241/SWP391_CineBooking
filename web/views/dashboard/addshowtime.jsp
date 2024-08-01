<%-- 
    Document   : addshowtime
    Created on : 6 thg 7, 2024, 13:22:00
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Showtime</title>
        <script>
            function validateShowtime() {
                var showtime = document.getElementById("showtime").value;
                var showtimeErr = document.getElementById("showtimeErr");
                var validShowtimes = [7, 10, 13, 16, 19, 22];

                if (validShowtimes.includes(parseInt(showtime))) {
                    showtimeErr.textContent = "";
                    return true;
                } else {
                    showtimeErr.textContent = "Showtime must be one of the following values: 7, 10, 13, 16, 19, or 22";
                    return false;
                }
            }

            function validateDate() {
                var cur = document.getElementById("date").value;
                var curDate = new Date(cur);
                var dateErr = document.getElementById("dateErr");

                var today = new Date();
                today.setHours(0, 0, 0, 0);
                var fiveDaysLater = new Date();
                fiveDaysLater.setDate(today.getDate() + 5);
                fiveDaysLater.setHours(23, 59, 59, 999); //set date đến cuối ngày 
                if (curDate >= today && curDate <= fiveDaysLater) {
                    dateErr.textContent = "";
                    return true;
                } else {
                    dateErr.textContent = "Date must be from today to 5 days later.";
                    return false;
                }
            }

            function validateRoom() {
                var dropdown = document.querySelector('select[name="room"]');
                const roomErr = document.getElementById("roomErr");
                if (dropdown.value === "all") {
                    roomErr.textContent = "Please choose the room.";
                    return false; // Prevent form submission
                }
                roomErr.textContent = "";
                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <div class="row g-4 mb-4 mt-0">
                    <!-- Latest Orders-->
                    <div class="col-12">
                        <div class="card mb-4 h-100">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">Add Showtime</h6>
                                <a class="btn btn-sm btn-primary" href="showtimeControl"><i class="fas fa-arrow-left me-1"></i> Back</a>
                            </div>
                            <div class="container">
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                    <strong>Error!</strong> ${errorMessage}
                                </div>
                            </c:if>
                            <form action="addNewShowtime" method="post">
                                <div class="table-responsive">
                                    <table class="table">
                                        <%
                                            Account m = (Account) session.getAttribute("user");
                                            int tID = m.getTheaterID();
                                        %>
                                        <input type="hidden" name="theaterID" value=<%= tID %>>
                                        <tr>
                                            <td>ID</td>
                                            <td><input type="text" class="form-control" readonly=""/></td>
                                        </tr>
                                        <tr>
                                            <td>Movie name</td>
                                            <td>
                                                <input type="text" id="movie" name="movie" class="form-control" readonly="" value="${movie.getMovie_name()}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Showtime</td>
                                            <td>
                                                <input type="text" id="showtime" name="showtime" class="form-control" required onblur="validateShowtime()"/>
                                                <span class="text-danger" id="showtimeErr"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Date</td>
                                            <td>
                                                <input type="date" id="date" name="date" class="form-control" required onblur="validateDate()"/>
                                                <span class="text-danger" id="dateErr"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Room</td>
                                            <td>
                                                <select name="room" class="form-control text-center" onblur="validateRoom()">
                                                    <option value="all">Choose the room</option>    
                                                    <c:forEach items="${listRoom}" var="r">
                                                        <option value="${r.getRoom_id()}">${r.getRoom_name()}</option>
                                                    </c:forEach>    
                                                </select>
                                                <span class="text-danger" id="roomErr"></span>  
                                            </td>
                                        </tr>

                                    </table>
                                </div>

                                <div class="container-fluid d-flex justify-content-end">
                                    <button type="submit" class="btn btn-success" id="addButton">Add</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
