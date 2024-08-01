<%-- 
    Document   : managetheater
    Created on : 6 thg 7, 2024, 03:30:09
    Author     : tranh
--%>
<%@page import="java.util.*, dal.AccountDAO, model.Account, dal.TheaterDAO, model.Theater"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Theaters</title>
        <script>
            function submitForm() {
                document.getElementById('filterForm').submit();
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <div class="col-12">
                    <div class="card mb-4 h-100">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Theater List</h6>
                            <form id="filterForm" class="d-flex" action="/CineBooking/searchTheater" method="get">
                                <input type="text" name="query" id="userSearch" class="form-control form-control-sm ms-2" placeholder="Search by Manager's Name" style="width: 200px;">
                                <button class="btn px-2 btn-primary py-0" type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="max-height: 720px">
                                <table class="table m-0 table-striped overflow-auto" border="1">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Theater ID</th>
                                            <th>Theater Name</th>
                                            <th>Manager's Name</th>
                                            <th>Number of Staff</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        // Retrieve search parameters
                                        String searchQuery = request.getParameter("query");

                                        TheaterDAO theaterDAO = new TheaterDAO();
                                        AccountDAO accountDAO = new AccountDAO();
                                        Vector<Theater> theaters;
                                        Vector<Account> managers = new Vector<>();
                                        Vector<Integer> staffCounts = new Vector<>();

                                        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                                            theaters = theaterDAO.searchTheatersByManagerName(searchQuery);
                                        } else {
                                            theaters = theaterDAO.getAllTheaters();
                                        }

                                        for (Theater theater : theaters) {
                                            Account manager = accountDAO.getManagerByTheaterID(theater.getId());
                                            int staffCount = accountDAO.getStaffCountByTheaterID(theater.getId());
                                            managers.add(manager);
                                            staffCounts.add(staffCount);
                                        }

                                        for (int i = theaters.size() - 1; i >= 1; i--) {
                                            Theater theater = theaters.get(i);
                                            Account manager = managers.get(i);
                                            int staffCount = staffCounts.get(i);
                                    %>
                                    <tr>
                                        <td><%= theater.getId() %></td>
                                        <td><%= theater.getName() %></td>
                                        <td><%= manager != null ? manager.getFullname() : "No Manager" %></td>
                                        <td><%= staffCount %></td>
                                        <td><a class="btn btn-sm text-primary" href="/CineBooking/views/dashboard/theaterdetail.jsp?id=<%= theater.getId() %>"><i class="fas fa-info-circle"></i> Detail</a>              </td>
                                    </tr>
                                        
                                    <%
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
