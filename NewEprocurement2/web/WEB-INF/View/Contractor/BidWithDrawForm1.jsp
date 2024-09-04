<div class="modal fade mdl-bg" id="bidwithdrawformfields" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content k-portlet">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Bid-WithDraw Remark</h5>
                <button type="button" class="close" data-dismiss="modal" id="closeBidWithDrawModel" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body notification_md">
                <form class="k-form" enctype="multipart/form-data">
                    <div class="k-portlet__body pt-2 pb-2 pl-0 pr-0">
                        <div class="form-group">
                            <label>Remark<i style="color: red;">*</i></label>
                            <textarea class="form-control" name="rejectRemarkEA" id="remarkNote" rows="3"></textarea>
                            <span id="bidwithDrawremarkError" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <label>File Browser<i style="color: red;">*</i></label>
                            <div></div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" name="uploadfileName" id="bidwithDrawremarkfile" onchange="bidwithDrawfile(this);">
                                <label class="custom-file-label" for="customFile" id="fileNamebidwithDrawremarkfile">Choose file</label>
                                <!--<span id="uploadfileError"></span>-->
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--<div class="k-portlet__foot pt-2 pb-2 pl-0 pr-0">-->
            <div class="modal-footer"> 
                <button type="button" class="btn btn-success btn-sm" onclick="validateRemark();" value="" id="rejectbtn">Submit</button>
                <button type="reset" class="btn btn-secondary btn-sm">Cancel</button> 
            </div>
            <!--</div>-->
        </div>
    </div>
</div>
<script>
    function validateRemark() {
        alert("validate remark");
        if ($('#remarkNote').val() == '' || $('#remarkNote').val() == null) {
            alert("alert inside if");
            $('#bidwithDrawremarkError').html("Please Enter Remark.");
//                }else if($('#uploadfile').val){
        } else {
//            alert("inside else");
            var uploadfileName = new Array();
            var formdata = new FormData();
            uploadfileName = document.getElementById("bidwithDrawremarkfile").files[0];
            var remark = $("#remarkNote").val();
//            alert("bidwithDrawremarkfile  " + uploadfileName.name + "  remark  " + remark);
            formdata.append('uploadfileName', uploadfileName);
            formdata.append('remark', remark);
            requestToAjax(formdata);
        }
    }
    function requestToAjax(formdata) {
        $.ajax({
            url: "saveBidWithDrawRequest",
            data: formdata,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success: function (res) {
                alert("response " + res);
                console.log(res);
                if (res == 'Your Bid has been WithDrawn') {
                    $('#closeBidWithDrawModel').click();
                    $(':button').prop('disabled', true);
                    $(':input').prop('disabled', true);
                    swal('',
                            res,
                            'success'
                            );
                }
                location.reload();
            },
            error: function (e) {
                alert('Error: ' + e);
            }
        });
    }
    function bidwithDrawfile(that) {
        alert("id " + that.id);
//              
        $('#fileName' + that.id).html("");
        var files = document.getElementById(that.id).files[0];
////      //      alert("fileName "+files.name); 
        $('#fileName' + that.id).html(files.name);
////            $('#fileFlag' + i).val("");
    }
</script>