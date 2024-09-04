// Code goes here Contractor Registration
var app = angular.module("myApp", []);
app.controller("myCtrl", function ($scope, $http) {
    $scope.contractor_details = [];

      //alert("ok");
////("contractorController Script called");
//Save the Contractor data     
    $scope.saveContractor = function () {
   
////("saveContractor script called");
           var form = $("#Savecontractor").serialize();
//           alert(form);
           var resultValidate=validation();
//           console.log("Fields are empty :"+resultValidate);
//    alert("ok22");
        if(resultValidate==false){
               alert("Please fill all mandatory fields");
//               console.log("false  return");
               return;
           }
        console.log("validation value is true");
           $http.post("Contractorsave?form="+form)
                .then(function (response) {
//                    alert(response);

//                    alert("response  1 " + response.data[0]);
//                    alert("response  2 " + response.data[1]);
//                    //("response  3 " + response.data[2]);
//                    //("response  4 " + response.data);
//                    alert("Response is: " + JSON.stringify(response));
                    //when data saved successfully
                      if (response.data[0] == "Mobile  is already registered") {
                      // //("Mobile  is already registered");
                         swal(
                                '',
                                response.data[0],
                                'error'
                                )
                        $("#mobilenoError").html("Mobile  is already registered");
                         return false; 
//                        window.location.href = 'verifyMob';//commented on 19nov
                    }
                      if (response.data[0] == "Emailid is already registered") {
                      // //("Emailid is already registered");
                         swal(
                                '',
                                response.data[0],
                                'error'
                                )
                         $("#emailError").html("Emailid is already registered");
                         return false; 
//                        window.location.href = 'verifyMob';//commented on 19nov
                    }
                     if (response.data[0] == "Data Saved Sucessfully") {
                        //("Data Saved Successfully");
                         swal(
                                '',
                                response.data[0],
                                'success'
                                )
                       $('#otpFunction').click();  
//                        $scope.contractorRegId = response.data[1];
                       
//                        window.location.href = 'verifyMob';//commented on 19nov
                    }
                    //when data updated successfully without updating the email id  and mobile number                 
                    else if (response.data[0] == "Data Updated Successfully") {
                        swal(
                                '',
                                response.data[0],
                                'success'
                                )
                     
                        var contRegId=$('#contRegId').val();
                        window.location.href = 'viewPrimaryContractor?id='+contRegId;
                    }
                    //when data updated successfully by updating mobile number nad emailid are changed                

                    else if (response.data[0] == "Mobile is changed" && response.data[2] == "EmailId is changed") {
//                        //("both conditions checked");
                        swal(
                                '',
                                'Data Updated Successfully',
                                'success'
                                )
                           $('#otpForEdit').click();  
                    }

                    //data updated successfully either mobile no or email id is changed
                    else if (response.data[0] == "Mobile is changed") {
//                        //("either conditions checked");
                        swal(
                                '',
                                'Data Updated Successfully',
                                'success'
                                )
                        $('#otpForEdit').click();  
                    }
                    else if (response.data[0] == "EmailId is changed") {
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
                        angular.forEach(response.data, function (key, value) {
                            $("#" + value).html(key);
                        });
                     return false;
                    }
                      $('#close_button').click();
                  
                });

    };
//Clear the input field after submit data
    $scope.openModal = function () {
        $("#firstname").val("");
        $("#middlename").val("");
        $("#lastname").val("");
        $("#fullname").val("");
        $("#company").val("");
        $("#designation").val("");
        $("#mobile").val("");
        $("#email").val("");
        $("#password").val("");
        $("#password1").val("");
        $("#captcha").val("");
    };

//    $http.get("secondaryContractorDetails.action")
//            .then(function (response) {
//
//                $scope.all_Contractor = response.data;
////     //(response.data);
//            });


    $scope.saveSecondaryContractor = function () {

//     //("as");
        var form = $("#form").serialize();
        //(form);
        $http.post("savesecondaryContractor?form=" + form)
                .then(function (response) {

                    //("response is:" + response.data);

                    angular.forEach(response.data, function (key, value) {
//                     //("key is "+key+" value is "+value);

                        $("#" + value).html(key);
                    });
//        //$scope.contractor_details = response.data; 
//        
                    var message = response.data;
//        if (message !== "") {
//            swal(
//                    '',
//                    message,
//                    'error'
//                    )
//        }
//        var message = response.data;
//        if (message !== "") {
//            swal(
//                    '',
//                    message,
//                    'success'
//                    )
//        }
                    if (message == "Contarctor registration is successfull") {
                        //("btn is clicked");
                        $("#verifySecBtn").click();
                    }
                });
    };


    //Fetch dynamic template of empanelment
    $scope.fetchDynamicTemplate = function (templateId) {
        //("templateId   " + templateId);
        var fetchDynamicTemplateData = "fetchDynamicTemplate?templateId=" + templateId;
        $http.post(fetchDynamicTemplateData)
                .then(function (response) {
//          //(response.data);
                    $scope.dynamicTemplate = response.data;
                });
    };


//Fetch dynamic template data of empanelment
    $scope.fetchDynamicTemplateData = function (templatenameId) {
        //("templatenameId  " + templatenameId);
//        var labelnamearr = new Array();
        var fetchDynamicTemplateData = "fetchDynamicTemplateData?templatenameId=" + templatenameId;
        $http.post(fetchDynamicTemplateData)
                .then(function (response) {
            //(JSON.stringify(response.data));
              $scope.template_name_Id = templatenameId;
                 $scope.dynamicTemplateData = response.data;
                   
//                   var res = JSON.parse(JSON.stringify(response));
                   
//                    angular.forEach(res, function (value, key) {
//                        //("key  "+ res.length +"  value  "+value);
//                        if(key == 0){
//                          for (var i = 0; i < value.length; i++) {
//                        //("res " + key[i]);
//                    }   
//                        }
//                    });
//             $scope.template_name_Id = templatenameId;
//                    var filename=response.data.empanelmntTemplateFileUrl;
//                    //("filename  "+response.data.empanelmntTemplateFileUrl);
//                    $scope.filename=response.data.empanelmntTemplateFilename;

//                        labelnamearr = value["labelname"].split(',');
//                        for (var i = 0; i < labelnamearr.length; i++) {
//                            //("labelnamearr " + labelnamearr[i]);
//                        }
////                        //("value~~~~ " + value["number"]);
////                        //("value~~~~ " + value["empanelmntTemplateFileUrl"]);
//                });
        
//                    $scope.numberval = response.data.number;
//                    //("number  " + numberval);
//                  $scope.filenameval = response.data.filename;

        });
    };
    function validation(){
    var regex = /^[a-zA-Z]*$/;
        var reg = /^[a-zA-Z ]*$/;
        var num = /^[0-9]*$/;
        var mobNoreg = /^[0]?[789]\d{9}$/;
        var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;
        var contRegId=$('#contRegId').val();
        //("contractor id is: "+contRegId); 
        if(contRegId != 0 || contRegId!= '' ){
            console.log("insde if condition of validation");
             if(  $('#firstname').val() != '' && regex.test($('#firstname').val()) &&
                    $('#lastname').val() != '' && regex.test($('#lastname').val()) &&
                    $('#designation').val() != ''&& 
                    $('#dialCode').val() != '-1'&& 
                   $('#mobileno').val() != '' && mobNoreg.test($('#mobileno').val()) &&
                    $('#email').val() != '' && emailidreg.test($('#email').val())) 
      
            {
                console.log("validation is true");
                   $("#contractorTypeError").html(" ");   
//                 $('#close_button').click();
                  return true;
            }
            
        }
       
          if($('#firstname').val() != '' && regex.test($('#firstname').val()) &&
                    $('#lastname').val() != '' && regex.test($('#lastname').val()) &&
                    $('#designation').val() != ''&& 
                    $('#dialCode').val() != '-1'&& 
                    $('input[name=contractorType]:checked').length > 0 &&
                    $('#mobileno').val() != '' && mobNoreg.test($('#mobileno').val()) &&
                    $('#email').val() != '' && emailidreg.test($('#email').val()) &&
                    $('#password').val() != '' && passreg.test($('#password').val()) &&
                    $('#password').val() == $('#password1').val() &&
                    $('#captcha').val() != '' && num.test($('#captcha').val()))
            {
                console.log("validation is @@@@@@@@@@@ true");
                   $("#contractorTypeError").html(" ");   
//                 $('#close_button').click();
                  return true;
            } else {

                    $("#validatingForm").find('input[type=text],input[type=password],input[type=radio],select').each(function () {
                       console.log("name: "+this.name+" id: "+this.id + " value : "+ this.value );
                       
                      var span_astrict = $(this).parent().prevAll("label").next("span").text();
                      var label = $(this).parent().prevAll("label").text();
                      var count=0;
                      var checkRadio=$('input[name=contractorType]:checked').length > 0;
//                      console.log("label is:"+label+"span value  is:"+$(this).prev("span").text()+"span_astrict"+span_astrict);
                      if(((this.value === '') || (this.value=== '-1')) && ($(this).parent().prevAll("label").next("span").text())){
                          
                          if(this.id == 'dialCode'){
                              alert("palak "+this.id +"44   "+this.value);
                               if(this.value == '-1'){
                                   alert("MMMMMMMMMMMM");
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
                          
//                         
                          if(this.id=='password1'){
                            $("#"+this.id+"Error").text("");    
                          }else{
                              count++;
                          $("#"+this.id+"Error").text("Please Enter " + label);
//                            $("#contractorTypeError").html("Please Select Contractor Type"); 
                      }
                      }else{
                          $("#"+this.id+"Error").text("");
                      } 
                    });
                   return false;
                }
        
    }
         

});