<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
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
        <!-- Fix for custom scrollbar if JS is disabled-->
        <noscript>
        <style>
            .simplebar-content-wrapper {
                overflow: auto;
            }
        </style>
        </noscript>
    </head>
    <body class="">
        <!--Header-->
        <!-- Page Content -->
        <main id="main">
            <!-- Breadcrumbs-->
            <div class="bg-white border-bottom py-3 mb-5">
                <div class="container-fluid d-flex justify-content-between align-items-start align-items-md-center flex-column flex-md-row">
                    <nav class="mb-0" aria-label="breadcrumb">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="./index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Manage User</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Content-->
            <section class="container-fluid">
                <!-- Content-->
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-body">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">Add Staff</h6>
                                <a class="btn btn-sm btn-primary" href="manageuser.jsp"><i class="align-bottom"></i>Back</a>
                            </div>
                            <form class="mt-4" action="adduser" method="post">
                                <table class="table">
                                    <tr>
                                        <td><label class="form-label">Username: </label></td>
                                        <td>
                                            <% 
                                                String errorUsername = (String) request.getAttribute("errorUsername");
                                                if (errorUsername != null) {
                                            %>
                                            <input type="text" name="username" placeholder="Username" required>
                                            <p style="color: red; font-size: smaller;"><%= errorUsername %></p>
                                            <% } else { %>
                                            <input type="text" name="username" placeholder="Username" value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" required>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label class="form-label">Password: </label></td>
                                        <td>
                                            <input type="password" name="password" placeholder="Password" required>
                                            <% 
                                                String errorPassword = (String) request.getAttribute("errorPassword");
                                                if (errorPassword != null) {
                                            %>
                                            <p style="color: red; font-size: smaller;"><%= errorPassword %></p>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label class="form-label">Re-enter Password: </label></td>
                                        <td>
                                            <input type="password" name="repassword" placeholder="Re-enter Password" required>
                                            <% 
                                                String errorRePassword = (String) request.getAttribute("errorRePassword");
                                                if (errorRePassword != null) {
                                            %>
                                            <p style="color: red; font-size: smaller;"><%= errorRePassword %></p>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label class="form-label">Fullname: </label></td>
                                        <td>
                                            <% 
                                                String errorFullname = (String) request.getAttribute("errorFullname");
                                                if (errorFullname != null) {
                                            %>
                                            <input type="text" name="fullname" placeholder="Fullname" required>
                                            <p style="color: red; font-size: smaller;"><%= errorFullname %></p>
                                            <% } else { %>
                                            <input type="text" name="fullname" placeholder="Fullname" value="<%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : "" %>" required>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label class="form-label">Email: </label></td>
                                        <td>
                                            <% 
                                                String errorEmail = (String) request.getAttribute("errorEmail");
                                                if (errorEmail != null) {
                                            %>
                                            <input type="text" name="email" placeholder="Email" required>
                                            <p style="color: red; font-size: smaller;"><%= errorEmail %></p>
                                            <% } else { %>
                                            <input type="text" name="email" placeholder="Email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label class="form-label">Phone: </label></td>
                                        <td>
                                            <% 
                                                String errorPhone = (String) request.getAttribute("errorPhone");
                                                if (errorPhone != null) {
                                            %>
                                            <input type="text" name="phone" placeholder="Phone" required>
                                            <p style="color: red; font-size: smaller;"><%= errorPhone %></p>
                                            <% } else { %>
                                            <input type="text" name="phone" placeholder="Phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>" required>
                                            <% } %>
                                        </td>
                                    </tr>
                                </table>
                                <% 
                                    String successMessage = (String) request.getAttribute("successMessage");
                                        if (successMessage != null) {
                                %>
                                <p style="color: green; font-size: smaller;"><%= successMessage %></p>
                                <% } %>                
                                <!-- Submit button for the form -->
                                <div>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </form>

                        </div>
                    </div>  
                </div>
                <!-- / Content-->
            </section>
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
