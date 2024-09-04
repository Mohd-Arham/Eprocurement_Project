<%-- 
    Document   : ContractorRegistrationModal
    Created on : 5 Dec, 2018, 4:08:51 PM
    Author     : Windows7
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div id="preloaderSpinner_new" class="preloader spinner">
    <div class="spinWrap">
        <p class="spinnerImage"></p>
        <p class="loader"></p>
        <p class="loadingMessage" id="spinnerMessage_new"></p>
    </div>
</div>

<div class="modal fade" id="contaractorRegistrationForm" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="max-width:80%;">
            <s:form modelAttribute="contractor" class="registerForm" id="Savecontractor">
                <div id="validatingForm">
                    <div class="modal-content">
                       <div class="modal-header pd-header">
                    <h5 class="modal-title logo-modal"> 
                        <a href="#" class="dpt_logo">
                            <img alt="Department Logo" src="<c:url value="resources/assets/demo/media/logo-light.png"/>" style="width:120px ;height:180px" class="logo-width">
                        </a>
                     <span class="dpt_name_logo">Bidder Registration</span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                        <div class="modal-body" style="background-color: #f8f8f8;">
                            <div class="k-portlet" style="margin-bottom:0;"> 
                                 <c:if test="${contractor.id==null || contractor.id==''}">   
                                <div class="middle_radiobt">
                                    <div class="k-portlet__head"> 
                                        <div class="k-portlet__head-label">
                                            <h3 class="k-portlet__head-title">Register As:</h3><span class="staric">*</span>
                                        </div>
                                        <s:hidden path="otpStatus"/>  
                                        <div class="k-portlet__head-toolbar">
                                           <div class="k-radio-inline">
                                                <label class="k-radio">
                                                    <s:radiobutton path="contractorType"  id="contractorType1" value="indian"  /> Indian Bidder
                                                    <span></span>
                                                </label>
                                                <label class="k-radio">
                                                    <s:radiobutton path="contractorType"  id="contractorType2" value="foreign"  /> Foreign Bidder
                                                    <span></span>
                                                </label>
                                                     <span  class="validateField d-block" id="contractorTypeError"></span>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                                  </c:if>       
                            <div class="k-portlet__body ">
                                <div class="tab-content_registration">
                                    <!-- STEP_FIRST_FORM -->
                                    <div class="content_registration_form">
                                        <form class="k-form"> 
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                             <s:hidden path="id"  id="contRegId"/>
                                                        <label>First Name</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                            <s:input path="firstname" cssClass="form-control Name" id="firstname"  style="text-transform: uppercase;" oninput="join_names();" placeholder="" /> 
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                        </div>
                                                        <span class="form-text validateField" id="firstnameError"></span>
                                                    </div>
                                                    <div class="col-lg-4 mt-2">
                                                        <label class="">Middle Name</label> 
                                                        <div class="k-input-icon k-input-icon--right">
                                                            <s:input path="middlename" cssClass="form-control Name" style="text-transform: uppercase;" id="middlename" oninput="join_names();" placeholder=""  />
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                        </div>
                                                         <span class="form-text validateField" id="middlenameError"></span>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <label class="">Last Name</label><span class="staric">*</span>
                                                           <div class="k-input-icon k-input-icon--right">
                                                            <s:input path="lastname" cssClass="form-control Name" id="lastname" style="text-transform: uppercase;" oninput="join_names();" placeholder="" value="" />
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                        </div>
                                                        <span class="form-text validateField" id="lastnameError"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label>Full Name</label>
                                                        <div class="k-input-icon k-input-icon--right">
                                                            <s:input path="fullname" cssClass="form-control fullnameinput" id="fullname" style="text-transform: uppercase;cursor: d;cursor: no-drop;" readonly="true"/>
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                        </div>
                                                        <span class="form-text"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Designation</label><span class="staric">*</span>
                                                        <div>
                                                        <s:select path="designation" id="designation" class="form-control select designation" required="true">
                                                            <s:option value="">Select</s:option>
                                                            <c:forEach var="contDesignationList" items="${contDesignationList}">
                                                          <s:option value="${contDesignationList.desigid}">${contDesignationList.desigName}</s:option>
                                                            </c:forEach>
                                                         </s:select>
                                                       <span class="form-text validateField" id="designationError"></span>
                                                        </div>
                                                        </div>
                                                    <div class="col-lg-6" id="otherDes">
                                                        <label class="">Other</label><span class="staric">*</span>
                                                        <s:input path="otherDesignation" cssClass="form-control "  id="otherDesignation"  value=""/>
                                                        <span class="form-text"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label class="">Mobile No.</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                           <s:select path="dialCode" id="dialCode" class="form-control float_lft p-0 dialCode" >
                                                                    <s:option value="-1">Select</s:option>
                                                                    <s:option value="+91">+91</s:option>
                                                                    <s:option value="+223">+223</s:option>
                                                                 </s:select>
                                                             <s:input path="mobileno" cssClass="form-control Mobile_No mob_no mobileno"  id="mobileno"   value=""/>
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                        </div>
                                                      <span class="form-text validateField" id="dialCodesError"></span>
                                                      <span class="form-text validateField mobilenoError" id="mobilenoError"></span>
                                                      </div>
                                                    <div class="col-lg-6">
                                                        <label>Email ID</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                            <s:input path="emailid"  cssClass="form-control Email_Id emailId"  id="email" placeholder=""   value="" />
                                                           <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-envelope"></i></span></span>
                                                        </div>
                                                          <span class="form-text validateField emailIdError" id="emailError"></span>
                                                      </div> 
                                                </div>
                                            </div>
                                           <c:if test="${contractor.password==null || contractor.password==''}">    
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label class="">Password</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                            <s:password path="password" cssClass="form-control passwordCont" id="passwordCont" placeholder=""   value=""  />
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-lock"></i></span></span>
                                                        </div>
                                                        <span class="form-text validateField" id="passwordContError"></span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label>Confirm Password</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                            <input type="password" name="password1" Class="form-control Confirm_Password" id="password1" placeholder=""   value="" />
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-lock"></i></span></span>
                                                        </div>
                                                        <span class="form-text validateField" id="password1Error" ></span>
                                                    </div> 
                                                </div>
                                            </div>
                                              </c:if>
                                                <c:if test="${contractor.id==null || contractor.id==''}">     
                                            <div class="form-group border_boxesDiv mrgin_autowidth"> 
                                                <div class="captcha_div">
							<span class="responsive-img">
							<p id="txtCaptcha"></p>
							</span>
							<a href="#" id="captchaVal" onclick="DrawCaptcha();"><i class="flaticon-refresh"></i></a>
							</div>
					           <div class="field_captcha_text">
                                                    <label>Captcha Text</label><span class="staric">*</span>
                                                    <div>
                                                    <input type="text" id="captcha" onchange="ValidatingCaptcha();"  oninput="validate_captcha(this);" class="form-control" placeholder=" ">
                                                <span class="form-text validateField" id="validatingCaptcha"></span>        <span class="form-text validateField" id="captchaError"></span>
                                                    </div>
                                                    </div> 
                                            </div>
                                              </c:if>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success sbtbtn" id="sbtbtn"  onclick="saveContractor();">Register</button> 
                        <button type="reset" class="btn btn-primary">Reset</button> 
                        <button type="button" class="btn btn-secondary close_button" id="close_button" data-dismiss="modal">Close</button>
                    </div>
                </div>
                </div>
            </s:form>
        </div>
    </div>
 <style>
     #preloaderSpinner_new.preloader.spinner{
         background:#ffffff4d!important;
     }
 </style>
