<%-- 
    Document   : editshowtime
    Created on : 7 thg 7, 2024, 00:29:32
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Showtime</title>
        <script>
            function validateShowtime() {
                var showtime = document.getElementById("showtiming").value;
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
                                <h6 class="card-title m-0">Update Showtime</h6>
                                <a class="btn btn-sm btn-primary" href="showtimeControl"><i class="fas fa-arrow-left me-1"></i> Back</a>
                            </div>                            
                            <div class="container">
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                    <strong>Error!</strong> ${errorMessage}
                                </div>
                            </c:if>
                            <form action="updateShowtime" method="post">
                                <div class="table-responsive">
                                    <c:set value="${showtimeUpdate}" var="s"/>
                                    <table class="table">
                                        <tr>
                                            <td>ID</td>
                                            <td><input name="id" type="text" class="form-control" readonly="" value="${s.getShowtime_id()}"/></td>
                                        </tr>
                                        <tr>
                                            <td>Movie name</td>
                                            <td><input name="movie" type="text" class="form-control" readonly="" value="${s.getMovie_name()}"/></td>
                                        </tr>
                                        <tr>
                                            <td>Room</td>
                                            <td>
                                                <select name="room" class="form-control text-center">
                                                    <c:forEach items="${listRoom}" var="r">
                                                        <option value="${r.getRoom_id()}" ${r.getRoom_id() == s.getRoom_id() ? 'selected' : ''}>${r.getRoom_name()}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Showtime</td>
                                            <td>
                                                <input name="showtime" id="showtiming" type="text" class="form-control" required value="${s.getShowtiming()}" onblur="validateShowtime()"/>
                                                <span class="text-danger" id="showtimeErr"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Date</td>
                                            <td>
                                                <input name="date" id="date" type="date" class="form-control" required value="${s.getDate()}" onblur="validateDate()"/>
                                                <span class="text-danger" id="dateErr"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="container-fluid d-flex justify-content-end">
                                    <button type="submit" class="btn btn-success">Update</button>
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
