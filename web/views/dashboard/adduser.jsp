<%-- 
    Document   : adduser
    Created on : 6 thg 7, 2024, 03:47:52
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
        <section class="container-fluid">
            <!-- Content-->
            <div class="col-12">
                <div class="card mb-4 h-100">
                    <div class="card-body">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Add Staff</h6>
                            <a class="btn btn-sm btn-primary" href="manageuser.jsp"><i class="fas fa-arrow-left me-1"></i> Back</a>
                        </div>
                        <form class="mt-4" action="adduser" method="post">
                            <table class="table">
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Username: </label></td>
                                    <td>
                                        <% 
                                            String errorUsername = (String) request.getAttribute("errorUsername");
                                            if (errorUsername != null) {
                                        %>
                                        <input class="form-control" type="text" name="username" placeholder="Username" required>
                                        <p style="color: red; font-size: smaller;"><%= errorUsername %></p>
                                        <% } else { %>
                                        <input class="form-control" type="text" name="username" placeholder="Username" value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" required>
                                        <% } %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Password: </label></td>
                                    <td>
                                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                                        <% 
                                            String errorPassword = (String) request.getAttribute("errorPassword");
                                            if (errorPassword != null) {
                                        %>
                                        <p style="color: red; font-size: smaller;"><%= errorPassword %></p>
                                        <% } %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Re-enter Password: </label></td>
                                    <td>
                                        <input class="form-control" type="password" name="repassword" placeholder="Re-enter Password" required>
                                        <% 
                                            String errorRePassword = (String) request.getAttribute("errorRePassword");
                                            if (errorRePassword != null) {
                                        %>
                                        <p style="color: red; font-size: smaller;"><%= errorRePassword %></p>
                                        <% } %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Fullname: </label></td>
                                    <td>
                                        <% 
                                            String errorFullname = (String) request.getAttribute("errorFullname");
                                            if (errorFullname != null) {
                                        %>
                                        <input class="form-control" type="text" name="fullname" placeholder="Fullname" required>
                                        <p style="color: red; font-size: smaller;"><%= errorFullname %></p>
                                        <% } else { %>
                                        <input class="form-control" type="text" name="fullname" placeholder="Fullname" value="<%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : "" %>" required>
                                        <% } %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Email: </label></td>
                                    <td>
                                        <% 
                                            String errorEmail = (String) request.getAttribute("errorEmail");
                                            if (errorEmail != null) {
                                        %>
                                        <input class="form-control" type="text" name="email" placeholder="Email" required>
                                        <p style="color: red; font-size: smaller;"><%= errorEmail %></p>
                                        <% } else { %>
                                        <input class="form-control" type="text" name="email" placeholder="Email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
                                        <% } %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Phone: </label></td>
                                    <td>
                                        <% 
                                            String errorPhone = (String) request.getAttribute("errorPhone");
                                            if (errorPhone != null) {
                                        %>
                                        <input class="form-control" type="text" name="phone" placeholder="Phone" required>
                                        <p style="color: red; font-size: smaller;"><%= errorPhone %></p>
                                        <% } else { %>
                                        <input class="form-control" type="text" name="phone" placeholder="Phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>" required>
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
                            <div class="container-fluid d-flex justify-content-center">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>

                    </div>
                </div>  
            </div>
            <!-- / Content-->
        </section>
    </body>
</html>