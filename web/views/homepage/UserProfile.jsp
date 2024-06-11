<%-- 
    Document   : Home
    Created on : May 19, 2024, 6:28:04 PM
    Author     : DungTT
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
            .main_1 {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .main-content {
                margin-top: 100px;
                padding-top: 20px;
            }

            .user-profile {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .user-profile-nav h4 {
                font-size: 1.5em;
                margin-bottom: 20px;
            }

            .menu-nav a {
                display: block;
                margin-bottom: 10px;
                color: #333;
                text-decoration: none;
            }

            .menu-nav a:hover {
                color: #007bff;
            }

            .user-profile-info {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .user-profile-info h3 {
                margin-bottom: 20px;
            }

            .edit-form label {
                font-weight: bold;
                margin-top: 10px;
            }

            .edit-form input[type="text"],
            .edit-form input[type="email"],
            .edit-form input[type="password"],
            .edit-form input[type="radio"] {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .edit-form input[type="submit"] {
                margin-top: 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .edit-form input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .d-flex {
                display: flex;
                align-items: center;
            }

            .d-flex input[type="radio"] {
                margin-right: 5px;
            }

            .error {
                color: red;
                font-size: 0.9em;
                margin-top: 5px; /* Adjusted to avoid overlap */
                margin-bottom: 10px;
                display: block; /* Ensure it displays as block to push next label down */
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <div style="background-color: black" class="main_1 clearfix position-fixed top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main-content">
                <c:if test="${sessionScope.user != null}">
                    <div class="user-profile">
                        <div class="container">
                            <div class="row justify-content-between user-profile-container">
                                <div class="col-lg-3 user-profile-nav">
                                    <h4>My Profile</h4>
                                    <div class="menu-nav">
                                        <a href="changepassword" class="menu-nav-item user-info">Change Password</a>
                                        <a href="#" class="menu-nav-item buy-history">Order History</a>
                                    </div>
                                </div>

                                <!-- User profile information -->
                                <div class="col-sm-8 user-profile-info">
                                    <div class="user-profile-desc">
                                        <h3 class="text-center">My Information</h3>
                                        <form id="myForm" action="customerController" method="get" class="edit-form" onsubmit="return validateForm()">
                                            <input type="hidden" name="service" value="updateProfile" />
                                            <input type="hidden" name="userID" value="${sessionScope.user.account_id}" />
                                            <div class="col-sm-7">
                                                <label for="fullname">Full Name</label>
                                                <input type="text" name="fullname" id="fullname" value="${account.fullname}" class="form-control" onblur="validateFullName()" />
                                                <span class="error" id="fullnameError"></span>

                                                <label for="phone">Phone number</label>
                                                <input type="text" name="phone" id="phone" value="${account.phone}" class="form-control" onblur="validatePhone()" />
                                                <span class="error" id="phoneError"></span>

                                                <label for="email">Email</label>
                                                <input type="text" name="email" id="email" value="${account.email}" class="form-control" onblur="validateEmail()" />
                                                <span class="error" id="emailError"></span>

                                                <label for="username">Username</label>
                                                <input type="text" name="username" id="username" value="${account.username}" class="form-control" onblur="validateUsername()" />
                                                <span class="error" id="usernameError"></span>
                                            </div>
                                            <input type="submit" value="Update my profile" />
                                        </form>

                                        <!-- Display success message -->
                                        <c:if test="${not empty message}">
                                            <div class="alert alert-success">
                                                ${message}
                                            </div>
                                        </c:if>
        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        </div>
        <script>
            function validateFullName() {
                var fullname = document.getElementById("fullname").value.trim();
                var fullnameError = document.getElementById("fullnameError");
                var fullnameRegex = /^[\p{L}\s]{6,30}$/u;

                if (!fullnameRegex.test(fullname) || fullname === "") {
                    fullnameError.textContent = "Fullname must be 6-30 characters long, only contain letters and spaces.";
                    return false;
                }
                fullnameError.textContent = "";
                return true;
            }

            function validatePhone() {
                var phone = document.getElementById("phone").value;
                var phoneError = document.getElementById("phoneError");
                var phoneRegex = /^(09|03|07|08)\d{8,9}$/;
                if (!phoneRegex.test(phone)) {
                    phoneError.textContent = "Valid phone number is required (must start with 09, 03, 07, or 08 and be 10-11 digits long).";
                    return false;
                }
                phoneError.textContent = "";
                return true;
            }

            function validateEmail() {
                var email = document.getElementById("email").value;
                var emailError = document.getElementById("emailError");
                var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
                if (!emailRegex.test(email)) {
                    emailError.textContent = "Valid email is required.";
                    return false;
                }
                emailError.textContent = "";
                return true;
            }

            function validateUsername() {
                var username = document.getElementById("username").value;
                var usernameError = document.getElementById("usernameError");
                var usernameRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/;
                if (!usernameRegex.test(username)) {
                    usernameError.textContent = "Username must be 6-20 characters long, contain both letters and numbers, and not contain any spaces.";
                    return false;
                }
                usernameError.textContent = "";
                return true;
            }

            function validateForm() {
                const isFullNameValid = validateFullName();
                const isPhoneValid = validatePhone();
                const isEmailValid = validateEmail();
                const isUsernameValid = validateUsername();
                return isFullNameValid && isPhoneValid && isEmailValid && isUsernameValid;
            }

            document.getElementById('fullname').addEventListener('blur', validateFullName);
            document.getElementById('phone').addEventListener('blur', validatePhone);
            document.getElementById('email').addEventListener('blur', validateEmail);
            document.getElementById('username').addEventListener('blur', validateUsername);
        </script>
    </body>
</html>
