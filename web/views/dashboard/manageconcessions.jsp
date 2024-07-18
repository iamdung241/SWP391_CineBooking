<%-- 
    Document   : manageconcessions
    Created on : 6 thg 7, 2024, 12:21:28
    Author     : tranh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Concessions</title>
    </head>
    <body>
        <jsp:include page="addConcession.jsp"></jsp:include>
        <jsp:include page="editConcession.jsp"></jsp:include>
        <jsp:include page="deleteConcession.jsp"></jsp:include>
        <jsp:include page="restockConcession.jsp"></jsp:include>
        <jsp:include page="../common/admin/main.jsp"></jsp:include>
            <section class="container-fluid">
                <div class="row g-4 mb-4 mt-0">
                    <!-- Latest Orders-->
                    <div class="col-12">
                        <div class="card mb-4 h-100">
                            <div class="card-header justify-content-between align-items-center d-flex">
                                <h6 class="card-title m-0">Concession Listing</h6>

                                <form class="filter-form d-none d-md-flex bg-light rounded" action="filter" onchange="this.form.submit()">
                                    <input type="hidden" name="keyword" value="${keyword}">
                                <input type="hidden" name="page" value="${pageControl.page}">
                                <select class="form-control filter-select" name="filter" aria-label="Filter">
                                    <option value="" ${selectedFilter == null || selectedFilter.isEmpty() ? 'selected' : ''}>All</option>
                                    <option value="priceAsc" ${selectedFilter != null && selectedFilter.equals("priceAsc") ? 'selected' : ''}>Price Increase</option>
                                    <option value="priceDesc" ${selectedFilter != null && selectedFilter.equals("priceDesc") ? 'selected' : ''}>Price Decrease</option>
                                    <option value="quantityAsc" ${selectedFilter != null && selectedFilter.equals("quantityAsc") ? 'selected' : ''}>Quantity Increase</option>
                                    <option value="quantityDesc" ${selectedFilter != null && selectedFilter.equals("quantityDesc") ? 'selected' : ''}>Quantity Decrease</option>
                                </select>
                            </form>

                            <form class="d-none d-md-flex bg-light rounded px-3 py-1" action="filter">
                                <input type="hidden" name="filter" value="${selectedFilter}">
                                <input type="hidden" name="page" value="${pageControl.page}">
                                <input class="form-control border-dark bg-transparent me-2" type="search" placeholder="Search" name="keyword" aria-label="Search ..." value="${param.keyword}">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                            </form>

                            <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#addModal" style="color: white">
                                <i class="ri-add-circle-line align-bottom" style="color: white"></i>
                                Add Concession
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" style="max-height: 530px">
                                <table class="table table-hover align-middle text-center overflow-auto">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Image</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="c" items="${listConcession}">
                                            <tr>
                                                <td name="id">
                                                    <span class="fw-bold">${c.concessions_id}</span>
                                                </td>
                                                <td name="image">
                                                    <img src="${c.image}" class="img-thumbnail" width="100" height="100"/>
                                                </td>
                                                <td name="name">${c.concessions_name}</td>
                                                <td name="price">${c.price} VNĐ</td>
                                                <td name="quantity">${c.quantity}</td>
                                                <td class="d-flex justify-content-center">
                                                    <form>
                                                        <button type="button" class="btn text-success"
                                                                data-toggle="modal"
                                                                data-target="#editConcessionModal"
                                                                onclick="editConcessionModal(this)">
                                                            <i class="fas fa-edit"></i>
                                                             Edit
                                                        </button>
                                                    </form>
                                                    <c:if test="${c.status == 1}">
                                                        <button type="button" class="btn text-danger"
                                                                data-toggle="modal" data-target="#deleteModal"
                                                                onclick="deleteConcession(${c.concessions_id})">
                                                            <i class="fas fa-trash-alt"></i>
                                                             Delete
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${c.status == 0}">
                                                        <button type="button" class="btn text-primary"
                                                                data-toggle="modal" data-target="#restockModal"
                                                                onclick="restockConcession(${c.concessions_id})">
                                                            <i class="fa-solid fa-rotate-right"></i>
                                                             Restock
                                                        </button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Additional custom styles -->


                            <!--Pagination for filter and search results-->
                            <nav>
                                <ul class="pagination justify-content-end mt-3 mb-0">
                                    <li class="page-item ${pageControl.page == 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="${pageControl.ulrPattern}page=${pageControl.page - 1}">Previous</a>
                                    </li>
                                    <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                        <li class="page-item ${pageControl.page == pageNumber ? 'active' : ''}">
                                            <a class="page-link" href="${pageControl.ulrPattern}page=${pageNumber}">${pageNumber}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item ${pageControl.page == pageControl.totalPage ? 'disabled' : ''}">
                                        <a class="page-link" href="${pageControl.ulrPattern}page=${pageControl.page + 1}">Next</a>
                                    </li>
                                </ul>
                            </nav>

                        </div>
                    </div>

                </div>
            </div>
        </section>
        <script>
            document.querySelector('.filter-select').addEventListener('change', function () {
                this.form.submit();
            });
        </script>
    </body>
</html>
