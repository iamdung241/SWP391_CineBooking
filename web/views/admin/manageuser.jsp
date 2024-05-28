<%-- 
    Document   : dashboard
    Created on : 18 May 2024, 10:18:31
    Author     : VuTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*, java.util.Vector, dal.AccountDAO, model.Account"%>
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
                                <li class="breadcrumb-item active" aria-current="page">Manage User</li>
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

                    <!-- Content-->
                    <div class="col-12">
                        <div class="card mb-4 h-100">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">User List</h6>
                                <a class="btn btn-sm btn-primary" href="adduser.jsp"><i class="ri-add-circle-line align-bottom"></i> Add Staff</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table m-0 table-striped">
                                        <thead>
                                            <tr>
                                                <th>Account ID</th>
                                                <th>Username</th>
                                                <th>Role</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            AccountDAO ad = new AccountDAO();
                                            Vector<Account> list = ad.getAllAccount();

                                            if (list != null) {
                                                for (Account a : list) {
                                        %>
                                        <tr>
                                            <td><%= a.getAccount_id() %></td>
                                            <td><%= a.getUsername() %></td>
                                            <td>
                                                <%
                                                    int roleId = a.getRole_id();
                                                    String roleName = "";
                                                    if (roleId == 2) {
                                                        roleName = "Staff";
                                                    } else if (roleId == 3) {
                                                        roleName = "Customer";
                                                    } else if (roleId == 1) {
                                                        roleName = "Admin";
                                                    }
                                                %>
                                                <%= roleName %>
                                            </td>
                                            <td>
                                                <a class="btn btn-sm btn-success" href="views/admin/accountDetail.jsp?id=<%= a.getAccount_id() %>" style="color: white"><i class="align-bottom"></i>Detail</a>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>                        
                        </div>
                    </div>  
                </div>
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

