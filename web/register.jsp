<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CineBooking Register</title>
        <style>
            body {
                background-color: #f5f5f5;
                font-family: "Open Sans", sans-serif;
                color: #2b3e51;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            #login-form-wrap {
                background-color: #fff;
                width: 400px;
                border-radius: 8px;
                box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
                padding: 40px;
            }

            h2 {
                font-weight: bold;
                text-align: center;
                text-transform: uppercase;
                margin-bottom: 40px;
                color: #2b3e51;
            }

            input[type="text"],
            input[type="password"] {
                width: calc(100% - 24px); /* Subtract padding and border */
                padding: 12px;
                margin-bottom: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #3ca9e2;
            }

            input[type="submit"] {
                background-color: #3ca9e2;
                border: none;
                color: white;
                padding: 14px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: calc(100% - 24px); /* Subtract padding and border */
            }

            input[type="submit"]:hover {
                background-color: #329dd5;
            }

            .form-footer {
                margin-top: 20px;
                text-align: center;
            }

            .form-footer a {
                color: #3ca9e2;
                text-decoration: none;
            }

            .form-footer a:hover {
                text-decoration: underline;
            }

            .error-message {
                color: red;
                font-size: 0.875rem;
                margin-bottom: 10px;
            }

            .error {
                border-color: red !important;
            }

            #login-with-google {
                background-color: #dd4b39;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
                width: 100%;
                transition: background-color 0.3s ease;
            }

            #login-with-google:hover {
                background-color: #c23321;
            }
        </style>
        <script>
            function validateFullname() {
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

            function validatePassword() {
                var password = document.getElementById("password").value;
                var passwordError = document.getElementById("passwordError");
                var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#\$%\^&\*.,:;]{6,20}$/;
                ;

                if (!passwordRegex.test(password) || password.includes(' ') || password.trim() === "") {
                    passwordError.textContent = "Password must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces.";
                    return false;
                }
                passwordError.textContent = "";
                return true;
            }

            function validateConfirmPassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                if (confirmPassword !== password) {
                    confirmPasswordError.textContent = "Passwords do not match.";
                    return false;
                }
                confirmPasswordError.textContent = "";
                return true;
            }

            function validateForm() {
                var validFullname = validateFullname();
                var validPhone = validatePhone();
                var validEmail = validateEmail();
                var validUsername = validateUsername();
                var validPassword = validatePassword();
                var validConfirmPassword = validateConfirmPassword();
                return validFullname && validPhone && validEmail && validUsername && validPassword && validConfirmPassword;
            }
        </script>
    </head>
    <body>
        <div id="login-form-wrap">
            <h2>CineBooking Register</h2>
            <form id="login-form" action="register" method="post" onsubmit="return validateForm()">
                <div>
                    <label for="fullname">Full Name:</label>
                    <input type="text" id="fullname" name="fullname" value="${param.fullname}" onblur="validateFullname()">
                    <span id="fullnameError" class="error-message">${fullnameError}</span>
                </div>
                <div>
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="${param.phone}" onblur="validatePhone()">
                    <span id="phoneError" class="error-message">${phoneError}</span>
                </div>
                <div>
                    <% 
                        String emailGoogle = (String) request.getAttribute("emailGoogle");
                        if (emailGoogle == null) {
                    %>
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="${param.email}" onblur="validateEmail()">
                    <span id="emailError" class="error-message">${emailError}</span>
                    <c:if test="${existedEmail ne null}">
                        <p style="color: red; font-size: 1.25rem; text-align: center">${existedEmail}</p>
                    </c:if>
                    <%} else {%>
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="<%= request.getAttribute("emailGoogle") %>" onblur="validateEmail()">
                    <span id="emailError" class="error-message">${emailError}</span>
                    <c:if test="${existedEmail ne null}">
                        <p style="color: red; font-size: 1.25rem; text-align: center">${existedEmail}</p>
                    </c:if>
                    <%}%>
                </div>
                <div>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${param.username}" onblur="validateUsername()">
                    <span id="usernameError" class="error-message">${usernameError}</span>
                    <c:if test="${existedUsername ne null}">
                        <p style="color: red; font-size: 1.25rem; text-align: center">${existedUsername}</p>
                    </c:if>
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" onblur="validatePassword()">
                    <span id="passwordError" class="error-message">${passwordError}</span>
                </div>
                <div>
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" onblur="validateConfirmPassword()">
                    <span id="confirmPasswordError" class="error-message">${confirmPasswordError}</span>
                </div>
                <p>
                    <input type="submit" id="register" value="Register">
                </p>
                <c:if test="${registerSuccess ne null}">
                    <p style="color: green; font-size: 1rem; text-align: center">
                        <a href="login.jsp">${registerSuccess}</a>
                    </p>
                </c:if>
                <button id="login-with-google">Sign up with Google</button>
            </form>
            <div class="form-footer">
                <p>Already have an account? <a href="login.jsp">Login Now</a></p>
            </div>
        </div>
    </body>
</html>
