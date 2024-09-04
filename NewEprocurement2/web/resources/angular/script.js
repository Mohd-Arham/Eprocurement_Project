// Code goes here
var myApp = angular.module('myApp', []);
myApp.filter('startFrom', function () {
    return function (input, start) {
        start = +start; //parse to int
        return input.slice(start);
    }
});

function MyController($scope, $http, $window) {
    $scope.all_Category = [];
    $scope.all_AreaOfWork = [];
    $scope.all_Keyword = [];
    $scope.all_departments = [];
    $scope.departmentUser = [];
    $scope.all_states = [];

    $scope.name1 = "";

    $scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.data = [];
    $scope.activeTab = 0;

///*
//     * Function to run the tik tak clock  
//     */
//    var tick = function() {
//       // $scope.clock = Date.now();
//         $http.get("FetchServerDate.action")
//                .then(function (response) {
//              //alert(response.data.time+":"+response.data.date);
//                $scope.clock = response.data.time;
//                $scope.date = response.data.date;
//            });
//        }
//        tick();
//        $interval(tick, 1000);


    for (var i = 0; i < 2; i++) {
        $scope.data.push("Item" + i);

    }
    $scope.numberOfPages = function () {
        return Math.ceil($scope.data.length / $scope.pageSize);
    }
    $scope.activateTab = function (indx) {
        $scope.activeTab = indx
    };

    $scope.$watch('currentPage', function () {
        $scope.activeTab = 0;
    })
    //Call to fetch the department User
    $http.get("departmentDetails.action")
            .then(function (response) {
                $scope.all_departments = response.data;
            });

//Onload Circle, Division and Subdivision
    $http.get("getCircleByAjax.action")
            .then(function (response) {
                $scope.msg_Circle = "";
                $scope.circles = response.data;
                angular.forEach(response.data, function (value, key) {
                    if (key == 0) {
                        $http.get("getDivisionByAjax.action?circleid=" + value.circleid)
                                .then(function (response) {
                                    angular.forEach(response.data, function (value, key) {
                                        if (key == 0) {
                                            $http.get("getSubDivisionByAjax.action?division_id=" + value.division_id)
                                                    .then(function (response) {
                                                        $scope.subdivisions = response.data;
                                                    });
                                        }
                                    });
                                    $scope.divisions = response.data;
                                });
                    }
                });
                if (response.data == "") {
                    $scope.msg_Circle = "Circle is not available.";
                }
            });

    $http.get("getProductcategory.action")
            .then(function (response) {
                $scope.msg_ProductCat = "";
                $scope.productcategories = response.data;

                angular.forEach(response.data, function (value, key) {
                    if (key == 0) {
                        $http.get("getProductSubCategory.action?productCategoryId=" + value.productCategoryId)
                                .then(function (response) {
                                    $scope.productsubcategories = response.data;
                                });
                    }
                });
                if (response.data == "") {
                    $scope.msg_ProductCat = "ProductCategory is not available.";
                }
            });

//Onload Countries,State and City
    $http.get("getCountryByAjax.action")
            .then(function (response) {
                $scope.msg_Country = "";
                $scope.all_country = response.data;

                angular.forEach(response.data, function (value, key) {
                    if (key == 0) {
                        $http.get("Showstate.action?country_id=" + value.country_id)
                                .then(function (response) {
                                    angular.forEach(response.data, function (value, key) {
                                        if (key == 0) {
                                            $http.get("getCitiesByAjax.action?state_id=" + value.state_id)
                                                    .then(function (response) {
                                                        $scope.all_cities = response.data;
                                                    });
                                        }
                                    });
                                    $scope.all_states = response.data;
                                });
                    }
                });
                if (response.data == "") {
                    $scope.msg_Country = "Country is not available.";
                }
            });

//Onload Tender Category,Area of work and Tender Keyword
    $http.get("fetchTenderCategory.action")
            .then(function (response) {
                $scope.all_Category = response.data;
                angular.forEach(response.data, function (value, key) {
                    if (key == 0) {
                        var tender_category_id = value.tender_category_id;
                        $http.post("fetchAreaOfWork.action?tender_category_id=" + tender_category_id)
                                .then(function (response) {
                                    $scope.msg_AreaOfWork = "";
                                    $scope.msg_Keyword = "";
                                    $scope.all_AreaOfWork = response.data;
                                    if (response.data == "") {
                                        $scope.msg_AreaOfWork = "Area Of Work is not available.";
                                        $scope.all_Keyword = "";
                                        $scope.msg_Keyword = "Keyword is not available.";
                                    }
                                    angular.forEach(response.data, function (value, key) {
                                        if (key == 0) {
                                            var areaofwork_id = value.areaofwork_id;
                                            $http.post("fetchKeyword.action?areaofwork_id=" + areaofwork_id)
                                                    .then(function (response) {
                                                        $scope.all_Keyword = response.data;
                                                    });
                                        }
                                    });
                                });
                    }
                });
            });

//View All Circles
    $scope.viewAllCircles = function () {
        $http.get("getCircleByAjax.action")
                .then(function (response) {
                    $scope.circles = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'allCircles';
                });
    };


//View All Division
    $scope.viewAllDivisions = function () {
        $http.get("getAllDivisions.action")
                .then(function (response) {
                    $scope.divisions = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'allDivisions';
                });
    };


    //View All SubDivision
    $scope.viewAllSubDivisions = function () {
        $http.get("getAllSubDivisions.action")
                .then(function (response) {
                    $scope.subdivisions = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'allSubDivisions';
                });
    };

//View All ProductCategory
    $scope.viewAllProductCategory = function () {
        $http.get("getProductcategory.action")
                .then(function (response) {
                    $scope.productcategories = response.data;
                    alert(JSON.stringify(response.length));
                    $window.location.href = 'AllProductCategory';

                });
    };

//View All ProductSubCategory
    $scope.viewAllProductSubCategory = function () {
        $http.get("getAllProductSubcategory.action")
                .then(function (response) {
                    $scope.productsubcategories = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'AllProductSubCategory';
                });
    };

    //Call to update the department User
    $scope.editDeptUser = function (id) {
        alert(id);

        $http.get("updateDepartmentUser?id=" + id)
                .then(function (response) {
                    $scope.departmentUser = response.data;
                    $scope.privi = $scope.departmentUser.userPrivileges;
                    var array = new Array();

                    array = $scope.privi.split(',');
                    for (i = 0; i <= 18; i++) {
                        $("#userPrivileges" + i).prop("checked", false);

                    }
                    angular.forEach(array, function (value, key) {
                        $("#userPrivileges" + value).prop("checked", true);
                    });
                });
        $http.get("departmentDetails.action")
                .then(function (response) {
                    alert(response.data);
                    $scope.all_departments = response.data;
                });
    };


//Call to save the department User Details
    $scope.addMore = function () {
        var form = $("#form").serialize();
        alert(form);
        alert("reg id is : " + $("#reg_Id").val());

        var reg_Id = $("#reg_Id").val();
        alert(reg_Id);
        +"&reg_Id=" + reg_Id
        $http.post("saveDepartmentUser?form=" + form + "&registerId=" + $("#reg_Id").val())
                .then(function (response) {
                    alert(response);
                });

        $http.get("departmentDetails.action")
                .then(function (response) {
                    $scope.all_departments = response.data;
                });
    };

//Show Model
    $scope.showModel = function () {
        var response = " ";
        $scope.departmentUser = response.data;
        for (var i = 0; i <= 18; i++) {
            $("#userPrivileges" + i).prop("checked", false);
        }
        return true;
    };

//--------------------------------Mansi Jain's Code Start-----------------------------//
// call save circle
    $scope.saveCircle = function () {
        alert("save Circle function called");
        var check_validation = circleValidation();
        if (check_validation === 0) {
            var form = $("#formid").serialize();
            var circleid = $("#idcircle").val();
            $http.post("savecircleModel?form=" + form + "&circleid=" + circleid)
                    .then(function (response) {
                        $scope.msg_Circle = "";
                        $scope.msg_Division = "";
                        $scope.msg_SubDivision = "";
                        $scope.circles = response.data;
                        var message = response.data;
                        if (message == "Circle Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#circleBTN").click();
                        }
                        var message = response.data;
                        if (message == "Circle Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.get("getCircleByAjax.action")
                                .then(function (response) {
                                    $scope.circles = response.data;
                                    //alert(response);
                                });

                    });
        }
        ;
    };

//call circleUpdate method
    $scope.circleUpdate = function (circleid) {
        //alert(circleid);
        $http.get("editCircle?id=" + circleid)
                .then(function (response) {
                    //$("#idcircle").val(circle.circleid);
                    // alert(response.data.circle);
                    $("#idcircle").val(response.data.circleid);
                    $("#target1").val(response.data.circle);
                });
    };

//call DivisionUpdate method
    $scope.divisionUpdate = function (division_id) {
        // alert(division_id);
        $http.get("editDivision?id=" + division_id)
                .then(function (response) {
                    // alert(response.data.division);
                    var $select = $('#circle1');
                    $select.find('option').remove();
                    $('<option>').val(response.data.circleid).text(response.data.circle).appendTo($select);
                    $("#division_id").val(division_id);
                    $("#division_name").val(response.data.division);
                });
    };

//call subDivisionUpdate method
    $scope.subDivisionUpdate = function (subdivision_id) {
        alert(subdivision_id);
        $http.get("editSubDivision?id=" + subdivision_id)
                .then(function (response) {
                    $("#id_subdivision").val(subdivision_id);
                    alert(response.data.division);
                    var $select = $('#circle10');
                    $select.find('option').remove();
                    $('<option>').val(response.data.circleid).text(response.data.circle).appendTo($select);
                    var $select = $('#division1');
                    $select.find('option').remove();
                    $('<option>').val(response.data.division_id).text(response.data.division).appendTo($select);
                    $("#subdivision_id").val(response.data.subdivision_id);
                    $("#subdivision_name").val(response.data.subdivision);
                });
    };

//fetch divisionlist from perticuler circle
    $scope.getDivision = function (circleid) {
        $scope.subdivisions = "";
        $http.get("getDivisionByAjax?circleid=" + circleid)
                .then(function (response) {
                    alert(response.data);
                    $scope.msg_Division = "";
                    $scope.msg_SubDivision = "";
                    $scope.divisions = response.data;
                    if (response.data == "") {
//                        // alert("Data is not available");
                        $scope.msg_Division = "Division is not available.";
                        $scope.subdivisions = "";
                        $scope.msg_SubDivision = "Sub Division is not available.";
                    }
                });
    };

//fetch Subdivisionlist from perticuler division
    $scope.getSubDivision = function (division_id) {
        $http.get("getSubDivisionByAjax?division_id=" + division_id)
                .then(function (response) {
                    $scope.msg_Division = "";
                    $scope.msg_SubDivision = "";
                    $scope.subdivisions = response.data;
                    if (response.data == "") {
//                        // alert("Data is not available");
                        $scope.msg_SubDivision = "Sub Division is not available.";
                    }

                });
    };

// call saveDivision method
    $scope.saveDivision = function () {
        alert("save Division function called");
        var check_validation = divisionValidation();
        if (check_validation === 0) {
            var circleid = $("#circle1").val();
            var form = $("#divisionForm").serialize();
            alert(form);
            var division_id = $("#division_id").val();
            $http.post("savedivision?form=" + form + "&division_id=" + division_id)
                    .then(function (response) {
                        alert(response);
                        $scope.msg_Division = "";
                        $scope.msg_SubDivision = "";
//                    alert(JSON.stringify(response));
                        $scope.divisions = response.data;
                        var message = response.data;
                        if (message == "Division Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#divisionBTN").click();
                        }
                        var message = response.data;
                        if (message == "Division Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.get("getDivisionByAjax?circleid=" + circleid)
                                .then(function (response) {
                                    $scope.divisions = response.data;
                                });
                        $('#modal2').click();
                    });
        }
        ;
    };

// call saveSubDivision method
    $scope.saveSubDivision = function () {
        alert("save Sub Division function called");
        var check_validation = subDivisionValidation();
        if (check_validation === 0) {
            var form = $("#subDivisionForm").serialize();
            var subdivision_id = $("#subdivision_id").val();
            // alert("subdivision_id" + subdivision_id);
            var division_id = $("#division1").val();
            $http.post("savesubdivision?form=" + form + "&subdivision_id=" + subdivision_id + "&division_id" + division_id)
                    .then(function (response) {
                        $scope.msg_Division = "";
                        $scope.msg_SubDivision = "";
//                    alert(JSON.stringify(response));
                        $scope.subdivisions = response.data;
//                    alert(response.data);
                        var message = response.data;
                        if (message == "SubDivision Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#subdivBTN").click();
                        }
                        var message = response.data;
                        if (message == "Subdivision Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.get("getSubDivisionByAjax?division_id=" + division_id)
                                .then(function (response) {
                                    $scope.subdivisions = response.data;
                                });

                    });
        }
        ;
    };

//call saveProductCategory method
    $scope.saveProductCategory = function () {
        alert("save saveProductCategory function called");
        var check_validation = pcategoryValidation();
        if (check_validation === 0) {
            var form = $("#prodcatform").serialize();
            var productCategoryId = $("#idproductcategory").val();
            $http.post("saveProductCategories?form=" + form + "&productCategoryId=" + productCategoryId)
                    .then(function (response) {
                        $scope.msg_ProductCat = "";
                        $scope.msg_ProductSubCat = "";
                        // alert(JSON.stringify(response));
                        $scope.productcategories = response.data;
//                     alert(response.data);
                        var message = response.data;
                        if (message == "Product Category Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $('#prcatBTN').click();
                        }
                        var message = response.data;
                        if (message == "Product Category Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }

                        $http.get("getProductcategory.action")
                                .then(function (response) {
                                    $scope.productcategories = response.data;
                                    //alert(response);
                                });

                    });
        }
        ;
    };

//fetch productSubcategory from perticular productCategory 
    $scope.getProductSubCategory = function (productCategoryId) {
        // alert(productCategoryId);
        $http.get("getProductSubCategory?productCategoryId=" + productCategoryId)
                .then(function (response) {
                    $scope.msg_ProductCat = "";
                    $scope.msg_ProductSubCat = "";
                    $scope.productsubcategories = response.data;
                    if (response.data == "") {
//                        // alert("Data is not available");
                        $scope.msg_ProductSubCat = "Product Sub-Category is not available.";
                    }

                });
    };

//call saveProductSubCategory method
    $scope.saveProductSubCategory = function () {
        alert("save saveProductCategory function called");
        var check_validation = pSubValidation();
        if (check_validation === 0) {
            var form = $("#prosubcatform").serialize();
            var productSubCategoryId = $("#productSubCategoryId").val();
            var productCategoryId = $("#prcategory").val();
            // // alert("Product CategoryId::" + productCategoryId);
            $http.post("saveProductSubCategory?form=" + form + "&productSubCategoryId=" + productSubCategoryId)
                    .then(function (response) {
                        $scope.msg_ProductCat = "";
                        $scope.msg_ProductSubCat = "";
                        // alert(JSON.stringify(response));
                        $scope.productsubcategories = response.data;
//                           alert(response.data);
                        var message = response.data;
                        if (message == "Product Sub-Category Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $('#prscatBTN').click();
                        }
                        var message = response.data;
                        if (message == "Product Sub-Category Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.get("getProductSubCategory?productCategoryId=" + productCategoryId)
                                .then(function (response) {
                                    $scope.productsubcategories = response.data;
                                });

                    });

        }
        ;
    };

//call productCategoryUpdate method
    $scope.productCategoryUpdate = function (productCategoryId) {
        // alert(productCategoryId);
        $http.get("editProductCategory?productCategoryId=" + productCategoryId)
                .then(function (response) {
                    //alert(response.data.productCategoryName);
                    $("#idproductcategory").val(response.data.productCategoryId);
                    $("#target1").val(response.data.productCategoryName);
                });
    };

//call productSubCategoryUpdate
    $scope.productSubCategoryUpdate = function (productSubCategoryId) {
        // // alert("product subCategoryId:" + productSubCategoryId);
        $http.get("editProductSubCategory?productSubCategoryId=" + productSubCategoryId)
                .then(function (response) {
                    $("#Id_productSubCategory").val(productSubCategoryId);
                    //// alert("Product Category id-" + response.data.productCategoryId);
                    $("#idproCategory").val(response.data.productCategoryId);
                    var $select = $('#prcategory');
                    $select.find('option').remove();
                    $('<option>').val(response.data.productCategoryId).text(response.data.productCategoryName).appendTo($select);
                    $("#productSubCategoryId").val(productSubCategoryId);
                    $("#psc").val(response.data.productSubCategoryName);
                });
    };
//--------------------Mansi Jain's Code End---------------------------------//
    $scope.openModal = function (id) {
        $("#idcircle").val("");
        $("#target1").val("");
        $("#idproductcategory").val("");
        $('#modal1').click();

        $("#productSubCategoryId").val("");
        $("#prcategory").val("");
        $("#psc").val("");

        $http.get("getProductcategory.action")
                .then(function (response) {
                    $scope.productcategories = response.data;
                    $('#circle1')
                            .find('prcategory').val("")
                            .remove()
                            .end()
                            .append('<option value="">Select</option>')
                            .val('');
                });
        $("#division_id").val("");
        $("#circle1").val("");
        $("#division_name").val("");
        $http.get("getCircleByAjax.action")
                .then(function (response) {
                    $scope.circles = response.data;
                    $('#circle1')
                            .find('option').val("")
                            .remove()
                            .end()
                            .append('<option value="">Select</option>')
                            .val('');
                });
        $('#modal2').click();

        $("#subdivision_id").val("");
        $("#circle10").val("");
        $("#division1").val("");
        $("#subdivision_name").val("");
        $http.get("getCircleByAjax.action")
                .then(function (response) {
                    $scope.circles = response.data;
                    $('#circle10')
                            .find('option').val("")
                            .remove()
                            .end()
                            .append('<option value="">Select</option>')
                            .val('');
                });
        $('#modal3').click();

        $("#country_name").val("");
        $("#countryp_id").val("");
        $('#CountryModel').click();

        $('#country_idP').val("");
        $('#state_name').val("");
        $('#state_idP').val("");
        $('#state_name').val("");
        $http.get("getCountryByAjax.action")
                .then(function (response) {
                    $scope.all_country = response.data;
                    $('#country_idP')
                            .find('option').val("")
                            .remove()
                            .end()
                            .append('<option value="">Select</option>')
                            .val('');
                });
        $('#myModal2').click();

        $('#cityname').val("");
        $('#city_idP').val("");
        $('#state_name2').val("");
        $('#count_idP').val("");
        $http.get("getCountryByAjax.action")
                .then(function (response) {
                    $scope.all_country = response.data;
                    $('#count_idP')
                            .find('option').val("")
                            .remove()
                            .end()
                            .append('<option value="">Select</option>')
                            .val('');
                });
        $('#myModal3').click();
        $("#tender_category_idP").val("-1");
        $("#areaofwork_name").val("");
        $("#myModal2").click();
        $("#selectcategoryidP").val("-1");
        $("#areaofwork").val("-1");
        $("#tenderkeywordid").val("");
        $("#myModal3").click();

    };

//------------------shashank's Code Start----------------------//

//Save Country
    $scope.saveCountries = function () {
        alert("save Country function called");
        var check_validation = countryValidation();
        if (check_validation === 0) {
            var formData = $("#countryform").serialize();
            alert(formData);
            var countryp_id = $("#countryp_id").val();
            $http.post("saveCountries?formData=" + formData + "&countryp_id=" + countryp_id)
                    .then(function (response) {
                        $scope.msg_Country = "";
                        $scope.msg_State = "";
                        $scope.msg_City = "";
                        var message = response.data;
                        if (message == "Country Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#countryBTN").click();
                        }
                        var message = response.data;
                        if (message == "Country Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.get("getCountryByAjax.action")
                                .then(function (response) {
                                    $scope.all_country = response.data;
                                });
                        $("#CountryModel").click();
                    });

        }
        ;
    };

    //Save State
    $scope.saveState = function () {
        alert("  saveState  ");
        var check_validation = stateValidation();
        if (check_validation === 0) {
            var formData1 = $("#stateForm").serialize();
            alert(formData1);
            var state_idP = $("#state_idP").val();
            var country_id = $("#country_idP").val();
            $http.post("saveState.action?formData1=" + formData1 + "&state_idP=" + state_idP)
                    .then(function (response) {
                        $scope.msg_State = "";
                        $scope.msg_City = "";
                        var message = response.data;
                        if (message == "State Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#stateBTN").click();
                        }
                        var message = response.data;
                        if (message == "State Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }

                        $http.get("Showstate.action?country_id=" + country_id)
                                .then(function (response) {
                                    $scope.all_states = response.data;
                                });

                    });
        }
        ;
    };


//Save City
    $scope.saveCity = function () {
        var check_validation = cityValidation();
        if (check_validation === 0) {
            var formData2 = $("#myform3").serialize();
            var country_id = $("#count_idP").val();
            var state_id = $("#state_name2").val();
            var city_idP = $("#city_idP").val();

            $http.post("saveCity.action?formData2=" + formData2 + "&city_idP=" + city_idP)
                    .then(function (response) {
                        $scope.msg_State = "";
                        $scope.msg_City = "";
                        $scope.all_cities = response.data;
                        var message = response.data;
                        if (message == "City Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#cityBTN").click();
                        }
                        var message = response.data;
                        if (message == "City Already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.get("getCitiesByAjax.action?state_id=" + state_id)
                                .then(function (response) {
                                    $scope.all_cities = response.data;
                                });

                    });
        }
        ;
    };

//Get All State
    $scope.showState = function (country_id) {
        $scope.all_cities = "";
        $http.get("Showstate.action?country_id=" + country_id)
                .then(function (response) {
                    $scope.msg_State = "";
                    $scope.msg_City = "";
                    $scope.all_states = response.data;
                    if (response.data == "") {
                        $scope.msg_State = "State is not available.";
                        $scope.all_cities = "";
                        $scope.msg_City = "City is not available.";
                    }

                });
    };

//Get All City
    $scope.showCity = function (state_id) {
        $http.get("getCitiesByAjax.action?state_id=" + state_id)
                .then(function (response) {
                    $scope.msg_State = "";
                    $scope.msg_City = "";
                    $scope.all_cities = response.data;
                    if (response.data == "") {
//                        // alert("Data is not available");
                        $scope.msg_City = "City is not available.";
                    }
                });
    };

//Update Country
    $scope.UpdateCountry = function (country_id) {
        $http.get("countryEdit.action?country_id=" + country_id)
                .then(function (response) {
                    var countryp_id = response.data.country_name;
                    var country_name = response.data.country_name;
                    $("#country_name").val(response.data.country_name);
                    $("#countryp_id").val(response.data.country_id);
                });

    };
    //Update State
    $scope.UpdateState = function (state_id) {
        var country_id = null;
        $http.post("editState.action?state_id=" + state_id)
                .then(function (response) {
                    country_id = response.data.country_name;
                    var state_name = (response.data.state_name);
                    var $select = $('#country_idP');
                    $select.find('option').remove();
                    $('<option>').val(response.data.country_id).text(response.data.country_name).appendTo($select);
                    $("#state_name").val(state_name);
                    $("#state_idP").val(response.data.state_id);
                    $("#country_idP").val(response.data.country_id);

                });
    };
//Update City
    $scope.UpdateCity = function (city_id) {
        $http.get("editcity?city_id=" + city_id)
                .then(function (response) {
                    alert(response.data.country_id);
                    alert(response.data.state_id);
                    var country_id = $("#count_idP").val();
                    var state_id = $("#state_name2").val();
                    var city_idP = $("#city_idP").val();
                    var city_name = response.data.city_name;
                    var $select = $('#count_idP');
                    $select.find('option').remove();
                    $('<option>').val(response.data.country_id).text(response.data.country_name).appendTo($select);
                    var $select = $('#state_name2');
                    $select.find('option').remove();
                    $('<option>').val(response.data.state_id).text(response.data.state_name).appendTo($select);
                    $("#cityname").val(city_name);
                    $("#count_idP").val(response.data.country_id);
                    $("#state_name2").val(response.data.state_id);
                    $("#city_idP").val(response.data.city_id);
                });
    };



    $scope.viewAllCountries = function () {
        // alert("hello");
        $http.get("getCountryByAjax.action")
                .then(function (response) {
                    $scope.all_country = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'AllCountries';
                });
    };

    $scope.viewAllStates = function () {
        // alert("hello");
        $http.get("getAllStates.action")
                .then(function (response) {
                    $scope.all_states = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'AllStates';
                });
    };

    $scope.viewAllCities = function () {
        // alert("hello");
        $http.get("getAllStates.action")
                .then(function (response) {
                    $scope.all_cities = response.data;
                    alert(JSON.stringify(response));
                    $window.location.href = 'AllCities';
                });
    };




    //------------------shashank's Code End---------------------//

//----------------------Naina Jain's Code Start------------------//
// Save Area Of Work
    $scope.save_AreaOfWork = function () {
        alert("save area of work");
        var check_validation = validateForm();
        if (check_validation === 0) {
            var formData = $("#form_Id").serialize();
//        alert(formData);
            var tender_category_id = $("#tender_category_idP").val();
//        alert(tender_category_id);
            var areaofwork_idP = $("#areaofwork_idP").val();
            $http.post("save_AreaOfWork.action?formData=" + formData + "&areaofwork_idP=" + areaofwork_idP)
                    .then(function (response) {
                        $scope.msg_AreaOfWork = "";
                        $scope.msg_Keyword = "";
                        var message = response.data;
                        if (message == "Area Of Work Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#awBTN").click();
                        }
                        var message = response.data;
                        if (message == "Area Of Work already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.post("fetchAreaOfWork.action?tender_category_id=" + tender_category_id)
                                .then(function (response) {
                                    $scope.all_AreaOfWork = response.data;
                                });
                    });

        }
        ;
    };

// Update Area Of Work
    $scope.updateAreaOfWork = function (areaofwork_id) {
//        // alert("areaofwork_id:: " + areaofwork_id);
        $http.get("edit_AreaOfWork.action?id=" + areaofwork_id)
                .then(function (response) {
                    var areaofwork_name = response.data.areaofwork_name;
                    var $select = $('#category_id');
                    $select.find('option').remove();
                    $('<option>').val(response.data.category_id).text(response.data.tender_category_name).appendTo($select);
//                    $("#category_idValue").val(response.data.tender_category_id); 
                    $("#areaofwork_name").val(areaofwork_name);
                    $("#areaofwork_idP").val(response.data.areaofwork_id);
                    $("#tender_category_idP").val(response.data.tender_category_id);
                });
    };

// Show Area Of Work List
    $scope.areaofwork = function (tender_category_id) {
        $scope.all_Keyword = "";
        $("#tender_category_id").removeClass('category0');
        $http.post("fetchAreaOfWork.action?tender_category_id=" + tender_category_id)
                .then(function (response) {
                    $scope.msg_AreaOfWork = "";
                    $scope.msg_Keyword = "";
                    $scope.all_AreaOfWork = response.data;
                    if (response.data == "") {
//                        // alert("Data is not available");
                        $scope.msg_AreaOfWork = "Area Of Work is not available.";
                        $scope.all_Keyword = "";
                        $scope.msg_Keyword = "Keyword is not available.";
                    }
                });
    };

//Save KeyWords 
    $scope.save_Keywords = function () {
        alert("save Keywords function called");
        var check_validation = formValidation();
        if (check_validation === 0) {
            var formData2 = $("#form_Id2").serialize();
            // alert("formData2 :: " + formData2);
            var tender_category_id = $("#selectcategoryidP").val();
            // alert("tender_category_id ::" + tender_category_id);
            var tenderKeyWordsIdP = $("#tenderKeyWordsIdP").val();
            // alert("tenderKeyWordsIdP ::" + tenderKeyWordsIdP);
            var areaofwork_id = $("#areaofwork").val();
            alert(areaofwork_id);
            $http.post("save_Keywords.action?formData2=" + formData2 + "&tenderKeyWordsIdP=" + tenderKeyWordsIdP)
                    .then(function (response) {
                        $scope.msg_AreaOfWork = "";
                        $scope.msg_Keyword = "";
//                    alert(response.data);
                        var message = response.data;
                        if (message == "Keyword Added Successfully") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                            $("#keywordBTN").click();
                        }
                        var message = response.data;
                        if (message == "Keyword already Exist") {
                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                        $http.post("fetchKeyword.action?areaofwork_id=" + areaofwork_id)
                                .then(function (response) {
                                    $scope.all_Keyword = response.data;
                                });
                    });


        }
        ;
    };

//Update Keywords
    $scope.updateKeyword = function (tenderKeyWordsId) {
//        // alert("tenderKeyWordsId  " + tenderKeyWordsId);
        var tender_category_id = null;
        $http.post("edit_Keyword.action?id=" + tenderKeyWordsId)
                .then(function (response) {
                    var tender_category_id = $("#selectcategoryidP").val();
                    var areaofwork_id = $("#areaofwork").val();
                    var tenderKeyWordsIdP = $("#tenderKeyWordsIdP").val();
                    var tenderKeyWordsName = response.data.tenderKeyWordsName;
                    var $select = $('#selectcategoryidP');
                    $select.find('option').remove();
                    $('<option>').val(response.data.tender_category_id).text(response.data.tender_category_name).appendTo($select);

                    var $select = $('#areaofwork');
                    $select.find('option').remove();
                    $('<option>').val(response.data.areaofwork_id).text(response.data.areaofwork_name).appendTo($select);

                    $("#tenderkeywordid").val(tenderKeyWordsName);
                    $("#tenderKeyWordsIdP").val(response.data.tenderKeyWordsId);
                    $("#areaofwork").val(response.data.areaofwork_id);
                    $("#selectcategoryidP").val(response.data.tender_category_id);
                });
    };

//delete areaofwork
    $scope.AreaOfWorkshowAlert = function (areaofwork_id) {
        alert("Tender ID: " + areaofwork_id + " clicked!");
        $http.get('delete_AreaofWorkKeyword.action?id=' + areaofwork_id)
                .then(function (response) {
                    alert("IDD  AGAI HAI")
                    var message = response.data;
                    if (message == "Tender AreaOfWork Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " + tenderKeyWordsId, error);
                    alert("An error occurred while deleting Tender ID: " + tenderKeyWordsId);
                });
    };


//delete Tender key word
    $scope.showAlert = function (tenderKeyWordsId) {
        alert("Tender ID: " + tenderKeyWordsId + " clicked!");
        $http.get('delete_Keyword.action?id=' + tenderKeyWordsId)
                .then(function (response) {
                    alert("IDD  AGAI HAI")
                    var message = response.data;
                    if (message == "Tender Key Word Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " + tenderKeyWordsId, error);
                    alert("An error occurred while deleting Tender ID: " + tenderKeyWordsId);
                });
    };
    
    //delete  ProductSubCategoryAlert
    $scope.ProductSubCategoryAlert = function (productSubCategoryId) {
       // alert("Tender ID: " + productSubCategoryId + " clicked!");
        $http.get('delete_ProductSubCategoryAlert?id=' + productSubCategoryId)
                .then(function (response) {
                    alert("ProductSubCategoryAlert Aa Gaya")
                    var message = response.data;
                    if (message == "Tender Product SubCategory Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " +  productSubCategoryId, error);
                    alert("An error occurred while deleting Tender ID: " +  productSubCategoryId);
                });
    };

//delete  ProductCategoryAlert
    $scope.ProductCategoryAlert = function (productCategoryId) {
       // alert("Tender ID: " + productCategoryId + " clicked!");
        $http.get('delete_ProductCategoryAlert?id=' + productCategoryId)
                .then(function (response) {
                    alert("ProductSubCategoryAlert Aa Gaya")
                    var message = response.data;
                    if (message == "Tender Product Category Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " +  productSubCategoryId, error);
                    alert("An error occurred while deleting Tender ID: " +  productSubCategoryId);
                });
    };

    //delete City Name
    $scope.delete_City = function (city_id) {
        //  alert("CITY ID: " + city_id + " clicked!");
        $http.get('delete_City.action?id=' + city_id)
                .then(function (response) {
                    alert("IDD  AGAI HAI")
                    var message = response.data;
                    if (message == "Tender City Key Word Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " + tenderKeyWordsId, error);
                    alert("An error occurred while deleting Tender ID: " + tenderKeyWordsId);
                });
    };

//delete State Name
    $scope.delete_State = function (state_id) {
        //   alert("STATE ID: " + state_id + " clicked!");
        $http.get('delete_State.action?id=' + state_id)
                .then(function (response) {
                    alert("IDD  AGAI HAI")
                    var message = response.data;
                    if (message == "Tender City Key Word Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " + tenderKeyWordsId, error);
                    alert("An error occurred while deleting Tender ID: " + tenderKeyWordsId);
                });
    };

//Delete SubDivision
    $scope.delete_SubDivision = function (subdivision_id) {
        //     alert("SUB DIVISION ID: " + subdivision_id + " clicked!");
        $http.get('delete_SubDivision.action?id=' + subdivision_id)
                .then(function (response) {
                    alert("IDD  AGAI HAI")
                    var message = response.data;
                    if (message == "Sub Division Word Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " + tenderKeyWordsId, error);
                    alert("An error occurred while deleting Tender ID: " + tenderKeyWordsId);
                });
    };

//Delete Division
    $scope.delete_Division = function (division_id) {
     //   alert("DIVISION ID: " + division_id + " clicked!");
        $http.get('delete_Division.action?id=' + division_id)
                .then(function (response) {
                    alert("IDD  AGAI HAI")
                    var message = response.data;
                    if (message == "DIVISION Word Deleted Successfully") {
                        // alert("TRUE");
                        // You can also perform any other actions here after successful delete
                        swal(
                                '',
                                message,
                                'success'
                                ).then(function () {
                            location.reload();
                        })

                    } else {
                        alert("FALSE");
                    }

                })
                .catch(function (error) {
                    // Handle error
                    console.error("Error deleting Tender ID: " + tenderKeyWordsId, error);
                    alert("An error occurred while deleting Tender ID: " + tenderKeyWordsId);
                });
    };

// Show Keywords List
    $scope.keyword = function (areaofwork_id) {
        $("#areaofwork_id").removeClass('areaofworks0');
        $http.post("fetchKeyword.action?areaofwork_id=" + areaofwork_id)
                .then(function (response) {
                    $scope.msg_AreaOfWork = "";
                    $scope.msg_Keyword = "";
                    $scope.all_Keyword = response.data;
                    if (response.data == "") {
//                        // alert("Data is not available");
                        $scope.msg_Keyword = "Keyword is not available.";
                    }
                });
    };

// View All Tender Category
    $scope.viewAllTenderCategory = function () {
        $http.post("fetchTenderCategory.action")
                .then(function (response) {
                    alert(JSON.stringify(response.data));
                    $scope.all_Category = response.data;
                    $window.location.href = 'viewAllTenderCategoryData';
                });
    };

// View All Area Of Work
    $scope.viewAllAreaOfWork = function () {
        $http.post("viewAllAreaOfWork.action")
                .then(function (response) {
                    alert(JSON.stringify(response.data));
                    $window.location.href = 'viewAllAreaOfWorkData';
                });
    };

// View All Tender Keywords
    $scope.viewAllTenderKeyword = function () {
        $http.post("viewAllTenderKeyword.action")
                .then(function (response) {
                    alert(JSON.stringify(response.data));
                    $window.location.href = 'viewAllKeywordData';
                });
    };

//------------------------------Naina Jain's Code End---------------------------------//


    $scope.printDiv = function (divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    };

    $scope.getStateData = function () {
        $scope.all_departments = [];
        var s = $("#state").val();
        $http.get('http://192.168.0.107/tender_alert_new/admin/dashboard/depart_report',
                {params: {state: s}}

        ).then(function (response) {
            // response.all_departments.empty();
            // alert(JSON.stringify(response.data));
            var res = response.data;
            res.all_departments.forEach(function (value) {
                // alert(value);
                $scope.all_departments.push(value);
                // $('#state').append('<option value="'+value.state_id+'">'+value.statename+'</option>');
            });
        });
    };
}

myApp.factory('Excel', function ($window) {
    var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
            base64 = function (s) {
                return $window.btoa(unescape(encodeURIComponent(s)));
            },
            format = function (s, c) {
                return s.replace(/{(\w+)}/g, function (m, p) {
                    return c[p];
                });
            };
    return {
        tableToExcel: function (tableId, worksheetName) {
            var table = $(tableId),
                    ctx = {worksheet: worksheetName, table: table.html()},
            href = uri + base64(format(template, ctx));
            return href;
        }
    };
});
myApp.controller('MyCtrl', function (Excel, $timeout, $scope) {
    $scope.exportToExcel = function (tableId) { // ex: '#my-table'
        var exportHref = Excel.tableToExcel(tableId, 'WireWorkbenchDataExport');
        $timeout(function () {
            location.href = exportHref;
        }, 100); // trigger download
    };
});



myApp.controller("listController", ["$scope",
    function ($scope) {
        // $scope.data=  [{"agence":"CTM","secteur":"Safi","statutImp":"operationnel"}];
        $scope.export = function () {
            html2canvas(document.getElementById('print'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                                image: data,
                                width: 500
                            }]
                    };
                    pdfMake.createPdf(docDefinition).download("test.pdf");
                }
            });
        };
    }
]);


function OtherController($scope) {
    $scope.pageChangeHandler = function (num) {
        console.log('going to page ' + num);
    };
}

myApp.controller('MyController', MyController);
myApp.controller('OtherController', OtherController);




