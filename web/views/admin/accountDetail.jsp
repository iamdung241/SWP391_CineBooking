<%-- 
    Document   : accountDetail
    Created on : May 24, 2024, 7:48:04 AM
    Author     : VuTA
--%>

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
<!--                    <div class="d-flex justify-content-end align-items-center mt-3 mt-md-0">
                        <a class="btn btn-sm btn-primary" href="#"><i class="ri-add-circle-line align-bottom"></i> New Project</a>
                        <a class="btn btn-sm btn-primary-faded ms-2" href="#"><i class="ri-settings-3-line align-bottom"></i> Settings</a>
                        <a class="btn btn-sm btn-secondary-faded ms-2 text-body" href="#"><i class="ri-question-line align-bottom"></i> Help</a>
                    </div>-->
                </div>
            </div>
            <!-- Content-->
            <section class="container-fluid">
                <!-- Content-->
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-body">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">User Detail</h6>
                                <a class="btn btn-sm btn-primary" href="manageuser.jsp"><i class="align-bottom"></i>Back</a>
                            </div>
                            <div class="container">

                                <%
                                    // Retrieve the account ID from the request parameter
                                    String id = request.getParameter("id");
                                    int accountId = 0;
                                    if (id != null) {
                                        accountId = Integer.parseInt(id);
                                    }

                                    // Create an instance of AccountDAO and retrieve the account details using the account ID
                                    AccountDAO ad = new AccountDAO();
                                    Account account = ad.getAccountByID(accountId);
                                %>

                                <% if (account != null) { %>
                                    <table class="table">
                                        <tr>
                                            <td><label>Account ID: </label></td>
                                            <td><%= account.getAccount_id() %></td>
                                        </tr>
                                        <tr>
                                            <td><label>Fullname: </label></td>
                                            <td><%= account.getFullname() %></td>
                                        </tr>
                                        <tr>
                                            <td><label>Phone: </label></td>
                                            <td><%= account.getPhone() %></td>
                                        </tr>
                                        <tr>
                                            <td><label>Email: </label></td>
                                            <td><%= account.getEmail() %></td>
                                        </tr>
                                        <tr>
                                            <td><label>Username: </label></td>
                                            <td><%= account.getUsername() %></td>
                                        </tr>
                                        <tr>
                                            <td><label>Role: </label></td>
                                            <td>
                                                <%
                                                    // Determine the role name based on the role ID
                                                    int roleId = account.getRole_id();
                                                    String roleName = "";
                                                    if (roleId == 2) {
                                                        roleName = "Staff";
                                                    } else if (roleId == 3) {
                                                        roleName = "Customer";
                                                    } else if (roleId == 1) {
                                                        roleName = "Admin";
                                                    }
                                                %>

                                                <% if (roleId == 2 || roleId == 1) { %>
                                                <!-- Form to update the role if the role is Staff or Admin -->
                                                <form action="updateRole" method="post">
                                                    <input type="hidden" name="accountId" value="<%= account.getAccount_id() %>">
                                                    <select name="roleId">
                                                        <option value="2" <%= roleId == 2 ? "selected" : "" %>>Staff</option>
                                                        <option value="1" <%= roleId == 1 ? "selected" : "" %>>Admin</option>
                                                    </select>
                                                    <input type="submit" class="btn btn-sm btn-primary" value="Update Role">
                                                </form>
                                                <% } else { %>
                                                <!-- Display role name if the role is Admin -->
                                                <%= roleName %>
                                                <% } %>
                                            </td>
                                        </tr>
                                    </table>
                                <%}%>      

                            </div>
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
