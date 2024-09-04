<%-- 
    Document   : otpmodal
    Created on : 16 Aug, 2018, 12:23:04 PM
    Author     : Windows7
--%>

<!DOCTYPE html>
<html lang="en">
<head>
 <title>Lotus Procure</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/new-dashboard.css">
    <link rel="stylesheet" href="resources/css/commoncss.css">
    <link rel="stylesheet" href="resources/css/wizards-style.css">
    <script src="resources/js/jquery-1.10.2.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  <!-- 
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>-->
  <style>
 img.otpimg {
    max-width: 0;
    min-width: 100%;
    position: relative;
    top: -14px;
}
.otpfield{
    display: inline-block;
    width: 70%;
}
 .rightotp p{
    color: #867b7b;
    font-weight: 600;
    font-size: 13px;
    text-align: justify;
}
.rightotp .btn.btn-primary{
letter-spacing: 0.06em;
    font-size: 13px;
    font-weight: 600;
}
img.otpsmal {
    margin-right: 52px;
}
.rightotp {
    margin: 14px 0;
}
.small-modaltitle{
font-size:17px;
}

  </style>

</head>
<body background="resources/images/background_image.PNG">
<div class="container">
<div class="modal fade in" id="myModalDeptUser" data-backdrop="static" role="dialog" >
    <div class="modal-dialog modal-sm" style="width: 500px;">
      <div class="modal-content">
        <div class="modal-header1">
         
         <h4 class="modal-title categoryTitle small-modaltitle"><img src="resources/img/logo.png" alt="modal_logo" class="otpsmal">Enter One Time Password</h4>
        </div>
        <div class="modal-body">
<div class="row">
<div class="col-md-4">
       <div class="otpmodal">
   <img src="resources/img/mobile_verfi.png" alt="otpimage" class="otpimg">
   </div>
   </div>
   <div class="col-md-8">
   <div class="rightotp"><p>An OTP has been sent to your registered mobile number, please enter the same to proceed.</p>
    <form id="veryfyotp" action="verifyOTPDeptUser" role="form" onsubmit="return otpMatch();">
        <input type="hidden" id="generatedotp" name="generatedotp" value="${generatedotp}">
         <span id="validateOTP" style="color: red"></span>
           <div class="form-group">
               <input type="text" class="form-control otpfield" id="usr" placeholder="Enter OTP" name="verifyingotp">
 
 
</div>
         <button type="submit" class="btn btn-primary">Verify</button>
         <button type="button" class="btn btn-success" onclick="resendOTP();">resend OTP</button>
     </form>   
   </div>
   </div>
 
        </div>
   
        </div>
 
      </div>
    </div>
  </div>
  </div>
</body>
        <script>
            $(document).ready(function () {
                var generatedotp = $("#generatedotp").val();
                alert("generatedotp::" + generatedotp);
            });
        </script> 
        <script>
            $(document).ready(function () {
                $('#myModalDeptUser').modal({backdrop: 'static', keyboard: false})  
            });
        </script>
        
        
        <script type="text/javascript">
            function otpMatch() {
                var generatedotp = $("#generatedotp").val();
                var verifying_otp = document.getElementById("verifyingotp").value;
                if (verifying_otp === "") {
                    var message = 'Must Keep OTP To Verify';
                    if (message !== "") {
                        swal(
                                '',
                                message,
                                'error'
                                )
                    }
                    return false;
                }
                if (generatedotp === verifying_otp) {
                    return true;
                }
                else {
                    document.getElementById("validateOTP").innerHTML = "OTP Does Not Matched";
                    return false;
                }
            }
            
            function resendOTP(){
                   alert("otp");
               $.ajax({
                            
                   url:"resendOTP", 
                   success:function (response){
                       alert("OTP ::"+response);
                        $("#generatedotp").val(response);
                   }
                    
                   
                    
        });
                  
                  
                  
              }
        </script>
</html>

