<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %><!-- Modal -->
<div class="modal fade mdl_bg mdl_frm" data-backdrop="static" id="otpModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                       <form id="verifyOTP"  autocomplete="off" action="verifyMobileContractor" role="form" class="k-login-v2__body-form k-form k-login-v2__body-form--border">
                                      <div class="verify_imgicn text-center">
                                       <i class="flaticon-chat-1"></i>
                                        </div>
                                        <p>An OTP has been sent to your registered mobile number, Please enter the same to proceed.</p>
                                        <div class="form-group">
                                             <input type="hidden" id="generatedotp" name="generatedotp">
                                             <input type="hidden" id="otpFor" name="otpFor">
                                            <input class="form-control otp_input otpfield checkOtp"   name="verifyingotp" id="enteredOtp" type="text" placeholder="Enter OTP"  autocomplete="off">
                                          <button type="submit" href="javascript:void(0);" class="btn btn-pill btn-brand btn-elevate"  onclick="return otpMatch();">Verify</button>
                                         </div>
                                         <span id="validateOTP" class="validateField d-block"></span>
                                         <a  href="javascript:;" onclick="resendOtp();" 
                                             class="k-link k-link--brand">
                                             
					  Resend OTP ?
						</a>
                                                <!--<input type="button" onclick="vg();" value="vg">-->  
                                    </form>
                                
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
         function otpMatch() {
//                alert("function for otp matched is called");
                var generatedotp = $("#generatedotp").val();
                var verifying_otp = $("#enteredOtp").val();
//                var verifying_otp = document.getElementById("enteredOtp").value;
                 console.log("generatedotp    "+generatedotp+"  verifying_otp   "+verifying_otp);
                if (verifying_otp === "") {
                    console.log("field is empty");
                 document.getElementById("validateOTP").innerHTML="Please Enter Otp";   
                    return false;
                }
                if (generatedotp !== verifying_otp) {
                  console.log("OTP Does Not Matched");
                 document.getElementById("validateOTP").innerHTML = "OTP Does Not Matched";
                    return false;
                 }
                else {
                    console.log("OTP Matched");
                    document.getElementById("validateOTP").html(" ");
                    return true;
                   }
            }
 </script>
    <script>
             function resendOtp(){
           $.ajax({
             url: "verifyMob",
             success: function (res) {
                alert(res);
                $('#generatedotp').val(res);
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