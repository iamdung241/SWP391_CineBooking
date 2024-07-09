<%-- 
    Document   : filmchart
    Created on : 8 Jul 2024, 21:37:49
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/path/to/fontawesome/css/all.min.css">
        <title>JSP Page</title>

        <style>
            .top-movie-image {
                max-width: 40%;
                height: auto;
                object-fit: contain;
            }
            .top-movie-row {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .top-movie-row img {
                max-width: 50px;
                margin-right: 15px;
            }
            .top-movie-title {
                font-weight: bold;
                font-size: 16px;
            }
            .top-movie-quantity {
                color: #888;
                font-size: 14px;
                margin-left: auto;
            }
        </style>


    </head>
    <body>

        <div class="row mb-4 mt-3">
            <div class="col-12 col-lg-5">
                <div class="card mb-4 h-100">
                    <div class="card-header justify-content-between align-items-center d-flex">
                        <h6 class="card-title m-0">Top Movies</h6>
                    </div>
                    <div class="card-body">
                        <c:forEach var="movie" items="${topMovies}">
                            <div class="top-movie-row">
                                <img class="top-movie-image" src="${pageContext.request.contextPath}/${movie[2]}" alt="${movie[0]}">
                                <div class="top-movie-title">${movie[0]}</div>
                                <div class="top-movie-quantity">${movie[1]}</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>                
            </div>
            <div class="col-12 col-lg-7">
                <div class="card h-100">
                    <div class="card-header justify-content-between align-items-center d-flex border-0 pb-0">
                        <h6 class="card-title m-0 text-muted fs-xs text-uppercase fw-bolder tracking-wide">Revenue Orders</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="revenueChart"></canvas>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>
    </body>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById('revenueChart').getContext('2d');
            var revenueData = JSON.parse('${filmRevenueByDay}');
            var labels = revenueData.map(item => item[0]);
            var data = revenueData.map(item => parseFloat(item[1]));

            var maxDataValue = Math.max(...data);
            var paddedMaxValue = maxDataValue * 1.2; // Thêm khoảng 1/5 giá trị lớn nhất

            var chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Revenue',
                            data: data,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        x: {
                            type: 'time',
                            time: {
                                unit: 'day'
                            }
                        },
                        y: {
                            beginAtZero: true,
                            max: paddedMaxValue // Thiết lập giá trị tối đa cho trục y
                        }
                    }
                }
            });
        });
    </script>

</html>
