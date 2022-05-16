<!-- delete Modal -->
<div id="note-edit-modal" class="modal fade">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title h6">{{translate('Edit Note For Cancelation')}}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body text-center">
                <form >
                    <div class="form-group">
                        <input type="hidden" name="order_id" id="ordr-id" >
                      <label for="exampleFormControlTextarea1">Modify For Canceling Order</label>
                      <textarea class="form-control" name="note" id="note_edit" rows="3"></textarea>
                    </div>
                  </form>
                <button type="button" class="btn btn-link mt-2" data-dismiss="modal">{{translate('Close')}}</button>
                <button  id="note-edit-btn" class="btn btn-primary mt-2">{{translate('Proceed')}}</button>
            </div>
        </div>
    </div>
</div><!-- /.modal -->
