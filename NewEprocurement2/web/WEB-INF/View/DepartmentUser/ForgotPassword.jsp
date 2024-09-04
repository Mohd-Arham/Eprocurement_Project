<div class="modal fade mdl_bg mdl_frm" id="change_passwords" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                            <i class="la la-key"></i>
                                        </div>Create New Password</h3>
                                </div>
                                <!--begin::Form-->
                                <form class="k-login-v2__body-form k-form k-login-v2__body-form--border" action="forgotPasswordContractor" autocomplete="off" onsubmit="return passwordMatch();"> 
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="${regId}">
                                        <input class="form-control Password" type="password" placeholder="New Password" id="newEnteredPassword" name="password" autocomplete="off">
                                        <span class="form-text validateField" id="newEnteredPasswordError"></span>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control Password" type="password" placeholder="Confirm Password" id="confirmNewPassword" name="confirmPassword" autocomplete="off">
                                        <span class="form-text validateField" id="confirmNewPasswordError"></span>
                                    </div>

                                    <!--end::Form-->
                                    <!--begin::Action-->
                                    <div class="k-login-v2__body-action k-login-v2__body-action--brand btn_justify"> 
                                        <button type="submit" class="btn btn-pill btn-brand btn-elevate">Save</button> 
                                        <a href="#" class="btn btn-danger btn-elevate" data-dismiss="modal">Close</a>
                                    </div>
                                    <!--end::Action-->
                                    <!--begin::Separator-->
                                    <!--                                                                <div class="k-login-v2__body-separator">
                                                                                                        <div class="k-separator k-separator--space-lg  k-separator--border-solid"></div>
                                                                                                    </div>-->
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