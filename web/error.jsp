<%-- 
    Document   : error
    Created on : Jul 11, 2024, 4:26:11 AM
    Author     : Tran Anh Vu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            color: #e74c3c;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
        }
        .details {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <p>Sorry, an error has occurred while processing your request. Please try again later.</p>
        <a href="home">Back to Homepage</a>
    </div>
</body>
</html>
