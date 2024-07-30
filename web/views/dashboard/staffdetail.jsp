<%-- 
Document   : userdetail
Created on : 6 thg 7, 2024, 03:51:47
Author     : tranh
--%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <!-- Content-->
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-body">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">Staff Detail</h6>
                                <a class="btn btn-sm btn-primary" href="managestaff.jsp"><i class="align-bottom"></i>Back</a>
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
                                    <td style="font-weight: bolder"><label>Account ID: </label></td>
                                    <td><%= account.getAccount_id() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Fullname: </label></td>
                                    <td><%= account.getFullname() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Phone: </label></td>
                                    <td><%= account.getPhone() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Email: </label></td>
                                    <td><%= account.getEmail() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Username: </label></td>
                                    <td><%= account.getUsername() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Role: </label></td>
                                    <td>
                                        <%
                                                int roleId = account.getRole_id();
                                                String roleName = "";
                                                if (roleId == 1) {
                                                    roleName = "Admin";
                                                } else if (roleId == 2) {
                                                    roleName = "Manager";
                                                } else if (roleId == 3) {
                                                    roleName = "Ticket_Checked";
                                                } else if (roleId == 4) {
                                                    roleName = "Customer";
                                                } else if (roleId == 5) {
                                                    roleName = "Ticket_Seller";
                                                }
                                        %>
                                        <%= roleName %>
                                        <% if (roleId == 3 || roleId == 5) { %>
                                        <form action="updateRole" method="POST" style="display:inline;">
                                            <input type="hidden" name="accountId" value="<%= accountId %>">
                                            <input type="hidden" name="roleId" value="<%= (roleId == 3 ? 5 : 3) %>">
                                            <button type="submit" class="btn btn-sm btn-warning">Change</button>
                                        </form>
                                        <% } %>
                                    </td>
                                </tr>
                                <% if (roleId == 2 || roleId == 3 || roleId == 5) { %>
                                <tr>
                                    <td style="font-weight: bolder"><label>Theater: </label></td>
                                    <td>
                                        <% 
                                                int theaterId = account.getTheaterID();
                                                String theaterName = "";
                                                if (theaterId == 1) {
                                                    theaterName = "Lotte";
                                                } else if (theaterId == 2) {
                                                    theaterName = "CGV";
                                                } 
                                        %>
                                        <%= theaterName %>
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                            <%}%>      

                        </div>
                    </div>
                </div>  
            </div>
        </section>
    </body>
</html>
