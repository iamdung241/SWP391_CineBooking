
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Tasks</title>
        <!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
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
                position: fixed;
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
            <section class="container-fluid">
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
            <div class="row g-4 mb-4 mt-0">
                <div class="col-12 mt-2">
                    <h4>Edit Task</h4>

                    <div class="card mb-4 h-100">
                        <div class="card-body">
                            <form action="./edit-task" method="POST" class="formEditTask" id="formEdit" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input class="form-control" type="text" id="title" name="title" required="required" value="${task.title}" />
                                </div>
                            <input type="hidden" value="${task.id}" name="id"/>
                                <div class="form-group mt-3 mb-3">
                                    <label for="threaterId">Theater</label>
                                    <input class="form-control" type="text" id="title" name="theaterId" value="${theater.name}"readonly />
                                </div>
                                <div>
                                    <label for="accountId">Task Receiver</label>
                                    <select class="form-control" name="accountId" id="accountId">
                                        <option value="0">Choose receiver task</option>
                                        <c:forEach items="${accounts}" var="a">
                                            <option value="${a.account_id}" ${task.accountId == a.account_id?'selected':''}>${a.fullname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="form-group mt-3 mb-3">
                                        <label for="desc">Descripton</label>
                                        <textarea class="form-control" id="desc" name="description" rows="10">${task.description}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group mt-3 mb-3">
                                            <label for="desc">Status</label>
                                            <select class="form-control" name="status" id="status">
                                                <option value="PENDING">PENDING</option>
                                                <option value="CONFIRM">CONFIRM</option>
                                                <option value="FINISHED">Finished</option>
                                                <option value="CANCEL">Cancel</option>
                                            </select>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <button class="btn btn-warning" id="sendData" type="submit">Update Task</button>
                                    </div>
                                </div>    

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="./pagination.jsp"/>
        </section>

        <script>

            function fetchApiAccount() {
                const selectElement = document.getElementById("theaterId");
                const opt = selectElement.options[selectElement.selectedIndex].value;
                //                console.log(opt);
                // Check if a province is selected
                if (opt === "0") {
                    // Only show the default option for district
                    const account = document.getElementById("accountId");
                    account.innerHTML = "<option value='0'>Choose receiver task</option>";
                    return;
                }
                const link = "getAccountJson?theaterId=" + opt;
                fetch(link)
                        .then(res => res.json())
                        .then(data => {
                            const district = document.getElementById("accountId");
                            let options = data.map((item) => {
                                return '<option value="' + item.account_id + '">' + item.fullname + '</option>';
                            });

                            options.unshift("<option value='0'>Choose receiver task</option>");
                            district.innerHTML = options.join("");

                        });
            }
            ;
            function validateForm() {
                const theater = document.getElementById("theaterId").value;
                const account = document.getElementById("accountId").value;
                const title = document.getElementById("title").value;
                const titleRegex = /^[A-Za-z0-9 ]+$/;

                if (title.trim() === "") {
                    alert("Title cannot be empty.");
                    return false;
                }

                if (!titleRegex.test(title)) {
                    alert("Title cannot contain special characters other than spaces.");
                    return false;
                }

                if (theater === "0") {
                    alert("Please choose a theater.");
                    return false;
                }

                if (account === "0") {
                    alert("Please choose a task receiver.");
                    return false;
                }

                return true;
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
        </script>
    </body>
</html>
