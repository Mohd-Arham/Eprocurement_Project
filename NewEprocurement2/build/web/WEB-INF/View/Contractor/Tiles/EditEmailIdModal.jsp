<%-- 
    Document   : EditEmailId
    Created on : 11 Jan, 2019, 11:46:31 AM
    Author     : Windows7
--%>

<div class="modal fade mdl_bg mdl_frm" id="editEmailIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="k-login-v2">
                    <!--begin::Body-->
                    <div class="k-login-v2__body">
                        <!--begin::Wrapper-->
                        <div class="k-login-v2__body-wrapper">
                            <div class="k-login-v2__body-container">
                                <div class="k-login-v2__body-title">
                                    <h3 class="icon_with"><div class="verify_imgicn text-center">
                                            <i class="la la-envelope"></i>
                                        </div>Edit Email</h3>
                                </div>
                                <!--begin::Form-->
                                <form class="k-login-v2__body-form k-form k-login-v2__body-form--border" data-backdrop="static" action="editContractorEmailId" onsubmit="return validateEditContEmail();" autocomplete="off"> 
                                    <div class="form-group">
                                        <input type="hidden" name="id" id="editEmailcontractorRegId">
                                       <input class="form-control EmailId" type="text" id="editEmailId" placeholder="New Email"  name="emailId" autocomplete="off">
                                        <span class="form-text validateField editEmailIdError" id="editEmailIdError"></span>
                                    </div>
                               
                                    <div class="k-login-v2__body-action k-login-v2__body-action--brand btn_justify"> 
                                        <button type="submit" class="btn btn-pill btn-brand btn-elevate" >Submit</button> 
                                        <a href="#" class="btn btn-danger btn-elevate" data-dismiss="modal">Close</a>
                                    </div>
                                 </form>
                                <!--end::Options-->
                            </div>
                        </div>
                        <!--end::Wrapper-->
                    </div>
                </div>
                <!--begin::Body-->
            </div> 
        </div>
    </div>
</div>         
