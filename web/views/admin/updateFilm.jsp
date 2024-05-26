<%-- 
    Document   : dashboard
    Created on : 18 May 2024, 10:18:31
    Author     : Huy
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
        </style>
        </noscript>

    </head>
    <body class="">

        <!--Header-->
        <jsp:include page="../common/admin/header.jsp"></jsp:include>

            <!-- Page Content -->
            <main id="main">

                <!-- Breadcrumbs-->
                <div class="bg-white border-bottom py-3">
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
                    <!-- / Page Title-->

                    <!-- Middle Row Widgets-->
                    <div class="row g-4 mb-4 mt-0">
                        <!-- Latest Orders-->
                        <div class="col-12">
                            <div class="card mb-4 h-100">
                                <div class="card-header justify-content-between align-items-center d-flex">
                                    <h6 class="card-title m-0">Update Movie</h6>
                                    <a class="btn btn-sm btn-primary" href="movie"><i class="align-bottom"></i>Back</a>
                                </div>                            
                            <div class="container">
                                <form action="movie?mode=update" method="post" enctype="multipart/form-data">
                                    <div class="table-responsive">
                                        <c:set value="${movieUpdate}" var="m"/>
                                        <table class="table">
                                            <tr>
                                                <td>ID</td>
                                                <td><input name="id" type="text" class="form-control" readonly="" value="${m.movie_id}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Name</td>
                                                <td><input name="name" type="text" class="form-control" required value="${m.movie_name}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Type</td>
                                                <td>
                                                    <select name="type" class="form-control text-center">
                                                        <c:forEach items="${typeMovie}" var="tm">
                                                            <option value="${tm.type_id}" ${tm.type_id == m.type_id ? 'selected' : ''}>${tm.type_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Duration</td>
                                                <td><input name="duration" type="text" class="form-control" required value="${m.duration}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Date</td>
                                                <td><input name="date" type="date" class="form-control" required value="${m.date_published}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Trailer</td>
                                                <td><input name="trailer" type="text" class="form-control" required value="${m.trailer}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Descripton</td>
                                                <td><input name="description" type="text" class="form-control" required value="${m.decription}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Image</td>
                                                <td>
                                                    <img src="${m.post_img}" style="width: 400px;height: 400px" alt="alt"/>
                                                    <input type="hidden" value="${m.post_img}" name="img">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Image</td>
                                                <td><input type="file" name="file" class="form-control"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <button type="submit" class="btn btn-success">Update</button>
                                </form>
                            </div>
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

