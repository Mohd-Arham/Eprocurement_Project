<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade mdl_bg mdl_frm" id="createNewPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                                  <form id="veryfyPassword" class="k-login-v2__body-form k-form k-login-v2__body-form--border" action="createNewPasswordd" role="form" method="post">
                                                <!--<form  action="forgotPasswordContractor" autocomplete="off" onsubmit="return passwordMatch();">--> 
                                                    <div class="form-group">
                                                        <input type="hidden" value="${reg_Id}" name="reg_Id">
                                                           <input class="form-control Password otpfield" type="password" placeholder="New Password" id="createPwd" name="password" autocomplete="off">
                                                                <span class="form-text validateField" id="Passworderror"></span>
                                                                </div>
                                                                <div class="form-group">
                                                                  <input class="form-control Password" type="password" placeholder="Confirm Password" name="cPassword" id="confrmPassword" autocomplete="off">
                                                                  <span class="form-text validateField" id="cPassworderror"></span>
                                                                </div>

                                                                <!--end::Form-->
                                                                <!--begin::Action-->
                                                                <div class="k-login-v2__body-action k-login-v2__body-action--brand btn_justify"> 
                                                                   <button type="submit" class="btn btn-pill btn-brand btn-elevate" onsubmit="return createPwdMatch();">Create Password</button> 
                                                                    <a href="#" class="btn btn-danger btn-elevate"  onclick="reset1()"  data-dismiss="modal">Close</a>
                                                                </div>
                                                                <!--end::Action-->
                                                                <!--begin::Separator-->
                                                              
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
                $(document).ready(function(){
              var  secRegId ='<%= session.getAttribute("reg_Id")%>';
               var secContRegId='<c:out value="${reg_Id}"></c:out>';
//               alert("secContRegId "+secContRegId +"secRegId  " +secRegId);
               });
             function createPwdMatch() {
//                alert("Password is matching");
                var newPassword =   document.getElementById("createPwd").value;
                var confirmPassword = document.getElementById("confrmPassword").value;
                document.getElementById("Passworderror").innerHTML = " ";    
                document.getElementById("cPassworderror").innerHTML = " ";   
//               alert("newPassword    "+newPassword +" confirmPassword   " +confirmPassword);
                if (newPassword === "") {
                  console.log("newPassword is empty"); 
                 document.getElementById("Passworderror").innerHTML="Please Enter Password";    
                    return false;
                }
                if (confirmPassword === "") {
                   console.log("confirmPassword is empty");
                 document.getElementById("cPassworderror").innerHTML="Please Confirm Password";    
                    return false;
                }
                if (newPassword !== confirmPassword) {
                 console.log("newPasswordError Does Not Matched");
                 document.getElementById("cPassworderror").innerHTML = "Password Not Matched";
                 return false;
                 }
                else {
                    console.log("newPassword  Matched");
                    document.getElementById("Passworderror").innerHTML = " ";    
                    document.getElementById("cPassworderror").innerHTML = " ";    
                    return true;
                   }
            }       
              </script>
              