<%-- 
    Document   : manageshowtime
    Created on : 6 thg 7, 2024, 13:27:05
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
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <div class="row g-4 mb-4 mt-0">
                    <!-- Latest Orders-->
                    <div class="col-12">
                        <div class="card mb-4 h-100">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">List Showtime</h6>
                            </div>
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success" role="alert">
                                    ${successMessage}
                                </div>
                            </c:if>
                            <div class="card-body">
                                <div class="table-responsive" style="max-height: 530px">
                                    <table class="table table-bordered table-hover align-middle overflow-auto">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Movie Image</th>           
                                                <th>Movie Name</th>                                                   
                                                <th>Room</th>
                                                <th>Date</th>
                                                <th>Showtime</th>                                                   
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listShowtime}" var="showtime">
                                            <tr>
                                                <td>
                                                    <img src="${showtime.getMovieImage()}" class="img-thumbnail" width="130" height="130"/>
                                                </td>
                                                <td>${showtime.getMovie_name()}</td>
                                                <td>${showtime.getRoom_name()}</td>
                                                <td>${showtime.getDate()}</td> 
                                                <td>${showtime.getShowtiming()}</td> 
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        <a class="btn btn-sm text-success" href="updateShowtime?showtimeID=${showtime.getShowtime_id()}" style="color: white">
                                                            <i class="fas fa-edit"></i> Edit
                                                        </a>
                                                    </div> 
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
