<%-- 
    Document   : resetpassword
    Created on : Jun 24, 2024, 9:54:42 PM
    Author     : Tran Anh Vu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <style>
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            #form-wrap {
                background-color: #fff;
                width: 350px;
                border-radius: 8px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                padding: 40px;
                text-align: center;
            }

            h2 {
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
            }

            label {
                display: block;
                text-align: left;
                font-size: 16px; /* Increased font size */
                color: #333;
                margin-bottom: 5px;
            }

            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 8px 0 16px 0; /* Adjusted margin for better spacing */
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
                width: 100%;
                margin-top: 20px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            #create-account-wrap {
                margin-top: 20px;
                font-size: 14px;
                color: #666;
            }

            #create-account-wrap a {
                color: #007bff;
                text-decoration: none;
            }

            #create-account-wrap a:hover {
                text-decoration: underline;
            }

            .error-message {
                color: red;
                margin-top: 10px;
            }

            #back {
                display: block;
                margin-top: 10px;
                color: #007bff;
                text-decoration: none;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div id="form-wrap">
            <h2>Reset Password</h2>
            <form action="resetpassword" method="POST">
                <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
                <div>
                    <label>New Password:</label>
                    <input type="password" name="newPassword" placeholder="Enter new password" required>
                </div>
                <div>
                    <label>Confirm Password:</label>
                    <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
                </div>
                <% 
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                <p class="error-message"><%= errorMessage %></p>
                <%}%>
                <% 
                    String successMessage = (String) request.getAttribute("successMessage");
                    if (successMessage != null) {
                %>
                <p class="success-message" style="color: green;"><%= successMessage %></p>
                <%}%>
                <input type="submit" value="Reset Password"></input>
                <a href="forgotpassword.jsp" id="back">Back</a>
            </form>
        </div>
    </body>
</html>
