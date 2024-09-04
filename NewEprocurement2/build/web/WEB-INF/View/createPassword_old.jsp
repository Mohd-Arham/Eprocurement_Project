

<div class="modal fade mdl_bg mdl_frm" id="" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                                <form class="k-login-v2__body-form k-form k-login-v2__body-form--border" id="veryfyPassword1" action="createNewPassword" autocomplete="off" > 
                                                    <div class="form-group">
                                                        <input type="hidden" name="reg_Id" value="${reg_Id}">
                                                            <input class="form-control Password" type="password" placeholder="New Password" id="newEnteredPassword1" name="password" autocomplete="off">
                                                                <span class="form-text validateField" id="newEnteredPasswordError1"></span>
                                                                </div>
                                                                <div class="form-group">
                                                                    <input class="form-control Password" type="password" placeholder="Confirm Password" id="confirmNewPassword1" name="cPassword" autocomplete="off">
                                                                        <span class="form-text validateField" id="confirmNewPasswordError1"></span>
                                                                </div>

                                                                <!--end::Form-->
                                                                <!--begin::Action-->
                                                                <div class="k-login-v2__body-action k-login-v2__body-action--brand btn_justify"> 
                                                                    <button type="submit" class="btn btn-pill btn-brand btn-elevate" onclick="return passwordMatch1();">Save</button> 
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
                                                            <script>
                                                                
                                                                
                                                                    function passwordMatch1() {
                                                                    
//                alert("Password is matching");
                var newPassword =   document.getElementById("newEnteredPassword1").value;
                var confirmPassword = document.getElementById("confirmNewPassword1").value;
//                 var password_pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
  
                document.getElementById("newEnteredPasswordError1").innerHTML = " ";    
                document.getElementById("confirmNewPasswordError1").innerHTML = " ";   
//               alert("newPassword    "+newPassword +" confirmPassword   " +confirmPassword);

            

                if (newPassword == "") {
                  console.log("newPassword is empty"); 
                 document.getElementById("newEnteredPasswordError1").innerHTML="Please Enter Password";    
                    return false;
                }else{
                  document.getElementById("newEnteredPasswordError1").innerHTML = " ";    
                    document.getElementById("confirmNewPasswordError1").innerHTML = " ";   
                    
                }
//                if(password_pattern!==newPassword){
//                     document.getElementById("newEnteredPasswordError1").innerHTML="Please Enter Valid Password";    
//                    return false;   
//                    
//                    
//                }else{
//                  document.getElementById("newEnteredPasswordError1").innerHTML = " ";    
//                    document.getElementById("confirmNewPasswordError1").innerHTML = " ";   
//                    
//                }
                if (confirmPassword == "") {
                   console.log("confirmPassword is empty");
                 document.getElementById("confirmNewPasswordError1").innerHTML="Please Confirm Password";    
                    return false;
                }else{
                   document.getElementById("newEnteredPasswordError1").innerHTML = " ";    
                    document.getElementById("confirmNewPasswordError1").innerHTML = " ";  
                }
                if (newPassword != confirmPassword) {
                 console.log("newPasswordError Does Not Matched");
                 document.getElementById("confirmNewPasswordError1").innerHTML = "Password Not Matched";
                 return false;
                 } else {
                    console.log("newPassword  Matched");
                    document.getElementById("newEnteredPasswordError1").innerHTML = " ";    
                    document.getElementById("confirmNewPasswordError1").innerHTML = " ";    
                    return true;
                    $('#veryfyPassword1').submit();
                   }
            }
                                                            </script>