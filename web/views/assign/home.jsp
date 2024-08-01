<%-- 
    Document   : managefilm
    Created on : 6 thg 7, 2024, 02:00:10
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Tasks</title>
        <!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.min.css">

        <style>
            .card-header {
                background-color: #f8f9fa;
            }
            .form-select-custom {
                border: 1px solid #007bff;
                border-radius: 4px;
                padding: 0.375rem 0.75rem;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .alert{
                position: fixed!important;
                top: 10px;
                right: 15px;
                z-index: 10000;
            }
            .alert span{
                position: absolute;
                top: -7px;
                right : 0;
                font-size: 25px;
                cursor: pointer;
            }
            .alert span i{
                color: #000;
            }
            [show-alert].alert-hidden {
                animation-name: alert-hidden;
                animation-duration: 0.5s;
                animation-fill-mode: both;
            }

            @keyframes alert-hidden {
                from {
                    right: 15px;
                }

                to {
                    right: -100%;
                    display: none;
                }
            }
        </style>
        <script>
            function confirmDelete() {
                return confirm("Are you sure you want to delete this movie?");
            }
        </script>
    </head>
    <body>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
        <c:if test="${sessionScope.status == 'success'}">
            <div class="alert alert-success d-flex align-items-center" role="alert" ${sessionScope.status=="success"?'show-alert':""}>
                <i class='fa-regular fa-circle-check' style="font-size: 26px;margin-right: 20px"></i>
                <div style="margin-right: 30px">
                    ${sessionScope.mess}
                </div>
                <span close-alert><i class="fa-regular fa-circle-xmark"></i>s</span>
            </div>
        </c:if>
        <c:if test="${sessionScope.status == 'error'}">
            <div class="alert alert-danger  d-flex align-items-center" role="alert" ${sessionScope.status=="error"?'show-alert':""}>
                <i class='fa-solid fa-circle-exclamation' style="font-size: 26px;margin-right: 20px"></i>
                <div style="margin-right: 30px">
                    ${sessionScope.mess}
                </div>
                <span close-alert>
                    <i class="fa-regular fa-circle-xmark"></i>
                </span>
            </div>
        </c:if>
        <section class="container-fluid">
            <div class="row g-4 mb-4 mt-0">
                <div class="col-12 mt-2">
                    <div class="card mb-3">
                        <div class="card-header"><h5>Manager Tasks</h5></div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <button class="btn btn-sm ml-1 btn-outline-success ${status ==''?'active':''}" button-status="">All</button>
                                    <button class="btn btn-sm ml-1 btn-outline-success ${status =='pending'?'active':''}" button-status="pending">Pending</button>
                                    <button class="btn btn-sm ml-1 btn-outline-success ${status =='confirm'?'active':''}" button-status="confirm">Confirm</button>
                                    <button class="btn btn-sm ml-1 btn-outline-success ${status =='finished'?'active':''}" button-status="finished">Finished</button>
                                    <button class="btn btn-sm ml-1 btn-outline-success ${status =='cancel'?'active':''}" button-status="cancel">Cancel</button>
                                </div><div class="col-6">
                                    <form action="" id="form-search">
                                        <div class="input-group">  
                                            <input class="form-control" type="text" placeholder="Searching...." name="keyword" value="${keyword}">
                                            <div class="input-group-append ms-1">
                                                <button class="btn btn-success" type="submit"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4 h-100">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 text-end justify-content-xl-between"> </div>
                                <div class="col-4 justify-content-xl-between" style="text-align: end"> 
                                    <a class="btn btn-outline-success mb-3" href="./create-task">
                                        <i class='fa fa-plus'></i> Add Tasks
                                    </a>
                                </div>
                            </div>
                            <hr>
                            <div class="table-responsive" style="max-height: 700px">
                                <table class="table table-bordered table-hover overflow-scroll">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>                                                   
                                            <th>Status</th>                                                   
                                            <th>Created At</th>
                                            <th>Receiver</th>
                                            <th>Finished At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="t" items="${tasks}">
                                            <tr>
                                                <td>${t.id}</td>
                                                <td>${t.title}</td>
                                                <td>${t.status}</td>
                                                <td>${t.createdAt}</td>
                                                <td>${t.nameAccount}</td>
                                                <td>${t.finishedAt}</td>
                                                <td>
                                                    <a href="./edit-task?taskId=${t.id}" class="btn btn-warning"><i class="fa-regular fa-pen-to-square"></i></a>
                                                    &nbsp;
                                                    <button button-delete class="btn btn-danger" data-mess='${t.id}' data-id="${t.id}"><i class="fa-solid fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="./pagination.jsp"/>
            <form action=""
                  method = "POST"
                  id = "form-delete-task"
                  data-path = "./delete-task"></form>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            // Button Status

            const buttonStatus = document.querySelectorAll("[button-status]");
            if (buttonStatus) {
                let url = new URL(window.location.href);
                buttonStatus.forEach((button) => {
                    button.addEventListener("click", () => {
                        const status = button.getAttribute("button-status");
                        if (status) {
                            url.searchParams.set("status", status);
                            url.searchParams.delete("page");
                        } else {
                            url.searchParams.delete("status");
                            url.searchParams.delete("page");
                        }
                        window.location.href = url.href;
                    });
                });
            }
            // Show alert
            const showAlert = document.querySelector("[show-alert]");
            if (showAlert) {
                setTimeout(() => {
                    showAlert.classList.add("alert-hidden");
                }, 3000);
                const closeAlert = showAlert.querySelector("[close-alert]");
                closeAlert.addEventListener("click", () => {
                    showAlert.classList.add("alert-hidden");
                });
            }
            // End Show alert
            // pagination
            const buttonsPagination = document.querySelectorAll("[button-pagination]");
            if (buttonsPagination) {
                const url = new URL(window.location.href);
                buttonsPagination.forEach((button) => {
                    button.addEventListener("click", (e) => {
                        const page = button.getAttribute("button-pagination");

                        url.searchParams.set("page", page);
                        window.location.href = url.href;
                    });
                });
            }
            // End pagination
            // Delete Item
            const buttonDelete = document.querySelectorAll("[button-delete]");
            if (buttonDelete.length > 0) {
                const formDeleteItem = document.querySelector("#form-delete-task");
                if (formDeleteItem) {
                    const path = formDeleteItem.getAttribute("data-path");
                    buttonDelete.forEach((button) => {
                        button.addEventListener("click", async () => {
                            const mess = button.getAttribute("data-mess");
                            Swal.fire({
                                title: "Are you sure delete?",
                                icon: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                cancelButtonText: "No",
                                confirmButtonText: "Yes, I'm sure"
                            }).then(async (result) => {
                                if (result.isConfirmed) {
                                    const data = {};
                                    const id = button.getAttribute("data-id");
                                    data.id = id;
                                    const result = await fetchData(path, data);
                                    if (result.code === 200) {
                                        Swal.fire({
                                            title: "Success!",
                                            text: "Delete Task id :" + mess + " successful!",
                                            icon: "success"
                                        });
                                        setTimeout(() => {
                                            location.reload();
                                        }, 1000);
                                    } else {
                                        Swal.fire({
                                            icon: "error",
                                            title: "Error delete Task",
                                            text: "An error occurred while deleting. ",
                                        });
                                    }

                                }
                            });

                        });
                    });
                }
            }
            //End delete Item

            const fetchData = async (path, data) => {
                try {
                    const result = await FetAPI(path, data);
                    return result;
                } catch (error) {
                    throw error;
                }
            };
            const FetAPI = async (url, data) => {
                try {
                    // Gửi yêu cầu PATCH bằng fetch
                    const result = await  fetch(url, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    });
                    if (!result.ok) {
                        throw new Error('not ok');
                    }

                    return result.json();
                } catch (error) {
                    console.error('PATCH request failed', error);
                    throw error;
                }
                ;
            };
        </script>
    </body>
</html>
