<%-- 
    Document   : moviedetail
    Created on : 6 thg 7, 2024, 02:07:42
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Film Detail</title>
        <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <div class="row g-4 mb-4 mt-0">
                    <!-- Movie Detail -->
                    <div class="col-12">
                        <div class="card mb-4 h-100">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="card-title m-0">Movie Detail</h6>
                                <a class="btn btn-sm btn-primary" href="movie"><i class="fas fa-arrow-left me-1"></i> Back</a>
                            </div>
                            <div class="container mt-4">
                            <c:set value="${movieDetail}" var="m"/>
                            <div class="row">
                                <div class="col-lg-6">
                                    <img src="${m.post_img}" class="img-fluid rounded" alt="${m.movie_name}" />
                                </div>
                                <div class="col-lg-6 mt-3 mt-lg-0">
                                    <h3>${m.movie_name}</h3>
                                    <p>
                                        <strong>Date published:</strong> ${m.date_published}<br>
                                        <strong>Type:</strong> ${m.type_name} (${m.age})<br>
                                        <strong>Duration:</strong> ${m.duration} minutes<br>
                                        <strong>Status:</strong> ${m.status eq 'on' ? 'Enable' : 'Disable'}<br>
                                        <strong>Trailer:</strong> <a href="${m.trailer}" target="_blank">${m.trailer}</a><br>
                                        <strong>Description:</strong><br>
                                        ${m.decription}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
