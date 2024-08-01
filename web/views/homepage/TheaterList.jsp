<%-- 
    Document   : Cinema
    Created on : Jul 29, 2024, 6:51:05 PM
    Author     : DungTT
--%>
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

                        <c:if test="${theater.name != 'None'}">
                             <li class="list-group-item type-item" data-type-id="${theater.id}">
                            <a style="text-decoration: none" href="theater?service=search&theaterID=${theater.id}">
                                ${theater.name}
                            </a>
                        </li>

                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <script>
            //lấy ra 7 ngày tiếp theo tính từ ngày hiện 
            function displayNextWeek() {
                var dateContainer = document.getElementById('dateContainer');
                var currentDate = new Date();
                var selectedDate = "${selectedDate}";

                for (var i = 0; i < 7; i++) {
                    var date = new Date(currentDate.getTime() + i * 24 * 60 * 60 * 1000);
                    var weekday = date.toLocaleDateString('en-US', {weekday: 'long'});
                    var day = date.getDate().toString().padStart(2, '0');
                    var month = (date.getMonth() + 1).toString().padStart(2, '0');
                    var year = date.getFullYear();
                    var formattedDate = day + '/' + month + '-' + weekday;
                    var formattedDateForLink = year + "-" + month + "-" + day;

                    var box = document.createElement('div');
                    box.classList.add('box');

                    var dateElement = document.createElement('a');
                    dateElement.classList.add('date');
                    dateElement.textContent = formattedDate;
                    dateElement.href = 'theater?service=search&theaterID=${theater.id}&date=' + formattedDateForLink;
                    if (selectedDate === formattedDateForLink) {
                        dateElement.style.color = 'red'; // Highlight the selected date
                    }
                    box.appendChild(dateElement);
                    dateContainer.appendChild(box);
                }
            }

            displayNextWeek();
        </script>


    </body>
</html>
