<%-- 
    Document   : adduser
    Created on : 6 thg 7, 2024, 03:47:52
    Author     : tranh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, dal.AccountDAO, model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>
        <style>
            .password-container {
                display: flex;
                align-items: center;
            }
            .toggle-password {
                margin-left: 10px;
                cursor: pointer;
            }
            .error-message {
                display: block;
                color: red;
                font-size: smaller;
            }
        </style>
        <script>
            function validateUsername() {
                let username = document.forms["addUserForm"]["username"].value;
                let usernamePattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,20}$/;
                if (!username.match(usernamePattern)) {
                    document.getElementById("errorUsername").textContent = "Username must be 8-20 characters long, contain both letters and numbers, and not contain any spaces";
                    return false;
                } else {
                    document.getElementById("errorUsername").textContent = "";
                    return true;
                }
            }

            function validatePassword() {
                let password = document.forms["addUserForm"]["password"].value;
                let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/;
                if (!password.match(passwordPattern)) {
                    document.getElementById("errorPassword").textContent = "Password must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces.";
                    return false;
                } else {
                    document.getElementById("errorPassword").textContent = "";
                    return true;
                }
            }

            function validateRePassword() {
                let password = document.forms["addUserForm"]["password"].value;
                let rePassword = document.forms["addUserForm"]["repassword"].value;
                if (password !== rePassword) {
                    document.getElementById("errorRePassword").textContent = "Passwords do not match";
                    return false;
                } else {
                    document.getElementById("errorRePassword").textContent = "";
                    return true;
                }
            }
            
            function validateSelection() {
                let role = document.forms["addUserForm"]["role"].value;
                let typeErr = document.getElementById("errorRole");
                if (role === "") {
                    typeErr.textContent = "Please choose a staff position.";
                    return false;
                } else {
                    typeErr.textContent = "";
                    return true;
                }
            }

            function validateFullname() {
                let fullname = document.forms["addUserForm"]["fullname"].value;
                let fullnamePattern = /^(?!\s*$)[a-zA-Z\s]{8,30}$/;
                if (!fullname.match(fullnamePattern)) {
                    document.getElementById("errorFullname").textContent = "Fullname must be 8-30 characters long, only contain letters and spaces, and cannot be all spaces";
                    return false;
                } else {
                    document.getElementById("errorFullname").textContent = "";
                    return true;
                }
            }

            function validatePhone() {
                let phone = document.forms["addUserForm"]["phone"].value;
                let phonePattern = /^\d{10,15}$/;
                if (!phone.match(phonePattern)) {
                    document.getElementById("errorPhone").textContent = "Phone must be a string of 10-15 digits";
                    return false;
                } else {
                    document.getElementById("errorPhone").textContent = "";
                    return true;
                }
            }

            function validateEmail() {
                let email = document.forms["addUserForm"]["email"].value;
                let emailPattern = /^[^\s]+@(gmail\.com|fpt\.edu\.vn)$/;
                if (!email.match(emailPattern)) {
                    document.getElementById("errorEmail").textContent = "Email must be in the format of 'example@gmail.com' or 'example@fpt.edu.vn' with no spaces";
                    return false;
                } else {
                    document.getElementById("errorEmail").textContent = "";
                    return true;
                }
            }

            function validateForm() {
                let isValid = true;

                if (!validateUsername()) isValid = false;
                if (!validatePassword()) isValid = false;
                if (!validateRePassword()) isValid = false;
                if (!validateFullname()) isValid = false;
                if (!validatePhone()) isValid = false;
                if (!validateEmail()) isValid = false;
                if (!validateSelection()) isValid = false;

                return isValid;
            }

            function togglePasswordVisibility(id) {
                let passwordField = document.getElementById(id);
                let toggleIcon = document.getElementById(id + "-toggle");
                if (passwordField.type === "password") {
                    passwordField.type = "text";
                    toggleIcon.classList.remove("fa-eye");
                    toggleIcon.classList.add("fa-eye-slash");
                } else {
                    passwordField.type = "password";
                    toggleIcon.classList.remove("fa-eye-slash");
                    toggleIcon.classList.add("fa-eye");
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
        <section class="container-fluid">
            <!-- Content-->
            <div class="col-12">
                <div class="card mb-4 h-100">
                    <div class="card-body">
                        <div class="card-header justify-content-between align-items-center d-flex">
                            <h6 class="card-title m-0">Add Staff</h6>
                            <a class="btn btn-sm btn-primary" href="managestaff.jsp"><i class="fas fa-arrow-left me-1"></i> Back</a>
                        </div>
                        <form name="addUserForm" class="mt-4" action="adduser" method="post" onsubmit="return validateForm()">
                            <table class="table">
                                <%
                                    Account as = (Account) session.getAttribute("user");
                                    int theaterID = as.getTheaterID();
                                %>
                                <input type="hidden" name="theaterID" value=<%= theaterID %>>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Username: </label></td>
                                    <td>
                                        <input class="form-control" type="text" name="username" placeholder="Username" onblur="validateUsername()" required>
                                        <p id="errorUsername" class="error-message"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Password: </label></td>
                                    <td>
                                        <div class="password-container">
                                            <input id="password" class="form-control" type="password" name="password" placeholder="Password" onblur="validatePassword()" required>
                                            <i id="password-toggle" class="fas fa-eye toggle-password" onclick="togglePasswordVisibility('password')"></i>
                                        </div>
                                        <p id="errorPassword" class="error-message"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Re-enter Password: </label></td>
                                    <td>
                                        <div class="password-container">
                                            <input id="repassword" class="form-control" type="password" name="repassword" placeholder="Re-enter Password" onblur="validateRePassword()" required>
                                            <i id="repassword-toggle" class="fas fa-eye toggle-password" onclick="togglePasswordVisibility('repassword')"></i>
                                        </div>
                                        <p id="errorRePassword" class="error-message"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Position: </label></td>
                                    <td>
                                        <select id="role" name="role" class="form-control text-center" style="width: auto;" onchange="validateSelection()">
                                            <option value="">Choose Staff's Position</option>
                                            <option value="3">Ticket_Checked</option>
                                            <option value="5">Ticket_Seller</option>
                                        </select>
                                        <p id="errorRole" class="error-message"></p>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Fullname: </label></td>
                                    <td>
                                        <input class="form-control" type="text" name="fullname" placeholder="Fullname" onblur="validateFullname()" required>
                                        <p id="errorFullname" class="error-message"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Email: </label></td>
                                    <td>
                                        <input class="form-control" type="text" name="email" placeholder="Email" onblur="validateEmail()" required>
                                        <p id="errorEmail" class="error-message"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder"><label class="form-label">Phone: </label></td>
                                    <td>
                                        <input class="form-control" type="text" name="phone" placeholder="Phone" onblur="validatePhone()" required>
                                        <p id="errorPhone" class="error-message"></p>
                                    </td>
                                </tr>
                            </table>
                            <p id="successMessage" style="color: green; font-size: smaller;"><%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %></p>
                            <!-- Submit button for the form -->
                            <div class="container-fluid d-flex justify-content-center">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                </div>  
            </div>
            <!-- / Content-->
        </section>
    </body>
</html>
