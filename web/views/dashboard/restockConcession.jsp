<%-- 
    Document   : restokeconcession
    Created on : 6 Jun 2024, 17:52:41
    Author     : Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="restockModal" tabindex="-1" role="dialog" aria-labelledby="restock-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="restock-modal-label">Confirm restock</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
                <p>Are you sure you want to restock this concession?</p>
            </div>
            <div class="modal-footer">
                <form action="control?action=restock" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idRestockInput" name="id" value="">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function restockConcession(id) {
        let inputId = document.querySelector("#idRestockInput");
        inputId.value = id;
    }
</script>
