<%-- 
    Document   : dashboard
    Created on : 18 May 2024, 10:18:31
    Author     : Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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
        <title></title>
        <!-- Fix for custom scrollbar if JS is disabled-->
        <style>
            /**
            * Reinstate scrolling for non-JS clients
            */
            .simplebar-content-wrapper {
                overflow: auto;
            }
        </style>



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
                                <li class="breadcrumb-item"><a href="/CineBooking/home">Home</a></li>
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
                                    <h6 class="card-title m-0">List Movie</h6>
                                    <div class="border-1 d-flex">
                                        <form class="d-flex" action="AdminSearchFilter">
                                            <input class="form-control" name ="searchAdmin" 
                                                   placeholder="Search">
                                            <button class="btn btn-primary p-0" type="submit">Search</button>
                                        </form>
                                        <div class="">
                                            <select class="form-select mx-2" onchange="location.href='AdminSearchFilter?ACT=filter&typeId='+this.value">
                                                <option>All</option>
                                            <c:forEach items="${listType}" var="t">
                                                <option value="${t.type_id}">${t.type_name}</option>
                                            </c:forEach>   
                                            </select>
                                        </div>
                                    </div>
                                <a class="btn btn-sm btn-primary" href="movie?mode=add"><i class="ri-add-circle-line align-bottom"></i> Add Film</a>
                            </div>
                            <div class="card-body">
                                <div class="border-1">
                                    <table class="table border-1">
                                        <thead>
                                            <tr>
                                                <th class="">ID</th>
                                                <th class="text-center">Name</th>                                                   
                                                <th class="text-center">Date</th>
                                                <th class="text-center">Age</th>
                                                <th class="text-center">Type</th>                                                   
                                                <th class="text-center">Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listMovie}" var="m">
                                                <c:if test="${m.status eq 'on'}">
                                                    <tr>
                                                        <td class="">${m.movie_id}</td>
                                                        <td class="text-center">${m.movie_name}</td>
                                                        <td class="text-center">${m.date_published}</td>
                                                        <td class="text-center">${m.age}</td> 
                                                        <td class="text-center">${m.type_name}</td> 
                                                        <td class="text-center">${m.status}</td> 
                                                        <td class="text-center">
                                                            <div class="d-flex p-6">
                                                                <a class="btn btn-sm btn-primary me-1" href="movie?mode=detail&idMovie=${m.movie_id}" style="color: white"><i class="align-bottom"></i>Detail</a>
                                                                <a class="btn btn-sm btn-success me-1" href="movie?mode=update&idMovie=${m.movie_id}" style="color: white"><i class="align-bottom"></i> Edit</a>
                                                                <a class="btn btn-sm btn-danger" href="movie?mode=del&idMovie=${m.movie_id}" style="color: white"><i class="align-bottom"></i> Delete</a>
                                                            </div> 
                                                        </td>
                                                    </tr>
                                                </c:if>
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

