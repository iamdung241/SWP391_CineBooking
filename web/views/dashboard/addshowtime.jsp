<%-- 
    Document   : addshowtime
    Created on : 6 thg 7, 2024, 13:22:00
    Author     : tranh
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
        <jsp:include page="main.jsp"></jsp:include>
        <section class="container-fluid">
            <div class="row g-4 mb-4 mt-0">
                <!-- Latest Orders-->
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Add Showtime</h6>
                            <a class="btn btn-sm btn-success" href="showtimeControl"><i class="fas fa-arrow-left me-1"></i> Back</a>
                        </div>
                        <div class="container">
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                    <strong>Error!</strong> ${errorMessage}
                                </div>
                            </c:if>
                            <form action="addNewShowtime" method="post" enctype="multipart/form-data" onsubmit="return formTrue()">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <td>ID</td>
                                            <td><input type="text" class="form-control" readonly=""/></td>
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
                                            <td>Movie name</td>
                                            <td>
                                                <input type="text" id="movie" name="movie" class="form-control" required onblur="validateMovie()"/>
                                                <span class="text-danger" id="movieErr"></span>
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
