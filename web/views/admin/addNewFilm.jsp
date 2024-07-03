<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Head -->
    <head>
        <!-- Page Meta Tags-->
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="">

        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/./assets/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/./assets/images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/./assets/images/favicon/favicon-16x16.png">
        <link rel="mask-icon" href="${pageContext.request.contextPath}/./assets/images/favicon/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/libs.bundle.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/./assets/css/theme.bundle.css" />
        <title></title>
        <!-- Fix for custom scrollbar if JS is disabled-->
        <noscript>
        <style>
            /**
            * Reinstate scrolling for non-JS clients
            */
            .simplebar-content-wrapper {
                overflow: auto;
            }
        </style>
        </noscript>

        <script>
            function validateAge() {
                var age = document.getElementById("age").value.trim();
                var AgeErr = document.getElementById("AgeErr");
                const regex = /^(?:[4-9]|1[0-8])\+$/;
                if (!regex.test(age) || age === "") {
                    AgeErr.textContent = "Please enter from 3 - 18 example '18+' ";
                    return false;
                } else {
                    AgeErr.textContent = "";
                    return true;
                }
            }

            function validateName() {
                var name = document.getElementById("name").value.trim();
                var nameErr = document.getElementById("nameErr");
                const regex = /^(?! )[A-Za-z0-9&]+(?: [A-Za-z0-9&]+)*$/;
                if (!regex.test(name)) {
                    nameErr.textContent = "Invalid format!";
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

            function validateduration() {
                var duration = document.getElementById("duration").value;
                var durationErr = document.getElementById("durationErr");
                const regex = /^(?:1[0-9]|[2-9][0-9]|1[0-6][0-9])$/;
                if (!regex.test(duration)) {
                    durationErr.textContent = "Please enter a number 10-170 example 100";
                    return false;
                } else {
                    durationErr.textContent = "";
                    return true;
                }
            }

            function validateTrailer() {
                var trailer = document.getElementById("trailer").value;
                var trailerErr = document.getElementById("trailerErr");
                const regex = /^[^\s]+\S*(\s*)$/;
                if (!regex.test(trailer)) {
                    trailerErr.textContent = "Enter true format, example https://www.youtube.com/embed/ar-IaAx7s8k";
                    return false;
                } else {
                    trailerErr.textContent = "";
                    return true;
                }
            }

            function validateDes() {
                var des = document.getElementById("des").value;
                var desErr = document.getElementById("desErr");
                const regex = /^(?! )(?!.* {2})([a-zA-Z0-9&,.\s]+ ?)+$/;

                if (!regex.test(des)) {
                    desErr.textContent = "Enter true format, do not have space first";
                    return false;
                } else {
                    desErr.textContent = "";
                    return true;
                }
            }

            function validateSelection() {
                var dropdown = document.querySelector('select[name="type"]');
                var typeErr = document.getElementById("typeErr");
                if (dropdown.value === "all") {
                    typeErr.textContent = "Please choose the type of film.";
                    return false; // Prevent form submission
                }
                typeErr.textContent = "";
                return true; // Allow form submission
            }

            function validDate() {
                var cur = document.getElementById("date").value;
                var curDate = new Date(cur);
                var dateErr = document.getElementById("dateErr");
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

            function validateImageFile() {
                var fileInput = document.getElementById('fileInput');
                var filePath = fileInput.value;
                var fileErr = document.getElementById("fileErr");
                // Các lo?i file ?nh h?p l?
                const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

                if (!allowedExtensions.exec(filePath)) {
                    fileErr.textContent = "Please upload a file with extensions .jpeg/.jpg/.png only.";
                    fileInput.value = '';
                    return false;
                } else {
                    // N?u là file ?nh, ki?m tra thêm kích th??c file
                    if (fileInput.files && fileInput.files[0]) {
                        var fileSize = fileInput.files[0].size / 1024 / 1024; // kích th??c file tính b?ng MB
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
                var checkType = validateSelection();
                var name = validateName();
                var age = validateAge();
                var duration = validateduration();
                var trailer = validateTrailer();
                var des = validateDes();
                var date = validDate();
                var image = validateImageFile();

                if (name && age && duration && trailer && des && checkType && date && image) {
                    document.getElementById('add-form').submit();
                } else {
                    window.alert("Validation failed. Please check the form fields and try again.");
                }
            }
        </script>
    </head>
    <body class="">

        <!--Header-->
        <jsp:include page="../common/admin/header.jsp"></jsp:include>
            <!-- Page Content -->
            <main id="main">

                <!-- Breadcrumbs-->
                <div class="bg-white border-bottom py-3">
                    <div class="container-fluid d-flex justify-content-between align-items-start align-items-md-center flex-column flex-md-row">
                        <nav class="mb-0" aria-label="breadcrumb">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="./index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manage Film</li>
                            </ol>
                        </nav>
                        <div class="d-flex justify-content-end align-items-center mt-3 mt-md-0">
                            <a class="btn btn-sm btn-primary" href="#"><i class="ri-add-circle-line align-bottom"></i> New Project</a>
                            <a class="btn btn-sm btn-primary-faded ms-2" href="#"><i class="ri-settings-3-line align-bottom"></i> Settings</a>
                            <a class="btn btn-sm btn-secondary-faded ms-2 text-body" href="#"><i class="ri-question-line align-bottom"></i> Help</a>
                        </div>
                    </div>
                </div>

                <!-- Content-->
                <section class="container-fluid">

                    <!-- Page Title-->
                    <!-- / Page Title-->

                    <!-- Middle Row Widgets-->
                    <div class="row g-4 mb-4 mt-0">
                        <!-- Latest Orders-->
                        <div class="col-12">
                            <div class="card mb-4 h-100">
                                <div class="card-header justify-content-between align-items-center d-flex">
                                    <h6 class="card-title m-0">Add Movie</h6>
                                    <a class="btn btn-sm btn-primary" href="movie"><i class="align-bottom"></i>Back</a>
                                </div>
                                <div class="container">
                                    <form action="movie?mode=add" method="post" enctype="multipart/form-data" id="add-form">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tr>
                                                    <td>Name</td>
                                                    <td>
                                                        <input type="text" id="name" name="name" class="form-control" required onblur="validateName()" />
                                                        <span class="text-danger" id="nameErr"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Type</td>
                                                    <td>
                                                        <select name="type" id="type" class="form-control text-center" onblur="validateSelection()">
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
                                                <td>
                                                    <input name="age" id="age" type="text" class="form-control" required onblur="validateAge()" />
                                                    <span class="text-danger" id="AgeErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Duration</td>
                                                <td>
                                                    <input type="text" id="duration" name="duration" class="form-control" required onblur="validateduration()" />
                                                    <span class="text-danger" id="durationErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Date</td>
                                                <td>
                                                    <input type="date" id="date" name="date" class="form-control" required onblur="validDate()" />
                                                    <span class="text-danger" id="dateErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Trailer</td>
                                                <td>
                                                    <input type="text" name="trailer" id="trailer" class="form-control" required onblur="validateTrailer()" />
                                                    <span class="text-danger" id="trailerErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Description</td>
                                                <td>
                                                    <input type="text" name="description" id="des" class="form-control" required onblur="validateDes()" />
                                                    <span class="text-danger" id="desErr"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Image</td>
                                                <td>
                                                    <input id="fileInput" type="file" name="file" class="form-control" required onblur="validateImageFile()" />
                                                    <span class="text-danger" id="fileErr"></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </form>
                                <div class="container-fluid d-flex justify-content-end">
                                    <button class="btn btn-success" onclick="checkForm()">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Latest Orders-->

                </div>
                <!-- / Middle Row Widgets-->

                <!-- Focus later in iter3-->
                <%--<jsp:include page="../common/admin/focuslater3.jsp"></jsp:include>--%>

                <!-- Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>

                    <!-- Sidebar Menu Overlay-->
                    <div class="menu-overlay-bg"></div>

                </section>
                <!-- / Content-->

            </main>
            <!-- /Page Content -->

            <!-- Page Aside-->
        <jsp:include page="../common/admin/aside.jsp"></jsp:include>
            <!-- Theme JS -->
            <!-- Vendor JS -->
            <script src="${pageContext.request.contextPath}/./assets/js/vendor.bundle.js"></script>

        <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>
    </body>

</html>
