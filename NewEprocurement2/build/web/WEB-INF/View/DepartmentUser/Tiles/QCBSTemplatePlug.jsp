<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
<%--<%@include  file="QCBSMarkTemplatePlug.jsp" %>--%>
<style>
   .questioncss{display: inline-block; width: 88% !important;float: right;}
   .questiontable{width: 95% !important; font-size: 13px;}
   .headingcss{
      margin: 0; border-bottom: 1px solid; border-color: #ddd; padding: 0 0 20px; margin-bottom: 12px;
      font-size: 23px; border-radius: 6px;
   }
   .divcss{ text-align: center; border: 2px solid #dedede; width: 50%; margin: 35px auto; padding: 30px 0; }
   .textcss{font-size: 17px; color: #ff8700;}
   .viewtemph1{margin-bottom: 0; border: none; font-size: 18px; text-align: center;}
</style>
<!-----Model Start ------>
<div class="modal fade mdl-bg" id="myModalQCBS" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg qcbs_modalwidth" role="document">
        <div class="modal-content"> 
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">QCBS Template</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <input type="hidden" id="templateid" value="${templateIdss}">
            <input type="hidden" id="tenderid" value="{{tender_Id}}">
            </div>
<div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="390" data-mobile-height="390" style="height: 390px; overflow: hidden;">
         <div class="modal-body">
             <div class="col-lg-12"><label>Template Name </label><input name="templateName" id="templateName" class="form-control"  placeholder="Mention QCBS Template Name"/></div> 
             <div id="ajaxResponse"> Write code here  
             </div> 
         </div>
</div>
         <div id="addButtonForAction"></div>
         <div class="modal-footer">
             <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button> 
         </div>
        </div>
   </div>
</div>

<script>
   //Global Variable

   // show dynamic template form as on popup
   function prepareDynamicTemplate() {
      $("#wait").show();
      //alert("function called");
      $.ajax({
         url: 'PrepareDynamicTemplate',
         type: 'POST',
         success: function (response) {
            $("#ajaxResponse").html(response);
            $("#myModalQCBS").modal('show');
            $("#wait").hide();
         },
         error: function (error) {
            alert(error);
            $("#wait").hide();
         }
      });
   }

$("#QCBSTemplate").show();
$("#QCBSTemplate2").hide();
   //For save dynamic template into database
   function saveQCBSTemplate() {
       //alert("function call");
  //For validate the template
      var tenderId = $("#tenderid").val(); 
      //alert("tenderId is "+tenderId);
      var templateIds = $("#templateid").val();
      //alert("templateIds is "+templateIds);
      var templateName = $("#templateName").val();
      //alert("templateName is"+templateName);
//      var e = document.getElementById("bidingQCBS");
//      var strUser = e.options[e.selectedIndex].value;
//      alert("select id is :::::  "+strUser);
      var status = false;
      $("#ajaxResponse").find('table').each(function () {
         $(this).find('input').each(function () {
            if ($(this).val() == '' || $(this).val() == null) {
               $(this).css('border-color', 'red');
               status = true;
            } else {
               $(this).css('border-color', '#ddd');
            }
         });
      });
      if (status) {
         return;
      } // validation end

      var stqcJsonData = [];
      $("#ajaxResponse").find('table').each(function () {
         var obj = {};
         var param = [];
         var mark = [];
         var selectDropdown = [];
         $(this).find('input,select').each(function () {
            if (this.name == 'parameter') {
               param.push($(this).val());
            } else if (this.name == 'mark') {
               mark.push($(this).val());
            } else if (this.name == 'strUser') {
                selectDropdown.push($(this).val());
            } else {
               obj[this.name] = $(this).val();
            }
         });
         obj.parameter = param;
         obj.mark = mark;
         obj.strUser = selectDropdown;
         stqcJsonData.push(obj);
         //alert("save time json data is "+JSON.stringify(stqcJsonData))
      });
      //alert(JSON.stringify(stqcJsonData));
      console.log("tenderId is : " + tenderId);
      console.log("template data is : " + JSON.stringify(stqcJsonData));
      var json = JSON.stringify(stqcJsonData);

      $.ajax({
         url: 'SaveQCBSTemplate',
         data: {'template': json, 'templateId': templateIds, 'templateName': templateName, 'tenderId': tenderId},
         type: 'POST',
         success: function (response) {
             //alert("response after save data is "+response);
             $("#qcbsTemplateView").click();
             var templateId = parseInt(response);
             $("#templateId").val(templateId);
             $("#templateid").val(response);
            $("#QCBSTemplate").html('<a href="#" class="text-white" onclick="viewEditQCBSTemplate();">New Template</a>');
            hideQCBSDiv();
             swal(
                        'Success',
                        'QCBS Save Successfully',
                        'success'
                        );
            
        $("#QCBSTemplate").on("hide", function() {    // remove the event listeners when the dialog is dismissed
            $("#QCBSTemplate a.btn").off("click");
    });
         },
         error: function (error) {
            alert("error : " + error);
         }
      });
   }

   //Variable use to generate dynamic id
   var q = 0;
   var c = 1;

     function openQCBSTemplate() {
      q++;
      var dynamicDiv = '<table class="table table-bordered questiontable" align="center">' +
              '<tr> <td colspan="3"> <span>Enter Criteria :<input type="text" placeholder="Enter Criteria Question" name="question" id="q' + q + '" class="form-control questioncss" placeholder="Enter Criteria Question" /></span> </td></tr>' +
              '<tr> <td> <input type="text" name="parameter" id="cri_q' + q + '_' + c + '" placeholder="Enter Parameters" class="form-control" /> </td>' +
              '<td> <input type="text" name="mark" id="mark_q' + q + '_' + c + '" placeholder="Enter Criteria Score" class="form-control" /> </td> <td> <select class="form-control" name="strUser" id="bidingQCBS' + q + '_' + c + '"><option value="0">select</option> + <option value="1">File</option> +<option value="2">Text</option> +</select> </td> +<td> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeParameters(this);" title="Delete"><i class="la la-trash"></i></button> </td></tr>' +
              '<tr> <td colspan="3"> <button onclick="addMoreParameter(this);" class="btn btn-success btn-sm" type="button"> + </button> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeCriteria(this);" title="Delete"><i class="la la-trash"></i></button></td> </tr>' +
              '</table>';
       $("#addButtonForAction").html('<div style="margin-left: 5%;"> <button onclick="addMoreCriteria();" class="btn btn-primary btn-sm" type="button"><i class="la la-plus-square-o"></i>Add More Question</button> <button onclick="saveQCBSTemplate();" class="btn btn-primary btn-sm" type="button" data-dismiss="modal"><i class="la la-save"></i>Save Template</button> </div>');
      $("templateid").html("");
        $("#ajaxResponse").html(dynamicDiv);
      c++;
   }
   
   
   // For open existing template on update mode and render it from json data
   function viewEditQCBSTemplate() {
       var t = $("#tenderid").val();
      console.log('shashank tenderId : '+t);
      //alert("val : "+t);
      
      var templateId = $("#templateid").val();
      //alert("templateId is "+templateId);
 $("#ajaxResponse").html("");
 $("#addButtonForAction").html("");
      $.ajax({
         url: 'ViewQCBSTemplate',
         data: {'templateId': templateId},
         type: 'GET',
         success: function (response) {
            // alert("response of viewEditQCBSTemplate  "+JSON.stringify(response));
            var count = 0;
            var data = JSON.parse(response);
           // alert("response is :-   "+response);
        console.log(response);    
        html = "";
        var temp = "";
        templateId = data[0];
            JSON.parse(data[1]).forEach(function (value) {
               if (typeof value == 'object') {
                  var html = '<table class="table table-bordered questiontable" align="center">';
                  var parameter = value.parameter;
                  var mark = value.mark;
                  var strUser = value.strUser;
                 html = html + '<tr> <td colspan="3"> <span> Enter Criteria :<input type="text" name="question" id="q' + q + '" class="form-control questioncss" placeholder="Enter Criteria Question"  value="' + value.question + '" /></span> </td></tr>';
                  for (var i = 0; i < mark.length; i++) {
                      var selectedfile = '',selectedtext = '';
                      if(strUser[i] == '2'){
                          selectedtext = 'selected';
                      } else if(strUser[i] == '1'){
                          selectedfile = 'selected';
                      }
                      var options = '<option value="1"'+selectedfile+'>File</option><option value="2"'+selectedtext+' >Text</option>';
                     html = html + '<tr> <td> <input type="text" name="parameter" id="cri_q' + q + '_' + c + '" placeholder="Enter Parameters" class="form-control" value="' + parameter[i] + '" /> </td>' +
                             '<td> <input type="text" name="mark" id="mark_q' + q + '_' + c + '" placeholder="Enter Criteria Score" class="form-control" value="' + mark[i] + '" /> <td> <select class="form-control" name="strUser" id="bidingQCBS' + q + '_' + c + '"><option value="0">select</option>'+options+'</select> </td></td> <td> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeParameters(this);" title="Delete"><i class="la la-trash"></i></button> </td></tr>';
                     c++;
                  }
                  html = html + '<tr> <td colspan="3"> <button onclick="addMoreParameter(this);" class="btn btn-success btn-sm" type="button"> + </button> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeParameters(this);" title="Delete"><i class="la la-trash"></i></button></td> </tr> </table>';
               }
//                $("#ajaxResponse").html("");
//               $("#addButtonForAction").html("");
               
                 temp += html;
              // $("#ajaxResponse").append(html);
               count++;
               q++;
            });
             $("#ajaxResponse").html(temp);
            $("#addButtonForAction").html('<div style="margin-left: 5%;"> <button onclick="addMoreCriteria();" class="btn btn-success btn-sm" type="button"><i class="la la-plus-square-o"></i>Add More Question</button> <button onclick="saveQCBSTemplate();" class="btn btn-success btn-sm" type="button" data-dismiss="modal"><i class="la la-save"></i>Save Template</button> </div>');
            $("#myModalQCBS").modal('show');
         },
         error: function (error) {
            alert(error);
         }
      });
   }

   //For adding parameter dynamically into criteria(Question)
   function addMoreParameter(obj) {
      var dynamicCriteria = '<tr><td> <input type="text" name="parameter" id="cri_q' + q + '_' + c + '" placeholder="Enter Parameters" class="form-control" /> </td>' +
              '<td> <input type="text" name="mark" id="mark_q' + q + '_' + c + '" placeholder="Enter Criteria Score" class="form-control" /> <td> <select class="form-control" name="strUser" id="bidingQCBS' + q + '_' + c + '"><option value="0">select</option> + <option value="1">File</option> +<option value="2">Text</option> +</select> </td> +</td>' +
              '<td> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeParameters(this);" title="Delete"><i class="la la-trash"></i></button> </td></tr>';
      $(obj).closest('table').find('tr:last').prev().after(dynamicCriteria);
      c++;
   }

   //For add Criteria(Question) dynamically into Template
   function addMoreCriteria() {
      q++;
      var dynamicDiv = '<table class="table table-bordered questiontable" align="center">' +
              '<tr> <td colspan="3"> <span> Enter Criteria :<input type="text" name="question" id="q' + q + '" class="form-control questioncss" /></span> </td></tr>' +
              '<tr> <td> <input type="text" name="parameter" id="cri_q' + q + '_' + c + '" placeholder="Enter Parameters" class="form-control" /> </td>' +
              '<td> <input type="text" name="mark" id="mark_q' + q + '_' + c + '" placeholder="Enter Criteria Score" class="form-control" /> <td> <select class="form-control" name="strUser" id="bidingQCBS' + q + '_' + c + '"><option value="0">select</option> + <option value="1">File</option> +<option value="2">Text</option> +</select> </td> +</td> <td> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeParameters(this);" title="Delete"><i class="la la-trash"></i></button> </td></tr>' +
              '<tr> <td colspan="1"> <button onclick="addMoreParameter(this);" class="btn btn-success btn-sm" type="button" type="button"> + </button> <button class="btn btn-hover-danger btn-icon btn-pill" onclick="removeCriteria(this);" title="Delete"><i class="la la-trash"></i></button></td>' +
              '</table>';
      $("#ajaxResponse").append(dynamicDiv);
      c++;
   }

   //For remove criteria from template
   function removeCriteria(obj) {
      $(obj).closest('table').remove();
   }

   //For remove parameter of criteria from template
   function removeParameters(obj) {
      $(obj).closest('tr').remove();
   }

   //For hide modal 
   function hideQCBSDiv() {
      $("[data-dismiss=myModalQCBS]").trigger({type: "click"});
   }

   // For render dynamic template to user(contractor) for fillup details
   function viewDynamicTemplate() {
      $.ajax({
         url: 'ViewDynamicTemplate',
         data: {},
         type: 'GET',
         success: function (response) {
            var count = 0;
            $("#containerDiv").show();
            JSON.parse(response).forEach(function (value) {
               if (typeof value == 'object') {
                  var parameter = value.parameter;
                  var mark = value.mark;
                  var html = '<tr> <td> <span>' + value.question + '</span> </td> <td> <select name="question" onchange="criteriaAnswer(this);" class="form-control">' +
                          '<option value="-1">Select</option>';
                  for (var i = 0; i < mark.length; i++) {
                     html = html + '<option value="' + mark[i] + '">' + parameter[i] + '</option>';
                  }
                  html = html + '</select> </td> <td> <input type="file" id="file' + count + '" name="docfile" onchange="uploadFile(' + count + ');" />' +
                          '<input type="hidden" name="filePath" id="c' + count + '" />'
                  '<input type="hidden" name="fileName" id="n' + count + '" />'
                  '<a href="#" id="showFile' + count + '" target="_blank"></a> </td> <td> <p></p> </td> </tr>';
               }
               $("#templateContainer").append(html);
               count++;
            });
         },
         error: function (error) {
            alert(error);
         }
      });
   }
   
   // For open existing template on update mode and render it from json data
   function viewQCBSTemplate() {
       var t = $("#tenderid").val();
      console.log('shashank tenderId : '+t);
      //alert("val : "+t);
      
      var templateId = $("#templateid").val();
     // alert("templateId is "+templateId);
      $("#ajaxResponse").html("");
      $("#addButtonForAction").html("");
      $.ajax({
         url: 'ViewQCBS',
         data: {'templateId': templateId},
         type: 'GET',
         success: function (response) {
             //alert("response of viewEditQCBSTemplate  "+JSON.stringify(response));
            var count = 0;
            var data = JSON.parse(response);
            //alert("response is :-   "+response);
        console.log(response);    
        html = "";
        var temp = "";
        templateId = data[0];
            JSON.parse(data[1]).forEach(function (value) {
               if (typeof value == 'object') {
                  var html = '<table class="table table-bordered questiontable" align="center">';
                  var parameter = value.parameter;
                  var mark = value.mark;
                  var strUser = value.strUser;
                 html = html + '<tr> <td colspan="3"> <span> Enter Criteria :<input type="text" name="question" id="q' + q + '" class="form-control questioncss" placeholder="Enter Criteria Question"  value="' + value.question + '" readonly/></span> </td></tr>';
                  for (var i = 0; i < mark.length; i++) {
                      var selectedfile = '',selectedtext = '';
                      if(strUser[i] == '2'){
                          selectedtext = 'selected';
                      } else if(strUser[i] == '1'){
                          selectedfile = 'selected';
                      }
                      var options = '<option value="1"'+selectedfile+'>File</option><option value="2"'+selectedtext+' >Text</option>';
                     html = html + '<tr> <td> <input type="text" name="parameter" id="cri_q' + q + '_' + c + '" placeholder="Enter Parameters" class="form-control" value="' + parameter[i] + '" readonly/> </td>' +
                             '<td> <input type="text" name="mark" id="mark_q' + q + '_' + c + '" placeholder="Enter Criteria Score" class="form-control" value="' + mark[i] + '" /> <td> <select class="form-control" name="strUser" id="bidingQCBS' + q + '_' + c + '" readonly><option value="0" readonly>select</option>'+options+'</select> </td></td></tr>';
                     c++;
                  }
               }

                 temp += html;
               count++;
               q++;
            });
             $("#ajaxResponse").html(temp);
            $("#myModalQCBS").modal('show');
         },
         error: function (error) {
            alert(error);
         }
      });
   }
   
  function takeValueOfTemplateIdDropdown(id){
      //alert(id);
      $("#templateid").val(id);
  } 
   
   
   
   
</script>

