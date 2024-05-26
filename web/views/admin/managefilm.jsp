<%-- 
    Document   : managefilm
    Created on : 18 May 2024, 10:18:31
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
                                <li class="breadcrumb-item"><a href="./index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manage Film</li>
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
                                <h6 class="card-title m-0">Latest orders</h6>
                                <a class="btn btn-sm btn-primary" href="#"><i class="ri-add-circle-line align-bottom"></i> Add Film</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table m-0 table-striped">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Billing Name</th>
                                                <th>Date</th>
                                                <th>Payment Method</th>
                                                <th>Items</th>
                                                <th>Amount</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <span class="fw-bolder">#1234-5679</span>
                                                </td>
                                                <td>Patria Nelson</td>
                                                <td class="text-muted">24th June, 2021</td>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <i class="ri-visa-line ri-lg me-2"></i> **** 6789
                                                    </div>
                                                </td>
                                                <td class="text-muted">5</td>
                                                <th class="text-muted">$123.99</th>
                                                <td><span class="badge rounded-pill bg-success-faded text-success">completed</span></td>
                                                <td>
                                                    <a class="btn btn-sm btn-success" href="#" style="color: white"><i class="align-bottom"></i> Edit</a>
                                                    <a class="btn btn-sm btn-danger" href="#" style="color: white"><i class="align-bottom"></i> Delete</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="fw-bolder">#1235-7755</span>
                                                </td>
                                                <td>Dominic Patterson</td>
                                                <td class="text-muted">22nd June, 2021</td>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <i class="ri-mastercard-fill ri-lg me-2"></i> **** 1233
                                                    </div>
                                                </td>
                                                <td class="text-muted">5</td>
                                                <th class="text-muted">$123.99</th>
                                                <td><span class="badge rounded-pill bg-info-faded text-info">processing</span></td>
                                                <td>
                                                    <a class="btn btn-sm btn-success" href="#" style="color: white"><i class="align-bottom"></i> Edit</a>
                                                    <a class="btn btn-sm btn-danger" href="#" style="color: white"><i class="align-bottom"></i> Delete</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="fw-bolder">#1236-6579</span>
                                                </td>
                                                <td>Steven Smith</td>
                                                <td class="text-muted">21st June, 2021</td>
                                                <td class="text-muted">
                                                    <div class="d-flex align-items-center">
                                                        <i class="ri-paypal-line ri-lg me-2"></i> **** 7766
                                                    </div>
                                                </td>
                                                <td class="text-muted">5</td>
                                                <th class="text-muted">$123.99</th>
                                                <td><span class="badge rounded-pill bg-danger-faded text-danger">cancelled</span></td>
                                                <td>
                                                    <a class="btn btn-sm btn-success" href="#" style="color: white"><i class="align-bottom"></i> Edit</a>
                                                    <a class="btn btn-sm btn-danger" href="#" style="color: white"><i class="align-bottom"></i> Delete</a>
                                                </td>
                                            </tr>
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
                <!-- / Middle Row Widgets-->

                <!-- Focus later in iter3-->
                <%--<jsp:include page="../common/admin/focuslater3.jsp"></jsp:include>--%>

                <!-- Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>


                    <!-- Sidebar Menu Overlay-->
                    <div class="menu-overlay-bg"></div>

            </section>
            <!-- / Content-->

        </main>
        <!-- /Page Content -->

        <!-- Page Aside-->
        <jsp:include page="../common/admin/aside.jsp"></jsp:include>
            <!-- Theme JS -->
            <!-- Vendor JS -->
            <script src="${pageContext.request.contextPath}/./assets/js/vendor.bundle.js"></script>

        <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>
    </body>

</html>

