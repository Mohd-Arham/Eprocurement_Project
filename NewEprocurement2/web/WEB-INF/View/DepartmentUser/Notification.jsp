<%-- 
    Document   : Notification
    Created on : 5 Dec, 2018, 3:04:04 PM
    Author     : Windows7
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .fa_lineheight{
        line-height:inherit;}
    .important_note .alert .alert-icon i{
        font-size:1.6rem;
    }
</style>
<div class="modal fade" id="contractor_notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Verify Your Mobile And Email</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>

            </div>
            <div class="modal-body notification_md">
                <div class="k-portlet__body">
                    <div class="k-notification">
                        <div class="important_note">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-group-last">
                                        <div class="alert alert-secondary" role="alert">
                                            <div class="alert-icon"><i id="emailVerifyCheck" ></i></div>
                                            <div class="alert-text">
                                                <span id="emailVerifyMessage" class="d-block">Please Verify Your Email (Verification link has been sent to your Email Id)<button type="button" class="btn btn-outline-hover-info btn-elevate btn-circle btn-icon pull-right" onclick="editRegisteredEmail();"><i class="flaticon-edit"></i></button></span>
                                                <input type="hidden" id="resendMail" value="${emailid}"></input>
                                                <span id="verLink" hidden="true" class="k-link pull-left" onclick="resendMail();">
                                                    <a href="#"> Resend Verification Link</a>
                                                </span>
                                                <button type="button" class="btn btn-success btn-sm pull-right" id="verifyStatus" onclick="checkVerifyStatus();">Check Status</button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group form-group-last">
                                        <div class="alert alert-secondary" role="alert">
                                            <div class="alert-icon"><i id="mobileVerifyCheck"></i></div>
                                            <div class="alert-text">
                                                <span id="mobileVerifyMessage" class="d-block">Please Verify Your Mobile Number<button type="button" class="btn btn-outline-hover-info btn-elevate btn-circle btn-icon pull-right" onclick="editRegisteredMobileNumber();"><i class="flaticon-edit"></i></button>
</span>
                                                <span  id="resendOtpLink" class="k-link"  hidden="true" onclick="resendOtpRegisteredCont();">
                                                    <a href="#" >Resend Otp</a>
                                                </span>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div> 
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    function checkVerifyStatus() {
        var id = $("#resendMail").val();
//        alert("function is called");
        $.ajax({
            url: "checkRegisteredContractor?emailId=" + id,
            success: function (res) {
//                alert(res);
                if (res == 'Email Status is not verified') {
                    swal(
                            '',
                            res,
                            'error'
                            );
                  
                } else {
                    $("#emailVerifyMessage").html("Email is verified");
                    $("#verLink").hide();
                    $("#verifyStatus").attr('hidden', true);
                    swal(
                            '',
                            'Email is Verified',
                            'error'
                            );
                }

            }
        });
    }
</script>
