<%-- 
    Document   : addconcession
    Created on : 21 May 2024, 12:54:31
    Author     : Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel">Add</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addConcessionForm" action="control?action=add" method="POST" enctype="multipart/form-data">
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceInput" name="price">
                        <div id="priceError" class="error"></div>
                    </div>
                    <!--Quantity-->
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityInput" name="quantity">
                        <div id="quantityError" class="error"></div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="file" onchange="displayImage(this)">
                                <label class="custom-file-label" >Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                    <!--Description-->
                    <!--                    <div class="form-group">
                                            <label for="description">Description:</label>
                                            <textarea class="form-control" name="description"></textarea>
                                        </div>-->
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addConcessionForm" onclick="validateForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        let name = $('#nameInput').val().trim();
        let price = $('#priceInput').val();
        let quantity = $('#quantityInput').val();
        
        //xoá thông báo lỗi hiện tại
        $('.error').html('');
        if (name === '') {
            $('#nameError').html('The concession name cannot be empty').css('color', 'red');
        } else if (name.trim() === '') {
            $('#nameError').html('The concession name cannot contain only spaces').css('color', 'red');
        }
        
        if (price === '') {
            $('#priceError').html('Concession price cannot be blank').css('color', 'red');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceError').html('The price of the concession must be a number and cannot be less than 0').css('color', 'red');
        }
        
        if (quantity === '') {
            $('#quantityError').html('The quantity of concessions cannot be left blank').css('color', 'red');
        } else if (!$.isNumeric(quantity) || parseInt(quantity) < 0) {
            $('#quantityError').html('The amount of the concession must be numeric and cannot be less than 0').css('color', 'red');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addConcessionForm').submit();
        } else {
            event.preventDefault();
        }
    }
    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        console.log(previewImage);
        var file = input.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }
        console.log(previewImage.src);
        reader.readAsDataURL(file);
    }
</script>
