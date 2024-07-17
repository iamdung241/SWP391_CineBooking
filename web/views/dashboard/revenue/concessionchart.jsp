<%-- 
    Document   : concessionchart
    Created on : 8 Jul 2024, 21:38:00
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/path/to/fontawesome/css/all.min.css">

        <title>Concession Revenue</title>
        <style>
            .top-product-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .top-product-list li {
                padding: 10px 0;
                font-size: 16px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .top-product-title {
                font-weight: bold;
                font-size: 14px;
                margin-bottom: 0;
            }

            .top-product-quantity {
                color: #888;
                font-size: 14px;
            }

            .top-product-image {
                width: 50px;
                height: 50px;
                object-fit: cover;
            }

            .top-product-row {
                display: flex;
                align-items: center;
                padding: 10px 0;
            }

            .top-product-name {
                flex: 1;
                margin-left: 10px;
                font-size: 14px;
            }

            .top-product-quantity {
                flex: 0 0 auto;
                text-align: right;
                margin-left: 10px;
            }
        </style>


    </head>
    <body>

        <div class="row mb-4 mt-3">
            <div class="row mb-4 mt-3">
                <div class="col-12 col-lg-5">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Top Product</h6>
                        </div>
                        <div class="card-body">
                            <ul class="top-product-list">
                                <c:forEach var="concession" items="${topConcessions}">
                                    <li class="top-product-row">
                                        <img class="top-product-image rounded" src="${pageContext.request.contextPath}/${concession[2]}" alt="${concession[0]}">
                                        <span class="top-product-name">
                                            <span class="top-product-title">${concession[0]}</span>
                                        </span>
                                        <span class="top-product-quantity">
                                            <div class="d-flex align-items-center justify-content-end">
                                                <span class="fw-bolder">${concession[1]}</span>
                                            </div>
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
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
            var revenueData = JSON.parse('${concessionRevenueByDay}');
            var labels = revenueData.map(item => item[0]);
            var data = revenueData.map(item => parseFloat(item[1]));

            var maxDataValue = Math.max(...data);
            var paddedMaxValue = maxDataValue * 1.2;

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
                            max: paddedMaxValue
                        }
                    }
                }
            });
        });
    </script>
</html>
