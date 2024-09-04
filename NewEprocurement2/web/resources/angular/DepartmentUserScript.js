// Code goes here
var myApp = angular.module('myApp', []);
myApp.controller('MyController', function ($scope, $http, $interval) {
//function MyController($scope, $http) {
//    alert("angular");
     var tick = function() {
       //$scope.clock = Date.now();
         $http.get("FetchServerDate.action")
                .then(function (response) {
              //alert(response.data.time+":"+response.data.date);
                $scope.clock = response.data.time;
                $scope.date = response.data.date;
            });
        };
        tick();
        $interval(tick, 1000);
        
    $scope.currentPage = 1;
    $scope.pageSize = 10;
    $scope.all_departments = [];
    $scope.departmentUser = [];
    $scope.all_states = [];
    $scope.name1 = "";                                          
     
     
    
   
    //Call to fetch the department User
    $http.get("departmentDetails.action")
        .then(function (response) {
//          alert("all_departments"+JSON.stringify(response));
             $scope.all_departments = response.data;
        });
    
    //Call to update the department User
    $scope.editDeptUser = function(id){
//        alert(id);
       
        //id = parse(id);
        $http.get("updateDepartmentUser?id=" + id)
                .then(function (response) {
//                 alert(response);
                    $scope.departmentUser = response.data;
                    $scope.privi = $scope.departmentUser.userPrivileges;
                    var array = new Array();

                    array = $scope.privi.split(',');
                    for (i = 0; i <= 18; i++) {
                        $("#userPrivileges" + i).prop("checked", false);

                    }
                    angular.forEach(array, function (value, key) {
//                 alert(value);
                        $("#userPrivileges" + value).prop("checked", true);

                    });
                });
        $http.get("departmentDetails.action")
                .then(function (response) {
//             alert(response.data);
                    $scope.all_departments = response.data;
                });
    };
     
    $scope.showModel = function(){
//       alert("dfhdhfj");
       
     
       $(".form-control Name").val("");
    };
    
     $scope.showModel1 = function(){
        
        $scope.all_departments = "  ";
        var privilegeid = $("#privilegeid").val();
//      alert(privilegeid+"xcvgfghdgv");

        $http.post("privilegeshort?privilegeid=" + privilegeid)
                .then(function (response) {
                    $scope.all_departments = response.data;
                    if (response.data == "") {
                        alert("No DepartmentUser Have This Privilege");

                    }


                });
        
    };
    //Call to save the Secondary department User Details
    $scope.addSecondaryUser = function () {

        var checkValidation = deptUserClientValidation();
        alert(checkValidation + "checkValidation");
        if (checkValidation === 0) {
            $("#preloaderSpinner").show();
//        alert("addSecondaryUser ");
            var form = $("#form").serialize();
//      alert(form);   
            $http.post("saveDepartmentSecondaryUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                    .then(function (response) {
                        $("#preloaderSpinner").hide();

                        $('.ValidationMsg').html('');
                        var message = 'We Have Sent Activation Details On Registed Email Id. ';
                        if (response.data === "The DepartmentUser Registration Done Successfully" || response.data === "The DepartmentUser Details Updated Successfully")
                        {
                            alert(response.data);
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            window.location.href = 'manageDepartmentUser';
                        } else {
                            //var error = JSON.parse(response.data);
                            //alert(error);
                            angular.forEach(response.data, function (key, value) {
//                     alert("key is "+key+" value is "+value);

                                $("#" + value).html(key);
                            });
                        }




                    });    
         
        }
    };
    //Call to save the department User Details
    $scope.addMore = function () {
//     alert("register add more");
  var checkValidation = deptUserClientValidation();
        alert(checkValidation + "checkVaalidation");
        if (checkValidation === 0) {
          $("#preloaderSpinner").show();

        var form = $("#form").serialize();

        $http.post("saveDepartmentUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                .then(function (response) {
                    $("#preloaderSpinner").hide();
                    $('.ValidationMsg').html('');
                    var message = 'We Have Sent Activation link On Registed Email Id. ';

                    if (response.data === "The DepartmentUser Registration Done Successfully" || response.data === "The DepartmentUser Details Updated Successfully") {
                        alert(response.data);
                        swal(
                                '',
                                message,
                                'success'
                                )
                        window.location.href = "manageDepartmentUser";

                    } else {
                        //var error = JSON.parse(response.data);
                        //alert(error);
                        angular.forEach(response.data, function (key, value) {
//                     alert("key is "+key+" value is "+value);

                            $("#" + value).html(key);
                        });
                    }
                }); 
            
            
        }
        


    }; 
    
    
    $scope.updateBasic = function () {
//     alert("register add more");
  var checkVaalidation = deptUserClientValidationForBasic();
        alert(checkVaalidation + "checkVaalidation");
        if (checkVaalidation === 0) {
         
            $('#getotp').click();
               
              
            
        }
        


    }; 
    
    
     $scope.updateBasicSecondaryUser = function () {

        var checkValidation = deptUserClientValidationForBasic();
        alert(checkValidation + "checkValidation");
        if (checkValidation === 0) {
               $('#getotp').click();
               
              
          
        }
    };
    
    
      $scope.updatePrivilege = function () {
//     alert("register add more");
  var checkVaalidation = deptUserClientValidationForprivilege();
        alert(checkVaalidation + "checkVaalidation");
        if (checkVaalidation === 0) {
          $('#getotp').click();
               
              
            
            
        }
        


    }; 
    
    
     $scope.updatePrivilegeSecondaryUser = function () {

        var checkVaalidation = deptUserClientValidationForprivilege();
        alert(checkVaalidation + "checkVaalidation");
        if (checkVaalidation === 0) {
            $('#getotp').click();
               
                 
           
        }
    };
    
    
    
    $scope.saveDeptUser=function (){
        
       
         $("#preloaderSpinner").show();

        var form = $("#form").serialize();

        $http.post("saveDepartmentUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                .then(function (response) {
                    $("#preloaderSpinner").hide();
                    $('.ValidationMsg').html('');
                    var message = 'We Have Sent Activation link On Registed Email Id. ';

                    if (response.data === "The DepartmentUser Registration Done Successfully" || response.data === "The DepartmentUser Details Updated Successfully") {
                        alert(response.data);
                        swal(
                                '',
                                message,
                                'success'
                                )
                        window.location.href = "manageDepartmentUser";

                    } else {
                        //var error = JSON.parse(response.data);
                        //alert(error);
                        angular.forEach(response.data, function (key, value) {
//                     alert("key is "+key+" value is "+value);

                            $("#" + value).html(key);
                        });
                    }
                }); 
    };
    
     $scope.saveDeptUserSecondary=function (){
          
     
          $("#preloaderSpinner").show();
            var form = $("#form").serialize();
//      alert(form);   
            $http.post("saveDepartmentSecondaryUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                    .then(function (response) {
                        $("#preloaderSpinner").hide();

                        $('.ValidationMsg').html('');
                        var message = 'We Have Sent Activation Details On Registed Email Id. ';
                        if (response.data === "The DepartmentUser Registration Done Successfully" || response.data === "The DepartmentUser Details Updated Successfully")
                        {
                            alert(response.data);
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            window.location.href = 'manageDepartmentUser';
                        } else {
                            //var error = JSON.parse(response.data);
                            //alert(error);
                            angular.forEach(response.data, function (key, value) {
//                     alert("key is "+key+" value is "+value);

                                $("#" + value).html(key);
                            });
                        }




                    });
         
     };
  
    
    
    
    
 
    //Call to save the department User Details
    $scope.addMoreForDeptUser = function () {
        
         var checkValidation = deptUserClientValidationForBasic();
        alert(checkValidation + "checkValidation");
        if (checkValidation === 0) {
            
            $('#getotp').click();
               
           
             
              
        }
    };
    
      $scope.updateForDeptUser= function(){
//     alert("register add more");
        $("#preloaderSpinner").show();
        var form = $("#form").serialize();

        $http.post("saveDepartmentUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                .then(function (response) {
                    $("#preloaderSpinner").hide();
                    $('.ValidationMsg').html('');

                     var message = 'We Have Sent Activation Details On Registed Email Id. ';
                    if (response.data === "The DepartmentUser Registration Done Successfully" || response.data === "The DepartmentUser Details Updated Successfully") {
                        
                        swal({
                        title: response.data,
                        text: message,
                        type: 'success',
                        showCancelButton: false,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Ok'
                      }).then((result) => {
                        if (result.value){ 
                         window.location.href = '/';
                            }
                        });
                        
                        
                       
                    } else {
                        //var error = JSON.parse(response.data);
                        //alert(error);
                        angular.forEach(response.data, function (key, value) {
//                     alert("key is "+key+" value is "+value);

                            $("#" + value).html(key);
                        });
                    }
                });

    };
    
    
       //Call to save the Secondary department User Details
    $scope.addSecondaryUserForDeptUser = function () {
  var checkValidation = deptUserClientValidationForBasic();
        alert(checkValidation + "checkValidation");
        if (checkValidation === 0) {
            
            $('#getotp').click();
               
           
             
              
        }
       
    };
    
    $scope.updateSecondaryUserForDeptUser= function(){
         $("#preloaderSpinner").show();
//        alert("addSecondaryUser ");
            var form = $("#form").serialize();
//      alert(form);   
            $http.post("saveDepartmentSecondaryUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                    .then(function (response) {
                        $("#preloaderSpinner").hide();

                        $('.ValidationMsg').html('');
                        var message = 'We Have Sent Activation Details On Registed Email Id. ';
                        if (response.data === "The DepartmentUser Registration Done Successfully" || response.data === "The DepartmentUser Details Updated Successfully")
                        {
                                   swal({
                        title: response.data,
                        text: message,
                        type: 'success',
                        showCancelButton: false,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Ok'
                      }).then((result) => {
                        if (result.value){ 
                         window.location.href = '/';
                            }
                        });
                        } else {
                            //var error = JSON.parse(response.data);
                            //alert(error);
                            angular.forEach(response.data, function (key, value) {
//                     alert("key is "+key+" value is "+value);

                                $("#" + value).html(key);
                            });
                        }




                    });   
        
    }
   
   
    
    
    
    $scope.printDiv = function(divName) {       
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    };
    

});


