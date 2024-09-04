<style>
    .uplodeFolderFile .modal-header{
        border-bottom:0;
        padding-bottom:0;
    }
    .pd-tp{
        padding-top:0px;
    }
    .pd-bt{
        padding-bottom:0px;
    }
    .pd-lt{
        padding-left:0px;
    }
    .pd-right{
        padding-top:0px;
    }
    .paddingboth {
        padding: 0!important;
    }
    .input_upload {
        margin: 60px auto;
        text-align: center;
    }
    .input_upload label {
        border: 1px solid #dedede;
        padding: 10px;
        font-size: 13px;
    }
</style>

<!-- Modal -->
<div class="modal mdl-bg fade uplodeFolderFile" id="cloudFolderModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <form action="#" id="cloudFolder">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Cloud Folder</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pd-tp pd-bt">
                    <div class="k-portlet k-portlet--tabs" style="margin-bottom:0;">
                        <div class="k-portlet__head paddingboth">
                            <div class="k-portlet__head-toolbar">
                                <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-primary" role="tablist">
                                    <!--                                    <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_1_1_tab_content" role="tab" aria-selected="true">
                                                                                <i class="la la-desktop"></i> Cloud Folder
                                                                            </a>
                                                                        </li>-->
                                    <li class="nav-item">
                                        <a class="nav-link active show" data-toggle="tab" href="#k_portlet_base_demo_1_2_tab_content" role="tab" aria-selected="true">
                                            <i class="la la-cloud-upload"></i> My Computer
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="225" data-mobile-height="225" style="height: 225px; overflow: hidden;">
                            <div class="tab-content">
                                <div class="tab-pane" id="k_portlet_base_demo_1_1_tab_content" role="tabpanel">
                                    <input type="hidden" name="cloudFolderId" id="cloudFolderId">
                                    <a href="#" onclick="mycloudfiledata();">Back</a>
                                    <table class="table table-bordered" id="cloudFolderFile">
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <table class="table table-bordered" id="clouddataFile">
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane active show" id="k_portlet_base_demo_1_2_tab_content" role="tabpanel">
                                    <div class="widthUploadBt">		<div></div>
                                        <div class="custom-file input_upload">
                                            <input type="file" class="custom-file-input" id="couldFolderFile">
                                            <label class="custom-file-label" for="customFile" id="couldFolderFileChoosefile">Choose file</label>        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm  btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-primary" ng-click="cloudFolderUploading();" data-dismiss="modal" >Upload</button>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- Modal -->
<div class="modal mdl-bg fade uplodeFolderFile" id="cloudFolderModel2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <form action="#" id="cloudFolder">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Cloud Folder</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pd-tp pd-bt">
                    <div class="k-portlet k-portlet--tabs" style="margin-bottom:0;">
                        <div class="k-portlet__head paddingboth">
                            <div class="k-portlet__head-toolbar">
                                <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-primary" role="tablist">
                                    <!--                                    <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_1_3_tab_content" role="tab" aria-selected="true">
                                                                                <i class="la la-desktop"></i> My Computer
                                                                            </a>
                                                                        </li>-->
                                    <li class="nav-item">
                                        <a class="nav-link active show" data-toggle="tab" href="#k_portlet_base_demo_1_4_tab_content" role="tab" aria-selected="true">
                                            <i class="la la-cloud-upload"></i> My Computer
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="225" data-mobile-height="225" style="height: 225px; overflow: hidden;">
                            <div class="tab-content">
                                <div class="tab-pane" id="k_portlet_base_demo_1_3_tab_content" role="tabpanel">
                                    <!--    <div class="widthUploadBt">		<div></div>
                                            <div class="custom-file input_upload">
                                                <input type="file" class="custom-file-input" id="couldFolderFile2">
                                                <label class="custom-file-label" for="customFile" id="remakeChooseFile">Choose file</label>        </div>
                                        </div>-->
                                </div>
                                <div class="tab-pane active show" id="k_portlet_base_demo_1_4_tab_content" role="tabpanel">
                                    <div class="widthUploadBt">		<div></div>
                                        <div class="custom-file input_upload">
                                            <input type="file" class="custom-file-input" id="couldFolderFile2">
                                            <label class="custom-file-label" for="customFile" id="remakeChooseFile">Choose file</label>        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm  btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-primary" ng-click="uploadFile();" onclick="documentCloudData();" data-dismiss="modal" >Upload</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- END Cloud Model -->
<script>
    function mycloudfiledata() {
//alert("Value");
        $.ajax({
            type: "GET",
            url: "cloudFolderModal",
            success: function (response) {
                $("#cloudFolderFile tbody").empty();
                var rows = "";
                console.log("Process" + response);
                // var obj = response;
                $.each(JSON.parse(response), function (key, value) {
                    rows += "<tr>\n\<td> " + '<i class="la la-cloud-upload"><a href = "#" onclick="cloudfild(' + value.cloudFolderId + ');" value="' + value.folderName + '">' + value.folderName + '</a>' + "</td><tr>\n\\n\"";
                });
                $(rows).appendTo("#cloudFolderFile tbody");
                //alert("dsfsdf" + rows);
            },
            error: function (e) {
                alert('Error: ' + e);
            }
        });
    }

    function cloudfild(cloudFolderId) {
        //alert("my dataaasdd  " + cloudFolderId);
        // alert("ok");
        $.ajax({
            type: "POST",
            url: "fetchcloudfileData",
            data: {'cloudFolderId': cloudFolderId},
            success: function (response) {
                // alert("gya");
                $("#cloudFolderFile tbody").empty();
                $('#exampleModalCenter').modal('show');
                var rows = "";
                var rows1 = "";
                console.log("Process" + response);
                // var obj = response;
                $.each(JSON.parse(response), function (key, value)
                {
//          rows1+="<tr>\n\<td>" + value.folderName + "</td>\n\</tr>";        
                    rows += "<tr>\n\<td> " + '<a href="#" onclick="cloudfolderID(' + value.fileId + ');">' + "" + value.fileName + "</a>\n\</tr>";
                });
//                $(rows1).appendTo("#clouddataFile tbody");
                $(rows).appendTo("#clouddataFile tbody");
//                alert("dsfsdf" + rows1);
                // alert("dsfsdf" + rows);
            },
            error: function (e) {
                alert('Error: ' + e);
            }
        });
    }

    function cloudfolderID(fileId) {
        $("#fileId").val(fileId);
        alert("xvxv" + fileId);
    }

    function documentCloudData() {
// alert("my data is:" + i);
        alert("Sequence Id" + id);
        alert("urlGlobal" + urlGlobal);
        var fileId = $("#fileId").val();
        alert("fileId  " + fileId);
        var formData = new FormData();
        formData.append("fileId", fileId);
        var documentName = $("#documentName" + id).val();
        //alert(documentName);
        formData.append("documentName", documentName);
        //alert(file);
        $.ajax({
            url: 'documentCloudData?fileId=' + fileId,
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (response) {
                $("#customFile").html("Choose file");
                alert("my Result data is success:" + response);
            },
            error: function (error) {
                alert("error : " + error);
            }
        });
    }
</script>