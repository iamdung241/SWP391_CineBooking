<%-- 
    Document   : addExcel
    Created on : Jul 3, 2024, 7:09:34 PM
    Author     : Tran Anh Vu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Excel File</title>
</head>
<body>
    <form action="uploadexcel" method="post" enctype="multipart/form-data">
        <input type="file" name="file" />
        <input type="submit" value="Upload" />
    </form>
</body>
</html>

