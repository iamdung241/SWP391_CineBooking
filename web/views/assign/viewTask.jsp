<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>QR Code Scanner</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/html5-qrcode.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="css/global.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.min.css">
        <style>
            .detail {
                margin-top: 100px;
                margin-bottom: 30px;
            }
            .navbarDetail {
                background-color: #000;
            }
            .nameDetail {
                font-size: 30px;
                font-weight: bold;
                margin-left: 20px;
            }
            ul {
                font-family: sans-serif;
            }
            span {
                font-weight: bold;
                font-size: 17px;
            }
            .bookTicket {
                color: rgb(240, 240, 240);
                background-color: red;
                padding: 5px;
                font-size: 15px;
                border-radius: 5px;
                margin-left: 7px;
            }
            .bookTicket:hover {
                color: #000; /* Text color on hover */
            }
            .dropdown-menu {
                background-color: #fff;
                border-radius: 10px;
            }

            .dropdown-item {
                color: #000;
                font-weight: bold;
                font-size: 18px;
            }

            .dropdown-item:hover {
                color: #fff;
            }
            .navbar-logo {
                height: 60px;
                width: 170px;
            }
        </style>
    </head>
    <body>
        <div class="main clearfix position-relative">
            <section id="header">
                <nav style="background-color: #000 ; padding-top: 5px; padding-bottom: 5px" class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
                    <div class="container-xl">
                        <a class="navbar-brand fs-2 p-0 fw-bold text-white m-0 me-5" href="#"><img class="navbar-logo" src="/CineBooking/img/movieLogo.PNG"/></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <ul class="navbar-nav mb-0 ms-auto">
                                <li class="nav-item">
                                    <c:if test="${sessionScope.user == null}">
                                        <a style="color: #fff; font-size: 15px" class="nav-link" href="/CineBooking/login.jsp"><i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1 "></i> Login </a>
                                    </c:if>
                                    <c:if test="${sessionScope.user != null}">
                                        <div class="nav-item dropdown">
                                            <a style="color: #fff; font-size: 15px" class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i style="color: red" class="fa fa-user fs-4 align-middle me-1 lh-1"></i>
                                                Welcome ${sessionScope.user.fullname} !
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="/CineBooking/OrderHistory">Order History</a></li>
                                                <li><a class="dropdown-item" href="/CineBooking/ViewTask">View Task</a></li>
                                                <li><a class="dropdown-item" href="logout">Logout</a></li>
                                            </ul>
                                        </div>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </section>
            <section id="exep" class="p_3 bg-light" style="height: 65vh;overflow: auto;">
                <div class="container-xl detail" style="margin-top: 10px">
                    <div class="table-responsive-md table-responsive-sm">
                        <table class="table table-hover table-md" checkbox-multi="checkbox-multi" id="table-category">
                            <thead class="text-left">
                                <tr style="vertical-align: baseline;"> 
                                    <th class="col-1">STT </th>
                                    <th class="col-3">Title</th>
                                    <th class="col-2">Status</th>
                                    <th class="col-2">Created At</th>
                                    <th class="col-2">Finished At</th>
                                    <th class="col-3">Action</th>
                                </tr>
                            </thead>
                            <tbody data-body>
                                <c:forEach var="t" items="${tasks}" varStatus="loop">
                                    <tr>
                                        <td> ${loop.index+1}</td>
                                        <td class="fit-content-column">${t.title}</td>
                                        <td class="fit-content-column">
                                            <select class="form-select form-select-sm" onchange="updateStatus(${t.id}, this.value)" ${t.status == 'FINISHED' || t.status == 'CANCEL' ? 'disabled' : ''}>
                                                <option value="PENDING" ${t.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                                <option value="CONFIRM" ${t.status == 'CONFIRM' ? 'selected' : ''}>CONFIRM</option>
                                                <option value="FINISHED" ${t.status == 'FINISHED' ? 'selected' : ''}>FINISHED</option>
                                                <option value="CANCEL" ${t.status == 'CANCEL' ? 'selected' : ''}>CANCEL</option>
                                            </select>
                                        </td>
                                        <td class="fit-content-column">${t.createdAt}</td>
                                        <td class="fit-content-column">
                                            <c:choose>
                                                <c:when test="${t.finishedAt !='Unfinished'}">
                                                    <span class="badge bg-success">${t.finishedAt}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger">Unfinished</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td>
                                            <a href="./taskDetail?taskId=${t.id}" class="btn btn-secondary btn-sm">Detail</a>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                                                const updateStatus = async (taskId, newStatus) => {
                                                    const url = `./ViewTask/change-status`;

                                                    try {
                                                        const result = await fetch(url, {
                                                            method: 'POST',
                                                            headers: {
                                                                'Content-Type': 'application/json'
                                                            },
                                                            body: JSON.stringify({status: newStatus,
                                                                taskId: taskId})
                                                        });
                                                         const data = await result.json();
                                                        console.log(data)
                                                        if (data.code === 200) {
                                                            Swal.fire({
                                                                position: "center",
                                                                icon: "success",
                                                                title: "Update status successful!",
                                                                showConfirmButton: false,
                                                                timer: 1000
                                                            });
                                                            setTimeout(() => {
                                                                location.reload();
                                                            }, 1000);
                                                        }
                                                    } catch (error) {
                                                        console.error('Error updating status:', error);
                                                    }
                                                }
        </script>
    </body>
</html>
