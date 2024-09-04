var myApp = angular.module('app', []);    
myApp.controller('MainCtrl', function ($scope, $window, $http, fileUploadService, $interval, $location) {
    $scope.title = 'myapp';
    $scope.item = [];
    $scope.sorDocumentFile = [];
    $scope.tenderDetais = [];
    $scope.sorDocumentFileName = [];
    $scope.tenderDocumentDetails = [];
    $scope.tenderKeyDateDetails = [];
    $scope.tenderKeyords = [];
    $scope.amendmentPrivilege = [];
    $scope.tender_Id = 0;
    $scope.documentName = [];
    $scope.tenderCategory = "0";
    $scope.areaOfWorkss = "0";
    $scope.bidValidateType = "0";
    $scope.workCompletionType = "0";
    $scope.sorDocumentFile = "0";
    $scope.emdApplicable = "0";    
    $scope.envelopeType = "0";    
    $scope.selectiveTender = "0";
    $scope.tenderStageDropDown = "0";
    $scope.tenderStageStatus = false;
    $scope.selectiveTenderStatus = false;
    $scope.envelopeTypeStatus = false;
    $scope.envelopeAName = "0";
    $scope.envelopeBName = "0";
    $scope.dynamicTemplate = [];
    $scope.DepartmentUserToShowA = [];
    $scope.DepartmentUserToShowB = [];
    $scope.DepartmentUserForApproval = [];
    $scope.DepartmentUserListB = [];
    $scope.DepartmentUserListA = [];
    $scope.DepartmentUserForAmmendmentPrivilege = [];
    $scope.DepartmentUserForAmmendmentPrivilegeB = [];
    $("#viewTemplateButtonA").hide();
    $("#viewTemplateButtonB").hide();
    $("#viewTemplateButtonC").hide();
    $("#removeTemplateButtonA").hide();
    $("#removeTemplateButtonB").hide();
    $scope.step = 'step1';
    $("#keyDatesId").val(0);
    //$("#tender_IdForEnvelopeA").val("0");
    $("#tenderStatusManaging").val("Created");
    $scope.previousTenderDetails = [];
    $scope.previousTenderSummary = [];
    $scope.copyButton = true;
    $scope.noOfCopy = 1;
    //Save and Next Button
    $scope.saveAndNextButton = false;
    //Ammend Button
    $scope.ammendButton = false;
    //Hide the Empanel Contractor Drop down
    $scope.empanelConts = true;
    //Hide the SOR DOcument Drop down
    $scope.sorDoc = false;
    //Hide the Buy Back Policy Drop down
    $scope.buyBackPol = true;
    //Hide the Buy Back DOcument Drop down
    $scope.buyBackPolDoc = true;
    //show Copy Tender button
    $scope.copyTenderButton = false;
    $scope.objsss = "safdasf";
    //Managing Type Of Tender Drop down
    $scope.typeOfTender = '0';
    //Managing the EMD Drop down
    $scope.emdApplicableStatus = false;
    $scope.qualificationWeightageStatus=false;
    //Managing the EMD Field
    $scope.emdInputField = true;
    $scope.emdStatusField = false;
    $scope.asPerShow = true;
    //All Check Box by default status
    $scope.reBidStatus = "";
    $scope.bidWithdrawStatus = "";
    $scope.modeOfFeeForTenderFee = "Online";
    $scope.modeOfFeeForEMDApplicable = "Online";
    $scope.scstExemptionStatus = "Not Allow";
    $scope.msmensicExemptionStatus = "Not Allow";
    $scope.obcExemptionStatus = "Not Allow";
    $scope.ammendmentPrivilegeStatus = "Not Allow";
    $scope.ammendmentField = true;
    $scope.singedPDF = false;
    $scope.tenderDocuments = true;
    $scope.managingOpeningECDate = true;
    var che = 1;
    var cheA = 0;
    var cheB = 0;
    var cheE = 0;
    $scope.choices = [{id: '1', name: '1'}];
    $scope.documentSequnce = 0;
    $scope.envelopeBId = "0";
    $scope.URLOfCloudFilePath = '';
    $scope.EnvelopeA = true;
    $scope.EnvelopeB = true;
    $scope.EnvelopeC = true;
    $scope.OpeningEBDate = true;  
    $scope.OpeningECDate = true;
    $scope.EnvelopeBQCBS = false;
    $scope.templates = "";
    $scope.departmentUserARegId = "0";
    $scope.contractorClass = "0";
    $scope.arrString = [];
    $scope.contractorClassStatus = false;
    $scope.tenderSelectedDivision = "0";
    $scope.nitNumber = "";
    $scope.estimateValue = "";
    $scope.doc_Id = [];
    $scope.documentLabel = [];
    $scope.showDocument = [];
    $scope.documentSequnce = [];
    $scope.documentVisibility = [];
    $scope.tenderForm;
    $scope.ammendmentButton = true;
    $scope.sequnceId = 0;
    $scope.tenderWizardButton = "Save and Next";
    //alert("ok");
    //view Image Scope Envelope C
    $scope.envelopeCImages = "";
    $scope.serverResponse = "";
    $scope.keywords = [];
    var $options = [];
    $scope.envelopeQCBSName = "0";
    $scope.viewQCBSTemplate = true;
    $scope.templateEnvelopeAButton = true;
    $scope.templateEnvelopeBButton = true;
    $scope.templateLabelName = [];
    $scope.templateLabelType = [];
    $scope.templateLabelSequnce = [];
    $scope.alphaButton = [];
    $scope.newTenderRadioButton = false;
    $scope.copyTenderRadioButton = false;
    $scope.prebidDiscussion = false;
    $scope.dependOnBidSubmissionDate = true;
   
    /*
     * Function to run the tik tak clock  
     */
    var tick = function() {
       // $scope.clock = Date.now();
         $http.get("FetchServerDate.action")
                .then(function (response) {
              //alert(response.data.time+":"+response.data.date);
                $scope.clock = response.data.time;
                $scope.date = response.data.date;
            });
        }
        tick();
        $interval(tick, 1000);
 
   //Add More Function for Document Uploading
    $scope.addNewChoice = function() {
     var documentLabel = $("#doc_Id"+$scope.sequnceId).val();
     //alert(documentLabel);
     if(documentLabel === "0"){
         swal({
                        title: 'Document is Mandatory',
                                html: $('<div>')
                                .addClass('some-class')
                                .text('Upload Document'),
                                animation: false,
                                customClass: 'animated tada'
                        })
     }else{
    var newItemNo = $scope.choices.length + 1;
    $scope.documentLabel[newItemNo] = "";
            $scope.choices.push({'id' : newItemNo, 'name' : 'choice' + newItemNo});
        }      
    };
   
    $scope.removeNewChoice = function() {
    var newItemNo = $scope.choices.length - 1;
            if (newItemNo !== 0) {
    $scope.choices.pop();
    }
    };
    $scope.showAddChoice = function(choice) {
    $scope.sequnceId = choice.id;
    return choice.id === $scope.choices[$scope.choices.length - 1].id;
    };
   
    //Add more functionality for Dynamic Template
      $scope.template = [{id: '1'}];
   
   $scope.addNewChoice2 = function() {
     var newItemNo = $scope.template.length+1;
     $scope.templateLabelName[newItemNo] = "";
     $scope.templateLabelType[newItemNo] = "0";
     $scope.template.push({'id' : newItemNo});
   };
   
   $scope.removeNewChoice2 = function() {
     var newItemNo = $scope.template.length-1;
     //alert(newItemNo);
     if ( newItemNo !== 0 ) {
      $scope.template.pop();
     }
   };
   
   $scope.showAddChoice2 = function(temp) {
     return temp.id === $scope.template[$scope.template.length-1].id;
   };
   
   
    $scope.documentSequnceCalled = function(id, URLOfCloudFilePath){
        //alert(id+" : "+URLOfCloudFilePath);
        $scope.documentSequnce = id;
        $scope.URLOfCloudFilePath = URLOfCloudFilePath;
    };
       
     
       
       $scope.cloudFolderUploading = function(){
          var formData = new FormData();
          //alert($scope.documentSequnce+" : "+$scope.URLOfCloudFilePath);
          var file = document.getElementById("couldFolderFile").files[0];
          var tender_Id = $scope.tender_Id;
          var doc_Id = $("#doc_Id"+$scope.documentSequnce).val();
          //alert(doc_Id);
          if(""==doc_Id.trim()){
              doc_Id = 0;
          }
          var documentLabel = $("#documentLabel"+$scope.documentSequnce).val();
          var documentVisibility = $("#documentVisibility"+$scope.documentSequnce).prop("checked");
          //alert(documentVisibility);
          formData.append("file", file);
          formData.append("docSequnceId", $scope.documentSequnce);
          formData.append("tender_id", tender_Id);
          formData.append("doc_Id", doc_Id);
          formData.append("doc_Name", documentLabel);
          formData.append("documentVisibility", documentVisibility);
          var cloudFolderURL = $scope.URLOfCloudFilePath;
          //alert(cloudFolderURL);
          var seq = $scope.documentSequnce;
          var documentName = $("#documentLabel"+seq).val();
               //alert(documentName);
                if(documentName === null || documentName === ""){
                    var message = "Please Mention Document Name";
                    swal({
                        title: "Required Document Name",
                        text: message,
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "OK"                    
                      });
                      return false;
                     }  
                //This URl Call to CloudController
                $http.post(cloudFolderURL, formData, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                }).success(function (response){
             $("#doc_Id"+$scope.documentSequnce).val(response.doc_Id);       $scope.showDocument[$scope.documentSequnce] = response.doc_Path;
             $("#couldFolderFileChoosefile").html("Choose file");
                }).error(function (response) {
                    //alert(response);
                });
      };
     
     /*
         * Function call to save the document
         * @param Document id,Tender Id, Document Name
         * @create 25 June 2018
         * @version 2.0.0
         */
        $scope.tenderDocumentUpload = function(i){
         var file = document.getElementById("documentFile"+i).files[0];
         var tender_Id = $("#tender_Id").val();
                //alert("Tender Id: "+tender_Id+" : DOC Id: "+i);
                var formData = new FormData();
                formData.append("file", file);
                var docId = $("#doc_Id"+i).val();
                var documentName = $("#documentName"+i).val();
                //alert(documentName);
                if(documentName === null || documentName === ""){
                    var message = "Please Mention Document Name";
                    swal({
                        title: "Required Document Name",
                        text: message,
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "OK"                    
                      });  
                    return false;
                }
                formData.append("documentName", documentName);
                formData.append("docSequnceId", i);
                formData.append("doc_Id", docId);
                var tenderDocumentURL = 'tenderDocument?tender_Id='+tender_Id;
                $http.post(tenderDocumentURL, formData, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                }).success(function (response){
                         $("#doc_Id"+i).val(response.doc_Id);
                         $("#showDocument"+i).html("<a href='/docs/"+response.doc_Converted_Name+"'> View </a>");                
                }).error(function (response) {
                     //alert(response.data);
                });
        };
       
       
    $scope.resetNITNumberAndDate = function(){
//        alert("ok");
      $("#nitNumber").val("");  
      $("#k_datetimepicker_2").val("");  
    };
    $("#showAmmendmentOfficer").hide();
   
    /*
     * Function to separate the alphatic and numeric value
     *  
     * @param step
     * @returns new step
     * @Create 20 Aug 2018
     * @version 2.0.0
     */
    $scope.stepManaging = function(step){
    var newStep = "step";
    var strArray = step.match(/(\d+)/g);
    var st = parseInt(strArray);
    if(st<=8){
       st = st+1;
       newStep = newStep+st;
    }
    $scope.step = newStep;
    //alert(newStep+" : "+$scope.tenderWizardButton);
   if(newStep==="step9"){
    if($scope.tenderWizardButton.trim()==="Update"){
          $("#tenderCreation").attr("action", "viewCreatedTenderDetails");
          $("#tenderCreation").submit();
         }else{
          $("#tenderCreation").attr("action", "eTendering");
          $("#tenderCreation").submit();  
         }
     }
    };
   
    /*
     * Function to separate the alphatic and numeric value
     *  
     * @param step
     * @returns new step
     * @Create 20 Aug 2018
     * @version 2.0.0
     */
    $scope.previousStepManaging = function(step){
    var tender_Id = $scope.tender_Id;
    var newStep = "step";
    var strArray = step.match(/(\d+)/g);
    var st = parseInt(strArray);
    if(st<=8){
       st = st-1;
       newStep = newStep+st;
    }
    //alert(newStep);
    $scope.step = newStep;
    //Scrolling Up in wizard
    var myDiv = document.getElementById('scrollingEffect');
    myDiv.scrollTop = 0;
    };
   
    /*
     * Function call to reset the wizard Data
     *
     * @param null
     * @return null
     * @Create 5 Sep 2018
     * @version 2.0.0
     */
    $scope.wizardReset = function(){
        $("#step1Tab").click();
        $("#tenderCreation")[0].reset();
        $scope.step = 'step1';
    };
   
    $scope.showAsPar = function(envelopeBId){
        //alert(envelopeBId);
        if(envelopeBId === "1"){
          $scope.asPerShow = false;      
        }else{
          $scope.asPerShow = true;  
        }
       
    };
   
    /*
     * Function to managing the Hide And Show
     * @return status
     */
    $scope.managehideAndShow = function(type){
        //Managed the Hide and show for Selective Tender
        //Managed the Empanel Contractor Drop down
        if(type === 'Selective Tender'){
            if($scope.selectiveTender === '1'){//open
              $scope.contractorClass = "0";  
              $scope.contractorClass = "4"; //open
              $scope.empanelConts = true;
              $scope.contractorClassStatus = true;
             
            }
            
            
            if($scope.selectiveTender === '2'){//Limited
              $scope.contractorClass = "0";  
              $scope.contractorClass = "6";//Empaneled  
              $scope.empanelConts = false;
              $scope.contractorClassStatus = true;
            }
            if($scope.selectiveTender === '3'){//Restricted
              $scope.contractorClass = "0";//Class A,Class B,Class C
              $("#contractorClass").find('option[value="4"]').hide();
              $("#contractorClass").find('option[value="5"]').hide();
              $("#contractorClass").find('option[value="6"]').hide();
              $scope.typeOfTender = "2";
              $scope.contractorClassStatus = false;
              $scope.empanelConts = true;
            }
            if($scope.selectiveTender === '4'){//Single Nomination
              $scope.contractorClass = "0";                    
              $scope.contractorClass = "6";//Empaneled  
              $scope.contractorClassStatus = true;
              $scope.empanelConts = false;
            }
            if($scope.selectiveTender === '5'){//GTE
              $scope.contractorClass = "0";  
              $scope.contractorClass = "5";//GTE  
              $scope.empanelConts = true;
              $scope.contractorClassStatus = true;
            }
        }
       
        //Managed the Hide and Show for Tender Category
        //Managed the SOR DOcument, Buy Back Policy and Buy Back Documnent
        if(type === 'Tender Categories'){
            if($scope.tenderCategory === '2'){
            $scope.sorDoc = true;
            $scope.buyBackPol = false;
            $scope.buyBackPolDoc = false;
            }else{
            $scope.sorDoc = false;
            $scope.buyBackPol = true;
            $scope.buyBackPolDoc = true;
            }
        }
       
        //Managed Hide and Show for Buy Back Policy
        //Managed the Buy Back Document
        if(type === 'BuyBackPolicy'){
            if($("#buyBackDocumentYes").prop("checked") === true){
            $scope.buyBackPolDoc = false;
            }else{
            $scope.buyBackPolDoc = true;
            }
        }
     
        //Managed Hide and Show for Type Of Tender
        //Managed the Type Of Tender
        if(type === 'typeOfTender'){
            if($scope.typeOfTender === '1'){
            $scope.emdApplicable = '1';
            $scope.envelopeCImages = '#m_select_modalCpercentage';
            $scope.emdApplicableStatus = true;
            $scope.managehideAndShow('emdApplicable');
            }else
            if($scope.typeOfTender === '2'){
            $scope.emdApplicable = '1';
            $scope.envelopeCImages = '#m_select_modalClumsum';
            $scope.emdApplicableStatus = true;
            $scope.managehideAndShow('emdApplicable');
            }else
            if($scope.typeOfTender === '4'){
            $scope.emdApplicable = '0';
            $scope.emdApplicableStatus = false;
            $scope.managehideAndShow('emdApplicable');
            }else{
            $scope.emdApplicable = '1';    
            $scope.emdApplicableStatus = true;
            $scope.managehideAndShow('emdApplicable');
            }
        }
       
        //Managed Hide and Show for EMD Applicable
        //Managed the EMD Applicable
        if(type === 'emdApplicable'){
            if($scope.emdApplicable === '2'){
            $scope.emdInputField = false;
            }else{  
            $scope.emdInputField = true;
            }
        }
       
        //Managed Hide and Show for Technical Bid Opening
        //Managed the Technical Bid Opening
        if(type === 'openingTechnical'){
            if($("#openingECaftertechopening").prop("checked") === true){
            $scope.managingOpeningECDate = false;
            }else{  
            $scope.managingOpeningECDate = true;
            }
        }
       
        //Managed Hide and Show for Pre-Bid Meeting
        //Managed the Pre-Bid Meeting
        if(type === 'preBidMeetingStatus'){
            if($("#preBidMeetingStatus").prop("checked") === true){
            $scope.prebidDiscussion = true;
            }else{  
            $scope.prebidDiscussion = false;
            }
        }
       
        //Managed the Hide and show for Envelope Type
        if(type === 'Envelope Type'){
              
            if($scope.envelopeType==='1'){
                 $scope.QualificationWeightage=false;
             $scope.QualificationWeightages=false;
            $scope.typeOfTender = '2';
            $scope.typeOfTenderStatus = true;
            $scope.managehideAndShow('typeOfTender');
            $scope.EnvelopeB = false;
             $scope.EnvelopeBQCBS = false;
             $scope.OpeningEBDate =  false;
             $scope.EnvelopeC = false;
             $scope.OpeningECDate =  false;
                     // document.getElementById("Qualification").style.display="none";
                      $scope.QualificationWeightage=false;
            }
            if($scope.envelopeType === '2'){
                $scope.QualificationWeightage=false;
             $scope.QualificationWeightages=false;
                $scope.typeOfTender = '2';
                  $scope.typeOfTenderStatus = false;
                  //document.getElementById("Qualification").style.display="none";
                  $scope.QualificationWeightage=false;
             $scope.EnvelopeB = false;
             $scope.EnvelopeBQCBS = false;
             $scope.OpeningEBDate =  false; //hide Tender Opening Envelope B Date
            }if($scope.envelopeType === '3'){
                $scope.QualificationWeightage=false;
                    //document.getElementById("Qualification").style.display="none";
                    $scope.QualificationWeightage=false;
                  $scope.typeOfTenderStatus = false;
            $scope.managehideAndShow('typeOfTender');
             $scope.EnvelopeB = true;
             $scope.EnvelopeBQCBS = false;
             $scope.OpeningEBDate =  true;  //show Tender Opening Envelope B Date
            }if($scope.envelopeType === '4'){
                //alert("arham");
                
             $scope.EnvelopeBQCBS = true;
             $scope.EnvelopeB = false;
             $scope.OpeningEBDate =  true;
//            document.getElementById("Qualification").style.display="block";
          $scope.QualificationWeightage=true;
            }
        }
       
        if(type === 'Tender Stage'){
          if($scope.tenderStageDropDown === '1'){
           //$scope.OpeningEBDate = true;  
           $scope.OpeningECDate = true;  
          }  
          if($scope.tenderStageDropDown === '2'){
            //$scope.OpeningEBDate = false;  
           $scope.OpeningECDate = false;  
          }  
        }
       
        if(type === 'Show Ammendment Button'){
           $scope.ammendmentButton = false;    
        }
       
        if(type === 'templateANameDropDown'){
            if($scope.envelopeAName==='0'){
               $scope.templateEnvelopeAButton = true;  
            }else{
               $scope.templateEnvelopeAButton = false;  
            }
        }
       
        if(type === 'templateBNameDropDown'){
            if($scope.envelopeBName==='0'){
               $scope.templateEnvelopeBButton = true;  
            }else{
               $scope.templateEnvelopeBButton = false;  
            }
        }
    }
   
   
    $scope.disableAndEnableToggle = function(){
        if($("#bidSubmissionDate").val() !== "")
        {
         $scope.dependOnBidSubmissionDate = false;  
        }else{
          $scope.dependOnBidSubmissionDate = true;  
        }
    }
    
    $scope.updateWeightagePercent = function() {
        //alert("huhuh");
        var weightage = $scope.qualificationWeightage;
        if (weightage < 0 ||weightage > 100) {
            $scope.qualificationWeightageError = "Enter value under 100";
            $scope.qualificationWeightage = "";
            $scope.qualificationWeightagePercent="";
        } else {
            $scope.qualificationWeightageError = "";
        }
        var percent = 100 - weightage;
        $scope.qualificationWeightagePercent = percent >= 0 ? percent : 0;
    };
    
    $scope.updateMinimiumQualification=function(){
      //  alert("uuu");
       var inputValue = $scope.minimiumQualification;
        if (inputValue < 0 ||inputValue > 100) {
            $scope.minimiumQualificationError = "Enter value under 100 Only";
            $scope.minimiumQualification = "";
          
        } else {
            $scope.minimiumQualificationError = "";
         
        }
    };
    /*
     * Function to managing the status of check boxes
     * @param checked box status
     * @return status
     */
    $scope.tenderCheckedBox = function(boxStatus){
    if(boxStatus === 'ReBid'){
       if($("#tenderReBid").prop("checked") === false){
           $scope.reBidStatus = "Do not";
           $(".tenderReBid1").addClass("text-muted");
       }else{
           $(".tenderReBid1").removeClass("text-muted");
           $scope.reBidStatus = "";
       }
    }    
    if(boxStatus === 'BidWithdraw'){
       if($("#tenderBidWithdraw").prop("checked") === false){
           $scope.bidWithdrawStatus = "Do not";
           $(".tenderBidWithdraw1").addClass("text-muted");
       }else{
           $(".tenderBidWithdraw1").removeClass("text-muted");
           $scope.bidWithdrawStatus = "";
       }
    }    
    if(boxStatus === 'modeOfFeeForTenderFee'){
       if($("#modeOfFeeForTenderFee").prop("checked") === true){
           $scope.modeOfFeeForTenderFee = "Online";
       }else{
           $scope.modeOfFeeForTenderFee = "Offline";
       }
    }    
    if(boxStatus === 'modeOfFeeForEMDApplicable'){
       if($("#modeOfFeeForEMDApplicable").prop("checked") === true){
           $scope.modeOfFeeForEMDApplicable = "Online";
       }else{
           $scope.modeOfFeeForEMDApplicable = "Offline";
       }
    }    
    if(boxStatus === 'scstExemption'){
       if($("#scstExemption").prop("checked") === true){
           $scope.scstExemptionStatus = "Allow";
       }else{
           $scope.scstExemptionStatus = "Not Allow";
       }
    }    
    if(boxStatus === 'msmensicExemption'){
       if($("#msmensicExemption").prop("checked") === true){
           $scope.msmensicExemptionStatus = "Allow";
       }else{
           $scope.msmensicExemptionStatus = "Not Allow";
       }
    }    
    if(boxStatus === 'obcExemption'){
       if($("#obcExemption").prop("checked") === true){
           $scope.obcExemptionStatus = "Allow";
       }else{
           $scope.obcExemptionStatus = "Not Allow";
       }
    }    
    if(boxStatus === 'ammendmentPrivilege'){
       if($("#ammendmentPrivilege").prop("checked") === true){
           $scope.ammendmentPrivilegeStatus = "Allow";
           $scope.ammendmentField = false;
       }else{
           $scope.ammendmentPrivilegeStatus = "Not Allow";
           $scope.ammendmentField = true;
       }
    }      
 };
   
    /*Function Call to copy the tender
     * @param {type}
     * @return {action} e-Tendering
     */
    $scope.copyTenderfunctionality = function(){
      var formData = new FormData();
      //copyTenderNumbers?tenderNumber={{copiedNumber}}&tender_Id={{tenderIdToCopy}}&noOfCopy={{noOfCopy}}
      var tenderNumber = $scope.copiedNumber;
      var tenderIdToCopy = $scope.tenderIdToCopy;
      var noOfCopy = $scope.noOfCopy;
      var nitNumber = $scope.nitNumber;
      var nitDate = $("#nitDate").val();
//      formData.append("tenderNumber", tenderNumber);
      // alert(tenderNumber+":"+noOfCopy);
       if(nitNumber === ""){
            $("#nitNumber").val("");
            $("#nitNumber").css("border-color", "red");
            $("#nitNumberError").html("NIT Number not be blank");
            return false;
        }else{
           
            $("#nitNumber").css("border-color", "green");
            $("#nitNumberError").html("");
        }
        if(nitDate === ""){
            $("#nitDate").val("");
            $("#nitDate").css("border-color", "red");
            $("#nitDateError").html("NIT Date not be blank");
            return false;
        }else{
            $("#nitDate").css("border-color", "green");
            $("#nitDateError").html("");
        }
        if(tenderNumber === "" || typeof tenderNumber === "undefined"){
            $("#copiedNumber").css("border-color", "red");
            $("#copyTenderNumberError").html("Tender Number not be blank");
            return false;
        }else{
            $("#copiedNumber").css("border-color", "green");
            $("#copyTenderNumberError").html("");
        }
       
      formData.append("tender_Id", tenderIdToCopy);
      formData.append("noOfCopy", noOfCopy);
      formData.append("nitDate", nitDate);
      formData.append("nitNumber", nitNumber);
      $http.post('copyTenderNumbers', formData, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                }).success(function (response){
                      location.reload();  
                }).error(function (response) {
                     alert(response.data);
                });
        $http({
            url: 'copyTenderNumbers',
            method: "POST",
            data: {'tenderNumber': tenderNumber, tenderId : tenderIdToCopy, 'noOfCopy' : noOfCopy},
             headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
                .then(function (response) {
                    alert(response.data);
                });
    };
   
    /*
     * Function call to generate unique tender number
     * @param {type} e
     * @returns String
     */
    $("#hiddenTenderNumber").val("");
    $scope.getTenderNumber = function(){
        $http.get("generateTenderNumber.action")
                .then(function (response) {
                //$("#generatedTenderNumber").html(response.data);
                $("#hiddenTenderNumber").val(response.data);
            });
    };
   
   
   
   
    /*
     * Function call to cahneg the stage of tender process
     * @param {type} e
     */
    $("#copyTenderFunctionality").hide();
    //$("#tender_Id").val('0');
    $scope.tenderStage = function(e){
        if (e === 'new Tender'){
        $("#copyTenderFunctionality").hide();
       $scope.saveAndNextButton = false;
        }
        if (e === 'copy Tender'){
        $("#copyTenderFunctionality").show();
        $scope.saveAndNextButton = true;
        }
    };
   
   
    /*
     * Function to fetch all previous tender number
     * @param null
     * @return list
     */
    $scope.fetchPreviousTenderNumber = function(){
        $http.get("fetchPreviousTenderNumber.action")
                .then(function (response) {
            $scope.previousTenderDetails = response.data;
            });
    };
   
    /*
     * Function to fetch a previous tender details
     * @param tender_Id
     * @return tender
     */
    $scope.fetchPreviouTenderDetail = function(tender_Id){
        $http.get("fetchPreviouTenderDetails.action?tender_Id="+tender_Id)
                .then(function (response) {
            $scope.previousTenderSummary = response.data;
            });
    };
   
    /*
     * Function to fetch a previous tender details
     * @param tender_Id
     * @return tender
     */
    $scope.fetchPreviouTenderDetailAmend = function(tenderAmend_Id){
        //alert(tenderAmend_Id);
        $http.get("fetchPreviouTenderDetailsAmendment.action?tenderAmend_Id="+tenderAmend_Id)
                .then(function (response) {
            $scope.previousTenderSummary = response.data;
            });
    };
   
   
    /*
     * Function call to copy tender number on text field
     * @param tenderNumber
     * @return tenderNumber
     */
    $scope.copyTenderNumber = function(tenderNumber, tender_Id){
      $scope.copiedNumber = tenderNumber;
      $scope.tenderIdToCopy = tender_Id;
      $scope.copyButton = false;
    };
   
    /*
     * Function call to copy tenders and there quantity
     * @param tenderNumber, No of copies
     */
    $scope.checkTenderNumber = function(){
        var tenderNo = $("#tenderNo").val();
       $http.get("checkTenderNumberExistence.action?tenderNumber="+tenderNo)
                .then(function (response) {
                if(response.data === true){
                 $scope.copyButton = false;
                }else{
                 $scope.copyButton = true;  
                }
            });
    };
   
    /*
     * Function call to save the tender details
     *
     * @param steps,Tender Details, Tender Id
     * @return Tender Id
     * @create 20 June 2018
     * @version 2.0.0
     */
    $scope.tenderCreation = function(e){
       var tender_Id =  $scope.tender_Id;
       var tenderId = parseInt(tender_Id);
       var keyDatesId = $("#keyDatesId").val();
      var tender = new FormData();
      tender = $("#tenderCreation").serialize();
        $http.get("tenderCreation.action?tender="+tender+"&tender_Id="+tenderId+"&keyDatesId="+keyDatesId,
               { params:{step: e} }
            ).then(function (response) {
            $scope.tender_Id = response.data.tender_Id;
            console.log("STAGEEE"+response.data.tenderStage);
              if(response.data.tenderStage==='1'){
             
                document.getElementById("stageToShow").style.display="none";
                 document.getElementById("Show").style.display="none";
        
            }
            
            if(response.data.tenderStage==='2'){
           
                document.getElementById("stageToShow").style.display="block";
                 document.getElementById("Show").style.display="block";
               
                 
            }
            
          
            
            $("#tenderStatusManaging").val(response.data.tenderStatus);
            $("#tender_IdForEnvelopeA").val(response.data); 
            
            $("#keyDatesId").val(response.data.tenderKeyDates.keyDatesId);  
        });  
    };
   
     /*
     * Function call to save the tender details
     *
     * @param steps,Tender Details, Tender Id
     * @return Tender Id
     * @create 20 June 2018
     * @version 2.0.0
     */
    $scope.tenderAmmendUpdate = function(e){
        alert("tenderAmmendment");
       var tender_Id = $("#tender_Id").val();
       var tenderId = parseInt(tender_Id);
       var keyDatesId = $("#keyDateId").val();
      var tender = new FormData();
      tender = $("#tenderCreation").serialize();
      tender.append('step', e);
      tender.append('keyDateId', keyDatesId);
      tender.append('tender_Id', tender_Id);
      $("#tenderCreation").submit();
//        $http({
//          method  : 'POST',
//          url     : 'updateTenderDetailsForAmmendment',
//          data    : {tender:tender, tenderId:tenderId, keyDatesId:keyDatesId, step:e},
//          headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
//         });
      //$(location).attr('href', 'updateTenderDetailsForAmmendment?tender='+tender+'&tender_Id='+tenderId+'&keyDatesId='+keyDatesId+'&step='+e);
     
    };
   
    $scope.arrangingTenderCreationWizard = function(){
      $scope.showOfficerForEnvelopeA('A');
      $scope.showEnvelopeANames('A');
      $scope.showOfficerForEnvelopeA('B');
      $scope.showEnvelopeANames('B');
      $scope.showEnvelopeANames('QCBS');
      $scope.showOfficerForEnvelopeA('C');
    };
   

   
    /*
     * Function save the keydates
     * @param Tender Key Dates, Tender Id
     * @Create 3 July 2018
     * @version 2.0.0
     */  
    $scope.tenderKeyDates = function(){
    var tenderKeyDates = $("#tenderKeyDates").serialize();
    //alert(tenderKeyDates);
        var tender_Id = $("#tender_Id").val();
        var keyDatesId = $("#keyDatesId").val();
       // alert(tender_Id+" : "+keyDatesId)
        var step = "step7";
        var tenderKeyDatesURL = "tenderKeyDates.action?tenderKeyDates="+tenderKeyDates+"&tender_Id="+tender_Id;
        $http.get(tenderKeyDatesURL,
               { params:{step: step} }
            ).then(function (response) {
            $("#keyDatesId").val(response.data);
        });      
        return false;
    };
   
    $scope.showModelForEnvelope = function(alpha){
        $scope.saveEnvelope = 'saveEnvelope'+alpha+'';
        $scope.alpha = alpha;
        $("#resetDynamicTemplate").click();
        for(var i=1;i<100;i++){
            $scope.removeNewChoice2();
        }
    };
   
    $scope.checkDuplicateEnvelopeName = function(alpha, envelopeName){
      $scope.alphaButton[alpha] = false;
      $http.get("checkTemplateDuplicateName"+alpha+"?envelopeName="+envelopeName).then(function(response) {
          if(response.data===false){
           $scope.alphaButton[alpha] = true;
            swal(
                    'Error',
                    'Envelope ' + alpha + ' Name should be unique',
                    'error'
                    );
            $scope.envelopeATemplateName = "";
          }else{
           $scope.alphaButton[alpha] = false;    
          }
         
      });
    };
   
   
    $scope.fetchDynamicTemplateData = function(alpha){
        $("#resetDynamicTemplate").click();
        $scope.templateLabelSequnce[1] = 0;
         $scope.templateLabelName[1] = "";
         $scope.templateLabelType[1] = "";
        var fetchDynamicTemplateData;
        var sequnce;
        if(alpha==='A'){
        var envelopeAId = $scope.envelopeAName;
        }
        if(alpha==='B'){
        var envelopeBId = $scope.envelopeBName;
        }
            if(alpha==='A'){
           fetchDynamicTemplateDataURL = "fetchDynamicTemplateData"+alpha+"?envelopeAId=" + envelopeAId;
            }
            if(alpha==='B'){
           fetchDynamicTemplateDataURL = "fetchDynamicTemplateData"+alpha+"?envelopeBId=" + envelopeBId;
            }
            $http.get(fetchDynamicTemplateDataURL).then(function(response) {
                   response.data.map(function(envelopeA){
                     sequnce = envelopeA.tender_EnvelopeA_SequnceId.toString();
                          $scope.templateLabelSequnce[envelopeA.tender_EnvelopeA_SequnceId] = envelopeA.tender_EnvelopeA_SequnceId;
                          $scope.templateLabelName[envelopeA.tender_EnvelopeA_SequnceId] = envelopeA.labelNameA;
                          $scope.templateLabelType[envelopeA.tender_EnvelopeA_SequnceId] = envelopeA.labelTypeA;
                        if(envelopeA.tender_EnvelopeA_SequnceId !== 0){
                            $scope.addNewChoice2();
                           }
                   });
                  $scope.removeNewChoice2();
                });
    }
   
    //Fetch Sub Division on teh basis of Division Id
    $scope.getSubDivision = function (division_id) {
        $http.get("getSubDivisionByAjax?division_id=" + division_id)
                .then(function (response) {
                    //alert(response.data);
                    $scope.subdivisions = response.data;
                    if (response.data == "") {
                        // alert("Data is not available");
                        $scope.msg_SubDivision = "Sub Division is not available.";
                    }
                });
            }
           
    /*
     * saveTemplateData
     * Function used to save the Envelope A & Envelope B information
     */
    $scope.saveTemplateData = function(alpha){
        var tender_Id = $scope.tender_Id;
//        alert(alpha);
        var saveTemplateURL;
        if(alpha === 'A'){
        var saveEnvelopeASubmit = $("#saveEnvelope"+alpha+"Submit").serialize();
        var submittedEnvelopeA_Id = $("#submittedEnvelopeA_Id").val();
        saveTemplateURL = "saveTemplateData"+alpha+".action?saveEnvelopeASubmit="+saveEnvelopeASubmit+"&tender_Id="+tender_Id+"&submittedEnvelopeA_Id="+submittedEnvelopeA_Id;
        }
        if(alpha === 'B'){
        var saveEnvelopeBSubmit = $("#saveEnvelope"+alpha+"Submit").serialize();
        var submittedEnvelopeB_Id = $("#submittedEnvelopeB_Id").val();
        saveTemplateURL = "saveTemplateData"+alpha+".action?saveEnvelopeBSubmit="+saveEnvelopeBSubmit+"&tender_Id="+tender_Id+"&submittedEnvelopeB_Id="+submittedEnvelopeB_Id;
        }
        if(alpha === 'QCBS'){
            //alert(tender_Id);
        var saveTemplateDataQCBS = $("#saveTemplateDataQCBS").serialize();
        var submittedQCBS = $("#submittedQCBS").val();
        saveTemplateURL = "saveTemplateDataQCBS.action?saveTemplateDataQCBS="+saveTemplateDataQCBS+"&tender_Id="+tender_Id+"&submittedQCBS="+submittedQCBS;
        }
        if(alpha === 'C'){
        var saveEnvelopeCSubmit = $("#saveEnvelope"+alpha+"Submit").serialize();
        var submittedEnvelopeC_Id = $("#submittedEnvelopeC_Id").val();
        //alert(submittedEnvelopeC_Id);
        saveTemplateURL = "saveTemplateData"+alpha+".action?saveEnvelopeCSubmit="+saveEnvelopeCSubmit+"&tender_Id="+tender_Id+"&submittedEnvelopeC_Id="+submittedEnvelopeC_Id;
        }
        console.log(saveTemplateURL);
        $http.get(saveTemplateURL)
                .then(function (response) {
            var message ;
            if(alpha === 'A'){
            $("#viewTemplateButtonA").show();
            $("#submittedEnvelopeA_Id").val(response.data);
            message = "Envelope A Added Successfully";
            }
            if(alpha === 'B'){
            $("#viewTemplateButtonB").show();
            $("#submittedEnvelopeB_Id").val(response.data);
            message = "Envelope B Added Successfully";
            }    
            if(alpha === 'QCBS'){
            $("#viewTemplateButtonB").show();
            $("#submittedQCBS").val(response.data);
            message = "Envelope QCBS Added Successfully";
            }  
            if(alpha === 'C'){
            $("#viewTemplateButtonC").show();
            $("#submittedEnvelopeC_Id").val(response.data);
            $("#modelCClose").click();
            message = "Envelope C Added Successfully";
            }
                 swal(
                        'Success',
                        message,
                        'success'
                        );
            });
    };
   
   
    $scope.envelopeSubmit = function(alpha){
        var tender_Id = $scope.tender_Id;
        var saveEnvelope = new FormData();
        saveEnvelope =  $("#saveEnvelope"+alpha).serialize();
        var envelopeATemplateName = $("#envelopeATemplateName").val();
        var tender_IdForEnvelopeA = $("#tender_IdForEnvelopeA").val();
        var envelopeURL = "saveEnvelope"+alpha+".action?saveEnvelope="+saveEnvelope+"&envelopeATemplateName="+envelopeATemplateName+"&tender_Id="+tender_Id;
        $http.post(envelopeURL)
                .then(function (response) {
                 swal(
                        'Success',
                        'Envelope '+alpha+' Created Successfully',
                        'success'
                        );
                $("#envelopeClose").click();
               
                $scope.showEnvelopeANames(alpha);
                if(alpha === 'A'){
                $scope.envelopeAName = "0";
                //alert(response.data);
                var dropName = (response.data).toString();
                $scope.envelopeAName = dropName;
                //$("#envelopeAName").val($scope.envelopeAName);
                }
                if(alpha === 'B'){
                $scope.envelopeBName = "0";    
                //alert(response.data);
                var dropName = (response.data).toString();
                $scope.envelopeBName = dropName;
                }
            });
    };
   
    $scope.dynamicTemplateChecked = function(id){
      var tender_Id = $scope.tender_Id;
      var status = $(".true"+id).prop('checked');
      //alert(status);
      if(status === true){
         $(".false"+id).prop('checked', false);
      }else{
         $(".false"+id).prop('checked', true);
      }
    }
   
    $scope.showModelForGenerateTemplate = function(tender_EnvelopeA_Id, alpha){
       // alert(tender_EnvelopeA_Id);
       console.log("HIIIIIIIIII");
       alert("HIIIIII")
       var tender_Id = $("#tender_Id").val();
       //alert(tender_EnvelopeA_Id);
       var envelopeURL = "showDynamicTemplate"+alpha+".action?tender_EnvelopeA_Id="+tender_EnvelopeA_Id;
       $http.get(envelopeURL)
                .then(function (response){
                   // alert(response.data);
                    var obj = response.data;
                    $scope.dynamicTemplate = response.data;
//                    $.each(obj, function(key, value){
//                   // alert(value.labelNameA);
//                    });
                });
        };
   
    $scope.testingDynamicTemplate = function(){
          swal(
                        'Testing Done',
                        'Dynamic Template Testing',
                        'success'
                        );
    };
   
    $scope.showOfficerForEnvelopeA = function(alpha){
       var fetchOfficerForEnvelopeAURL = "fetchOfficerForEnvelope"+alpha+".action";
       $http.post(fetchOfficerForEnvelopeAURL)
            .then(function (response){
               console.log(response.data);
               if(alpha === 'A'){
               $scope.DepartmentUser = response.data;
               }
               if(alpha === 'B'){
               $scope.DepartmentUserB = response.data;    
               }
                if(alpha === 'C'){
               $scope.DepartmentUserC = response.data;
               }
        });
    };
   
    $scope.showEnvelopeANames = function(alpha){
       
       //alert("Fetch the Envelope Name For Envelope A");
       var showEnvelopeANamesURL = "showEnvelope"+alpha+"Names.action";
       $http.post(showEnvelopeANamesURL)
            .then(function (response){
                console.log(response.data);
                if(alpha === 'A'){
                $scope.templateNameForEnvelopeA = response.data;
                }
                if(alpha === 'B'){
                $scope.templateNameForEnvelopeB = response.data;
                }
                if(alpha === 'QCBS'){
                $scope.templateNameForQCBS = response.data;
                }
        });  
    };
   
    $scope.showAmmendmentPrivilegeOfficer = function(){
//        if ($("#ammendmentPrivilege").prop("checked") === true){
            $("#showAmmendmentOfficer").show();
             var ammendmentPrivilegeURL = "showAmmendmentPrivilegeOfficer.action";
             $http.get(ammendmentPrivilegeURL)
                .then(function (response){
                 $scope.DepartmentUserForAmmendmentPrivilege = response.data;
             });
        };
   
    $scope.tenderCategoryShow = function(){  
        $scope.areaOfWork = "0";
        var tenderCategory = $scope.tenderCategory;
        //This URL move in the TenderCategoryAreaofworkkeywords controller
        var areaOfWorkUrl = "fetchAreaOfWork.action?tender_category_id="+tenderCategory;
        $http.post(areaOfWorkUrl)
            .then(function (response){
                $scope.areaOfWork = response.data;
               
        });
        $scope.areaOfWork = "0";
    };        
   
    /*
     * Function call to show the keyowrds
     * @param areaOfWorkId,
     * @create 12 Oct 2018
     * @version 2.0.0
     */
   
    $scope.tenderKeyWordsShow = function(id){
        //Initialization of select Picker
        $('#keywordsIDS').selectpicker();
        $scope.keyword = "";
        //alert(id);
        //This URL move in the TenderCategoryAreaofworkkeywords controller
        var areaOfWorkUrl = "fetchKeyword.action?areaofwork_id="+id;
        $http.post(areaOfWorkUrl)
                .then(function (response){
                    $scope.keywords = response.data;
                    var log = [];
                });    
            };
     
    /*
     * Function call to show the empanelment Contractor
     * @param areaOfWorkId,
     * @create 12 Oct 2018
     * @version 2.0.0
     */
    $scope.empanelContractorShow = function(id){
    $scope.contractors = "";
            //alert(id);
            $(".multiSel").empty();
            //This URL move in the TenderCategoryAreaofworkkeywords controller
            var empanelledContracorsUrl = "fetchEmpanelContractor.action?areaofworkId=" + id;
            $http.post(empanelledContracorsUrl)
            .then(function (response){
            //alert(response.data);
            $scope.contractors = response.data;
            });
    };
     
    /*
     * Function call to show the SOR document
     * @param sorDocumentFile,
     * @create 3 Aug 2018
     * @version 2.0.0
     */
    $scope.sorDocument = function(sorDocumentFile){  
       var document = $(".sorDOcument"+sorDocumentFile).attr('id');
       $scope.sorDocuments = document;
       $scope.sorDocumentName = "Click to view your document";
    };  
   
       
    /*
     * Function call to show the tender details by tender_Id
     * fetchTenderDetails
     * @param {type} tender_Id
     * @returns {undefined}
     * @create 9 Aug 2018
     * @version 2.0.0
     */
    $scope.fetchTenderDetails = function(tender_Id, tender_Number){
        //$scope.showAmmendmentPrivilegeOfficer();
        $scope.envelopeType = "0";
        tender_Id = parseInt(tender_Id+" : "+tender_Number);
        $('#preloaderSpinner').css('z-index','1060');
        $('#preloaderSpinner').css('opacity:','0.005');
        $('#preloaderSpinner').css('background:','#ffffff4d','!important' );
        $("#preloaderSpinner").show();
         $("#newTenderRadio").prop('checked', true);
         $("#newTenderRadio").prop('disabled', true);
         $("#copyTenderRadio").prop('disabled', true);
         $scope.arrangingTenderCreationWizard();
       //alert(tender_Id+" : "+tender_Number);
        var reId = '0';
        var fetchTenderDataURL = "fetchTenderData.action?tender_Id="+tender_Id;        //alert(fetchTenderDataURL);
        $http.get(fetchTenderDataURL)
                .then(function (response){
                   
                    //step assign in wizard after fetching the data.
                    $scope.step = response.data.wizardStep;
                    $scope.wizardStep = response.data.wizardStep;
                    console.log($scope.wizardStep);
                   
                   if($scope.wizardStep !== 'step8'){
                      $("#"+$scope.wizardStep).click();
                      $(".btn_prev").css("display", "inline-block");
                     $scope.tenderWizardButton = "Save And next";
                     $scope.tenderNumber = response.data.tenderNumber;
                   }else{
                     $scope.tenderWizardButton = "Update";
                   }
                   if($scope.wizardStep === 'step1'){
                       $(".btn_prev").css("display", "none");
                   }
                   
                    /**Managing Step 1 */
                   $scope.tender_Id = response.data.tender_Id;
                   $("#tender_Id").val(response.data.tender_Id);
                   $("#tenderStatusManaging").val(response.data.tenderStatus);
                   $scope.nitNumber = response.data.nitNumber;
                   $scope.nitDate = response.data.nitDate;
                   $scope.tenderNumber = response.data.tenderNumber;
                   
                   /**Managing Step 2 */
                   $("#tenderStage").val(response.data.tenderStage);
                   if(response.data.tenderStage!="0"){
                   $("#tenderStage").addClass("disabledClass");
                   }
                   $("#selectiveTender").val(response.data.selectiveTender);
                   $scope.selectiveTender = response.data.selectiveTender;
                   $scope.managehideAndShow('Selective Tender');
                   
                   $("#tenderCategory").val(response.data.tenderCategory);
                   //Calling tender Category function to show area of work
                   $scope.tenderCategory = response.data.tenderCategory;
                   $scope.tenderCategoryShow();
                   $scope.areaOfWorkss = response.data.areaOfWork;
                   
                   
                   setTimeout(function(){
                    var log = [];
                    var $option = [];
                    angular.forEach(response.data.tenderKeywordsNameList, function(value, key) {
                    $option.push(value.tenderKeyWordsId);
                    }, log);
                    console.log("KeyWords: "+$option);
             $('select[name="tenderKeywords"]').selectpicker('val', $option);
             $('select[name="tenderKeywords"]').selectpicker('refresh');
                   }, 1000);
                   
              $scope.managehideAndShow('Tender Categories');
             
              if($scope.tenderCategory === "1" || $scope.tenderCategory === "3"){
             //Calling Area of work function to show Keywords.
              if(response.data.sorDocument !== "notApplicable"){
               
              $("#sorDOcument").val(response.data.sorDocument);
              setTimeout(function(){
                    var log = [];
                    var $option = [];
                    angular.forEach(response.data.sorDocument, function(value, key) {
                       // alert(value);
                    $option.push(value);
                      //alert($option);
                    }, log);
                    //console.log("sorDocument: "+$option);
             $('select[name="sorDocument"]').selectpicker('val', $option);
             $('select[name="sorDocument"]').selectpicker('refresh');
                   }, 1000);
              $scope.sorDocumentFile = response.data.sorDocument;
              $scope.sorDocument(response.data.sorDocument);
                }
                if (response.data.sorDocument === "notApplicable") {
                    $("#sorDOcument").val("notApplicable");
                }
              }
                if ($scope.tenderCategory === "2") {
                    if (response.data.buyBackPolicy === "yes") {
                        $scope.buyBackPolDoc = false;
                    } else {
                        $scope.buyBackPolDoc = true;
                    }
                }
             
              //Fetch the Empanel Contractor
              if (typeof response.data.empanelContrators !== "undefined") {
              setTimeout(function(){
                    var log = [];
                    var $option = [];
                      response.data.empanelContrators.split(",").map(function(opt){
                var op = parseInt(opt);
                $option.push(op);
                });
             $('select[name="empanelContrators"]').selectpicker('val', $option);
             $('#empanelContrators').selectpicker('refresh');
             }, 1000);
            }
         
              if(response.data.tenderRebid=="Allowed"){
               $("#tenderReBid").prop('checked', true);
               $scope.tenderCheckedBox('ReBid');
              }
              if(response.data.tenderRebid=="Not Allowed"){
               $("#tenderReBid").prop('checked', false);
               $scope.tenderCheckedBox('ReBid');
              }    
              if(response.data.tenderBidWithdraw=="Allowed"){
               $("#tenderBidWithdraw").prop('checked', true);  
               $scope.tenderCheckedBox('BidWithdraw');
              }      
              if(response.data.tenderBidWithdraw=="Not Allowed"){
               $("#tenderBidWithdraw").prop('checked', false);  
               $scope.tenderCheckedBox('BidWithdraw');
              }
               
                   
               /**Managing Step 3*/
               $("#nameOfWork").val(response.data.nameOfWork);
               $("#descriptionOfWork").val(response.data.descriptionOfWork);
               $scope.estimateValue = response.data.estimateValueInFig;
               $scope.tenderFee = response.data.tenderFeeInFig;
               if(response.data.modeOfFeeForTenderFee=="online"){
                   $("#modeOfFeeForTenderFee").prop("checked", true);
                   $scope.tenderCheckedBox('modeOfFeeForTenderFee');
               }  
               if(response.data.modeOfFeeForTenderFee=="offline"){
                   $("#modeOfFeeForTenderFee").prop("checked", false);
                   $scope.tenderCheckedBox('modeOfFeeForTenderFee');
               }
               $("#workCompletionType").val(response.data.workCompletionType);
               $("#bidValidateType").val(response.data.emdApplicable);
               $("#bidValidatePeriod").val(response.data.bidValidatePeriod);
               $("#workCompletionPeriod").val(response.data.workCompletionPeriod);
               $scope.rainySeasonMode = response.data.rainySeason;
               if(response.data.tenderSelectedDivision!==""){
                   
               }
               
               /**Managing Step 4*/
               $("#envelopeType").val(response.data.envelopeType);
               $scope.envelopeType = response.data.envelopeType;
               $("#contractorClass").val(response.data.contractorClass);
               $("#typeOfTender").val(response.data.typeOfTender);
               $scope.typeOfTender = response.data.typeOfTender;
               $scope.managehideAndShow('typeOfTender');
               $scope.emdValues = response.data.emdInFig;
               $("#emdApplicable").val(response.data.typeOfTender);
               $("#emdInWords").val(response.data.emdInWords);
               if(response.data.modeOfFeeForEMDApplicable=="online"){
                   $("#modeOfFeeForEMDApplicable").prop("checked", true);
                   $scope.tenderCheckedBox('modeOfFeeForEMDApplicable');
               }  
               if(response.data.modeOfFeeForEMDApplicable=="offline"){
                   $("#modeOfFeeForEMDApplicable").prop("checked", false);
                   $scope.tenderCheckedBox('modeOfFeeForEMDApplicable');
               }
               //to show the keywords checked according to there name by
                if (response.data.scstExemption === "Allowed"){
                $("#scstExemption").prop('checked', true);
                        $scope.tenderCheckedBox('scstExemption');
                        $scope.scstExemption = true;
                        $scope.tenderfeeSCSTExemption = response.data.tenderfeeSCSTExemption;
                        $scope.emdTenderSCSTFeeExemption = response.data.emdTenderSCSTFeeExemption;
                }

                if (response.data.obcExemption === "Allowed"){
                $("#obcExemption").prop('checked', true);
                        $scope.tenderCheckedBox('obcExemption');
                        $scope.obcExemption = true;
                        $scope.tenderfeeOBCExemption = response.data.tenderfeeOBCExemption;
                        $scope.emdTenderOBCFeeExemption = response.data.emdTenderOBCFeeExemption;
                }

                if (response.data.msmensicExemption === "Allowed"){
                $("#msmensicExemption").prop('checked', true);
                        $scope.tenderCheckedBox('msmensicExemption');
                        $scope.msmensicExemption = true;
                        $scope.tenderfeeMSMENSICExemption = response.data.tenderfeeMSMENSICExemption;
                        $scope.emdMSMENSICExemption = response.data.emdMSMENSICExemption;
                }
                   
                 
               /**Managing step 5*/
               //If The Envelope Type is 3Envelope
               if (response.data.envelopeType === '3'){
               $scope.EnvelopeB = true;
               $scope.EnvelopeBQCBS = false;
               $scope.OpeningEBDate = true;
               setTimeout(function(){
                $scope.fetchTemplateADetails(tender_Id);
                $scope.fetchTemplateBDetails(tender_Id);
                $scope.fetchTemplateCDetails(tender_Id);
                }, 1000);
               }
               
               //If The Envelope Type is QCBS
               if (response.data.envelopeType === '4'){
               $scope.EnvelopeB = false;
               $scope.EnvelopeBQCBS = true;
               $scope.OpeningEBDate = true;
               setTimeout(function(){
                $scope.fetchTemplateADetails(tender_Id);
                $scope.fetchTemplateBQCBSDetails(tender_Id);
                $scope.fetchTemplateCDetails(tender_Id);
                }, 1000);
               }
               
               //If The Envelope Type is 2Envelope
               if (response.data.envelopeType === '2'){
               $scope.EnvelopeB = false;
               $scope.EnvelopeBQCBS = false;
               $scope.OpeningEBDate = false;
               setTimeout(function(){
                $scope.fetchTemplateADetails(tender_Id);
                $scope.fetchTemplateCDetails(tender_Id);
                }, 1000);
               }
               
               //If The Envelope Type is 1Envelope
               if (response.data.envelopeType === '1'){
               $scope.EnvelopeB = false;
               $scope.EnvelopeBQCBS = false;
               $scope.OpeningEBDate = false;
                setTimeout(function(){
                $scope.fetchTemplateADetails(tender_Id);
                }, 1000);
               }
               
               //If The Ammendment Privilege is applicable on the tender
               if(response.data.ammendmentPrivilege==='Allowed'){
                 $("#ammendmentPrivilege").prop("checked", true);
                 $scope.tenderCheckedBox('ammendmentPrivilege');
               }
               
               if (typeof response.data.ammendmentPrivilegeOfficer !== "undefined") {
             var option = [];
             response.data.ammendmentPrivilegeOfficer.split(",").map(function(opt){
                var op = parseInt(opt);
                option.push(op);
               
                });
             $('select[name="ammendmentPrivilegeOfficer"]').selectpicker('val', option);
             $('select[name="ammendmentPrivilegeOfficer"]').selectpicker('refresh');
            }
           
                   /**Managin step 6 */
                    //checked whether the singedPDF is checked or not
                    if (response.data.singedPDF === 'no'){
                    $("#singedPDF").prop("checked");
                            $("#singedPDF").click();
                    }

                   /**Managing step 7*/
                   if (typeof response.data.tenderKeyDates !== "undefined") {
                   //Assign the key Dates in it's model attribute
                   $("#keyDatesId").val(response.data.tenderKeyDates.keyDatesId);
                   $scope.tenderReleaseDate = response.data.tenderKeyDates.tenderReleaseDate;
                   $scope.tenderPurchaseDate = response.data.tenderKeyDates.tenderPurchaseDate;
                   $scope.bidSubmissionDate = response.data.tenderKeyDates.bidSubmissionDate;
                   $scope.openingEA = response.data.tenderKeyDates.openingEA;
                   $scope.openingEB = response.data.tenderKeyDates.openingEB;
                   $scope.ecBidSubmissionDate=response.data.tenderKeyDates.ecBidSubmissionDate;
                  
                   $scope.openingEC = response.data.tenderKeyDates.openingEC;
                   $scope.openingECaftertechopening = response.data.tenderKeyDates.openingECaftertechopening;
                    //checked whether EC opening after technical bidding
                   if(response.data.tenderKeyDates.openingECaftertechopening === 'yes'){
                       $("#openingECaftertechopening").prop("checked", true);
//                       $("#ECOpeningDate1").hide();
                       $scope.managingOpeningECDate = false;
//                       $("#ECOpeningDate2").hide();
//                       $("#ECOpeningDate3").hide();
//                       $("#ECOpeningDate4").hide();
                      }
                    $scope.dependOnBidSubmissionDate = false;  
                    if(response.data.preBidMeetingStatus === 'yes'){
                       $("#preBidMeetingStatus").prop("checked", true);
                       $scope.prebidDiscussion = true;
                       $("#preBidMeetingVenue").val(response.data.preBidMeetingVenue);
                       $("#preBidMeeting").val(response.data.preBidMeetingDate);
                      }
                        setTimeout(function () {
                            $(".tenderKeyDateValueFetch").click();
                        }, 1500);
                   }
                   
                  $("#preloaderSpinner").hide();                
                });
       
               
               
         
        var fetchTenderDocumentDataURL = "fetchTenderDocumentData.action?tender_Id="+tender_Id;
        $http.post(fetchTenderDocumentDataURL)
                .then(function (response){
                 angular.forEach(response.data, function(value, key){
                     $scope.documentLabel[value.docSequnceId] = value.doc_Name;
                     $scope.doc_Id[value.docSequnceId] = value.doc_Id;
                     $scope.showDocument[value.docSequnceId] = value.doc_Path;  
                     if(value.documentVisibility === "true"){
                      $scope.documentVisibility[value.docSequnceId] = true;    
                     }else{
                      $scope.documentVisibility[value.docSequnceId] = false;
                     }
                     if(value.docSequnceId !== 0){
                         $scope.addNewChoice();
                     }
                    });
                    $scope.removeNewChoice();
                });
               
               
    };
   
   
   
    /*
    * Function call to remove the document
    * @param DocumentSequnceId ,Tender Id
    * @create 7 Sep 2018
    * @version 2.0.0
    */
    $scope.fetchTemplateADetails = function(tender_Id){
       var fetchTemplateADetailsURL = "fetchingDataForTemplateA?tender_Id="+tender_Id;
       $http.post(fetchTemplateADetailsURL)
        .then(function (response){
          $scope.envelopeAName = "0";
         if(response.data != 'null'){
          var envelopeIDA = parseInt(response.data.envelopeAId);
          $scope.envelopeAName = envelopeIDA;
          $("#viewTemplateButtonA").show();
          $scope.minOpeningOfficerA = response.data.minOpeningOfficerA;
          $("#submittedEnvelopeA_Id").val(response.data.submittedEnvelopeA_Id);
                var $option = [];
                response.data.envelopeAOfficers.split(",").map(function(opt){
                var op = parseInt(opt);
                $option.push(op);
                });
                //alert("A"+$option);
             $('select[name="envelopeAOfficers"]').selectpicker('val', $option);
             $('#envelopeAOfficers').selectpicker('refresh');
             setTimeout(function(){
                $("#envelopeAId").val(envelopeIDA);
                }, 500);
         }
        });
//        $event.stopPropagation();
    };
   
    /*
    * Function call to remove the document
    * @param DocumentSequnceId ,Tender Id
    * @create 7 Sep 2018
    * @version 2.0.0
    */
    $scope.fetchTemplateBDetails = function(tender_Id){
       var fetchTemplateBDetailsURL = "fetchingDataForTemplateB?tender_Id="+tender_Id;
       $http.post(fetchTemplateBDetailsURL)
        .then(function (response){
          $scope.envelopeBName = "0";
          if(response.data != 'null'){
          $("#viewTemplateButtonB").show();
          $scope.minOpeningOfficerB = response.data.minOpeningOfficerB;
          $scope.envelopeBName = response.data.envelopeBId;
          $("#submittedEnvelopeB_Id").val(response.data.submittedEnvelopeB_Id);
          var $option = [];
          response.data.envelopeBOfficers.split(",").map(function(opt){
                var op = parseInt(opt);
                $option.push(op);
                });
             $('select[name="envelopeBOfficers"]').selectpicker('val', $option);
             $('#envelopeBOfficers').selectpicker('refresh');
              setTimeout(function(){
                $("#envelopeBId").val(response.data.envelopeBId);
                }, 500);
         }
        });
       
    };
   
     /*
    * Function call to remove the document
    * @param DocumentSequnceId ,Tender Id
    * @create 7 Sep 2018
    * @version 2.0.0
    */
    $scope.fetchTemplateBQCBSDetails = function(tender_Id){
       var fetchTemplateBQCBSDetails = "fetchTemplateBQCBSDetails?tender_Id="+tender_Id;
       $http.post(fetchTemplateBQCBSDetails)
        .then(function (response){
        if(response.data != ''){    
          $("#templateId").val(response.data.templateId);
          $scope.minOpeningOfficerQCBS = response.data.minOpeningOfficerQCBS;
           $("#viewQCBSButton").show();
          $("#submittedQCBS").val(response.data.submittedQCBS);
             var $option = [];
          response.data.QCBSOfficers.split(",").map(function(opt){
                var op = parseInt(opt);
                $option.push(op);
                });
             $('select[name="QCBSOfficers"]').selectpicker('val', $option);
             $('#QCBSOfficers').selectpicker('refresh');
         }
        });
    };
   
      /*
    * Function call to remove the document
    * @param DocumentSequnceId ,Tender Id
    * @create 7 Sep 2018
    * @version 2.0.0
    */
    $scope.fetchTemplateCDetails = function(tender_Id){
       var fetchTemplateCDetailsURL = "fetchingDataForTemplateC?tender_Id="+tender_Id;
       $http.post(fetchTemplateCDetailsURL)
        .then(function (response){
        if(response.data != ''){    
          $scope.minOpeningOfficerC = response.data.minOpeningOfficerC;
          $("#viewTemplateButtonC").show();
          $("#submittedEnvelopeC_Id").val(response.data.submittedEnvelopeC_Id);
             var $option = [];
          response.data.envelopeCOfficers.split(",").map(function(opt){
              var op = parseInt(opt);
                $option.push(op);
                });
             $('#envelopeCOfficers').selectpicker('val', $option);
             $('#envelopeCOfficers').selectpicker('refresh');

                        if ($scope.typeOfTender === '1'){
                $scope.envelopeCImages = '#m_select_modalCpercentage';
                        $scope.viewEnvelopeC = true;
                } else
                        if ($scope.typeOfTender === '2'){
                $scope.envelopeCImages = '#m_select_modalClumsum';
                        $scope.viewEnvelopeC = true;
                }
         }else{
           $("#submittedEnvelopeC_Id").val(0);
         }
        });
    };
   
   
    /*
     * Function call to upload the Buy Back Documents
     * @param BuyBackDoucment, tender_Id
     * @Create 6 Aug 2018
     * @version 2.0.0
     */
    $scope.uploadFile = function () {
//            var file = $scope.myFile;
            var file = document.getElementById("couldFolderFile2").files[0];
            var tender_Id = $scope.tender_Id;
            var uploadUrl = $scope.URLOfCloudFilePath+".action?tender_Id="+tender_Id, //Url of webservice/api/server
                promise = fileUploadService.uploadFileToUrl(file, uploadUrl);
            promise.then(function (response) {
                $scope.serverResponse = response;
            }, function () {
                //$scope.serverResponse = 'An error has occurred';
            });
        };        
       
        /*
         * Function to show the selected Department User For Envlope A
         */
        $scope.departmentUserAView = function(DepartmentUsers){
            var array = $("#envelopeAOfficers").val();
            //alert(DepartmentUsers+":"+array);
            cheA = 0;
                //alert(array);
                var hhh = String(array);
                var iii = hhh.split(",");
                for (i = 0; i < iii.length; i++){
                    //alert(iii[i]);
                    cheA = cheA + 1;
                }
                //alert(cheA);
                 if(cheA>4){
                    swal(
                            'Error',
                            'Maximum Officer Selection is Four',
                            'error'
                          )
                     $scope.departmentUserARegId = [];
                 }
              $("#remainOpeningOfficerA").val(cheA);
        };
       
        $scope.totalDepartmentUser = function(count, countId , inputId, error, counts){
            var xcoun = $("#"+countId).val();
            //alert(count+" : "+countId+" : "+inputId+" : "+error+" : "+counts);
           if(count > xcoun || count > 4 || count < 0){
             $("#"+inputId).val("");
             if(xcoun <5){
             $("#"+counts).html("/ Minimun Opening Authority is "+xcoun);
             }else{
             $("#"+counts).html("/ Minimun Opening Authority is 4");    
             }
           }else{  
             $("#"+counts).html("");
           }
        };
       
        /*
         * Function to show the Department User For Envelope B
         */
        $scope.departmentUserBView = function(DepartmentUsers){
            var array = $("#envelopeBOfficers").val();
            cheB = 0;
                //alert(array);
                  var hhh = String(array);
                var iii = hhh.split(",");
                for (i = 0; i < iii.length; i++){
                    //alert(iii[i]);
                    cheB = cheB + 1;
                }
                if(cheB>4){
                    swal(
                            'Error',
                            'Maximum Officer Selection is Four',
                            'error'
                          )
                     $scope.departmentUserBRegId = [];
                 }
            $("#remainOpeningOfficerB").val(cheB);
        };
       
         /*
         * Function to show the Department User For Envelope B
         */
        $scope.departmentUserCView = function(DepartmentUsers){
            var array = $("#envelopeCOfficers").val();
            cheC = 0;
                //alert(array);
                  var hhh = String(array);
                var iii = hhh.split(",");
                for (i = 0; i < iii.length; i++){
                    //alert(iii[i]);
                    cheC = cheC + 1;
                }
                if(cheC>4){
                    swal(
                            'Error',
                            'Maximum Officer Selection is Four',
                            'error'
                          )
                     $scope.departmentUserCRegId = [];
                 }
            $("#remainOpeningOfficerC").val(cheC);
        };
       
        /*
         * Function to show the Department User For Envelope B
         */
        $scope.departmentUserQCBSView = function(DepartmentUsers){
            var array = $("#QCBSOfficers").val();
            cheC = 0;
                //alert(array);
                  var hhh = String(array);
                var iii = hhh.split(",");
                for (i = 0; i < iii.length; i++){
                    //alert(iii[i]);
                    cheC = cheC + 1;
                }
                if(cheC>4){
                    swal(
                            'Error',
                            'Maximum Officer Selection is Four',
                            'error'
                          )
                     $scope.departmentUserCRegId = [];
                 }
            $("#remainOpeningOfficerQCBS").val(cheC);
        };
       
        $scope.amendmentPrivilegeOfficerSelection = function(){
            if ($("#ammendmentPrivilege").prop("checked") === true){
                  cheE = 0;
           var amendmentPrivilege = $("#amendmentPrivilege").val();
            var hhh = String(amendmentPrivilege);
                var iii = hhh.split(",");
                for (i = 0; i < iii.length; i++){
                    //alert(iii[i]);
                    cheE = cheE + 1;
                }
                if(cheE>2){
                    swal(
                            'Error',
                            'Maximum Officer Selection is Two',
                            'error'
                          )
                     $scope.amendmentPrivilege = [];
                 }
             }    
        };
       
        /*
         * Function to show the selected Department User For Envlope A
         */
        $scope.detailsOfApprovalOfficer = function(firstName, lastName, mobNo, emailAdd,
        psclimit, address, id){
                if (che > 2){
                swal('Warning',
                        'Maximum 2 Officer Selection',
                        'warning')
                        $("#" + id).prop("checked", false);
                }
                if ($("#" + id).prop("checked") === true) {
                swal('<h4 style="color:#d97b1a;">Department User Envelope A</h4>',
                        '<p class="deptDetailsClass">Name: ' + firstName + ' ' + lastName + '</p>' +
                        '\n<p class="deptDetailsClass">Contact: ' + mobNo + '</p>' +
                        '\n<p class="deptDetailsClass">Email Id: ' + emailAdd + '</p>' +
                        '\n<p class="deptDetailsClass">PAC Limit: ' + psclimit + '</p>' +
                        '\n<p class="deptDetailsClass">Address: ' + address + '</p>')
                        che = che + 1;
                } else{
                che = che - 1;
                }
        };
       
       
        /*
         * Function call to warn the user about signed PDF
         * @param null
         * @returns null
         */
        $scope.uploadedSignedPDFDOcument = function(singedPDF){
          var tender_Id = $scope.tender_Id;
          var document = $("#documentLabel1").val();
          if(singedPDF == true){
               if(document.trim() != ""){
                    swal({
                        title: 'Are you sure?',
                        text: "You will lost your uploaded Documents",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                      }).then((result) => {
                        if (result.value){
                        $scope.tenderDocuments = false;
                        var removeAllTenderDocumentURL = 'removeAllTenderDocument?tender_Id='+tender_Id;
                       $.ajax({
                    url : 'removeAllTenderDocument?tender_Id='+tender_Id,                    
                    success : function(){
                         swal({
                        title: 'Status Changed Success',
                                html: $('<div>')
                                .addClass('some-class')
                                .text('Your status has been changed'),
                                animation: false,
                                customClass: 'animated tada'
                        })
                       if($scope.documentSequnce > 0){
                           for(var i=1;i <=$scope.documentSequnce;i++){
                               $("#doc_Id"+i).val(0);
                               $scope.documentLabel[i] = "";
                               //$scope.doc_Id[i] = 0;
                               $scope.removeNewChoice();
                           }
                       }
                       }
                    });
                        }else{
                          $scope.singedPDF = false;
                          $scope.tenderDocuments = true;
                          $("#singedPDF").attr("unchecked", true);
                          $("#tenderDcoument").show();
                        }
                      });
                }else{
                         $scope.tenderDocuments = false;
                    }
                }else{
                  $scope.tenderDocuments = true;
                }
        };
       
        $scope.checkEnvelopeUpdate = function(envelopeType){
           if($scope.tenderWizardButton === 'Update'){
               var tender_Id = $scope.tender_Id;
               //alert($scope.tender_Id);
          //alert(envelopeType+":"+$scope.tenderWizardButton);
//                if(envelopeType === '2'){
//                    //alert("Envelope 2 Change");
//                     swal({
//                        title: 'Are you sure?',
//                        text: "You will lost your EnvelopeB Details",
//                        type: 'warning',
//                        showCancelButton: true,
//                        confirmButtonColor: '#3085d6',
//                        cancelButtonColor: '#d33',
//                        confirmButtonText: 'Yes, delete it!'
//                      }).then((result) => {
//                        if (result.value){
//                          var deleteEnvelopeBOnChangeOfEnvelopeType = 'deleteEnvelopeBOnChangeOfEnvelopeType?tender_Id='+$scope.tender_Id;
//                       $.ajax({
//                    url : deleteEnvelopeBOnChangeOfEnvelopeType,                    
//                    success : function(){
//                         swal({
//                        title: 'Envelope B Deleted Successfully',
//                                html: $('<div>')
//                                .addClass('some-class')
//                                .text('Your Envelope status has been changed'),
//                                animation: false,
//                                customClass: 'animated tada'
//                        })
//                       }
//                    });
//                   }else{
//                          // alert(result.value);
//                           $scope.envelopeType = "3";
//                        }
//                    });
//                }
                if(envelopeType === '3'){
                    //alert("Envelope 3 Change");
                    swal({
                        title: 'Are you sure?',
                        text: "You need to filled EnvelopeB Details",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes'
                      }).then((result) => {
                        if (result.value){
                           $("#step5").click();
                           $("#addTemplateButtonB").click();
                           // alert(result.value);
                        }else{
                           //alert(result.value);
                           $scope.envelopeType = "2";
                        }
                    });
                }
           }
        };
       
             /*
              * Function call to remove the document
              * @param DocumentSequnceId ,Tender Id
              * @create 25 June 2018
              * @version 2.0.0
              */
            $scope.documentRemove = function(i){
                var tender_Id = $scope.tender_Id;
                $.ajax({
                    url : 'tenderDocumentRemove?tender_Id='+tender_Id,
                    data : { docSequnceId:i },
                    success : function(data){
                   }
                });
            };
           
           /*
            * Function to define whether document avaliable after purchase
            *
            * @param {type} param1
            * @param {type} param2
            */
           $scope.documentAfterPurchase = function(i){
             //  alert(i);
               var tender_Id = $scope.tender_Id;
               var documentName = $("#documentName"+i).val();
               //alert(tender_Id);
               var documentFile = $("#documentFile"+i).val();
               //alert(documentFile);
               if(documentName !== ""){
                   if(documentFile !== ""){
               var documentVisibility = $("#documentVisibility"+i).prop("checked");
               if(documentVisibility === true){
                   documentVisibility = "true";
               }else{
                   documentVisibility = "false";
               }
               var documentAfterPurchaseURL = "documentAfterPurchase.action?tender_Id="+tender_Id+"&documentVisibility="+documentVisibility+"&docSequnceId="+i;
                $http.get(documentAfterPurchaseURL)
                        .success(function (response){
              });
                   }else{
                     swal(
                            'Required Document File',
                            'Please Upload Document File',
                            'warning'
                          );
                $("#documentVisibility"+i).attr('checked', false);  
                   }
               }else{
                 swal(
                            'Required Document Name',
                            'Please Mention Document Name',
                            'warning'
                          );
                $("#documentVisibility"+i).attr('checked', false);  
               }  
           };
           
            /*
            * Function to define whether document avaliable after purchase
            *
            * @param {type} param1
            * @param {type} param2
            */
           $scope.documentAfterPurchaseTemporary = function(i){
             //  alert(i);
               var tender_Id = $scope.tender_Id;
               var documentName = $("#documentName"+i).val();
               //alert(tender_Id);
               var documentFile = $("#documentFile"+i).val();
               //alert(documentFile);
               if(documentName !== ""){
                   if(documentFile !== ""){
               var documentVisibility = $("#documentVisibility"+i).prop("checked");
               if(documentVisibility === true){
                   documentVisibility = "true";
               }else{
                   documentVisibility = "false";
               }
               var documentAfterPurchaseURL = "documentAfterPurchaseAmmendmentTemporary.action?tender_Id="+tender_Id+"&documentVisibility="+documentVisibility+"&docSequnceId="+i;
                $http.get(documentAfterPurchaseURL)
                        .success(function (response){
              });
                   }else{
                     swal(
                            'Required Document File',
                            'Please Upload Document File',
                            'warning'
                          );
                $("#documentVisibility"+i).attr('checked', false);  
                   }
               }else{
                 swal(
                            'Required Document Name',
                            'Please Mention Document Name',
                            'warning'
                          );
                $("#documentVisibility"+i).attr('checked', false);  
               }  
           };
           
           /*
         * Function call to save the Amendment document
         * @param Document id,Tender Id, Document Name
         * @create 26 Aug 2018
         * @version 2.0.0
         */
        $scope.tenderAmendmentDocumentUpload = function(i){
         var file = document.getElementById("documentFile"+i).files[0];
         var tender_Id = $scope.tender_Id;
               // alert("Tender Id: "+tender_Id+" : DOC Id: "+i);
                var formData = new FormData();
                formData.append("file", file);
                var docId = $("#doc_Id"+i).val();
                var documentName = $("#documentName"+i).val();
                //alert(documentName);
                if(documentName === null || documentName === ""){
                    var message = "Please Mention Document Name";
                    swal({
                        title: "Required Document Name",
                        text: message,
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "OK"                    
                      });  
                     
                    return false;
                }
                formData.append("documentName", documentName);
                formData.append("docSequnceId", i);
                formData.append("doc_Id", docId);
                var tenderAmendmentDocument = 'tenderAmendmentDocument?tender_Id='+tender_Id;
                $http.post(tenderAmendmentDocument, formData, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                }).success(function (response){
                         $("#doc_Id"+i).val(response.doc_Id);
                         $("#showDocument"+i).html("<a href='/docs/"+response.doc_Converted_Name+"'>"+response.doc_Name+"</a>");                
                }).error(function (response) {
                     //alert(response.data);
                });
        };
       
        /*
         * Function call to remove the Amendment document
         * @param DocumentSequnceId ,Tender Id
         * @create 26 Aug 2018
         * @version 2.0.0
         */
       $scope.documentAmendmentRemove = function(i){
           var tender_Id = $("#tender_Id").val();
           //alert(i);
           $.ajax({
               url : 'tenderDocumentAmendmentRemove?tender_Id='+tender_Id,
               data : { docSequnceId:i },
               success : function(data){
              }
           });
       };
             
       
           /*
            * Tender Creation Validation
            * 4 Sep 2018
            */
