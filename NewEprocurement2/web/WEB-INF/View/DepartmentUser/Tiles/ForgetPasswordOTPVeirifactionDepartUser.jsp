<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %><!-- Modal -->
<div class="modal fade mdl_bg mdl_frm departUserForgetPasswordModel" data-backdrop="static" id="departUserForgetPasswordModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                        <h3>Enter One Time Password</h3>
                                    </div>
                                     <!--begin::Form-->
                                       <div class="k-login-v2__body-form k-form k-login-v2__body-form--border">
                                      <div class="verify_imgicn text-center">
                                       <i class="flaticon-chat-1"></i>
                                        </div>
                                        <p>An OTP has been sent to your registered mobile number, Please enter the same to proceed.</p>
                                        <div class="form-group">
                  
<!--                                             <input type="hidden" class="departmentUserOTP" name="otpFor" >-->
                                            <input class="form-control otp_input otpfield checkOtp"   name="verifyingotp" id="deptUserOTPPass" type="text" placeholder="Enter OTP"  autocomplete="off">
                                          <button type="button" href="javascript:void(0);" class="btn btn-pill btn-brand btn-elevate"  onclick="return matchForDepartUserForgetPassword();" >Verify</button>
                                         </div>
                                         <span id="validateOTP1" class="validateField d-block"></span>
                                         <a  href="javascript:;" onclick="resendOTPForDepartmentUser();" 
                                             class="k-link k-link--brand">
                                             
					  Resend OTP ?
						</a>
                                                <!--<input type="button" onclick="vg();" value="vg">-->  
                                    </div>
                                
                             <!--end::Form--> 
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
<script>
    function matchForDepartUserForgetPassword(){
        var deptUserOTPPass = $("#deptUserOTPPass").val();
        alert(deptUserOTPPass+":"+otpReceived);
        if(deptUserOTPPass==otpReceived){
            $(".createPassDeptUser").click();
            $('.departUserForgetPasswordModel').modal('toggle');
        }else{
            alert("OTP not matched");
           
        }
    }
    </script>
    <script>
             function resendOTPForDepartmentUser(){
                 var resendOTPForDepartmentUser = "resendOTPForDepartmentUser";
                 //alert(resendOTPForDepartmentUser);
           $.ajax({
             url: resendOTPForDepartmentUser,
             success: function (res) {
                alert(res);
                $('#generatedotp1').val(res);
                }
            });
        }
     </script>
    
        
            <style>
              .validateField {
                color: red;
                font-size: 13px;
            }
            </style>