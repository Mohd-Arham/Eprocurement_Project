<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal fade" id="secondaryContractorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="max-width:80%;">
          <form:form  class="registerForm" modelAttribute="secondrycontractor" id="form"  action="savesecondaryContractor">
                  <form:hidden path="address"/>
                                    <form:hidden path="primaryContractor_regId" value="${regId}"/>
                                    <form:hidden path="contractorSecndry_regId"/> 
              <div id="validatingForm">
                    <div class="modal-content">
                        <!--<div class="modal-header">
                                                                                                                                        </div>-->
                        <div class="modal-body" style="background-color: #f8f8f8;">
                            <div class="k-portlet" style="margin-bottom:0;"> 
                            <div class="k-portlet__body k-scroll k-scroller ps ps--active-y scroll_y" data-scroll="true" data-height="400"  data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                                <div class="tab-content_registration">
                                    <!-- STEP_FIRST_FORM -->
                                    <div class="content_registration_form">
                                        <form class="k-form"> 
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                       <label>First Name</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                               <form:input path="firstName" cssClass="form-control Name" id="firstNameError" oninput="join_names();"  placeholder="Enter FirstName" /> 
                                                           <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                        </div>
                                                        <span class="form-text validateField" id="firstNameError"></span>
                                                    </div>
                                                   <div class="col-lg-4">
                                                        <label class="">Last Name</label><span class="staric">*</span>
                                                         
                                                        <div class="k-input-icon k-input-icon--right">
                                                             <form:input path="lastName" cssClass="form-control Name" id="lastname" oninput="join_names();" placeholder="Enter LastName" value="" />
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                        </div>
                                                        <span class="form-text validateField" id="lastNameError"></span>
                                                    </div>
                                                </div>
                                            </div>
                                          
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Designation</label><span class="staric">*</span>
                                                        <div>
                                                          <form:select path="designation" id="designation" class="form-control select" >
                                                                        <form:option value="">Select Designation</form:option>
                                                                        <c:forEach var="contDesignationList" items="${contDesignationList}">
                                                                        <form:option value="${contDesignationList.desigid}">${contDesignationList.desigName}</form:option>
                                                                      </c:forEach>
                                                            </form:select>
                                                       <span class="form-text validateField" id="designationError"></span>
                                                        </div>
                                                        </div>
