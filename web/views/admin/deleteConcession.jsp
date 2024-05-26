<%-- 
    Document   : deleteconcession
    Created on : 18 May 2024, 10:18:31
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label">Confirm deletion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
                <p>Are you sure you want to delete this concession?</p>
            </div>
            <div class="modal-footer">
                <form action="control?action=delete" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idDeleteInput" name="id" value="">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteConcession(id) {
        let inputId = document.querySelector("#idDeleteInput");
        inputId.value = id;
    }
</script>
