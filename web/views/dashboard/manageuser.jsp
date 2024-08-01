<%-- 
    Document   : manageuser
    Created on : 6 thg 7, 2024, 03:30:09
    Author     : tranh
--%>
<%@page import="java.util.*, java.util.Vector, dal.AccountDAO, model.Account, dal.TheaterDAO, model.Theater"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
        <script>
            function submitForm() {
                document.getElementById('filterForm').submit();
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <!-- Content-->
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">User List</h6>
                            <!-- Search by Username and Role -->
                            <form id="filterForm" class="d-flex" action="/CineBooking/searchAccountAdmin">
                                <input type="text" name="query" id="userSearch" class="form-control form-control-sm ms-2" placeholder="Search by Name" style="width: 200px;">
                                <button class="btn px-2 btn-primary py-0" type="submit"><i class="fas fa-search"></i></button>
                                <select name="role" class="form-control form-control-sm mx-3" style="width: 150px;" onchange="submitForm()">
                                    <option value="">All Roles</option>
                                    <option value="1" <%= "1".equals(request.getParameter("role")) ? "selected" : "" %>>Admin</option>
                                    <option value="2" <%= "2".equals(request.getParameter("role")) ? "selected" : "" %>>Manager</option>
                                    <option value="3" <%= "3".equals(request.getParameter("role")) ? "selected" : "" %>>Ticket_Checked</option>
                                    <option value="4" <%= "4".equals(request.getParameter("role")) ? "selected" : "" %>>Customer</option>
                                    <option value="5" <%= "5".equals(request.getParameter("role")) ? "selected" : "" %>>Ticket_Seller</option>
                                </select>
                                <select name="theater" class="form-control form-control-sm mx-3" style="width: 150px;" onchange="submitForm()">
                                    <option value="">All Theaters</option>
                                    <%
                                        TheaterDAO thd = new TheaterDAO();
                                        Vector<Theater> listTheater = thd.getAllTheaters();
                                        
                                        for(Theater t : listTheater){
                                            int i = t.getId();
                                    %>
                                    <option value="i" <%= "i".equals(request.getParameter("theater")) ? "selected" : "" %>><%= t.getName() %></option>
                                    <%        
                                        }
                                    %>

                                </select>
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="max-height: 720px">
                            <table class="table m-0 table-striped overflow-auto" border="1">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Account ID</th>
                                        <th>Fullname</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Theater</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String searchQuery = request.getParameter("query");
                                        String roleFilter = request.getParameter("role");
                                        String theaterFilter = request.getParameter("theater");
                                        Vector<Account> list;
                                        AccountDAO ad = new AccountDAO();
            
                                        list = ad.searchAccounts(searchQuery, roleFilter, theaterFilter);
            
                                        if (list != null) {

                                            for (int i = list.size() - 1; i >= 0; i--) {
                                                Account a = list.get(i);

                                    %>
                                    <tr>
                                        <td><%= a.getAccount_id() %></td>
                                        <td><%= a.getFullname() %></td>
                                        <td><%= a.getEmail() %></td>
                                        <td>
                                            <%
                                                int roleId = a.getRole_id();
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
                                        </td>
                                        <td>
                                            <% 
                                                int theaterId = a.getTheaterID();
                                                for(Theater t : listTheater){
                                                    if(theaterId == t.getId()){
                                            %>
                                            <%= t.getName()%>
                                            <%
                                                    }
                                                }
                                            %>
                                        </td>
                                        <td>
                                            <a class="btn btn-sm text-primary" href="/CineBooking/views/dashboard/userdetail.jsp?id=<%= a.getAccount_id() %>"><i class="fas fa-info-circle"></i> Detail</a>
                                            <% if (roleId == 4) {%>
                                            <a class="btn btn-sm text-primary" href="/CineBooking/views/dashboard/OrderDetail.jsp?id=<%= a.getAccount_id() %>"><i class="fas fa-info-circle"></i> Order</a>
                                            <%}%>
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
        </section>
    </body>
</html>
