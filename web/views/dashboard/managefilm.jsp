<%-- 
    Document   : managefilm
    Created on : 6 thg 7, 2024, 02:00:10
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Film</title>
        <!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <style>
            .card-header {
                background-color: #f8f9fa;
            }
            .form-select-custom {
                border: 1px solid #007bff;
                border-radius: 4px;
                padding: 0.375rem 0.75rem;
            }
            .table th, .table td {
                vertical-align: middle;
            }
        </style>
        <script>
            function confirmDelete() {
                return confirm("Are you sure you want to delete this movie?");
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <div class="row g-4 mb-4 mt-0">
                    <div class="col-12">
                        <div class="card mb-4 h-100">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="card-title m-0">List Movie</h6>
                                <div class="d-flex align-items-center">
                                    <form class="d-flex me-2" action="AdminSearchFilter">
                                        <input class="form-control me-2" name="searchAdmin" placeholder="Search" value="${key}">
                                    <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                                </form>
                                <a class="btn btn-sm mx-2 text-success" href="movie?mode=add"><i class="fas fa-plus-circle me-1"></i> Add Film</a>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="max-height: 530px">
                                <table class="table table-bordered table-hover overflow-scroll">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>                                                   
                                            <th>Date</th>
                                            <th>Age</th>
                                            <th>
                                                <select class="form-select form-select-custom" onchange="location.href = 'AdminSearchFilter?ACT=filter&typeId=' + this.value">
                                                    <option ${typeSearch == 10 ? 'selected ' : ''} value="10">All Type</option>
                                                    <c:forEach items="${listType}" var="t">
                                                        <option ${typeSearch == t.type_id ? 'selected' : ''} value="${t.type_id}">${t.type_name}</option>
                                                    </c:forEach>   
                                                </select>
                                            </th>                                                   
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listMovie}" var="m">
                                            <tr>
                                                <td>${m.movie_id}</td>
                                                <td>${m.movie_name}</td>
                                                <td>${m.date_published}</td>
                                                <td>${m.age}</td> 
                                                <td>${m.type_name}</td> 
                                                <td>${m.status eq 'on' ? '<p style="color: green">Enable</p>' : '<p style="color: red">Disable</p>'}</td>
                                                <td class="text-center">
                                                    <div class="d-flex justify-content-center">
                                                        <a class="btn text-primary" href="movie?mode=detail&idMovie=${m.movie_id}"><i class="fas fa-info-circle"></i> Detail</a>
                                                        <a class="btn text-success" href="movie?mode=update&idMovie=${m.movie_id}"><i class="fas fa-edit"></i> Edit</a>
                                                        <a class="btn text-warning" href="addNewShowtime?idMovie=${m.movie_id}"><i class="fa-solid fa-clock"></i> Showtime</a>
                                                        <a class="btn text-danger" onclick="return confirmDelete()" href="movie?mode=del&idMovie=${m.movie_id}"><i class="fas fa-trash-alt"></i> Delete</a>
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
