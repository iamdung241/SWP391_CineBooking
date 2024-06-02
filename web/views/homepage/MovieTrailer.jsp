<%-- 
    Document   : MovieTrailer
    Created on : May 23, 2024, 10:11:04 PM
    Author     : thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                background-color: #f0f0f0;
                font-family: Arial, sans-serif;
            }

            .btn-open-popup {
                padding: 12px 24px;
                font-size: 18px;
                background-color: green;
                color: #fff;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .btn-open-popup:hover {
                background-color: #4caf50;
            }

            .overlay-container {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                justify-content: center;
                align-items: center;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .popup-box {
                background: #fff;
                padding: 24px;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
                text-align: center;
                opacity: 0;
                transform: scale(0.8);
                animation: fadeInUp 0.5s ease-out forwards;
            }

            .form-container {
                display: flex;
                flex-direction: column;
            }

            .form-label {
                margin-bottom: 10px;
                font-size: 16px;
                color: #444;
                text-align: left;
            }

            .form-input {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 16px;
                width: 100%;
                box-sizing: border-box;
            }

            .btn-submit,
            .btn-close-popup {
                padding: 12px 24px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .btn-close-popup {
                margin-top: 12px;
                background-color: red;
                color: #fff;
            }

            .btn-submit:hover,
            .btn-close-popup:hover {
                background-color: red;
            }

            /* Keyframes for fadeInUp animation */
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Animation for popup */
            .overlay-container {
                display: flex;
                opacity: 1;
            }
        </style> 
    </head>
    <body>
        
        <div id="close" class="overlay-container"> 
            <div class="popup-box"> 
                <h2 style="color: red;">Movie Trailer</h2> 
                <form class="form-container"> 
                    <iframe width="700px" height="400px" src="${trailer}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen> </iframe>
                </form> 
                <button class="btn-close-popup" onclick="location.href='moviedetail?ID=${ID}'"> 
                    Close 
                </button> 
            </div> 
        </div> 
                
    </body> 
</html>