<script>
  function saveContractor()
            {
               // alert("!!!!!1111");
                 $('#preloaderSpinner_new').css('z-index','99999');
                 $('#preloaderSpinner_new').css('opacity:','0.8');
                 $('#preloaderSpinner_new').css('background:','#ffffff4d','!important' );
                 $("#preloaderSpinner_new").show();
               //   alert("@@@@@@@@@@@@@@@@@@");
                 var form = $("#Savecontractor").serialize();
                 var resultValidate=validation();
               
                console.log("result for validation is  "+resultValidate);
                 if(resultValidate==false){
                 $("#preloaderSpinner_new").hide();
//                 alert("Please fill all mandatory fields");
//               console.log("false  return");
                  return;
                  }
                $.ajax({
                    url: "Contractorsave",
                    method: 'POST',
                    data: form,
                   success: function (response) {
                   $("#preloaderSpinner_new").hide();
                   var res=response.length;
                   var res1 = response[0];
                   console.log("response are : 1 "+res1 +" and 2: "+ response[1]);
                   if (response[0] == "Mobile  is already registered") {
                      // //("Mobile  is already registered");
                         swal(
                                '',
                               response[0],
                                'error'
                                )
                        $("#mobilenoError").html("Mobile  is already registered");
                         return false; 
//                        window.location.href = 'verifyMob';//commented on 19nov
                    }
                      if (response[0] == "Emailid is already registered") {
                      // //("Emailid is already registered");
                         swal(
                                '',
                               response[0],
                                'error'
                                )
                         $("#emailError").html("Emailid is already registered");
                         return false; 
//                        window.location.href = 'verifyMob';//commented on 19nov
                    }
                     if (response[0] == "Data Saved Sucessfully") {
                        //("Data Saved Successfully");
                         swal(
                                '',
                             response[0],
                                'success'
                                )
                       $("#contractorRegId").val(response[1]);
                     //  otpRegContractor();
                     
                       
//                        $scope.contractorRegId = response.data[1];
                       
//                        window.location.href = 'verifyMob';//commented on 19nov
                    }
                    //when data updated successfully without updating the email id  and mobile number                 
                    else if (response[0] == "Data Updated Successfully") {
                        swal(
                                '',
                               response[0],
                                'success'
                                )
                     
                        var contRegId=$('#contRegId').val();
                        window.location.href = 'viewPrimaryContractor';
                    }
                    //when data updated successfully by updating mobile number nad emailid are changed                

                    else if (response[0] == "Mobile is changed" && response[1] == "EmailId is changed") {
//                        //("both conditions checked");
                        swal(
                                '',
                                'Data Updated Successfully',
                                'success'
                                )
                           $('#otpForEdit').click();  
                    }

                    //data updated successfully either mobile no or email id is changed
                    else if (response[0]== "Mobile is changed") {
//                        //("either conditions checked");
                        swal(
                                '',
                                'Data Updated Successfully',
                                'success'
                                )
                        $('#otpForEdit').click();  
                    }
                    else if (response[0] == "EmailId is changed") {
//                        //("EmailId either conditions checked");
                        swal(
                                '',
                                'Data Updated Successfully',
                                'success'
                                )
                        swal(
                                '',
                                'Confirmation Link has been send to your account',
                                'success'
                                )
                        window.location.href = 'logoutContractor';
                    }

                    else {
                       $("#showError").click();
                       var obj = JSON.parse(response);
                       $.each(obj, function (key, value) {
                          $("#"+key).html(value);
                        });
                     return false;
                    }
                      $('#close_button').click();
                    }, error: function (error) {
//                            alert("error : " + error);
                        return false;
                          }
                         });
          }
     function validation(){
        var regex = /^[a-zA-Z]*$/;
        var reg = /^[a-zA-Z]/;
        var num = /^[0-9]*$/;
        var mobNoreg = /^[0]?[789]\d{9}$/;
        var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;
//        var contRegId=$('#contRegId').val();
//        alert("contractor id is: "+contRegId); 
        if($('#firstname').val() != '' && reg.test($('#firstname').val()) &&
                    $('#lastname').val() != '' && reg.test($('#lastname').val()) &&
                    $('#designation').val() != ''&& 
                    $('#dialCode').val() != '-1'&& 
                    $('input[name=contractorType]:checked').length > 0 &&
                    $('#mobileno').val() != '' && mobNoreg.test($('#mobileno').val()) &&
                    $('#email').val() != '' && emailidreg.test($('#email').val()) &&
                    $('#passwordCont').val() != '' && passreg.test($('#passwordCont').val()) &&
                    $('#password1').val() != '' && passreg.test($('#password1').val()) &&
//                    $('#passwordCont').val() == $('#password1').val() &&
                    $('#captcha').val() != '' && num.test($('#captcha').val()))
            {
                console.log("validation is true when regid is 0");
                   $(".validateField").html("");
                  return true;
            } else {

                    $("#validatingForm").find('input[type=text],input[type=password],input[type=radio],select').each(function () {
                      var span_astrict = $(this).parent().prevAll("label").next("span").text();
                      var label = $(this).parent().prevAll("label").text();
                      var count=0;
                      var checkRadio=$('input[name=contractorType]:checked').length > 0;
                      console.log("label is:"+label+"span value  is:"+$(this).prev("span").text()+"span_astrict"+span_astrict);
                      if(((this.value === '') || (this.value=== '-1')) && ($(this).parent().prevAll("label").next("span").text())){
                          if(this.id == 'dialCode'){
                            if(this.value == '-1'){
                                $("#dialCodesError").html("Please Select Dial Code"); 
                                }
                          }
                         if ($('input[name=contractorType]:checked').length > 0) {
                                console.log("in that condition:"+checkRadio);
                              $("#contractorTypeError").html(" ");   
                             }else{
                                 console.log("in this condition:"+checkRadio);
                                 count++;
                                $("#contractorTypeError").html("Please Select Contractor Type");      
                             }
                           $("#"+this.id+"Error").text("Please Enter " + label);
                         }else{
                          $("#"+this.id+"Error").text("");
                      } 
                    });
                   return false;
                }
        
    }
    
      function concatenate(/*String*/string_one, /*String*/string_two, /*String*/string_three, /*boolean*/with_space) {
                                if (with_space === true) {
                                return string_one + ' ' + string_two + ' ' + string_three;
                                }
                                else {
                                return string_one + string_two + string_three;
                                }
                                }
                        function join_names() {
                        var input_name_first = document.getElementById("firstname").value;
                                var input_name_middle = document.getElementById("middlename").value;
                                var input_name_last = document.getElementById("lastname").value;
                                var fullname = document.getElementById('fullname');
                                var var_name_full = input_name_first + ' ' + input_name_middle + ' ' + input_name_last;
                                document.getElementById('fullname').value = var_name_full;
                        }
                        
     </script>