//           $scope.validatingTender  = function(step){
//               var formData = new FormData();
//               //alert(step);
//               formData = $("#tenderCreation").serialize();
//              
//               var tenderKeyDates = $("#tenderKeyDates").serialize();
//               var validatingTenderURL = "tenderValidationURL.action?formData="+formData+"&step="+step+"&keyDateData="+tenderKeyDates;              
//               $http.get(validatingTenderURL)
//                       .success(function (response){
//                        var log = [];
//                        angular.forEach(response, function(value, key) {                      
//                          $("#"+key).html(value);
//                          if(value !== ""){
//                          $("#"+step+"Tab").click();
//                          return false;
//                          }
//                        }, log);
//                               console.log("Validation is success for"+step);
//                               $scope.tenderCreation(step);
//                               $scope.stepManaging(step);
//                               if(step === "step8"){
//                               $scope.tenderKeyDates();
//                               }
//                       }).error(function (response) {
//                     //alert(response.data);
//                });
//           }
   
    $scope.lostDataMessage = function(){
       swal({
                        title: 'Are you sure?',
                        text: "You will lost your Data",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: "No",
                        confirmButtonText: 'Yes, Close it!'
                      }).then((result) => {
                        if (result.value){
                       $('#createTenderWizard').modal('toggle');
                      $window.location.reload();
                    }  
                });
    }
   
           $scope.percentageCheck = function(e, input, error){
               //alert(e+" : "+input);
               var decimal = e.split(".");
               
               var lengthOfDec = parseInt(decimal[1]);
               //alert(lengthOfDec);
               if(e > 100 || e === ""){
                   $("#"+input).val("");
                   $("#"+error).html("Mention between 0 to 100%");
               }else if(lengthOfDec > 100){
                   $("#"+input).val("");
                   $("#"+error).html("Mention two decimal value");
               }else{                  
                  // $("#"+input).val("").html("%");
                   $("#"+error).html("");
               }  
           };
     
      $scope.validations = function(step){
         
       if(step === 'step1'){
         var nitDate = $(".nitDate").val();
         var tenderNumber = $("#hiddenTenderNumber").val();
         if($('#nitNumber').val() === ""){
             $('#nitNumber').addClass('shake-horizontal');
             setTimeout("$('#nitNumber').removeClass('shake-horizontal');", 500);
             $("#nitNumberError").html("NIT Number Not be empty");
         }else if(nitDate === ""){
             $("#nitDateError").html("NIT Date Not be empty");
             $('#nitDate').addClass('shake-horizontal');
             setTimeout("$('#nitDate').removeClass('shake-horizontal');", 500);
         }else if(tenderNumber === ""){
             $("#tenderNumberError").html("Tender Number Not be empty");
             $('#hiddenTenderNumber').addClass('shake-horizontal');
             setTimeout("$('#hiddenTenderNumber').removeClass('shake-horizontal');", 500);
         }else{
             $("#nitNumberError").html("");
             $("#nitDateError").html("");
             $("#tenderNumberError").html("");
             var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
             if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
         }
       }
       
       if(step === 'step2'){
           var array = $("#keywordssss").val();
           var keyWords = String(array);
           var array2 = $("#empanelContrators").val();
           var empanelContractor = String(array2);
         
           if($("#tenderStage").val() === "0"){
               $("#tenderStageError").html("Please Select Tender Stage");
               $('#tenderStage').addClass('shake-horizontal');
             setTimeout("$('#tenderStage').removeClass('shake-horizontal');", 500);
           }else if($("#selectiveTender").val() === "0"){
               $("#selectiveTenderError").html("Please Select Selective Tender");
               $('#selectiveTender').addClass('shake-horizontal');
             setTimeout("$('#selectiveTender').removeClass('shake-horizontal');", 500);
           }else if($scope.tenderCategory === "0"){
               $("#tenderCategoryError").html("Please Select Tender Stage");
               $('#tenderCategory').addClass('shake-horizontal');
             setTimeout("$('#tenderCategory').removeClass('shake-horizontal');", 500);
           }else if($scope.areaOfWorkss === "0"){
               $("#areaOfWorkssError").html("Please Select Area Of Work");
               $('#areaOfWork').addClass('shake-horizontal');
             setTimeout("$('#areaOfWork').removeClass('shake-horizontal');", 500);
           }else if(keyWords === ""){
               $("#keyWordError").html("Please Select Tender Keywords");
               $('#keywordssss').addClass('shake-horizontal');
             setTimeout("$('#keywordssss').removeClass('shake-horizontal');", 500);
           }else if($scope.selectiveTender === "2" && empanelContractor === "" || $scope.selectiveTender === "4" && empanelContractor === ""){
               $("#empanelContratorsError").html("Please Select Empanel Contractor");
               $('#empanelContrators').addClass('shake-horizontal');
             setTimeout("$('#empanelContrators').removeClass('shake-horizontal');", 500);
           }else if($scope.tenderCategory === "2" && $("#buyBackDocumentYes").prop("checked") === true && typeof document.getElementById("couldFolderFile2").files[0] === "undefined"){
               $("#buyPolicyDocumentError").html("Please Upload Buy Back Document");
                $('#buyPolicyDocument').addClass('shake-horizontal');
             setTimeout("$('#buyPolicyDocument').removeClass('shake-horizontal');", 500);
           }else{
               var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
            if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
           }
       }
       
       if(step === 'step3'){
           var nameOfWork = $("#nameOfWork").val();
           var descriptionOfWork = $("#descriptionOfWork").val();
           var estimateValue = $("#estimateValue").val();
           var tenderFee = $("#tenderFee").val();
           var bidValidateType = $("#bidValidateType").val();
           var bidValidatePeriod = $("#bidValidatePeriod").val();
           var workCompletionType = $("#workCompletionType").val();
           var workCompletionPeriod = $("#workCompletionPeriod").val();
           var rainySeason = $scope.rainySeasonMode;
           
           if(nameOfWork === ""){
               $("#nameOfWorkError").html("Mention the Name of Work");
               $('#nameOfWork').addClass('shake-horizontal');
             setTimeout("$('#nameOfWork').removeClass('shake-horizontal');", 500);
           }else if(descriptionOfWork === ""){
               $("#descriptionOfWorkError").html("Mention the Description of Work");
               $('#descriptionOfWork').addClass('shake-horizontal');
             setTimeout("$('#descriptionOfWork').removeClass('shake-horizontal');", 500);
           }
           else if(estimateValue === ""){
               $('#estimateValue').addClass('shake-horizontal');
             setTimeout("$('#estimateValue').removeClass('shake-horizontal');", 500);
               $("#estimateValueError").html("???????????????????");
           }
           else if(tenderFee === ""){
               $('#tenderFee').addClass('shake-horizontal');
             setTimeout("$('#tenderFee').removeClass('shake-horizontal');", 500);
               $("#tenderFeeError").html("Mention The Tender Fee");
           }else if(bidValidateType === "0"){
                $('#bidValidateType').addClass('shake-horizontal');
             setTimeout("$('#bidValidateType').removeClass('shake-horizontal');", 500);
               $("#bidValidateTypeError").html("Select The Bid Validate Type");
           }else if(bidValidatePeriod === ""){
               $('#bidValidatePeriod').addClass('shake-horizontal');
             setTimeout("$('#bidValidatePeriod').removeClass('shake-horizontal');", 500);
               $("#bidValidatePeriodError").html("Mention The Bid Validate Period");
           }else if(workCompletionType === "0"){
                $('#workCompletionType').addClass('shake-horizontal');
             setTimeout("$('#workCompletionType').removeClass('shake-horizontal');", 500);
               $("#workCompletionTypeError").html("Select The Work Completion Type");
           }else if(workCompletionPeriod === ""){
                $('#workCompletionPeriod').addClass('shake-horizontal');
             setTimeout("$('#workCompletionPeriod').removeClass('shake-horizontal');", 500);
               $("#workCompletionPeriodError").html("Mention The Work Completion Period");
           }else if(typeof rainySeason == "undefined"){
               $("#rainySeasonError").html("Select The Rainy Season Type");
           }else{
               var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
             if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
           }
       }
       
       if(step === 'step4'){
          var envelopeType = $("#envelopeType").val();
          var contractorClass = $("#contractorClass").val();
          var typeOfTender = $("#typeOfTender").val();
          var emdApplicable = $("#emdApplicable").val();
          var emdInFig = $("#emdInFig").val();
          var valueWeightage = $("#qualificationWeightage").val();
          var minQualificationMakrs=$("#minimiumQualification").val();
          if(envelopeType === "0"){
              $('#envelopeType').addClass('shake-horizontal');
             setTimeout("$('#envelopeType').removeClass('shake-horizontal');", 500);
              $("#envelopeTypeError").html("Please select Envelope Type");
          }else if(contractorClass === "0"){
              $('#contractorClass').addClass('shake-horizontal');
             setTimeout("$('#contractorClass').removeClass('shake-horizontal');", 500);
              $("#contractorClassError").html("Please select Contractor Class");
          }else if(typeOfTender === "0"){
               $('#typeOfTender').addClass('shake-horizontal');
             setTimeout("$('#typeOfTender').removeClass('shake-horizontal');", 500);
              $("#typeOfTenderError").html("Please select Type of Tenders");
          }else if(emdApplicable === "0"){
              $('#emdApplicable').addClass('shake-horizontal');
             setTimeout("$('#emdApplicable').removeClass('shake-horizontal');", 500);
              $("#emdApplicableError").html("Please select EMD Applicable");
          }else if(emdApplicable === "1" && emdInFig === ""){
              $('#emdInFig').addClass('shake-horizontal');
             setTimeout("$('#emdInFig').removeClass('shake-horizontal');", 500);
              $("#emdInFigError").html("Please Mention EMD");
          }
          else if(envelopeType === "4" && valueWeightage === "") {
                $('#qualificationWeightage').addClass('shake-horizontal');
                 setTimeout("$('#qualificationWeightage').removeClass('shake-horizontal');", 500);
                $("#WeightageError").html("Please Mention Weightage Value");
            }
         else if(envelopeType==="4" && minQualificationMakrs=== ""){
             $('#minimiumQualification').addClass('shake-horizontal');
              setTimeout("$('#minimiumQualification').removeClass('shake-horizontal');", 500);
              $("#minQualificationError").html("Please Mention Qualification Value");
         }
              else{
              var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
             if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);  
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
             
           }
       }
       
       if(step === 'step5'){
           var amendmentPrivilege = $("#amendmentPrivilege").val();
            var hhh = String(amendmentPrivilege);
          var envelopeType = $("#envelopeType").val();
          //alert(envelopeType);
          if($scope.envelopeAName === "0"){
              $("#envelopeAError").html("Please Fill the Details of Envelope A");  
          }else if(envelopeType === "3" && $scope.envelopeBName === "0" || envelopeType === "5" && $scope.envelopeBName === "0"){
              $("#envelopeBError").html("Please Fill the Details of Envelope B");
          }else if($scope.envelopeCImages === ""){
              $("#envelopeCError").html("Please Fill the Details of Envelope C");
          }else if($("#ammendmentPrivilege").prop("checked")===true && hhh===""){
              $("#amendmentPrivilegeError").html("Please select Amendment Officer");  
          }
          else{
              var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
            if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
               
          }
       }
       
       
       if(step === 'step6'){
           var documentLink = $("#doc_Id"+$scope.sequnceId).val();
           var signPDF = $("#singedPDF").prop("checked");
            //alert($scope.sequnceId+" : "+signPDF);
            if($("#singedPDF").prop("checked")===false){
                //alert(documentLink);
                if(documentLink === "0" || documentLink.trim() === ""){
                     swal({
                        title: 'Document is Mandatory',
                                html: $('<div>')
                                .addClass('some-class')
                                .text('Upload Document'),
                                animation: false,
                                customClass: 'animated tada'
                        })
                }else{
                    var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
             if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);  
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
               
            }
           
            }else{
                var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
              if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);  
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
               
            }
       }
       
       if(step === 'step7'){
           
           var tenderPurchaseDate = $("#tenderPurchaseDate").val();
           var bidSubmissionDate = $("#bidSubmissionDate").val();
           var openingEA = $("#openingEA").val();
           var openingEB = $("#openingEB").val();
           var openingEC = $("#openingEC").val();
           
           var envelopeType = $("#envelopeType").val();
           if(tenderPurchaseDate === ""){
               $("#tenderPurchaseDateError").html("Please Mention Purchase Date");
           }
           else if(bidSubmissionDate === ""){
               $("#bidSubmissionDateError").html("Please Mention Bid Submission Date");
           }
//           else if(openingEA === ""){
//               $("#openingEAError").html("Please Mention Opening EA");
//           }
//           
//           else if(openingEB === "" && envelopeType==="4"){
//               alert("helllo")
//               $("#openingEBError").html("Please Mention Opening EBssssssssss");
//           }
//           else if(openingEC === "" && envelopeType==="2"){
//              // alert("CCCCCCCC")
//                 $("#openingECError").html("Please Mention Opening EC");
//           }
//           else if( $scope.tenderStageDropDown === "1" && $("#openingECaftertechopening").prop("checked")===false){
//               alert("cccccc")
//                $("#openingECError").html("Please Mention Opening ECCCCCCCCCC");
//           }
           else if($("#preBidMeetingStatus").prop("checked")===true){
               if($("#preBidMeetingVenue").val() === "" || $("#preBidMeeting").val() === ""){
                  $("#preBidMeetingError").html("Please Mention Pre-Bid Meeting");  
               }else {
                    var myDiv = document.getElementById('scrollingEffect');
                    myDiv.scrollTop = 0;
                    if ($("#tenderStatus").val() === 'Approved') {
                        $scope.tenderAmmendUpdate(step);
                    }else {
                        $scope.tenderCreation(step);
                        $scope.stepManaging(step);
                        $("#saveAndNextButton").click();
                    }

                }
           }else {
               var myDiv = document.getElementById('scrollingEffect');
             myDiv.scrollTop = 0;
                if($("#tenderStatus").val()==='Approved'){
                $scope.tenderAmmendUpdate(step);
             }else{
                $scope.tenderCreation(step);
                $scope.stepManaging(step);
                $("#saveAndNextButton").click();
             }
               
            }
       }
       if(step === 'step8'){
           var tenderNotice = $("#tenderNotice").val();
           //alert(tenderNotice);
             if(tenderNotice === ""){
               $("#tenderNoticeError").html("Please Mention Tender Notice");  
             }else{
                if ($("#tenderStatus").val() === 'Approved'){
                $scope.tenderAmmendUpdate(step);
                } else{
                $scope.tenderCreation(step);
                $scope.stepManaging(step);
                message="Tender Created Succesfully";
                //$("#saveAndNextButton").click();
                }
               
            }    
       }
       swal(
                        'Success',
                        message,
                        'success'
                        );
      };
     
      $scope.envelopeAValidation = function(alpha){
         var array = $("#envelopeAOfficers").val();
         var officers = String(array);
         var minOpeningOfficerA = $("#minOpeningOfficerA").val();
         var envelopeAId = $("#envelopeAId").val();
         if(officers===""){
             $("#envelopeAOfficersError").html("Select Opening Authority For Envelope A");
             return false;
         }else{
            $("#envelopeAOfficersError").html("");
         }
         if(minOpeningOfficerA===""){
             $("#minOpeningOfficerAError").html("Mention Minimum Opening Authority");
             return false;
         }else{
            $("#minOpeningOfficerAError").html("");
         }
         if($scope.envelopeAName==="0"){
             $("#envelopeAIdError").html("Select Envelope A Type");
             return false;
         }else{
             $("#envelopeAIdError").html("");
         }
         $scope.saveTemplateData(alpha);
         $("#modelAClose").click();
      }
     
       $scope.envelopeBValidation = function(alpha){
         var array = $("#envelopeBOfficers").val();
         var hhh = String(array);
         var minOpeningOfficerB = $("#minOpeningOfficerB").val();
         var envelopeBId = $("#envelopeBId").val();
         if(hhh===""){
             $("#envelopeBOfficersError").html("Select Opening Authority For Envelope B");
             return false;
         }else{
            $("#envelopeBOfficersError").html("");
         }
         if(minOpeningOfficerB===""){
             $("#minOpeningOfficerBError").html("Mention Minimum Opening Authority");
             return false;
         }else{
            $("#minOpeningOfficerBError").html("");
         }
         if($scope.envelopeBName==="0"){
             $("#envelopeBIdError").html("Select Envelope B Type");
             return false;
         }else{
             $("#envelopeBIdError").html("");
         }
         $scope.saveTemplateData(alpha);
         $("#modelBClose").click();
      }
     
      $scope.tenderDataReset = function(tenderId, tenderNumber, nitNumber, nitDate){
         swal({
                        title: 'Are you sure?',
                        text: "You will lost your Tender Details",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Any way'
                      }).then((result) => {
                        if (result.value){
 
                         swal({
                        title: 'Reset Process Started',
                                html: $('<div>')
                                .addClass('some-class')
                                .text('Process to make Reset'),
                                animation: false,
                                customClass: 'animated tada'
                        })
                       
                         $(location).attr('href', 'tenderResetProcess?tender_Id='+tenderId+"&tender_Number="+tenderNumber+"&nitNumber="+nitNumber+"&nitDate="+nitDate);
                        }else{
                           
                        }
                      });
      };
     
      $scope.tenderAmendmentHistory = function(tender_Id){
          var amendmentHistoryViewURl = 'ViewAmendmentHistoryOfTender?tender_Id='
          +tender_Id;
          $http.get(amendmentHistoryViewURl)
                       .success(function (response){
                     $scope.previousTenderDetails = response;      
          });
      };
       
    $scope.searchingOfTender = function(){
      var tenderNoSearch = $("#tenderNoSearch").val();
      var statusSearch = $("#statusSearch").val();
      var officerNameSearch = $("#officerNameSearch").val();
      var nitDateSearch = $("#nitDateSearch").val();
      alert(tenderNoSearch+":"+statusSearch+":"+officerNameSearch+":"+nitDateSearch);
      var searchingTenderURl = "searchingTenderProcess?tenderNoSearch="+tenderNoSearch+"&statusSearch="+statusSearch+"&officerNameSearch="+officerNameSearch+"&nitDateSearch="+nitDateSearch;
      $http.get(searchingTenderURl)
                       .success(function (response){
                    alert(response.data);    
          });
    };
   
    $scope.discardChangesButton = function(tender_Id){
         $.ajax({
               url : 'tenderTemporaryDocumentRemove?tender_Id='+tender_Id,
               success : function(data){
                   $(location).attr('href', 'eTendering');
              }
          });
    };
 
});


