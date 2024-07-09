<%-- 
    Document   : focuslater2
    Created on : 18 May 2024, 10:54:59
    Author     : Son
--%>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/path/to/fontawesome/css/all.min.css">

        <title>Statistics</title>
    </head>
    <body>
        <!-- Pie Chart -->
        <div class="col-12 col-lg-4">
            <div class="card mb-4 h-100">
                <div class="card-header justify-content-between align-items-center d-flex">
                    <h6 class="card-title m-0">Pie Chart For Type Movie</h6>
                    <i style='font-size:24px' class='fas'>&#xf200;</i>
                </div>
                <div class="card-body">
                    <div class="chart chart-lg">
                        <canvas id="chartDoughnut"></canvas>
                    </div>
                    <div class="row g-1 mt-4">
                        <c:forEach var="entry" items="${revenueByTypeMovie_Raw}">
                            <div class="col-12 col-sm-4 d-flex flex-column align-items-center">
                                <p class="fw-bolder mb-1">${entry.value}</p>
                                <div class="d-flex align-items-center">
                                    <span class="f-w-2 f-h-2 bg-secondary-faded d-block rounded-circle me-2"></span>
                                    <span class="small text-muted">${entry.key}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
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
                    <!-- Average Order -->
                    <div class="text-center mt-4">
                        <h6 class="card-title m-0">Average Value Order</h6>
                        <p class="fs-2 fw-bold">${averageValueOrder}</p>
                    </div>
                    <!-- /Average Order -->
                </div>
            </div>
        </div>
        <!-- /Order Statistic -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>
        <script>
        // Parse JSON data
        var revenueByTypeMovie = JSON.parse('${revenueByTypeMovie}');
        var orderStatistics = JSON.parse('${orderStatistics}');

        // Biểu Đồ Tròn cho Doanh Thu theo Loại Phim
        var ctxDoughnut = document.getElementById('chartDoughnut').getContext('2d');
        var revenueData = Object.values(revenueByTypeMovie);
        var labelsData = Object.keys(revenueByTypeMovie);
        var chartDoughnut = new Chart(ctxDoughnut, {
            type: 'doughnut',
            data: {
                labels: labelsData,
                datasets: [{
                    label: 'Doanh Thu',
                    data: revenueData,
                    backgroundColor: ['#ff6384', '#36a2eb', '#cc65fe', '#ffce56', '#36a2eb', '#ff6384']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                var total = context.dataset.data.reduce((a, b) => a + b, 0);
                                var value = context.raw;
                                var percentage = ((value / total) * 100).toFixed(2) + '%';
                                return context.label + ': ' + value + ' (' + percentage + ')';
                            }
                        }
                    }
                }
            }
        });

        // Biểu Đồ Đường cho Thống Kê Đơn Hàng
        var ctxLine = document.getElementById('chartLine').getContext('2d');
        var orderData = Object.values(orderStatistics);
        var dateLabels = Object.keys(orderStatistics);
        var chartLine = new Chart(ctxLine, {
            type: 'line',
            data: {
                labels: dateLabels,
                datasets: [{
                    label: 'Đơn Hàng',
                    data: orderData,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    fill: false,
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    pointStyle: 'circle'
                }]
            },
            options: {
                responsive: true,
                layout: {
            padding: {
                top: 40 
            }
        },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1 // Đặt khoảng cách giữa các giá trị trên trục Y
                        },
                        suggestedMax: Math.max(...orderData) + 2
                    },
                    x: {
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return 'Ngày: ' + context.label + ', Đơn Hàng: ' + context.raw;
                            }
                        }
                    }
                }
            }
        });
    </script>
    </body>
</html>
