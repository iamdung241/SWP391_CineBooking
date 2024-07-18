<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Film</title>
        <script>
            function validateAge(age) {
                var AgeErr = document.getElementById("AgeErr");
                const regex = /^(?:[4-9]|1[0-8])\+$/;
                if (!regex.test(age) || age === "") {
                    AgeErr.textContent = "Please enter from 4 - 18 example '18+' ";
                    return false;
                } else {
                    AgeErr.textContent = "";
                    return true;
                }
            }

            function validateName(name) {
                var nameErr = document.getElementById("nameErr");
                const regex = /^[^\s][A-Za-z0-9&]*(?: [A-Za-z0-9&]+)*$/;
                if (!regex.test(name) || name === "") {
                    nameErr.textContent = name === "" ? "" : "Invalid format!";
                    return false;
                } else {
                    if (name.length >= 2 && name.length <= 100) {
                        nameErr.textContent = "";
                        return true;
                    } else {
                        nameErr.textContent = "Name must have 2-100 characters!";
                        return false;
                    }
                }
            }

            function validateDuration(duration) {
                var durationErr = document.getElementById("durationErr");
                const regex = /^(?:1[0-9]|[2-9][0-9]|1[0-6][0-9])$/;
                if (!regex.test(duration) || duration === "") {
                    durationErr.textContent = duration === "" ? "" : "Please enter a number 10-170 example 100";
                    return false;
                } else {
                    durationErr.textContent = "";
                    return true;
                }
            }

            function validateTrailer(trailer) {
                var trailerErr = document.getElementById("trailerErr");
                const regex = /^[^\s]+\S*(\s*)$/;
                if (!regex.test(trailer) || trailer === "") {
                    trailerErr.textContent = trailer === "" ? "" : "Enter true format, example https://www.youtube.com/embed/ar-IaAx7s8k";
                    return false;
                } else {
                    trailerErr.textContent = "";
                    return true;
                }
            }

            function validateDes(des) {
                var desErr = document.getElementById("desErr");
                const regex = /^(?! )(?!.* {2})([a-zA-Z0-9&,.\s]+ ?)+$/;
                if (!regex.test(des) || des === "") {
                    desErr.textContent = des === "" ? "" : "Enter true format, do not have space first";
                    return false;
                } else {desErr.textContent = "";
                    return true;
                }
            }

            function validateSelection(dropdown) {
                var typeErr = document.getElementById("typeErr");
                if (dropdown === "all") {
                    typeErr.textContent = "Please choose the type of film.";
                    return false;
                }
                typeErr.textContent = "";
                return true;
            }

            function validDate(date) {
                var dateErr = document.getElementById("dateErr");
                var curDate = new Date(date);
                const minDate = new Date('1927-01-01');
                const maxDate = new Date('2030-12-30');
                if (curDate >= minDate && curDate <= maxDate) {
                    dateErr.textContent = "";
                    return true;
                } else {
                    dateErr.textContent = "Invalid, enter date true format and from 1/1/1927 to 30/12/2030.";
                    return false;
                }
            }

            function validateImageFile(fileInput) {
                var filePath = fileInput.value;
                var fileErr = document.getElementById("fileErr");
                const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
                if (!allowedExtensions.exec(filePath)) {
                    fileErr.textContent = "Please upload a file with extensions .jpeg/.jpg/.png only.";
                    fileInput.value = '';
                    return false;
                } else {
                    if (fileInput.files && fileInput.files[0]) {
                        var fileSize = fileInput.files[0].size / 1024 / 1024;
                        if (fileSize > 10) {
                            fileErr.textContent = "File size exceeds 10 MB.";
                            fileInput.value = '';
                            return false;
                        }
                    }
                    fileErr.textContent = "";
                    return true;
                }
            }

            function checkForm() {
                var checkType = validateSelection(document.getElementById('type').value);
                var name = validateName(document.getElementById('name').value);
                var age = validateAge(document.getElementById('age').value);
                var duration = validateDuration(document.getElementById('duration').value);
                var trailer = validateTrailer(document.getElementById('trailer').value);
                var des = validateDes(document.getElementById('des').value);
                var date = validDate(document.getElementById('date').value);
                var image = validateImageFile(document.getElementById('fileInput'));

                if (name && age && duration && trailer && des && checkType && date && image) {
                    document.getElementById('add-form').submit();
                } else {window.alert("Validation failed. Please check the form fields and try again.");
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <main id="main" class="container-fluid">
                <section class="container-fluid">
                    <div class="row g-4 mb-4 mt-0">
                        <div class="col-12">
                            <div class="card mb-4 h-100">
                                <div class="card-header justify-content-between align-items-center d-flex">
                                    <h6 class="card-title m-0">Add Movie</h6>
                                    <a class="btn btn-sm btn-primary" href="movie"><i class="fas fa-arrow-left me-1"></i> Back</a>
                                </div>
                                <div class="container">
                                    <form action="movie?mode=add" method="post" enctype="multipart/form-data" id="add-form">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tr>
                                                    <td>Name</td>
                                                    <td>
                                                        <input type="text" id="name" name="name" class="form-control" required oninput="validateName(this.value)" />
                                                        <span class="text-danger" id="nameErr"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Type</td>
                                                    <td>
                                                        <select name="type" id="type" class="form-control text-center" onchange="validateSelection(this.value)">
                                                            <option value="all">Choose the type of film</option>
                                                        <c:forEach items="${typeMovie}" var="tm">
                                                            <option value="${tm.type_id}">${tm.type_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <span class="text-danger" id="typeErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Age</td>
                                                <td><input name="age" id="age" type="text" class="form-control" required oninput="validateAge(this.value)" />
                                                    <span class="text-danger" id="AgeErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Duration</td>
                                                <td>
                                                    <input type="text" id="duration" name="duration" class="form-control" required oninput="validateDuration(this.value)" />
                                                    <span class="text-danger" id="durationErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Date</td>
                                                <td>
                                                    <input type="date" id="date" name="date" class="form-control" required oninput="validDate(this.value)" />
                                                    <span class="text-danger" id="dateErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Trailer</td>
                                                <td>
                                                    <input type="text" name="trailer" id="trailer" class="form-control" required oninput="validateTrailer(this.value)" />
                                                    <span class="text-danger" id="trailerErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Description</td>
                                                <td>
                                                    <textarea type="text" name="description" id="des" rows="5" class="form-control" required oninput="validateDes(this.value)"></textarea>
                                                    <span class="text-danger" id="desErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Image</td>
                                                <td>
                                                    <input id="fileInput" type="file" name="file" class="form-control" required oninput="validateImageFile(this)" />
                                                    <span class="text-danger" id="fileErr"></span>
                                                </td></tr>
                                        </table>
                                    </div>
                                </form>
                                <div class="container-fluid d-flex justify-content-end">
                                    <button class="btn btn-success" id="submit" onclick="checkForm()">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>