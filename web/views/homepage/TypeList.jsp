<%-- 
    Document   : TypeList
    Created on : Jun 3, 2024, 3:39:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <style>
            /* CSS for menu */
            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: #f8f9fa; /* Background color */
            }

            .card-title {
                font-size: 1.2rem;
                font-weight: bold;
                color: #343a40; /* Title color */
                margin-bottom: 1.5rem;
            }

            .list-group {
                padding-left: 0; /* Loại bỏ padding mặc định của list */
            }

            .list-group-item {
                background-color: transparent;
                border: none;
                border-radius: 0;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none; /* Loại bỏ gạch chân */
                color: #000; /* Màu chữ */
            }

            .list-group-item:hover {
                background-color: red; /* Hover background color */
                color: #fff;
            }
        </style>
    </head>
    <body>

        <!-- Filter by type -->
        <div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Filter by Type</h5>
                    <ul class="list-group" id="typeList">
                        <c:forEach items="${typeList}" var="t">
                            <a href="movieController?service=filter_type&type_id=${t.type_id}" 
                               class="list-group-item type-item" data-type-id="${t.type_id}">
                                ${t.type_name}
                            </a>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Get the type items and current selected type ID from URL
                const typeItems = document.querySelectorAll('.type-item');
                const urlParams = new URLSearchParams(window.location.search);
                const selectedTypeId = urlParams.get('type_id');

                // Function to remove 'active' class from all items and add to the clicked one
                function setActiveItem() {
                    typeItems.forEach(item => {
                        item.classList.remove('active');
                    });
                    this.classList.add('active');
                }

                // Add click event listener to each type item
                typeItems.forEach(item => {
                    item.addEventListener('click', setActiveItem);
                    // Highlight the item if its type_id matches the selectedTypeId from the URL
                    if (item.getAttribute('data-type-id') === selectedTypeId) {
                        item.classList.add('active');
                    }
                });
            });
        </script>

    </body>
</html>

