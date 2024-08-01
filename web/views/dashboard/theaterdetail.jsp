<%-- 
Document   : userdetail
Created on : 6 thg 7, 2024, 03:51:47
Author     : tranh
--%>
<%@page import="java.util.*, dal.AccountDAO, model.Account, dal.TheaterDAO, model.Theater"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theater Detail Page</title>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <!-- Content-->
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-body">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">Theater Detail</h6>
                                <a class="btn btn-sm btn-primary" href="managetheater.jsp"><i class="align-bottom"></i>Back</a>
                            </div>
                            <div class="container">

                            <%
                                String id = request.getParameter("id");
                                int theaterId = 0;
                                if (id != null) {
                                    theaterId = Integer.parseInt(id);
                                }

                                TheaterDAO thd = new TheaterDAO();
                                Theater theater = thd.getTheaterByTheaterID(theaterId);
                                AccountDAO ad = new AccountDAO();
                                
                                // Fetch manager
                                Account manager = ad.getAccountByTheaterIdAndRoleId(theaterId, 2);

                                // Fetch staff
                                Vector<Account> staffList = ad.getStaffByTheaterId(theaterId);
                            %>

                            <% if (theater != null) { %>
                            <table class="table">
                                <tr>
                                    <td style="font-weight: bolder"><label>Theater ID: </label></td>
                                    <td><%= theater.getId() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Theater Name: </label></td>
                                    <td><%= theater.getName() %></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label>Manager Name: </label></td>
                                    <td><%= manager != null ? manager.getFullname() : "No manager assigned" %></td>
                                </tr>
                            </table>

                            <h6>Staff List</h6>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Account ID</th>
                                        <th>Full Name</th>
                                        <th>Username</th>
                                        <th>Role</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Account staff : staffList) { %>
                                    <tr>
                                        <td><%= staff.getAccount_id() %></td>
                                        <td><%= staff.getFullname() %></td>
                                        <td><%= staff.getUsername() %></td>
                                        <td>
                                            <%
                                                String roleName = "";
                                                if (staff.getRole_id() == 3) {
                                                    roleName = "Ticket_Checked";
                                                } else if (staff.getRole_id() == 5) {
                                                    roleName = "Ticket_Seller";
                                                }
                                            %>
                                            <%= roleName %>
                                        </td>
                                        <td><%= staff.getEmail() %></td>
                                        <td><%= staff.getPhone() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <% } %>      

                        </div>
                    </div>
                </div>  
            </div>
        </section>
    </body>
</html>
