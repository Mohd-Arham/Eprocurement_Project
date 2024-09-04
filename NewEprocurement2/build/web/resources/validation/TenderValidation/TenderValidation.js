/*jslint browser:true*/
/*global jQuery, document*/
 
jQuery(document).ready(function () {
    'use strict';
     //alert("ok");
     
var tenderStage ;
$("#tenderStage").change(function () {
        tenderStage = $("#tenderStage").val();
        //alert(tenderStage);
    });
var envelopeType ;
$("#envelopeType").change(function () {
        envelopeType = $("#envelopeType").val();
    });
    
    var date = new Date();
    var date2 ;
    var date3 ;
    var date4 ;
    var date5 ;
    var date6 ;
    var date7 ;
    var date8 ;
    var date9 ;
     var date10 ;
     var date11 ;
    
    $("#tenderKeyDateValueFetch").click(function () {
       // alert("onFetchTenderDate");
    //Tender Purchase date
    var purchaseDateByID = $("#tenderPurchaseDate").val().split("/");
    //alert(purchaseDateByID);
    date2 =  Date.parse(purchaseDateByID[0]);
    date3 =  Date.parse(purchaseDateByID[1]);
    //Tender Bidding date
    var bidSubmissionDateBYID = $("#bidSubmissionDate").val().split("/");
    date4 =  Date.parse(bidSubmissionDateBYID[0]);
    date5 =  Date.parse(bidSubmissionDateBYID[1]);
    //Opening EA Date
    var openingEAByID = $("#openingEA").val();
    date6 = Date.parse(openingEAByID);
    //Opening EB Date
    var openingEBById = $("#openingEB").val();
    date7 = Date.parse(openingEBById);
    //Tender C Bid Submission
    
     var openingECById = $("#openingEC").val();
    date8 = Date.parse(openingECById);
    //alert(date2+":"+date3+":"+date4+":"+date5+":"+date6+":"+date7+":"+date8);
    
    var bidCSubmissionDateBYID = $("#ecBidSubmissionDate").val().split("/");
    date10 =  Date.parse(bidCSubmissionDateBYID[0]);
    date11 =  Date.parse(bidCSubmissionDateBYID[1]);
    
    //Opening EC Date
   
    });
    
    $('#nitDate').datetimepicker({
        timepicker: false,
        showTimepicker: false,
        maxDate: date,
        dateFormat: 'dd M yy'
    });
    
    $("#k_daterangepicker_561").daterangepicker({
          
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                timePicker: !0,
                timePickerIncrement: 1,
                minDate: date,
                locale: {
                    format: "ddd, DD MMM YYYY h:mm A"
               }
            },
            
    function(a, t, e) {
                $("#k_daterangepicker_561 .form-control").val(a.format("ddd, DD MMM YYYY h:mm A") + " / " + t.format("ddd, DD MMM YYYY h:mm A"));
         
            var purchaseDate = $("#k_daterangepicker_561 .form-control").val().split("/");
             date2 =  Date.parse(purchaseDate[0]);
             date3 =  Date.parse(purchaseDate[1]);
           //alert(date2+":"+date3);
             if(parseInt(date2)>parseInt(date3)){
              $("#k_daterangepicker_561 .form-control").val("");
              $("#tenderPurchaseDateError").html("Start Date Not greater to End Date");
             }else{
               $("#tenderPurchaseDateError").html("");  
             }
            });
            $("#k_daterangepicker_571").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                timePicker: !0,
                timePickerIncrement: 1,
                minDate: date,
                locale: {
                    format: "ddd, DD MMM YYYY h:mm A"
                }
            }, function(a, t, e) {
                $("#k_daterangepicker_571 .form-control").val(a.format("ddd, DD MMM YYYY h:mm A") + " / " + t.format("ddd, DD MMM YYYY h:mm A"));
               var bidSubmissionDate = $("#k_daterangepicker_571 .form-control").val().split("/");
             date4 =  Date.parse(bidSubmissionDate[0]);
             date5 =  Date.parse(bidSubmissionDate[1]);
             //alert(date4+":"+date5);
               if(parseInt(date4)<parseInt(date2)){
               $("#bidSubmissionDateError").html("Bid Submission Date greater then Purchase Start Date");  
               $("#k_daterangepicker_571 .form-control").val("");
               }else if(parseInt(date5)<parseInt(date3)){
                 $("#bidSubmissionDateError").html("Bid Submission End Date greater then Purchase End Date");  
               $("#k_daterangepicker_571 .form-control").val(""); 
               }else if(parseInt(date4)===parseInt(date5)){
               $("#bidSubmissionDateError").html("Start Date Not equal to End Date");  
               $("#k_daterangepicker_571 .form-control").val("");  
               }else{
                $("#bidSubmissionDateError").html("");   
               }
            });
            
               
  $("#k_daterangepicker_581").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                timePicker: !0,
                timePickerIncrement: 1,
                minDate: date,
                locale: {
                    format: "ddd, DD MMM YYYY h:mm A"
                }
            }, function(a, t, e) {
                $("#k_daterangepicker_581 .form-control").val(a.format("ddd, DD MMM YYYY h:mm A") + " / " + t.format("ddd, DD MMM YYYY h:mm A"));
               var ecBidSubmissionDate = $("#k_daterangepicker_581 .form-control").val().split("/");
             date10 =  Date.parse(ecBidSubmissionDate[0]);
             date11 =  Date.parse(ecBidSubmissionDate[1]);
             alert(date10+":"+date11);
               
            });
            
             $('.filter-date-time-openingEA').datetimepicker({
           dateFormat: 'D, d M yy', controlType: 'select', timeFormat: 'hh:mm TT'
    }).on('change', function () {
        date6 = Date.parse(this.value);
       // console.log(date6+":"+date5);
        //alert(date6+":"+date5);
        if (parseInt(date5) > parseInt(date6)) {
            $("#openingEAError").html("EA Opening Date not lesser then Bid End Date");
            $("#openingEA").val("");
        } else if (parseInt(date5) === parseInt(date6)) {
            $("#openingEAError").html("EA Opening Date not equal to Bid End Date");
            $("#openingEA").val("");
        } else {
            $("#openingEAError").html("");
        }
    });
    $('.filter-date-time-openingEB').datetimepicker({
        dateFormat: 'D, d M yy', controlType: 'select', timeFormat: 'hh:mm TT'
    }).on('change', function () {
        date7 = Date.parse(this.value);
        console.log(date7+":"+date6);
        //alert(date7+":"+date5);
        if (parseInt(date6) > parseInt(date7)) {
            //alert(date7+":"+date6);
            $("#openingEBError").html("EB Opening Date not lesser then EA Opening Date");
            $("#openingEB").val("");
        } else if (parseInt(date6) === parseInt(date7)) {
            $("#openingEBError").html("EB Opening Date not equal to EA Opening Date");
            $("#openingEB").val("");
        } else {
            $("#openingEBError").html("");
        }
    });
    
    $('.filter-date-time-openingEC').datetimepicker({
        dateFormat: 'D, d M yy', controlType: 'select', timeFormat: 'hh:mm TT'
    }).on('change', function () {
        date8 = Date.parse(this.value);
        //alert($("#envelopeType").val());
       // alert(date8+":"+date7);
        if($("#envelopeType").val() === '3' || $("#envelopeType").val() === '4'){
            //alert(date7+":"+date8+":"+$("#envelopeType").val());
        if (parseInt(date7) > parseInt(date8) && $("#tenderStage").val() === '1') {
            $("#openingECError").html("EC Opening Date not lesser then EB Opening Date");
            $("#openingEC").val("");
        } else if (parseInt(date7) === parseInt(date8) && $("#tenderStage").val() === '1') {
            $("#openingECError").html("EC Opening Date not equal to EB Opening Date");
            $("#openingEC").val("");
        } else {
            $("#openingECError").html("");
        }
        }
        if($("#envelopeType").val() === '2'){
            //alert(date6+":"+date8+"Tender Stage"+$("#tenderStage").val());
        if (parseInt(date6) > parseInt(date8) && $("#tenderStage").val() === '1') {
            $("#openingECError").html("EC Opening Date not lesser then EA Opening Date");
            $("#openingEC").val("");
        } else if (parseInt(date6) === parseInt(date8) && $("#tenderStage").val() === '1') {
            $("#openingECError").html("EC Opening Date not equal to EA Opening Date");
            $("#openingEC").val("");
        } else {
            $("#openingECError").html("");
        }
        }
        
    });
    
    $('#preBidMeeting').datetimepicker({
        dateFormat: 'D, d M yy', controlType: 'select', timeFormat: 'hh:mm TT'
    }).on('change', function () {
        date9 = Date.parse(this.value);
        console.log(date9);
        //alert(date9+" : "+date4);
        //console.log(tenderStage);
        if (parseInt(date9) > parseInt(date4)) {
            $("#preBidMeetingError").html("Pre-bid meeting should be lesser then Bid Submission start date.");
            $("#preBidMeeting").val("");
        }
    });
    
    $('#nitDateSearch').datetimepicker({
        timepicker: false,
        showTimepicker: false,
        dateFormat: 'dd M yy'
    });
});

