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
    <title>Statistics</title>
</head>
<body>
    <!-- Monthly Expenses -->
    <div class="col-12 col-lg-4">
        <div class="card mb-4 h-100">
            <div class="card-header justify-content-between align-items-center d-flex">
                <h6 class="card-title m-0">Biểu Đồ Tròn Cho Loại Phim</h6>
                <i style='font-size:24px' class='fas'>&#xf200;</i>
            </div>
            <div class="card-body">
                <div class="chart chart-lg">
                    <canvas id="chartDoughnut"></canvas>
                </div>
                <div class="row g-1 mt-4">
                    <c:forEach var="entry" items="${revenueByTypeMovie}">
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
    <!-- /Monthly Expenses -->

    <!-- Order Statistic -->
    <div class="col-12 col-lg-8">
        <div class="card mb-4 h-100">
            <div class="card-header justify-content-between align-items-center d-flex">
                <h6 class="card-title m-0">Thống Kê Đơn Hàng</h6>
                <i style='font-size:24px' class='fas'>&#xf201;</i>
            </div>
            <div class="card-body">
                <div class="chart chart-lg">
                    <canvas id="chartLine"></canvas>
                </div>
            </div>
        </div>
    </div>
    <!-- /Order Statistic -->

    <script>
        // Biểu Đồ Tròn cho Doanh Thu theo Loại Phim
        var ctxDoughnut = document.getElementById('chartDoughnut').getContext('2d');
        var revenueData = [<c:forEach var="entry" items="${revenueByTypeMovie}">"${entry.value}", </c:forEach>];
        var labelsData = [<c:forEach var="entry" items="${revenueByTypeMovie}">"${entry.key}", </c:forEach>];
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
        var orderData = [<c:forEach var="entry" items="${orderStatistics}">"${entry.value}", </c:forEach>];
        var dateLabels = [<c:forEach var="entry" items="${orderStatistics}">"${entry.key}", </c:forEach>];
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
                    fill: false
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
