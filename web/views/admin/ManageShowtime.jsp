<%-- 
    Document   : ManageShowtime
    Created on : Jul 1, 2024, 5:20:42 PM
    Author     : thanh
--%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Manage Showtime</title>
        <!-- Fix for custom scrollbar if JS is disabled-->
        <style>
            /**
            * Reinstate scrolling for non-JS clients
            */
            .simplebar-content-wrapper {
                overflow: auto;
            }
        </style>



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
                                <li class="breadcrumb-item">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manage Showtime</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Content-->
                <section class="container-fluid">

                    <!-- Page Title-->
                    <!-- Middle Row Widgets-->
                    <div class="row g-4 mb-4 mt-0">
                        <!-- Latest Orders-->
                        <div class="col-12">
                            <div class="card mb-4 h-100">
                                <div class="card-header justify-content-between align-items-center d-flex">
                                    <h6 class="card-title m-0">List Showtime</h6>
                                    <!--                                    <div class="border-1 d-flex">
                                                                            <form class="d-flex" action="AdminSearchFilter">
                                                                                <input class="form-control" name ="searchAdmin" 
                                                                                       placeholder="Search">
                                                                                <button class="btn btn-primary p-0" type="submit">Search</button>
                                                                            </form>
                                                                            <div class="">
                                                                                <select class="form-select mx-2" onchange="location.href = 'AdminSearchFilter?ACT=filter&typeId=' + this.value">
                                                                                    <option>All</option>
                                <c:forEach items="${listType}" var="t">
                                    <option value="${t.type_id}">${t.type_name}</option>
                                </c:forEach>   
                            </select>
                        </div>
                    </div>-->
                                <a class="btn btn-sm btn-primary" href="addNewShowtime"><i class="ri-add-circle-line align-bottom"></i> Add Showtime</a>
                            </div>
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success" role="alert">
                                    ${successMessage}
                                </div>
                            </c:if>
                            <div class="card-body">
                                <div class="border-1">
                                    <table class="table border-1">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Movie Image</th>           
                                                <th class="text-center">Movie Name</th>                                                   
                                                <th class="text-center">Room</th>
                                                <th class="text-center">Date</th>
                                                <th class="text-center">Showtime</th>                                                   
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listShowtime}" var="showtime">
                                                <tr>
                                                    <td class="text-center"><img border="2px" width="130px" height="130px" src="${showtime.getMovieImage()}"/></td>
                                                    <td class="text-center">${showtime.getMovie_name()}</td>
                                                    <td class="text-center">${showtime.getRoom_name()}</td>
                                                    <td class="text-center">${showtime.getDate()}</td> 
                                                    <td class="text-center">${showtime.getShowtiming()}</td> 
                                                    <td class="text-center">
                                                        <div class="d-flex p-6">
                                                            <a class="btn btn-sm btn-success me-1" href="updateShowtime?showtimeID=${showtime.getShowtime_id()}" style="color: white"><i class="align-bottom"></i> Edit</a>
                                                        </div> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>    
                                <nav>
                                    <ul class="pagination justify-content-end mt-3 mb-0">
                                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                    </ul>
                                </nav>

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
            <aside class="aside bg-white">

                <div class="simplebar-wrapper">
                    <div data-pixr-simplebar>
                        <div class="pb-6">
                            <!-- Mobile Logo-->
                            <div class="d-flex d-xl-none justify-content-between align-items-center border-bottom aside-header">
                                <a class="navbar-brand lh-1 border-0 m-0 d-flex align-items-center" href="./index.html">
                                    <div class="d-flex align-items-center">
                                        <svg class="f-w-5 me-2 text-primary d-flex align-self-center lh-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 203.58 182"><path d="M101.66,41.34C94.54,58.53,88.89,72.13,84,83.78A21.2,21.2,0,0,1,69.76,96.41,94.86,94.86,0,0,0,26.61,122.3L81.12,0h41.6l55.07,123.15c-12-12.59-26.38-21.88-44.25-26.81a21.22,21.22,0,0,1-14.35-12.69c-4.71-11.35-10.3-24.86-17.53-42.31Z" fill="currentColor" fill-rule="evenodd" fill-opacity="0.5"/><path d="M0,182H29.76a21.3,21.3,0,0,0,18.56-10.33,63.27,63.27,0,0,1,106.94,0A21.3,21.3,0,0,0,173.82,182h29.76c-22.66-50.84-49.5-80.34-101.79-80.34S22.66,131.16,0,182Z" fill="currentColor" fill-rule="evenodd"/></svg>
                                        <span class="fw-black text-uppercase tracking-wide fs-6 lh-1">Apollo</span>
                                    </div>                    </a>
                                <i
                                    class="ri-close-circle-line ri-lg close-menu text-muted transition-all text-primary-hover me-4 cursor-pointer"></i>
                            </div>
                            <!-- / Mobile Logo-->

                            <ul class="list-unstyled mb-6">

                                <!-- Dashboard Menu Section-->
                                <li class="menu-section mt-2">Menu</li>
                                <li class="menu-item"><a class="d-flex align-items-center" href="dashboard">
                                        <span class="menu-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" class="w-100">
                                            <rect fill-opacity=".5" fill="currentColor" x="3" y="3" width="7" height="7"></rect>
                                            <rect fill="currentColor" x="14" y="3" width="7" height="7"></rect>
                                            <rect fill-opacity=".5" fill="currentColor" x="14" y="14" width="7" height="7">
                                            </rect>
                                            <rect fill="currentColor" x="3" y="14" width="7" height="7"></rect>
                                            </svg>
                                        </span>
                                        <span class="menu-link">
                                            Dashboard
                                            <span class="badge bg-success-faded text-success pb-1 ms-2 align-middle rounded-pill">beta</span>
                                        </span></a></li>
                                <!-- / Dashboard Menu Section-->

                                <!-- Dashboard Menu Section-->
                                <li class="menu-section mt-4">Data</li>
                                <li class="menu-item"><a class="d-flex align-items-center" href="./charts.html">
                                        <span class="menu-icon">
                                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 489.902 489.902" style="enable-background:new 0 0 489.902 489.902;">
                                            <path fill="currentColor" opacity="0.5" d="M349.2,178.251l113.6-45.9c-37.7-72.7-110.1-124-195.6-131.8v122.5C301.8,129.651,330.9,149.851,349.2,178.251z"/>
                                            <path fill="currentColor" opacity="0.75" d="M121.3,244.751c0-60.7,43.6-110.8,101.1-121.3V0.551C98,11.851,0,116.851,0,244.751c0,54.8,17.9,105.4,48.2,146.2
                                                  l91.4-81.7C128.3,290.251,121.3,268.051,121.3,244.751z"/>
                                            <path fill="currentColor" d="M479.5,173.551l-113.6,45.9c1.6,8.2,2.7,16.3,2.7,24.9c0,68.1-55.2,123.7-123.7,123.7c-28.4,0-54.8-9.7-75.4-26.1
                                                  l-91.4,81.7c43.9,40.8,102.3,65.7,166.8,65.7c135.3,0,245-109.7,245-245C490,219.851,486.1,196.151,479.5,173.551z"/>

                                            </svg>
                                        </span>
                                        <span class="menu-link">
                                            Charts
                                            <span class="badge bg-danger-faded text-danger pb-1 ms-2 align-middle rounded-pill">new</span>
                                        </span></a></li>
                                <!-- / Dashboard Menu Section-->

                                <!-- Pages Menu Section-->
                                <li class="menu-section mt-4">Pages</li>
                                <li class="menu-item"><a class="d-flex align-items-center collapsed" href="#"
                                                         data-bs-toggle="collapse" data-bs-target="#collapseMenuItemPages" aria-expanded="false"
                                                         aria-controls="collapseMenuItemPages">
                                        <span class="menu-icon">
                                            <svg enable-background="new 0 0 520 520" viewBox="0 0 520 520" xmlns="http://www.w3.org/2000/svg"><g><path fill="currentColor" d="m481.734 100.063h-158.331l-43.111-70.397c-2.727-4.452-7.571-7.166-12.792-7.166h-119.235c-21.099 0-38.265 17.166-38.265 38.266v65.51 229.184c0 21.1 17.166 38.266 38.265 38.266h261.735 71.734c21.1 0 38.266-17.166 38.266-38.266v-217.13c0-21.101-17.166-38.267-38.266-38.267z"/><path fill="currentColor" opacity=".5" d="m80 355.459v-229.184h-41.734c-21.1 0-38.266 17.166-38.266 38.266v294.693c0 21.1 17.166 38.266 38.266 38.266h333.469c21.1 0 38.266-17.166 38.266-38.266v-35.51h-261.736c-37.641.001-68.265-30.623-68.265-68.265z"/></g></svg>
                                        </span>
                                        <span
                                            class="menu-link">Pages</span></a>
                                    <div class="collapse" id="collapseMenuItemPages">
                                        <ul class="submenu">
                                            <li><a href="./charts.html">Charts</a></li>
                                            <li><a href="./user-listing.html">User Listing</a></li>
                                            <li><a href="./login.html">Login</a></li>
                                            <li><a href="./register.html">Register</a></li>
                                            <li><a href="./forgot-password.html">Forgot Password</a></li>
                                            <li><a href="./404.html">404 Page</a></li>
                                            <li><a href="./blank.html">Blank Page</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- / Pages Menu Section-->

                                <li class="menu-section mt-4">FILM MANAGEMENT</li>
                                <li class="menu-item">
                                    <a class="d-flex align-items-center collapsed" href="#"
                                       data-bs-toggle="collapse" data-bs-target="#collapseMenuItemFilms" aria-expanded="false"
                                       aria-controls="collapseMenuItemFilms">
                                        <span class="menu-icon">
                                            <i class="fas fa-clapperboard"></i> <!-- Sử dụng biểu tượng Film từ Font Awesome -->
                                        </span>
                                        <span class="menu-link">Films</span>
                                    </a>
                                    <div class="collapse" id="collapseMenuItemFilms">
                                        <ul class="submenu">
                                            <li>
                                            <li style="primary" class="blue-text">Film Listing</li>
                                        </ul>
                                    </div>
                                </li>

                                <li class="menu-section mt-4">Concessions Management</li>
                                <li class="menu-item"><a class="d-flex align-items-center collapsed" href="#"
                                                         data-bs-toggle="collapse" data-bs-target="#collapseMenuItemConcessions" aria-expanded="false"
                                                         aria-controls="collapseMenuItemConcessions">
                                        <span class="menu-icon">
                                            <i class="fas fa-store"></i> <!-- Sử dụng biểu tượng Water từ Font Awesome -->
                                        </span>
                                        <span class="menu-link">Concessions</span></a>
                                    <div class="collapse" id="collapseMenuItemConcessions">
                                        <ul class="submenu">
                                            <li><a href="admin/concession">Concessions Listing</a></li>
                                        </ul>
                                    </div>
                                </li>

                                <!-- Pages Menu Section-->
                                <li class="menu-section mt-4">User Management</li>
                                <li class="menu-item"><a class="d-flex align-items-center collapsed" href="#"
                                                         data-bs-toggle="collapse" data-bs-target="#collapseMenuItemUsers" aria-expanded="false"
                                                         aria-controls="collapseMenuItemUsers">
                                        <span class="menu-icon">
                                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                            <path fill="currentColor" opacity=".5" d="M155.327,57.142c-51.531,0-93.454,44.45-93.454,99.086c0,54.636,41.923,99.086,93.454,99.086s93.455-44.45,93.455-99.086
                                                  C248.782,101.592,206.859,57.142,155.327,57.142z"/>

                                            <path fill="currentColor" d="M367.798,71.321c-0.211,0-0.425,0.001-0.636,0.002c-21.626,0.179-41.826,9.31-56.878,25.713
                                                  c-14.788,16.113-22.829,37.37-22.644,59.854c0.186,22.484,8.577,43.605,23.628,59.473c15.17,15.991,35.265,24.773,56.651,24.773
                                                  c0.215,0,0.43-0.001,0.646-0.002c21.626-0.179,41.826-9.311,56.878-25.713c14.788-16.113,22.829-37.37,22.644-59.855
                                                  C447.702,108.972,411.747,71.321,367.798,71.321z"/>

                                            <path fill="currentColor" d="M371.74,257.358h-7.76c-36.14,0-69.12,13.74-94.02,36.26c6.23,4.78,12.16,9.99,17.78,15.61
                                                  c16.58,16.58,29.6,35.9,38.7,57.42c8.2,19.38,12.88,39.8,13.97,60.83H512v-29.87C512,320.278,449.08,257.358,371.74,257.358z"/>

                                            <path fill="currentColor" opacity=".5" d="M310.35,427.478c-2.83-45.59-25.94-85.69-60.43-111.39c-25.09-18.7-56.21-29.77-89.92-29.77h-9.34
                                                  C67.45,286.319,0,353.768,0,436.978v17.88h310.65v-17.88C310.65,433.788,310.55,430.618,310.35,427.478z"/>

                                            </svg>
                                        </span>
                                        <span
                                            class="menu-link">Users</span></a>
                                    <div class="collapse" id="collapseMenuItemUsers">
                                        <ul class="submenu">
                                            <li><a href="views/admin/manageuser.jsp">User Listing</a></li>
                                        </ul>
                                    </div>
                                </li>



                            </ul>
                        </div>
                    </div>
                </div>

            </aside>
            <!-- Theme JS -->
            <!-- Vendor JS -->
            <script src="${pageContext.request.contextPath}/./assets/js/vendor.bundle.js"></script>

        <!-- Theme JS -->
        <script src="${pageContext.request.contextPath}/./assets/js/theme.bundle.js"></script>        
    </body>

</html>

<style>
    .blue-text {
        color: #003ed5;
        text-decoration: none;
        cursor: pointer;
    }
</style>
