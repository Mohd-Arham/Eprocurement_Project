<div class="modal fade mdl_bg mdl_frm" id="bidWithDrawotp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
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
                                     
                                     
                                     
                                      <form id="verifyOTP" class="k-login-v2__body-form k-form k-login-v2__body-form--border" autocomplete="off"  role="form" >
                                      <div class="verify_imgicn text-center">
                                       <i class="flaticon-chat-1"></i>
                                        </div>
                                        <p>An OTP has been sent to your registered mobile number, Please enter the same to proceed.</p>
                                        <div class="form-group">
                                          
                                            
                                            <input class="form-control otp_input otpfield checkOtp"  name="enteredOtp" id="enteredOtp" type="text" placeholder="Enter OTP" onkeyup="checkoottpp(this)"  autocomplete="off">
                                            <button type="button" class="btn btn-pill btn-brand btn-elevate" onclick="validationOTP1();">Verify</button> 
                                         <button type="button" class="btn btn-default" id="closeOTP" data-dismiss="modal" hidden="true" >Close</button>
                                        </div>
                                        <span id="otperror" class="validateField d-block" style="color: red;"> </span> 
                                        <a  href="javascript:;"  onclick="getOTPcontractor();">
					  Resend OTP ?
						</a>
                                                        <button type="button" hidden="true" id="closeotpmodel" class="btn btn-secondary btn-sm" aria-label="Close" data-dismiss="modal"  >close</button> 
                                
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
       
            
          
        
         function getOTPcontractor(){
                 $('#enteredOtp').val("");
                     $('#otperror').val("");
            $.ajax({
                url: "getOTPforBidwithDraw",
                success: function (response) {
                  alert("response "+response);  
                    
             
                  },
                error: function () {
                    console.log('Upload error');
                }
            });
        }
         
            
            
            function checkoottpp(that){
             var otpp=that.value; 
            
             if(otpp.length<=4){
                 that.value=that.value.replace(/[^0-9]/g, ''); 
            
                 
             }else{
                that.value= that.value.substring(0,otpp.length-1);
             
                that.value=that.value.replace(that.value,that.value); 
             }
        
              
            }
            
            
          function validationOTP1(){
              
           var enteredOtp = $("#enteredOtp").val();
           
           alert("enteredOtp "+enteredOtp);
           if(enteredOtp==""||enteredOtp==null){
               
            $('#otperror').text("Enter OTP");   
               
           return false;    
               
           }else{
              $('#otperror').text("");   
               validationOTP(enteredOtp);
           return true;    
             
           }
       }
       
       
       function validationOTP(enteredOtp){
       
               $.ajax({
             url: "matchOTP?enteredOtp="+enteredOtp,
             success: function (res) {
                alert(res);
              if(res==true){
//              
//                $('#otpmatched').val('matched');
//                 
                  $('#closeotpmodel').click();
                  $('#otponBidWithDraw1').click();
//                  $('#saveData').click();
              }else{
//                   $('#otpmatched').val('notMatched');  
               $('#otperror').text("Entered OTP Not Matched");      
              }
                }
            });  
              
         }
            
            </script>
           
            
            
            