<%-- 
    Document   : dashboard
    Created on : 29 May 2024, 16:34:54
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Head -->
    <head>
        <!-- Page Meta Tags-->
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="">

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

        <!-- Fix for custom scrollbar if JS is disabled-->
        <noscript>
        <style>
            /**
            * Reinstate scrolling for non-JS clients
            */
            .simplebar-content-wrapper {
                overflow: auto;
            }
        </style>
        </noscript>

        <!-- Page Title -->
        <title>Apollo | Bootstrap 5 HTML Admin Dashboard</title>

    </head>
    <body class="">

        <!--Header-->
        <jsp:include page="../common/admin/header.jsp"></jsp:include>

            <!-- Page Content -->
            <main id="main">

                <!-- Breadcrumbs-->
                <div class="bg-white border-bottom py-3 mb-5">
                    <div class="container-fluid d-flex justify-content-between align-items-start align-items-md-center flex-column flex-md-row">
                        <nav class="mb-0" aria-label="breadcrumb">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Content-->
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
                    <!-- / Total revenue-->

                    <!-- Total Orders-->
                    <div class="col-12 col-sm-3 col-xxl-4">
                        <div class="card h-100">
                            <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                                <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Total Order</h6>
                            </div>
                            <div class="card-body">
                                <div class="row gx-4 mb-3 mb-md-1">
                                    <div class="col-12 col-md-6">
                                        <p class="fs-3 fw-bold d-flex align-items-center">${totalOrders}</p>
                                    </div>
                                </div>
                            </div>
                        </div>                </div>
                    <!-- / Total Orders-->

                    <!-- Average Order-->
                    <div class="col-12 col-sm-3 col-xxl-4">
                        <div class="card h-100">
                            <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                                <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Average Order</h6>
                            </div>
                            <div class="card-body">
                                <div class="row gx-4 mb-3 mb-md-1">
                                    <div class="col-12 col-md-6">
                                        <p class="fs-3 fw-bold d-flex align-items-center">${averageOrder}</p>
                                    </div>
                                </div>
                            </div>
                        </div>                
                    </div>
                    <!-- / Average Orders-->
                </div>

                <!-- Middle Row Widgets-->
                <div class="row g-4 mb-4 mt-0">
                    <!-- Focus later in iter3-->
                    <jsp:include page="../common/admin/chart.jsp"></jsp:include>

                    </div>
                    <!-- Page Aside-->
                <jsp:include page="../common/admin/aside.jsp"></jsp:include>

                    <!-- Focus later in iter3-->
                <%--<jsp:include page="../common/admin/focuslater3.jsp"></jsp:include>--%>

                <!-- Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>
                    <!-- / Footer-->

                </section>
            </main>

            <!-- Vendor JS -->
            <script src="${pageContext.request.contextPath}/./assets/js/vendor.bundle.js"></script>
                

        <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js?version=1"></script>
    </body>
</html>

