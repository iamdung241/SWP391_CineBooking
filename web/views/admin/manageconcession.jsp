<%-- 
    Document   : manageconcession
    Created on : 18 May 2024, 10:18:31
    Author     : Son
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            .error{
                color:red;
            }
        </style>
        </noscript>

    </head>
    <body class="">

        <!--Header-->
        <jsp:include page="../common/admin/header.jsp"></jsp:include>

        <jsp:include page="addConcession.jsp"></jsp:include>
        <jsp:include page="editConcession.jsp"></jsp:include>
        <jsp:include page="deleteConcession.jsp"></jsp:include>

            <!-- Page Content -->
            <main id="main">

                <!-- Breadcrumbs-->
                <div class="bg-white border-bottom py-3 mb-5">
                    <div class="container-fluid d-flex justify-content-between align-items-start align-items-md-center flex-column flex-md-row">
                        <nav class="mb-0" aria-label="breadcrumb">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="./index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manage Concession</li>
                            </ol>
                        </nav>
                        <div class="d-flex justify-content-end align-items-center mt-3 mt-md-0">
                            <a class="btn btn-sm btn-primary" href="#"><i class="ri-add-circle-line align-bottom"></i> New Project</a>
                            <a class="btn btn-sm btn-primary-faded ms-2" href="#"><i class="ri-settings-3-line align-bottom"></i> Settings</a>
                            <a class="btn btn-sm btn-secondary-faded ms-2 text-body" href="#"><i class="ri-question-line align-bottom"></i> Help</a>
                        </div>
                    </div>
                </div>

                <!-- Content-->
                <section class="container-fluid">

                    <!-- Page Title-->
                    <h2 class="fs-3 fw-bold mb-2">Welcome, Manager 👋</h2>
                    <p class="text-muted mb-5">Get a quick overview of your project, or click into one of the sections for a more detailed breakdown.</p>
                    <!-- / Page Title-->

                    <!-- Middle Row Widgets-->
                    <div class="row g-4 mb-4 mt-0">


                        <!-- Latest Orders-->
                        <div class="col-12">
                            <div class="card mb-4 h-100">
                                <div class="card-header justify-content-between align-items-center d-flex">
                                    <h6 class="card-title m-0">Concession Listing</h6>

                                    <form class="d-none d-md-flex bg-light rounded px-3 py-1" action="search">
                                        <input class="form-control border-0 bg-transparent px-0 py-2 me-2 fw-bolder" type="search"
                                               placeholder="Search" name="keyword" aria-label="Search">
                                        <button class="btn btn-link p-0 text-muted" type="submit"><i class="ri-search-2-line"></i></button>
                                    </form>

                                    <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#addModal" style="color: white">
                                        <i class="ri-add-circle-line align-bottom" style="color: white"></i>
                                        Add Concession
                                    </a>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table m-0 table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Image</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="c" items="${listConcession}">
                                                <tr>
                                                    <td name="id">
                                                        <span class="fw-bolder">${c.concessions_id}</span>
                                                    </td>
                                                    <td name="name">${c.concessions_name}</td>
                                                    <td name="image">
                                                        <img src="${c.image}" width="100" height="100"/> 
                                                    </td>
                                                    <td name="price">${c.price}đ</td>
                                                    <td name="quantity">${c.quantity}</td>
                                                    <td class="">
                                                        <form>  
                                                            <button type="button" class="btn btn-primary"
                                                                    data-toggle="modal" 
                                                                    data-target="#editConcessionModal"
                                                                    onclick="editConcessionModal(this)">
                                                                Edit
                                                            </button>
                                                        </form>
                                                        <button type="button" class="btn btn-danger"
                                                                data-toggle="modal" data-target="#deleteModal"
                                                                onclick="deleteConcession(${c.concessions_id})">
                                                            Delete
                                                        </button>
<!--                                                        <button type="button" class="btn btn-success"
                                                                data-toggle="modal" data-target="#restockModal"
                                                                onclick="restockProduct">
                                                            Restock
                                                        </button>-->
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>    
                                <nav>
                                    <ul class="pagination justify-content-end mt-3 mb-0">
                                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Latest Orders-->

                </div>

                <!-- Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>

                </section>
                <!-- / Content-->

            </main>
            <!-- /Page Content -->

            <!-- Page Aside-->
        <jsp:include page="../common/admin/aside.jsp"></jsp:include>
            <!-- Theme JS -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <!-- Vendor JS -->
            <script src="${pageContext.request.contextPath}/./assets/js/vendor.bundle.js"></script>

        <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>
    </body>

</html>

