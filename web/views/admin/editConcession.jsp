<%-- 
    Document   : editconcession
    Created on : 21 May 2024, 13:32:36
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editConcessionModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                Edit Concessions
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm" action="control?action=edit" method="POST" enctype="multipart/form-data">
                    <!--id-->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idEditInput" name="id">
                    </div>
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="nameEditInput" name="name">
                        <div id="nameEditError" class="error"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceEditInput" name="price">
                        <div id="priceEditError" class="error"></div>
                    </div>
                    <!--Quantity-->
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityEditInput" name="quantity">
                        <div id="quantityEditError" class="error"></div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="imageEdit" name="image"
                                       onchange="displayImage2(this)">
                                <label class="custom-file-label">Choose file to update</label>
                            </div>
                        </div>
                        <img id="previewImage2" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                        <input type="hidden" id="currentImage" name="currentImage" value="">
                    </div>
                    <!--Description-->
<!--                    <div class="form-group">
                        <label for="descriptionEditInput">Description:</label>
                        <textarea class="form-control" id="descriptionEdit" name="description"></textarea>
                    </div>-->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editForm"
                        onclick="validateForm2()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm2() {
        let name = $('#nameEditInput').val();
        let price = $('#priceEditInput').val();
        let quantity = $('#quantityEditInput').val();
        let regex = /^(?!.* {3})[a-zA-Z0-9 ]+$/;
        //xoá thông báo lỗi hiện tại
        $('.error').html('');
        if (name === '') {
            $('#nameEditError').html('The concession name cannot be empty').css('color', 'red');
        }  else if (!regex.test(name)) {
            $('#nameEditError').html('The concession name cannot contain special characters or more than two consecutive spaces').css('color', 'red');
        } else if (name.trim() === '') {
            $('#nameEditError').html('The concession name cannot contain only spaces').css('color', 'red');
        }
        if (price === '') {
            $('#priceEditError').html('Concession price cannot be blank').css('color', 'red');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
        $('#priceEditError').html('The price of the concession must be a number and cannot be less than 0').css('color', 'red');
        }
        if (quantity === '') {
            $('#quantityEditError').html('The quantity of concessions cannot be left blank').css('color', 'red');
        } else if (!$.isNumeric(quantity) || parseInt(quantity) < 0) {
            $('#quantityEditError').html('The amount of the concession must be numeric and cannot be less than 0').css('color', 'red');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#editForm').submit();
        } else {
            event.preventDefault();
        }
    }
    function displayImage2(input) {
        var previewImage = document.getElementById("previewImage2");
        var file = input.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }
        reader.readAsDataURL(file);
    }
    <!-- function editConcessionModal(id, name, description, author, price, quantity, image, categoryId) { -->
    function editConcessionModal(button) {
        let id = $(button).closest('tr').find('td[name="id"]').text().trim();
        let name = $(button).closest('tr').find('td[name="name"]').text().trim();
        let price = $(button).closest('tr').find('td[name="price"]').text().trim().split('$')[0];
        console.log(price);
        let quantity = $(button).closest('tr').find('td[name="quantity"]').text().trim();
//        let description = $(button).closest('tr').find('td[name="description"]').text().trim();
        let image = $(button).closest('tr').find('td[name="image"]').find('img').attr('src');
        $('#idEditInput').val(id);
        $('#nameEditInput').val(name);
        $('#priceEditInput').val(price);
        $('#quantityEditInput').val(quantity);
//        $('#descriptionEdit').val(description);
        $('#previewImage2').attr('src', image);
        $('#previewImage2').css('display', 'block');
        $('#currentImage').val(image);
    }
</script>