<!--                                                    <div class="col-lg-6" id="otherDes">
                                                        <label class="">Other</label><span class="staric">*</span>
                                                        <s:input path="otherDesignation" cssClass="form-control "  id="otherDesignation"  value=""/>
                                                        <span class="form-text"></span>
                                                    </div>-->
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv"> 
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label class="">Mobile No.</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                          <form:input path="mobileno" cssClass="form-control Mobile_No" id="mobile_no"   value="" placeholder="Enter MobileNo"/>
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                        </div>
                                                      <span class="form-text validateField" id="mobile_noError"></span>
                                                      </div>
                                                    <div class="col-lg-6">
                                                        <label>Email ID</label><span class="staric">*</span>
                                                        <div class="k-input-icon k-input-icon--right">
                                                          <form:input path="emailid"  cssClass="form-control Email_Id"  id="emailid" placeholder="Enter Email"   value="" />
                                                           <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-envelope"></i></span></span>
                                                        </div>
                                                          <span class="form-text validateField" id="emailidError"></span>
                                                      </div> 
                                                </div>
                                            </div>
                                    
                                        </form>
                                    </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary close_button" id="close_button" data-dismiss="modal">Close</button>
                        <button type="reset" class="btn btn-primary">Reset</button>
                          <c:if test="${action=='edit'}">
                                <button type="button" onclick="validateForm();" class="btn btn-success sbtbtn1" id="sbtbtn">Update</button>
                               </c:if>
                           <c:if test="${action!='edit'}">
                                 <button type="button" onclick="validateForm();" class="btn btn-success sbtbtn1" id="register">Register</button>
                          </c:if>
                      </div>
                </div>
                </div>
          </form:form>
        </div>
    </div>

    <script>
     $(document).ready(function () {
             
          var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var firstregex = new RegExp(
                        '^(([a-zA-Z ]+$))'
                 );

                var mobregex = new RegExp(
                        '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                        );

                var emailregex = new RegExp(
                        '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                        '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                        '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                        );
               

                    $('.Name').on('input', function (e) {
                    var id = this.id;
                    console.log(this.id + "is" );
                    if (firstregex.test($(this).val())) {
                        $("#"+id+"Error").html(" ");
                    } else {
                        $("#"+id+"Error").html("Please Enter Alphabets Only");
                        $("#"+id).val(' ');
                   }
              });
                 $('.select').on('change', function (e) {
                     if ($('.select').val() !== '-1') {
                        $("#"+this.id+"Error").html(" ");
                        console.log("success");
                    } else {
                        $("#"+this.id+"Error").html("Please Select The Required Field");
                         $("#"+id).val(' ');
                        console.log("error");
                    }

                });

                $('.Mobile_No').on('change', function (e) {
                    if (mobregex.test($(this).val())) {
                        $("#"+this.id+"Error").html(" ");
                        console.log("success");
                    } else {
                        $("#"+this.id+"Error").html("Please Enter Valid Phone Number");
                        $("#"+this.id).val(" ");
                    }
                  });
                $('.mob_no').on('input', function (e) {
                $("#"+this.id+"Error").html("");
                this.value = this.value.replace(/[^0-9\.]/g,"");
               if(this.value === ''){
                $("#"+this.id+"Error").html("Please Enter Valid Phone Number");
                    }else{
                          $("#"+this.id+"Error").html("");
                    }
                   });

            
                $('.Email_Id').on('change', function (e) {
                 if (emailregex.test($(this).val())) {
                        $("#"+this.id+"Error").html(" ");
                        console.log("success");
                    } else {
                        $("#"+this.id+"Error").html("Please Enter Valid Email Id");
                        console.log("error");
                    }

                 });
            });
        </script>
        <script>
    $(document).ready(function () {
      var email = $("#emailid").val();
//        alert("contReg "+contReg+"  desui"+desui);
        $("#emailid").change(function () {
            $.ajax({
                url: "CheckEmail",
                data: {email: email},
                success: function (res) {
//                   alert(res);
                    if (res !== "valid Email") {
                       $("#emailidError").html("Email Id Is Already Registered");
                        $("#"+this.id).val(" ");
                     else {
                       $("#"+this.id+"Error").html("");
                        $('.sbtbtn1').removeAttr('disabled'); 
                   }
                }
               }, error: function (error){
//               alert("error : "+error); 
               }
         
         });
       });
      $("#mobileno").change(function () {
      var mobile=$("#mobile_no").val();    
      $.ajax({
                url: "checkUserContact",
                data: {mobile: mobile},
                success: function (res) {
//                               alert(res);
                    if (res !== "valid mobile_no") {
//                                    alert("done");
                   
                        $("#"+this.id+"Error").html("Mobile Number. Is Already Registered");
                        $("#"+this.id).val(" ");
//                         $('.sbtbtn1').attr('disabled', 'disabled');
                    }
                    else {
                        $("#"+this.id+"Error").html("");
                        $('.sbtbtn1').removeAttr('disabled'); 
                    }
                }, error: function (error){

               }
            });
    
        });
    });
</script>

<script>
    function validateForm(){
//    alert("validateForm ");
    
     var form = $("#form").serialize();
//     alert(form);
      $.ajax({
          url: "validate?secondaryContractor="+form,
           success: function (res) {
//                    alert(res);
                    if(res === 'Noerror'){
                        
                  $('#form').submit();
                       }else{ 
                         
                  $.each(JSON.parse(res), function (key, value) {
                         
//                     alert("key is "+key+" value is "+value);
                      $("#"+key).html(value);
                       
                  });
      }
   }
});  

  }
</script>

<script>
    $(document).ready(function () {
    $(function () {
            $('.sbtbtn1').attr('disabled', 'disabled');
        });
        var regex = /^[a-zA-Z]*$/;
        var reg = /^[a-zA-Z ]*$/;
        var mobNoreg = /^[0]?[789]\d{9}$/;
        var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
       $('input[type=text],input[type=select]').keyup(function () {
         if ($('#firstname').val() != '' && regex.test($('#firstname').val()) &&
                    $('#lastname').val() != '' && regex.test($('#lastname').val()) &&
                    $('#company').val() != '' && reg.test($('#company').val()) &&
                    $('#designation').val() != ''&&
                    $('#mobile_no').val() != '' && mobNoreg.test($('#mobile_no').val()) &&
                    $('#email').val() != '' && emailidreg.test($('#email').val()) 
              {
               $('.sbtbtn1').removeAttr('disabled');
            } else {

                $('.sbtbtn1').attr('disabled', 'disabled');
            }
        });
    });
             
</script>





