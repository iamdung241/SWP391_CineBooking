<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <!--<link rel="stylesheet" href="../assets/bootstrap.min.css">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <!--<link href="../assets/bootstrap.min.css" rel="stylesheet">-->
        <!-- Custom styles for this template -->
        <!--<link href="../assets/jumbotron-narrow.css" rel="stylesheet">-->      
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <style>
            body label{
                font-size: 20px;
                font-weight: bold;
            }
            
        </style>
        
    </head>

    <body>
         <div class="container">
           <div class="header clearfix">
                <h3 class="text-muted">VNPAY</h3>
                <button class="btn btn-danger mt-2" onclick="location.href='${sessionScope.urlback}'">Back</button>
            </div>
            <h3>Thanh toán hóa đơn</h3>
            <div class="table-responsive">
                <form action="vnpayajax" id="frmCreateOrder" method="post">
                    <div>
                        Show : ${sessionScope.showtime}<br>
                        Seat : ${sessionScope.seat}<br>
                        Combo<br>
                        <c:forEach items="${sessionScope.combo}" var="c">
                            <span>${c.concessions_name}</span>
                            <span>${c.quantity}</span><br>
                        </c:forEach>
                    </div>
                    <div class="form-group">
                        <label for="amount">Số tiền</label><br>
                        <input readonly class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${price}" />
                    </div>
                     <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                       <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                       <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>                       
                       <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                       <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                       <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>
                       
                       <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                       <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>
                       
                       <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                       <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>
                       
                    </div>
                    <div class="d-flex text-center">
                        <button type="submit" class="btn btn-primary" href>Thanh toán</button>
                    </div>    
                </form>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>
          
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>