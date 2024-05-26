<%-- 
    Document   : adduser
    Created on : May 24, 2024, 8:39:47 AM
    Author     : VuTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Setting the content type and character encoding for the page -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        <!-- Heading for the page -->
        <h1>Add Staff</h1>

        <% 
            // Check if there's an error message set in the request and display it
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <!-- Display the error message in red if it exists -->
        <p style="color: red;"><%= errorMessage %></p>
        <% } %>

        <!-- Form for adding a new user, posting to "adduser" -->
        <form action="adduser" method="post">
            <table border="1">
                <thead>
                    <tr>
                        <th></th>
                        <th>Information</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <!-- Input field for username -->
                        <td><label>Username <span>*</span></label></td>
                        <td><input type="text" name="username" placeholder="Username" required></td>
                    </tr>
                    <tr>
                        <!-- Input field for password -->
                        <td><label>Passwords <span>*</span></label></td>
                        <td><input type="password" name="password" placeholder="Password" required></td>
                    </tr>
                    <tr>
                        <!-- Input field for re-entering password -->
                        <td><label>Re-enter Password <span>*</span></label></td>
                        <td><input type="password" name="repassword" placeholder="Re-enter Password" required></td>
                    </tr>
                    <tr>
                        <!-- Input field for fullname -->
                        <td><label>Fullname <span>*</span></label></td>
                        <td><input type="text" name="fullname" placeholder="Fullname" required></td>
                    </tr>
                    <tr>
                        <!-- Input field for phone number -->
                        <td><label>Phone <span>*</span></label></td>
                        <td><input type="text" name="phone" placeholder="Phone" required></td>
                    </tr>
                    <tr>
                        <!-- Input field for email -->
                        <td><label>Email <span>*</span></label></td>
                        <td><input type="text" name="email" placeholder="Email" required></td>
                    </tr>
                </tbody>
            </table>
            <div>
                <!-- Submit button for the form -->
                <button type="submit">Add</button>
                <!-- Hidden input to specify the service action -->
                <input type="hidden" name="service" value="add">
            </div>

            <% 
            // Check if there's a success message set in the request and display it
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
            %>
            <!-- Display the success message in green if it exists -->
            <p style="color: green;"><%= successMessage %></p>
            <% } %>
        </form>
        <!-- Link to go back to manage users page -->
        <div>
            <a href="manageuser.jsp">Back</a>
        </div>
    </body>
</html>
