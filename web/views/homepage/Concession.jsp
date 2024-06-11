<%-- 
    Document   : Concession
    Created on : May 21, 2024, 8:10:00 AM
    Author     : thanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Concession</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" >
        <link href="../../css/font-awesome.min.css" rel="stylesheet" >
        <link href="../../css/global.css" rel="stylesheet">
        <link href="../../css/index.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Overpass&display=swap" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    </head>
    <body>
        <div class="main clearfix position-relative">
            <div class="main_1 clearfix position-absolute top-0 w-100">
                <jsp:include page="/views/homepage/Header.jsp"></jsp:include>
                </div>
                <div class="main_blog clearfix">
                    <section id="center" class="center_blog">
                        <div class="container-xl">
                            <div class="row center_o1">
                                <div class="col-md-12">
                                    <h2 class="text-white">Concession</h2>
                                    <h6 class="mb-0 mt-3 fw-normal col_red">
                                        <a class="text-light" href="home">Home</a>
                                        <span class="mx-2 text-muted">/</span>Concession
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="main_2 clearfix">
                    <section id="spec" class="p_3">
                        <div class="container-xl">
                            <div class="row stream_1 text-center">
                                <div class="col-md-12">
                                    <h1 style="color: #000" class="mb-0 font_50">Now Showing</h1>
                                    <!-- Search and filter section -->
                                    <div class="mt-4 search-filter-form">
                                        <form method="get" action="${pageContext.request.contextPath}/concession" class="search-input me-3">
                                        <input type="text" name="search" class="form-control" placeholder="Search" value="${search}">
                                        <input type="hidden" name="filter" value="${selectedFilter}">
                                        <button type="submit" class="btn">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </form>
                                    <form method="get" action="${pageContext.request.contextPath}/concession" class="filter-select">
                                        <input type="hidden" name="search" value="${search}">
                                        <select name="filter" class="form-control" onchange="this.form.submit()">
                                            <option value="all" ${selectedFilter == null || selectedFilter.equals("all") ? 'selected' : ''}>All</option>
                                            <option value="f_d" ${selectedFilter != null && selectedFilter.equals("f_d") ? 'selected' : ''}>Food & Drink</option>
                                            <option value="combo" ${selectedFilter != null && selectedFilter.equals("combo") ? 'selected' : ''}>Combo</option>
                                            <option value="price_increase" ${selectedFilter != null && selectedFilter.equals("price_increase") ? 'selected' : ''}>Price Increase</option>
                                            <option value="price_decrease" ${selectedFilter != null && selectedFilter.equals("price_decrease") ? 'selected' : ''}>Price Decrease</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row spec_1 mt-4">
                            <c:forEach items="${listC}" var="c">
                                <div class="pe-0 col-3">
                                    <div class="spec_1im clearfix position-relative">
                                        <div class="spec_1imi clearfix film">
                                            <img width="160px" height="300px" src="${c.getImage()}" class="w-100" alt="abc">
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="spec_1im1 clearfix">
                                        <ul>
                                            <li style="font-weight: bold">
                                                ${c.getConcessions_name()}
                                            </li>
                                            <li class="col_black">
                                                Price: ${c.getPrice()}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
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
                </section>
                <jsp:include page="/views/homepage/Footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>

<style>
    .film {
        border: 2px solid #000;
    }
    .search-filter-form {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .search-input {
        display: flex;
        width: 30%;
        align-items: center;
    }
    .search-input input {
        flex: 1;
        margin-right: 5px;
    }
    .search-input button {
        background-color: red;
        border: none;
        color: white;
        padding: 6px 12px;
    }
    .filter-select {
        width: 20%;
    }
    .filter-select select {
        width: 100%;
    }
</style>