/*
 * Service is used to upload the document
 * @param {File} file
 * @param {URL} uploadUrl
 */
 myApp.service('fileUploadService', function ($http, $q) {
        this.uploadFileToUrl = function (file, uploadUrl) {
            //alert("service called"+file);
            //FormData, object of key/value pair for form fields and values
            var fileFormData = new FormData();
            fileFormData.append('file', file);
 
            var deffered = $q.defer();
            $http.post(uploadUrl, fileFormData, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
 
            }).success(function (response) {
                deffered.resolve(response);
 
            }).error(function (response) {
                deffered.reject(response);
            });
 
            return deffered.promise;
        };
    });

/*
 * Validations Directive
 */
myApp.directive('myDirective', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attr, mCtrl) {
            function myValidation(value) {
                if (!value.match(/^[A-Za-z0-9/]*$/)) {
                    mCtrl.$setValidity('charE', true);
                } else {
                    mCtrl.$setValidity('charE', false);
                }
                return value;
            }
            mCtrl.$parsers.push(myValidation);
        }
    };
});

/*
 * A directive to enable two way binding of file field
 */
myApp.directive('sorFileModel', function ($parse) {
    return {
        restrict: 'A', //the directive can be used as an attribute only
        /*
         link is a function that defines functionality of directive
         scope: scope associated with the element
         element: element on which this directive used
         attrs: key value pair of element attributes
         */
        link: function (scope, element, attrs) {
            var model = $parse(attrs.sorFileModel),
                    modelSetter = model.assign; //define a setter for demoFileModel
            //Bind change event on the element
            element.bind('change', function () {
                //Call apply on scope, it checks for value changes and reflect them on UI
                scope.$apply(function () {
                    //set the model value
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
});


myApp.directive('selectWatcher', function ($timeout) {
    return {
        link: function (scope, element, attr) {
            var last = attr.last;
            if (last === "true") {
                $timeout(function () {
                    $(element).parent().selectpicker('val', 'any');
                    $(element).parent().selectpicker('refresh');
                });
            }
        }
    };
});

myApp.directive('myModal', function() {
   return {
     restrict: 'A',
     link: function(scope, element, attr) {
       scope.dismiss = function() {
           element.modal('data-dismiss');
       };
     }
   }
});