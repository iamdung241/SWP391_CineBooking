<%-- 
    Document   : changepassword
    Created on : Jun 15, 2024, 09:24:00 PM
    Author     : Tran Anh Vu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>My Profile</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/font-awesome.min.css" rel="stylesheet">
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                font-family: 'Overpass', sans-serif;
                background-color: #000;
                color: black;
            }

            .main_1 {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
                background-color: #000;
                box-shadow: 0 2px 5px rgba(255, 255, 255, 0.1);
            }

            .main-content {
                margin-top: 100px;
                padding: 20px;
            }

            .user-profile {
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
                color: black;
            }

            .user-profile-nav h4 {
                font-size: 1.75em;
                margin-bottom: 20px;
                color: black;
            }

            .menu-nav a {
                display: block;
                margin-bottom: 10px;
                color: black;
                text-decoration: none;
                font-size: 1.1em;
                transition: color 0.3s;
            }

            .menu-nav a:hover {
                color: #007bff;
                text-decoration: underline;
            }

            .user-profile-info {
                border-radius: 12px;
                box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
                color: black;
            }

            .user-profile-info h3 {
                margin-bottom: 20px;
                font-size: 2em;
                color: black;
            }

            .edit-form label {
                font-weight: bold;
                margin-top: 10px;
                font-size: 1.1em;
                color: black;
            }

            .edit-form input[type="text"],
            .edit-form input[type="email"],
            .edit-form input[type="password"] {
                margin-bottom: 15px;
                padding: 12px;
                border: 1px solid #555;
                border-radius: 8px;
                width: 100%;
                font-size: 1em;
                color: black;
                transition: border-color 0.3s;
            }

            .edit-form input[type="text"]:focus,
            .edit-form input[type="email"]:focus,
            .edit-form input[type="password"]:focus {
                border-color: #007bff;
            }

            .edit-form input[type="submit"] {
                margin-top: 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 12px 20px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 1.1em;
                transition: background-color 0.3s, transform 0.2s;
            }

            .edit-form input[type="submit"]:hover {
                background-color: #0056b3;
                transform: scale(1.05);
            }

            .error {
                color: #ff6666;
                font-size: 0.9em;
                margin-top: 5px;
                margin-bottom: 10px;
                display: block;
            }

            .alert {
                margin-top: 20px;
                padding: 15px;
                background-color: #444;
                color: #d4edda;
                border: 1px solid #c3e6cb;
                border-radius: 5px;
            }

            .container {
                max-width: 1200px;
            }

            .icon {
                font-size: 1.5em;
                margin-right: 10px;
                color: #007bff;
            }

            .header {
                background-image: linear-gradient(to right, #000, #333);
                color: white;

                box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            }

            .header h1 {
                margin: 0;
                font-size: 2.5em;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="header main_1 clearfix">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main-content container">
                <c:if test="${sessionScope.user != null}">
                    <div class="user-profile">
                        <div class="row justify-content-between user-profile-container">
                            <div class="col-lg-3 user-profile-nav">
                                <h4><i class="fa fa-user icon"></i>My Profile</h4>
                                <div class="menu-nav">
                                    <a href="changepassword.jsp?userID=${sessionScope.user.account_id}" class="menu-nav-item user-info"><i class="fa fa-lock icon"></i>Change Password</a>
                                    <a href="OrderHistory?userID=${sessionScope.user.account_id}" class="menu-nav-item buy-history"><i class="fa fa-history icon"></i>Order History</a>
                                </div>
                            </div>
                            <div class="col-sm-8 user-profile-info">
                                <div class="user-profile-desc">
                                    <h3 class="text-center"><i class="fa fa-info-circle icon"></i>Change Password</h3>
                                    <form id="myForm" class="edit-form" action="changepassword" method="POST">
                                        <input type="hidden" name="userID" value="<%= request.getParameter("userID") %>">
                                        <div class="form-group">
                                            <label>Old Password:</label>
                                            <% 
                                                String errorOld = (String) request.getAttribute("errorOld");
                                                if (errorOld != null) {
                                            %>
                                            <input type="password" name="oldPassword" placeholder="Enter old password" required>
                                            <p style="color: red; font-size: smaller;"><%= errorOld %></p>
                                            <%} else {%>
                                            <input type="password" name="oldPassword" placeholder="Enter old password" value="<%= request.getAttribute("oldPassword") != null ? request.getAttribute("oldPassword") : "" %>" required>
                                            <%}%>
                                        </div>

                                        <div class="form-group">
                                            <label>New Password:</label>
                                            <% 
                                                String errorNew = (String) request.getAttribute("errorNew");
                                                if (errorNew != null) {
                                            %>
                                            <input type="password" name="newPassword" placeholder="Enter new password" required>
                                            <p style="color: red; font-size: smaller;"><%= errorNew %></p>
                                            <%} else {%>
                                            <input type="password" name="newPassword" placeholder="Enter new password" value="<%= request.getAttribute("newPassword") != null ? request.getAttribute("newPassword") : "" %>" required>
                                            <%}%>
                                        </div>

                                        <div class="form-group">
                                            <label>Confirm Password:</label> 
                                            <% 
                                                String errorConfirm = (String) request.getAttribute("errorConfirm");
                                                if (errorConfirm != null) {
                                            %>
                                            <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
                                            <p style="color: red; font-size: smaller;"><%= errorConfirm %></p>
                                            <%} else {%>
                                            <input type="password" name="confirmPassword" placeholder="Confirm new password" value="<%= request.getAttribute("confirmPassword") != null ? request.getAttribute("confirmPassword") : "" %>" required>
                                            <%}%>
                                        </div>

                                        <% 
                                            String successMessage = (String) request.getAttribute("successMessage");
                                            if (successMessage != null) {
                                        %>
                                        <p style="color: green; font-size: smaller;"><%= successMessage %></p>
                                        <a href="login.jsp" id="back">Back to login</a>
                                        <%} else {%>
                                        <input type="submit" value="Change Password"></input>
                                        <a href="customerController?userID=<%= request.getParameter("userID")%>" id="back">Back</a>
                                        <%}%>
                                    </form>
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-success">
                                            ${message}
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        </div>
    </body>
</html>