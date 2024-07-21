<%-- 
    Document   : dashborad
    Created on : 6 thg 7, 2024, 23:57:14
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/./assets/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/./assets/images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/./assets/images/favicon/favicon-16x16.png">
        <link rel="mask-icon" href="${pageContext.request.contextPath}/./assets/images/favicon/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/libs.bundle.css" />


        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/theme.bundle.css" />
        
        <title>Dashboard</title>
    </head>
    <body>
        <jsp:include page="../../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <form method="get" action="${pageContext.request.contextPath}/dashboard">
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
            <!-- Focus later in iter3-->
            <div class="row g-4">       

                <!-- Total revenue-->
                <div class="col-12 col-sm-3 col-xxl-4">
                    <div class="card h-100">
                        <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Total Revenue</h6>
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
                            <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Average Value Order</h6>
                        </div>
                        <div class="card-body">
                            <div class="row gx-4 mb-3 mb-md-1">
                                <div class="col-12 col-md-6">
                                    <p class="fs-3 fw-bold d-flex align-items-center">${averageValueOrder}</p>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
            <div class="row mb-4 mt-3">
                <jsp:include page="chart.jsp"></jsp:include>
            </div>
        </section>
    </body>
    
    <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js?version=1"></script>
</html>
