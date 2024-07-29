<%-- 
    Document   : addExcel
    Created on : Jul 16, 2024, 5:07:10 PM
    Author     : Tran Anh Vu
--%>

<%@page import="java.util.*, dal.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
        <style>
            .text-danger {
                background-color: #ffdddd;
            }
            .db-error {
                background-color: #ffeeaa;
            }
            .error-message {
                color: red;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
        <section class="container-fluid">
            <div class="col-12">
                <div class="card mb-4 h-100">
                    <div class="card-header justify-content-between align-items-center d-flex">
                        <h6 class="card-title m-0">Add User</h6>
                        <div>
                            <input type="file" class="form-control" accept=".xlsx" id="fileExcel" style="display: inline-block; width: auto; margin-right: 10px;" />
                            <button type="button" class="btn btn-primary" onclick="addExcel()">Upload</button>
                        </div>
                        <a class="btn btn-sm btn-primary" href="managestaff.jsp"><i class="fas fa-arrow-left me-1"></i> Back</a>
                    </div>
                    <div class="card-body">
                        <div id="errorMessage" class="error-message"></div>
                        <div id="tableContainer" class="table-responsive" style="max-height: 550px; display: none;">
                            <table class="table m-0 table-striped overflow-auto" border="1">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Fullname</th>
                                        <th>Phone</th>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="tablebody">
                                </tbody>
                            </table> 
                        </div>
                    </div>
                </div>  
            </div>
        </section>
        <script src="https://unpkg.com/read-excel-file@5.x/bundle/read-excel-file.min.js"></script>
        <script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            async function addExcel() {
                let input = document.getElementById('fileExcel');
                let errorMessage = document.getElementById('errorMessage');
                let tableContainer = document.getElementById('tableContainer');
                let tablebody = document.getElementById('tablebody');

                errorMessage.textContent = ''; // Clear any previous error message
                tablebody.innerHTML = ''; // Clear the table body

                await readXlsxFile(input.files[0]).then((rows) => {
                    if (rows[0].length !== 6 || rows[0][0] !== 'Fullname' || rows[0][1] !== 'Phone' || rows[0][2] !== 'Email' || rows[0][3] !== 'Username' || rows[0][4] !== 'Password' || rows[0][5] !== 'Role') {
                        errorMessage.textContent = 'Excel file wrong format. The file must only have 6 columns and each column must have header as this format: Fullname, Phone, Email, Username, Password, Role. Please fix and upload again.';
                        input.value = '';
                        return;
                    }
                    
                    let hasErrors = false; // Flag to track errors
                    
                    rows.forEach((cell, index) => {
                        if (index > 0) { // Skip the header row
                            const rowHasErrors = loadTable(cell[0], cell[1], cell[2], cell[3], cell[4], cell[5]);
                            if (rowHasErrors) {
                                hasErrors = true;
                            }
                        }
                    });

                    if (hasErrors) {
                        errorMessage.textContent = 'There are errors in the uploaded data. Please correct them before proceeding.';
                    }

                    tableContainer.style.display = 'block'; // Always show the table if the file format is correct
                }).catch((error) => {
                    errorMessage.textContent = 'Error reading Excel file: ' + error.message;
                });
            }

            function loadTable(fullname, phone, email, username, password, role) {
                let tablebody = document.getElementById('tablebody');
                let tr = document.createElement('tr');
                let rowHasErrors = false; // Flag to track errors in this row

                let tdFullname = document.createElement('td');
                tdFullname.innerHTML = fullname;
                if (!fullname || !/^(?!\s*$)[a-zA-Z\s]{8,30}$/.test(fullname)) {
                    tdFullname.className = 'fullname text-danger';
                    tdFullname.title = 'Fullname must be 8-30 characters long, only contain letters and spaces, and cannot be all spaces or null';
                    rowHasErrors = true;
                } else {
                    tdFullname.className = 'fullname';
                }

                let tdPhone = document.createElement('td');
                tdPhone.innerHTML = phone;
                if (!phone || !/^\d{10,15}$/.test(phone)) {
                    tdPhone.className = 'phone text-danger';
                    tdPhone.title = 'Phone must be a string of 10-15 digits and cannot be null';
                    rowHasErrors = true;
                } else {
                    tdPhone.className = 'phone';
                }

                let tdEmail = document.createElement('td');
                tdEmail.innerHTML = email;
                if (!email || !/^[^\s]+@(gmail\.com|fpt\.edu\.vn)$/.test(email)) {
                    tdEmail.className = 'email text-danger';
                    tdEmail.title = 'Email must be in the format of "example@gmail.com" or "example@fpt.edu.vn" with no spaces and cannot be null';
                    rowHasErrors = true;
                } else {
                    tdEmail.className = 'email';
                }

                let tdUsername = document.createElement('td');
                tdUsername.innerHTML = username;
                if (!username || !/^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,20}$/.test(username)) {
                    tdUsername.className = 'username text-danger';
                    tdUsername.title = 'Username must be 8-20 characters long, contain both letters and numbers, and not contain any spaces or null';
                    rowHasErrors = true;
                } else {
                    tdUsername.className = 'username';
                }

                let tdPassword = document.createElement('td');
                tdPassword.innerHTML = password;
                if (!password || !/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(password)) {
                    tdPassword.className = 'password text-danger';
                    tdPassword.title = 'Password must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces or null';
                    rowHasErrors = true;
                } else {
                    tdPassword.className = 'password';
                }

                let tdRole = document.createElement('td');
                tdRole.innerHTML = role;
                if (!role || !/^(Ticket_Checked|Ticket_Seller)$/.test(role)) {
                    tdRole.className = 'role text-danger';
                    tdRole.title = 'Role must be either "Ticket_Checked" or "Ticket_Seller"';
                    rowHasErrors = true;
                } else {
                    tdRole.className = 'role';
                }

                let tdAction = document.createElement('td');
                let deleteBtn = document.createElement('button');
                deleteBtn.addEventListener('click', function () {
                    tablebody.removeChild(this.parentNode.parentNode);
                });
                deleteBtn.textContent = 'Delete';
                deleteBtn.className = 'btn btn-sm text-primary';

                let addBtn = document.createElement('button');
                addBtn.textContent = 'Add';
                addBtn.className = 'btn btn-sm text-primary';
                addBtn.addEventListener('click', function () {
                    addUser(this);
                });

                tdAction.appendChild(deleteBtn);
                tdAction.appendChild(addBtn);

                tr.appendChild(tdFullname);
                tr.appendChild(tdPhone);
                tr.appendChild(tdEmail);
                tr.appendChild(tdUsername);
                tr.appendChild(tdPassword);
                tr.appendChild(tdRole);
                tr.appendChild(tdAction);
                tablebody.appendChild(tr);

                // Check existence in database
                checkExistence(tr, username, phone, email, tdFullname, tdPhone, tdEmail, tdUsername, tdRole);
                
                return rowHasErrors; // Return whether this row has errors
            }

            function checkExistence(row, username, phone, email, fullnameTd, phoneTd, emailTd, usernameTd, roleTd) {
                $.ajax({
                    url: 'checkExistence',
                    type: 'POST',
                    data: {username: username, phone: phone, email: email},
                    success: function (data) {
                        let hasDbErrors = false;
                        if (!fullnameTd.classList.contains('text-danger') && data.usernameExists) {
                            usernameTd.classList.add('db-error');
                            usernameTd.title = 'Username already exists';
                            hasDbErrors = true;
                        }
                        if (!phoneTd.classList.contains('text-danger') && data.phoneExists) {
                            phoneTd.classList.add('db-error');
                            phoneTd.title = 'Phone number already exists';
                            hasDbErrors = true;
                        }
                        if (!emailTd.classList.contains('text-danger') && data.emailExists) {
                            emailTd.classList.add('db-error');
                            emailTd.title = 'Email already exists';
                            hasDbErrors = true;
                        }

                        if (hasDbErrors) {
                            document.getElementById('errorMessage').textContent = 'There are errors in the uploaded data. Please correct them before proceeding.';
                        }

                        row.dataset.valid = !data.usernameExists && !data.phoneExists && !data.emailExists;
                    },
                    error: function (xhr, status, error) {
                        console.error('AJAX request failed:', status, error);
                    }
                });
            }

            function addUser(addButton) {
                let row = addButton.parentNode.parentNode;
                let isValid = true;
                let tds = row.getElementsByTagName('td');

                for (let td of tds) {
                    if (td.classList.contains('text-danger') || td.classList.contains('db-error')) {
                        isValid = false;
                        break;
                    }
                }

                if (!isValid) {
                    alert('Cannot add user. Please correct the errors.');
                    return;
                }

                let fullname = tds[0].innerText;
                let phone = tds[1].innerText;
                let email = tds[2].innerText;
                let username = tds[3].innerText;
                let password = tds[4].innerText;
                let role = tds[5].innerText;

                $.ajax({
                    url: 'addexcel',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        fullname: fullname,
                        phone: phone,
                        email: email,
                        username: username,
                        password: password,
                        role: role
                    }),
                    success: function (data) {
                        console.log(data);
                        if (data.success) {
                            alert('User added successfully');
                            row.remove();
                        } else {
                            alert('Failed to add user');
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('AJAX request failed:', status, error);
                        alert('Failed to add user');
                    }
                });
            }
        </script>
    </body>
</html>
