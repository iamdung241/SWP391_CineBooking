<%-- 
    Document   : pagination
    Created on : Feb 12, 2024, 11:58:23 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<nav class="mb-3">
    <ul class="pagination justify-content-center">
        <c:if test="${currentPage > 2}">
            <li class="page-item">
                <button class="page-link" button-pagination="1">
                    <i class='fa-solid fa-angles-left' style="vertical-align: middle;"></i>
                </button>
            </li>
        </c:if>
        <c:if test="${currentPage > 1}">
            <li class="page-item">
                <button class="page-link" button-pagination="${currentPage - 1}">
                    <i class='fa-solid fa-angle-left' style="vertical-align: middle;"></i>
                </button>
            </li> 
        </c:if>

        <c:forEach var="i" begin="1" end="${totalPages}">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
                <button class="page-link" button-pagination="${i}">${i}</button>
            </li>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <button class="page-link"  button-pagination="${currentPage + 1}">
                    <i class='fa-solid fa-angle-right' style="vertical-align: middle;"></i>
                </button>
            </li>
        </c:if>

        <c:if test="${currentPage < totalPages - 1}">
            <li class="page-item">
                <button class="page-link"  button-pagination="${totalPages}">
                    <i class='fa-solid fa-angles-right' style="vertical-align: middle;"></i>
                </button>
            </li>
        </c:if>
    </ul>
</nav>