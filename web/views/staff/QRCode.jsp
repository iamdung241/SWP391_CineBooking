<%-- 
    Document   : QRCode
    Created on : Jun 27, 2024, 3:24:32 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>QR Code Scanner</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 500px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .row {
                display: flex;
                align-items: center;
            }
            .scanner-container {
                width: 100%;
                max-width: 500px;
                height: 400px;
                margin: auto;
                background-color: #ddd;
                border-radius: 8px;
                overflow: hidden;
            }

        </style>
        <script src="html5-qrcode.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div id="reader" class="scanner-container"></div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function onScanSuccess(qrCodeMessage) {
                document.getElementById('result').innerHTML = '<span class="result">' + qrCodeMessage + '</span>';
            }

            function onScanError(errorMessage) {
                // Handle scan error if needed
            }

            var html5QrcodeScanner = new Html5QrcodeScanner("reader", {fps: 10, qrbox: 250});
            html5QrcodeScanner.render(onScanSuccess, onScanError);
        </script>
    </body>
</html>
