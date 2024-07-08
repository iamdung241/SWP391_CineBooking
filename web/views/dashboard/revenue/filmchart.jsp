<%-- 
    Document   : filmchart
    Created on : 8 Jul 2024, 21:37:49
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/path/to/fontawesome/css/all.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-12 col-lg-4">
            <div class="card mb-4 h-100">
                <div class="card-header justify-content-between align-items-center d-flex">
                    <h6 class="card-title m-0">Top Movie</h6>
                    <i style='font-size:24px' class='fas'>&#xf200;</i>
                </div>
                <!--Làm cho tôi danh sách top 4 Film được book nhiều nhất bao gồm name, quantity-->
            </div>
        </div>
        <!-- /Pie Chart -->

        <!-- Order Statistic -->
        <div class="col-12 col-lg-8">
            <div class="card mb-4 h-100">
                <div class="card-header justify-content-between align-items-center d-flex">
                    <h6 class="card-title m-0">Revenue Orders</h6>
                    <i style='font-size:24px' class='fas'>&#xf201;</i>
                </div>
                <div class="card-body">
                    <div class="chart chart-lg" >
                        <canvas id="chartLine"></canvas>
                    </div>
                    <!-- Average Value -->
                    <div class="text-center mt-4">
                        <h6 class="card-title m-0">Average Value</h6>
                        <p class="fs-2 fw-bold">${averageValue}</p>
                    </div>
                    <!-- /Average Value -->
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>
    </body>
</html>
