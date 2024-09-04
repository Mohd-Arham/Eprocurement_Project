<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade mdl_bg mdl_frm" id="forgotPasswordEmailModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">				 
            <div class="modal-body">
                
                <div class="k-login-v2">
                    <!--begin::Body-->
                    <div class="k-login-v2__body">

                        <!--begin::Wrapper-->
                        <div class="k-login-v2__body-wrapper">
                            <div class="k-login-v2__body-container">
                                <div class="modal-header">
                    <h5 class="modal-title logo-modal"> 
                        <a href="#" class="dpt_logo">
                            <img alt="Department Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" class="logo-width">
                        </a>
                     <span class="dpt_name_logo">Forgot Password</span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                                <!--begin::Form-->
                     <s:form  id="forgotPwdEmailModal" name="forgotPasswordEmailModal"  modelAttribute="commonlogin"   class="k-login-v2__body-form k-form k-login-v2__body-form--border"  autocomplete="off">
                                  <div id="forgotPasswordEmailPage">
                                     <span style="color:red;"><c:out value="${invalidUser}"/></span>
                                    <div class="form-group">
                                        <s:input path="emailid" name="emailid" id="forgotpwdEmail" placeholder="Enter Email Id/Contact No" class="form-control forgotpwdEmail" autocomplete="off" />     
                                        <span id="forgotpwdEmailError" class="form-text validateField forgotpwdEmailError"></span>  
                                     </div>
                                   <div class="form-group"> 
                                        <div class="captcha_div">
                                        <span class="responsive-img">
                                        <p id="forgotPasswordCaptcha"></p>
                                        </span>
                                       <a  href="#" onclick="forgotPasswordCaptcha();"><i class="flaticon-refresh"></i></a>
                                        </div>
                                        <div class="field_captcha_text">
                                            <label>Captcha Text</label>
                                            <s:input path="txtCaptchaInput" id="forgotPasswordCaptchaInput"  oninput="validateForgotPwdCaptcha(this);"  placeholder="Enter Captcha text here" class="form-control forgotPasswordCaptchaInput" />
                                            <span id="forgotPasswordCaptchaInputError" class="form-text validateField"></span>    
                                        </div>
                                   </div>
                                  </div>
                              <div class="k-login-v2__body-action k-login-v2__body-action--brand p-0">
                                   <button type="button"  class="btn btn-pill btn-brand btn-elevate" onclick="return forgotPasswordUser();">Submit</button>
                                </div>
                                  </s:form>

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
 
  

    
    


