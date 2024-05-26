<%-- 
    Document   : accountDetail
    Created on : May 24, 2024, 7:48:04 AM
    Author     : VuTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Setting the content type and character encoding for the page -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Detail</title>
    </head>
    <body>
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
        <!-- Display account details if the account is not null -->
        <h1>Account Detail</h1>
        <table border="1">
            <tr>
                <!-- Display account ID -->
                <th>Account ID</th>
                <td><%= account.getAccount_id() %></td>
            </tr>
            <tr>
                <!-- Display fullname -->
                <th>Fullname</th>
                <td><%= account.getFullname() %></td>
            </tr>
            <tr>
                <!-- Display phone number -->
                <th>Phone</th>
                <td><%= account.getPhone() %></td>
            </tr>
            <tr>
                <!-- Display email -->
                <th>Email</th>
                <td><%= account.getEmail() %></td>
            </tr>
            <tr>
                <!-- Display username -->
                <th>Username</th>
                <td><%= account.getUsername() %></td>
            </tr>
            <tr>
                <!-- Display role and allow role update if applicable -->
                <th>Role</th>
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

                    <% if (roleId == 2 || roleId == 3) { %>
                    <!-- Form to update the role if the role is Staff or Customer -->
                    <form action="updateRole" method="post">
                        <input type="hidden" name="accountId" value="<%= account.getAccount_id() %>">
                        <select name="roleId">
                            <option value="2" <%= roleId == 2 ? "selected" : "" %>>Staff</option>
                            <option value="3" <%= roleId == 3 ? "selected" : "" %>>Customer</option>
                        </select>
                        <input type="submit" value="Update Role">
                    </form>
                    <% } else { %>
                    <!-- Display role name if the role is Admin -->
                    <%= roleName %>
                    <% } %>
                </td>
            </tr>
        </table>
        <%}%>
        <!-- Link to go back to manage users page -->
        <a href="manageuser.jsp">Back</a>
    </body>
</html>
