<%-- 
    Document   : concessionrevenue
    Created on : 8 Jul 2024, 21:30:49
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/libs.bundle.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/theme.bundle.css" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/libs.bundle.css" />


        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/theme.bundle.css" />

        <title>Concessions Revenue</title>
    </head>
    <body>
        <jsp:include page="../../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <form method="get" action="${pageContext.request.contextPath}/revenue/concession">
                <div class="row align-items-center g-4">
                    <div class="col-6 col-md-3">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" id="startDate" name="startDate" class="form-control" value="${startDate != null ? startDate : defaultStartDate}">
                    </div>
                    <div class="col-6 col-md-3">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" id="endDate" name="endDate" class="form-control" value="${endDate != null ? endDate : defaultEndDate}">
                    </div>
                    <div class="col-12 col-md-2">
                        <label for=" " class="form-label">&nbsp;</label>
                        <button type="submit" class="btn btn-primary w-100">Filter</button>
                    </div>
                </div>
            </form>
                    <br/>
                    <br/>

            <div class="row g-4">       

                <!-- Total revenue-->
                <div class="col-12 col-sm-3 col-xxl-4">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Total Film Revenue</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center">${totalRevenue}</p>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
                <div class="col-12 col-sm-3 col-xxl-4">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Average Value</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center">${averageValue}</p>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
                                <br/>
            <div class="row mb-4 mt-3">
                <jsp:include page="concessionchart.jsp"></jsp:include>
                </div>

                
        </section>

    </body>
</html>