$(document).ready(function(){
   $("#couldFolderFile").change(function(){
      var file = document.getElementById("couldFolderFile").files[0];
      $(".custom-file-label").html(file.name);
   });  
     
});
    
$(document).ready(function() {
    var regexp = /^[A-Za-z0-9_.,()\/:-]*$/;
    var regexpNumric = /^[0-9]+$/;
    var regexpNumricTwoDigit = /^[0-9](2)$/;
  $("#nitNumber").keyup(function(){
       var nitNumber = $("#nitNumber").val().trim();
        //alert(dateString);
        if(!nitNumber.match(regexp)){
            $("#nitNumber").val("");
            $("#nitNumber").css("border-color", "red");
            $("#nitNumberError").html("Wrong format for NIT Number");
        }else{
            $("#nitNumber").css("border-color", "green");
           $("#nitNumberError").html(""); 
        }
  }); 
  
    $("#newTenderRadio").click(function () {
        $("#hiddenTenderNumber").css("border-color", "green");
    });
  
//  $("#copyTenderRadio").click(function(){
//      $("#hiddenTenderNumber").css("border-color", "green");
//      if($("#copyTenderRadio").prop("checked", true)){
//          alert("ok");
//      }
//  });

    $("#tenderStage").change(function () {
        var tenderStage = $("#tenderStage").val();
        //alert(tenderStage);
        if (tenderStage !== "0") {
            $("#tenderStage").css("border-color", "green");
        } else {
            $("#tenderStage").css("border-color", "red");
        }
    });

    $("#selectiveTender").change(function () {
        var selectiveTender = $("#selectiveTender").val();
        if (selectiveTender !== "0") {
            $("#selectiveTender").css("border-color", "green");
        } else {
            $("#selectiveTender").css("border-color", "red");
        }
    });
  
    $("#tenderCategory").change(function () {
        var tenderCategory = $("#tenderCategory").val();
        if (tenderCategory !== "0") {
            $("#tenderCategory").css("border-color", "green");
        } else {
            $("#tenderCategory").css("border-color", "red");
        }
    });
  
    $("#areaOfWork").change(function () {
        var areaOfWork = $("#areaOfWork").val();
        if (areaOfWork !== "0") {
            $("#areaOfWork").css("border-color", "green");
        } else {
            $("#areaOfWork").css("border-color", "red");
        }
    });
  
    $("#keywordssss").change(function () {
        var keywordssss = $("#keywordssss").val();
        if (keywordssss !== "0") {
            $("#keywordssss").css("border-color", "green");
        } else {
            $("#keywordssss").css("border-color", "red");
        }
    });
    
    $("#sorDOcument").change(function () {
        var sorDOcument = $("#sorDOcument").val();
        if (sorDOcument !== "0") {
            $("#sorDOcument").css("border-color", "green");
        } else {
            $("#sorDOcument").css("border-color", "red");
        }
    });
    
    $("#nameOfWork").keyup(function(){
        var nameOfWork = $("#nameOfWork").val();
        if (nameOfWork !== "") {
            $("#nameOfWork").css("border-color", "green");
        } else {
            $("#nameOfWork").css("border-color", "red");
        }
    });
    
    $("#descriptionOfWork").keyup(function(){
        var descriptionOfWork = $("#descriptionOfWork").val();
        if (descriptionOfWork !== "") {
            $("#descriptionOfWork").css("border-color", "green");
        } else {
            $("#descriptionOfWork").css("border-color", "red");
        }
    });
   
    $("#estimateValue").keyup(function(){
        var estimateValue = $("#estimateValue").val();
        if (estimateValue.match(regexpNumric)) {
            $("#estimateValue").css("border-color", "green");
             $("#estimateValueError").html("");
        } else {
            $("#estimateValue").val("");
            $("#estimateValueError").html("Numeric Value allowed");
            $("#estimateValue").css("border-color", "red");
        }
    });
    
    $("#tenderFee").keyup(function(){
        var tenderFee = $("#tenderFee").val();
        if (tenderFee.match(regexpNumric)) {
            $("#tenderFee").css("border-color", "green");
             $("#tenderFeeError").html("");
        } else {
            $("#tenderFee").val("");
            $("#tenderFeeError").html("Numeric Value allowed");
            $("#tenderFee").css("border-color", "red");
        }
    });
    
    $("#bidValidateType").change(function () {
        var bidValidateType = $("#bidValidateType").val();
        if (bidValidateType !== "0") {
            $("#bidValidateType").css("border-color", "green");
        } else {
            $("#bidValidateType").css("border-color", "red");
        }
    });
    
    $("#bidValidatePeriod").keyup(function () {
        var bidValidatePeriod = $("#bidValidatePeriod").val();
        if (bidValidatePeriod.match(regexpNumric)) {
            $("#bidValidatePeriod").css("border-color", "green");
            $("#bidValidatePeriodError").html("");
        } else {
            $("#bidValidatePeriod").val("");
            $("#bidValidatePeriod").css("border-color", "red");
            $("#bidValidatePeriodError").html("Numeric Value allowed");
        }
    });
    
    $("#workCompletionType").change(function () {
        var workCompletionType = $("#workCompletionType").val();
        if (workCompletionType !== "0") {
            $("#workCompletionType").css("border-color", "green");
        } else {
            $("#workCompletionType").css("border-color", "red");
        }
    });
    
    $("#workCompletionPeriod").keyup(function () {
        var workCompletionPeriod = $("#workCompletionPeriod").val();
        if (workCompletionPeriod.match(regexpNumric)) {
            $("#workCompletionPeriod").css("border-color", "green");
            $("#workCompletionPeriodError").html("");
        } else {
            $("#workCompletionPeriod").val("");
            $("#workCompletionPeriod").css("border-color", "red");
            $("#workCompletionPeriodError").html("Numeric Value allowed");
        }
    });
    
    $("#envelopeType").change(function () {
        var envelopeType = $("#envelopeType").val();
        if (envelopeType !== "0") {
            $("#envelopeType").css("border-color", "green");
        } else {
            $("#envelopeType").css("border-color", "red");
        }
    });
    
   
    $("#contractorClass").change(function () {
        var contractorClass = $("#contractorClass").val();
        if (contractorClass !== "0") {
            $("#contractorClass").css("border-color", "green");
        } else {
            $("#contractorClass").css("border-color", "red");
        }
    });
    
    $("#typeOfTender").change(function () {
       var typeOfTender = $("#typeOfTender").val();
       if (typeOfTender !== "0") {
           $("#typeOfTender").css("border-color", "green");
       } else {
           $("#typeOfTender").css("border-color", "red");
       }
   });
   
    $("#emdApplicable").change(function () {
       var emdApplicable = $("#emdApplicable").val();
       if (emdApplicable !== "0") {
           $("#emdApplicable").css("border-color", "green");
       } else {
           $("#emdApplicable").css("border-color", "red");
       }
   });
   
   $("#emdInFig").keyup(function () {
        var emdInFig = $("#emdInFig").val();
        if (emdInFig.match(regexpNumric)) {
            $("#emdInFig").css("border-color", "green");
            $("#emdInFigError").html("");
        } else {
            $("#emdInFig").val("");
            $("#emdInFig").css("border-color", "red");
            $("#emdInFigError").html("Numeric Value allowed");
        }
    });
//    
//    $("#tenderPurchaseDate").change(function(){
//        alert("ok");
//    });

$("#validateSentForApproval").submit(function(){
    var officers = $("#approvalOfficer").val();
    var hhh = String(officers);
    var off = hhh.trim();
    var iii = hhh.split(",");
    var m = 0;
    for (var i = 0; i < iii.length; i++){
         m++;
    }
     if(off===""){
         swal(
                'Error',
                'Select Officer for Tender Approving.',
                'error'
                );
        return false; 
     } 
     if(m>2){
        swal(
                'Error',
                'Select Minimum 2 Officer for Tender Approving.',
                'error'
                );
        return false;
        }
    return true;
});
});


 
  