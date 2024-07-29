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
            margin: 0; /* Remove default margin */
            width: 100%; /* Ensure card spans full width */
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #343a40; /* Title color */
            margin-bottom: 1.5rem;
        }

        .list-group {
            padding-left: 0; /* Remove default padding */
        }

        .list-group-item {
            background-color: transparent;
            border: none;
            border-radius: 0;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none; /* Remove underline */
            color: #000; /* Text color */
        }

        .list-group-item:hover {
            background-color: red; /* Hover background color */
            color: #fff; /* Hover text color */
        }
    </style>
</head>
<body>

<!-- Filter by type -->
<div class="card" id="menuCard">
    <div class="card-body">
        <h5 class="card-title">Filter by Type</h5>
        <ul class="list-group" id="typeList">
            <c:forEach items="${typeList}" var="t">
                <a style="text-decoration: none" href="movieController?service=filter_type&type_id=${t.type_id}" 
                   class="list-group-item type-item" data-type-id="${t.type_id}">
                    ${t.type_name}
                </a>
            </c:forEach>
        </ul>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const menuCard = document.querySelector('#menuCard');
        if (menuCard) {
            const typeItems = menuCard.querySelectorAll('.type-item');
            const urlParams = new URLSearchParams(window.location.search);
            const selectedTypeId = urlParams.get('type_id');

            function setActiveItem() {
                typeItems.forEach(item => {
                    item.classList.remove('active');
                });
                this.classList.add('active');
            }

            typeItems.forEach(item => {
                item.addEventListener('click', setActiveItem);
                if (item.getAttribute('data-type-id') === selectedTypeId) {
                    item.classList.add('active');
                }
            });
        }
    });
</script>

</body>
</html>
