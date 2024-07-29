<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <style>
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
            width: 80%;
            margin: 20px auto;
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }

        .list-group {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            list-style-type: none;
            padding: 0;
            margin: 0 auto;
            max-width: 80%; /* Ensure this is wide enough to accommodate 4 items */
            justify-content: center; /* Center the items horizontally */
        }

        .list-group-item {
            background-color: transparent;
            padding: 15px; /* Increased padding for better spacing */
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            color: #000;
            flex: 1 0 21%; /* Adjusted width to fit 4 items per row */
            box-sizing: border-box;
            text-align: center;
            border-radius: 5px;
            margin: 5px; /* Space between items */
            font-size: 1.2rem; /* Increased font size */
        }

        .list-group-item:hover {
            background-color: red;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="card" id="homeCard">
    <div class="card-body">
        <h5 style="font-weight: bolder; font-size: 30px" class="card-title">All Theater</h5>
        <ul class="list-group" id="listTheater">
            <c:forEach items="${listTheater}" var="theater">
                <li class="list-group-item type-item" data-type-id="${theater.id}">
                    ${theater.name}
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const homeCard = document.querySelector('#homeCard');
        if (homeCard) {
            const typeItems = homeCard.querySelectorAll('.type-item');
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
