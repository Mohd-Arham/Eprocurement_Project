<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade mdl_bg mdl_frm" id="cont_login_page" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                            <img alt="Department Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" style="width:120px ;height:120px" class="logo-width">
                        </a>
                     <span class="dpt_name_logo">Sign In</span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                                <!--begin::Form-->
                                <s:form  name="myForm1" id="myform1" modelAttribute="commonlogin" action="login"  class="k-login-v2__body-form k-form k-login-v2__body-form--border"  autocomplete="off">
                                  <div id="loginField">
                                      <span style="color:red;"><c:out value="${invalidUser}"/></span>
                                    <div class="form-group">
                                        <s:input path="emailid" id="emailid" name="emailid" placeholder="Enter Email Id/Contact No" class="form-control" autocomplete="off" />     
                                        <span id="emailFieldError" class="form-text validateField"></span>  
                                        <span id="emailidError" class="form-text validateField"></span>  
                                    </div>
                                    <div class="form-group">
                                        <s:password path="password" id="password" name="password" placeholder="Password" class="form-control Password" autocomplete="off" />
                                        <span id="passwordFieldError" class="form-text validateField"></span>  
                                        <span id="passwordError" class="form-text validateField"></span>  
                                    </div>

                                    <div class="form-group"> 
                                        <div class="captcha_div">
                                        <span class="responsive-img">
                                        <p id="loginCaptcha"></p>
                                        </span>
                                       <a  href="#" onclick="Captcha();"><i class="flaticon-refresh"></i></a>
                                        </div>
                                        <div class="field_captcha_text">
                                            <label>Captcha Text</label>
                                            <s:input path="txtCaptchaInput" id="loginCaptchaInput"  oninput="validate_captcha(this);" placeholder="Enter Captcha text here" class="form-control" />
                                            <span id="testCaptchaMsg" class="form-text validateField"></span>    
                                            <span id="loginCaptchaInputError" class="form-text validateField"></span>    
                                        </div>

                                    </div>
                                  </div>
                              

                                <!--end::Form-->

                                <!--begin::Action-->
                                <div class="k-login-v2__body-action k-login-v2__body-action--brand p-0">
                                    <a href="javascript:;" onclick="forgotPassword();" class="k-link k-link--brand">
                                        Forgot Password ?
                                    </a>
                                    <button type="submit"  class="btn btn-pill btn-brand btn-elevate" onclick="return validateLoginForm();">Sign In</button>
                                </div>
                                          
                                  </s:form>
<!--      <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                </div>-->
                                <!--end::Action-->

                                <!--begin::Separator-->
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

    
    


