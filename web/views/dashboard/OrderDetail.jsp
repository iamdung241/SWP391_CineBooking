<%-- 
    Document   : OrderDetail
    Created on : Jul 9, 2024, 10:35:51 AM
    Author     : Tran Anh Vu
--%>

<%@page import="java.util.*, dal.TicketDAO, model.Ticket, model.Seat, model.Concession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
        <section class="container-fluid">
            <!-- Content-->
            <div class="col-12">
                <div class="card mb-4 h-100">
                    <div class="card-body">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Order History</h6>
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

                                TicketDAO td = new TicketDAO();
                                List<Ticket> tickets = td.getTicketsByUserId(accountId);
                            %>

                            <% if (tickets != null) { %>
                                <% for (Ticket ticket : tickets) { %>
                                    <div class="card mb-5 border-danger">
                                        <div class="card-body">
                                            <h5 class="card-title">Ticket Code: <%= ticket.getCode() %></h5>
                                            <p class="card-text"><strong>Movie:</strong> <%= ticket.getMovieName() %></p>
                                            <p class="card-text"><strong>Showtime:</strong> <%= ticket.getShowtime().getShowtiming() %>:00</p>
                                            <p class="card-text"><strong>Room:</strong> <%= ticket.getShowtime().getRoom_name() %></p>
                                            <p class="card-text"><strong>Date:</strong> <%= ticket.getShowtime().getDate() %></p>
                                            <p class="card-text"><strong>Total Price:</strong> <%= ticket.getTotalprice() %> VND</p>
                                            <p class="card-text"><strong>Status:</strong> <%= ticket.getStatus() %></p>
                                            <p class="card-text"><strong>Date Booked:</strong> <%= ticket.getDate_book() %></p>
                                            <p class="card-text"><strong>Seats:</strong>
                                                <%
                                                    for (Seat s : ticket.getSeat()) {
                                                        out.print(s.getSeat_name() + " ");
                                                    }
                                                %>
                                            </p>
                                            <%
                                                if (ticket.getCombo() != null) {
                                            %>
                                                <p class="card-text"><strong>Combos:</strong>
                                                    <%
                                                        for (Concession tc : ticket.getCombo()) {
                                                            out.print(tc.getConcessions_name() + "/SL: " + tc.getQuantity() + " <br>");
                                                        }
                                                    %>
                                                </p>        
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                <% } %>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>  
        </section>
    </body>
</html>
