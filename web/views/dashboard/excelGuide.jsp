<%-- 
    Document   : excelGuide
    Created on : Jul 30, 2024, 7:22:57 AM
    Author     : Tran Anh Vu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="excelGuideModal" tabindex="-1" aria-labelledby="excelGuideModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="excelGuideModalLabel">Excel File Upload Instructions</h5>
            </div>
            <div class="modal-body">
                <h6>Header Requirements:</h6>
                <p>The Excel file must contain the following headers in this exact order:</p>
                <ul>
                    <li><strong>Fullname:</strong> Must be 8-30 characters long, only contain letters and spaces, and cannot be all spaces or null.</li>
                    <li><strong>Phone:</strong> Must be a string of 10-15 digits and cannot be null.</li>
                    <li><strong>Email:</strong> Must be in the format of "example@gmail.com" or "example@fpt.edu.vn" with no spaces and cannot be null.</li>
                    <li><strong>Username:</strong> Must be 8-20 characters long, contain both letters and numbers, and not contain any spaces or be null.</li>
                    <li><strong>Password:</strong> Must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces or null.</li>
                    <li><strong>Role:</strong> Must be either "Ticket_Checked" or "Ticket_Seller".</li>
                </ul>
                
                <h6>Example of Correct Header:</h6>
                <p><code>Fullname, Phone, Email, Username, Password, Role</code></p>
                
                <h6>Field Requirements:</h6>
                <ul>
                    <li><strong>Fullname:</strong> Enter the full name of the user. Example: <code>John Doe</code></li>
                    <li><strong>Phone:</strong> Enter the user's phone number. Example: <code>1234567890</code></li>
                    <li><strong>Email:</strong> Enter the user's email address. Example: <code>example@gmail.com</code> or <code>example@fpt.edu.vn</code></li>
                    <li><strong>Username:</strong> Enter a unique username for the user. Example: <code>john1234</code></li>
                    <li><strong>Password:</strong> Enter a secure password for the user. Example: <code>Pass1234</code></li>
                    <li><strong>Role:</strong> Enter the role of the user. Must be either <code>Ticket_Checked</code> or <code>Ticket_Seller</code>.</li>
                </ul>
                
                <h6>Additional Notes:</h6>
                <ul>
                    <li>The file must be in <code>.xlsx</code> format.</li>
                    <li>Ensure there are no empty rows in the file.</li>
                    <li>Double-check the data for correctness before uploading to avoid errors.</li>
                </ul>
            </div>
        </div>
    </div>
</div>
