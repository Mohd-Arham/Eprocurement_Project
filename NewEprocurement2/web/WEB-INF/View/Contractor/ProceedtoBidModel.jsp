
<!DOCTYPE html>

<html lang="en">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Department Admin | Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script>
            WebFont.load({
                google: {
                    "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
                },
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.tenderData').DataTable();
            });
        </script>
        <!--end::Web font -->




        <style>

            .checkB_center .k-checkbox > span{
                left: 40px;
            }
            .widthUploadBt{
                margin:0 auto;
                width:40%;
            }
            .input_upload label:after{
                display:none;
            }

            textarea.wrd_conversion {
                height: 40px;
            }
            /*****NAV-TABS-CSS*****/

            .tender_view_tab .k-portlet__body {
                padding-top: 6px;
            }

            .nav-tabs.nav-tabs-line .nav-link {}

            .nav-tabs.nav-tabs-line {}

            .nav-tabs.nav-tabs-line.nav-tabs-line-danger.nav.nav-tabs .nav-link:hover,
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger.nav.nav-tabs .nav-link.active,
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger a.nav-link:hover,
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger a.nav-link.active {}

            .tender_view_tab .k-portlet__head {
                min-height: inherit;
            }

            .tender_view_tab.k-portlet--tabs .nav-tabs.nav-tabs-line {}

            .tender_view_tab.k-portlet--tabs .nav-tabs.nav-tabs-line .nav-item {
                margin-right: 15px;
                margin-bottom: -1px;
            }

            .tender_view_tab .nav-tabs.nav-tabs-line .nav-link {
                border: 0;
                border-bottom: 1px solid transparent;
                padding: 12px 15px;
                font-size: 1rem;
                font-weight: 400;
            }
            /*****NAV-TABS-CSS-END****/

            .payment_mode {
                position: relative;
                top: 9px;
                left: 11px;
                font-weight: normal;
            }

            .tender_search {
                padding: 0;
            }

            .tender_search li {
                width: 23.5%;
                float: left;
                list-style: none;
                margin-right: 10px;
            }

            .AuctionWizard .wizard_tb .nav-pills.nav-tabs-btn .nav-item {
                border-radius: 100px;
                background-color: #fff;
                height: 45px;
                width: 45px;
                margin: 0 5.3rem;
                cursor: no-drop;
            }

            .AuctionWizard .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 87%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 50%;
                z-index: 1;
            }

            .mdl-bg {
                background-color: #000000ab;
            }

            .k-separator.k-separator--height-sm {
                height: 0.5rem;
            }
            /*.k-aside__brand-logo:before {
        background-color: #ffffff;
        top: 0;
        left: -45px;
        bottom: 0;
        content: "";
        position: absolute;
        -webkit-transform: skew(-30deg);
        -moz-transform: skew(-30deg);
        -ms-transform: skew(-30deg);
        -o-transform: skew(-30deg);
        transform: rotate(0deg);
        width: 100%;
    }
            .k-aside__brand-logo{
            position:relative;}
    .k-aside__brand-logo:after {
        background-color: #ffffff;
        top: 0px;
        right: 15px;
        bottom: 0;
        content: "";
        width: 48%;
        position: absolute;
        -webkit-transform: skew(-30deg);
        -moz-transform: skew(-30deg);
        -ms-transform: skew(-30deg);
        -o-transform: skew(-30deg);
        transform: rotate(44deg);
    }*/

            .wizard_tb .nav-pills.nav-tabs-btn .nav-link {
                padding: 8px!important;
                border-radius: 100px;
                border: 1px solid #dedede;
                height: 45px;
                width: 45px;
                pointer-events: none;
            }

            .wizard_tb .nav-pills.nav-tabs-btn .nav-item {
                border-radius: 100px;
                background-color: #fff;
                height: 45px;
                width: 45px;
                margin: 0 3.5rem;
                cursor: no-drop;
            }

            .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 90%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 42%;
                z-index: 1;
            }

            .sve_class_cl {
                background-color: #44cb99;
            }

            .sve_class_cl span {
                color: #fff!important;
            }

            .sve_class_already {
                background-color: #00BCD4;
            }

            .sve_class_already span {
                color: #fff!important;
            }

            <!-- .sve_class_cl:before {
                --> <!-- content: "\f150";
                --> <!-- color: #fff;
                --> <!-- background-color: #44cb99;
                --> <!-- height: 45px;
                --> <!-- width: 45px;
                --> <!-- border-radius: 100px;
                --> <!-- line-height: 45px;
                --> <!-- position: absolute;
                --> <!--
            }

            --> .modal-body .ps > .ps__rail-y > .ps__thumb-y {
                background: #5867dc;
                opacity: 1;
            }

            .space_btn_height {
                height: 21px;
            }

            .detail-tender {
                padding: 5px 0px 8px;
            }

            .detail-tender p {
                text-align: center;
                margin: 0;
                color: #6e4ff6;
                font-size: 13px;
            }

            .detail-tender p span {
                /* font-size: 12px; */
                color: #fd3995;
                padding-right: 8px;
                padding-left: 8px;
            }
            .swal2-popup .swal2-content {
                color: #464457;
                padding-left: 40px;
            }
        </style>

    </head> 
    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled">
        <!-- end::Scrolltop -->
        <div class="modal fade mdl-bg mdal-lg" id="tenderOpeningEnvelope" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="assets/demo/media/logo-dark.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo" id="deptName"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body opening_tender">
                        <div class="bider_table_dt ">
                            <div class="k-content__head-toolbar-wrapper text-right ">
                                <a href="#" class="btn btn-sm btn-elevate btn-danger radius_0" data-toggle="k-tooltip" title="" data-placement="top" data-original-title="Select dashboard daterange"> 
                                    <span class="k-font-bold" id="clock12345"></span>
                                    <span class="k-opacity-10">Remaning</span>
                                    <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                </a>
                            </div>
                            <!-- <h3 class="modal_heading"> <i class="flaticon-information"></i> Tender Information <div class="k-content__head-toolbar"> -->
                            <!-- <div class="k-content__head-toolbar-wrapper"> -->
                            <!-- <a href="#" class="btn btn-sm btn-elevate btn-danger" data-toggle="k-tooltip" title="" data-placement="top" data-original-title="Select dashboard daterange"> -->
                            <!-- <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp; -->
                            <!-- <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16</span> -->
                            <!-- <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i> -->
                            <!-- </a> -->
                            <!-- </div> -->
                            <!-- </div></h3> -->
                            <table class="table table-bordered table-hover table-checkable">
                                <tbody>
                                    <tr class="group tbl_row_bg">
                                        <th colspan="10" class="clearfix tbl_td_bg text-center"><span class="tndr_cntr modal_heading"><i class="flaticon-information"></i> Tender Information</span></th>
                                    </tr>
                                    <tr>
                                        <th>Tender No.</th>
                                        <td><span id="tenderNumber"></span></td>
                                        <th>EMD (In fig.)</th>
                                        <td><span class="rs_ic" ><i class="la la-rupee"></i><span id="emdInFig"></span></span></td> 
                                    </tr>
                                    <tr>
                                        <th>Bid Withdraw</th>
                                        <td><span class="text-success" id="tenderBidWithdrawAllowed"></span>
                                            <span class="text-danger" id="tenderBidWithdraw"></span>
                                        </td> 
                                        <th>Re-Bid</th>
                                        <td><span class="text-success" id="tenderRebidAllowed"></span>
                                            <span class="text-danger" id="tenderRebid"> </span>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="k-portlet__body bidder_template">
                            <div class="nav nav-pills nav-tabs-btn nav-pills-btn-success">
                                <div class="nav-item">
                                    <div class="nav-link btn-success" id="submittStatusEA" style="display:none;" >

                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope A</span>
                                        <span class="nav-link-title">Envelope A Submitted</span>

                                    </div>
                                    <div class="nav-link btn-secondary" id="notsubmittStatusEA"  >

                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope A</span>
                                        <span class="nav-link-title">Envelope A Not Submitted</span>

                                    </div>
                                </div>
                                <div class="nav-item">
                                    <div class="nav-link btn-success" id="submittStatusEB" style="display: none;">
                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope B</span>
                                        <span class="nav-link-title">Envelope B Submitted</span>
                                    </div>
                                    <div class="nav-link btn-secondary" id="notsubmittStatusEB"  >
                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope B</span>
                                        <span class="nav-link-title">Envelope B Not Submitted</span>
                                    </div>
                                </div>
                                <div class="nav-item">
                                    <div class="nav-link btn-success" id="submittStatusEC" style="display: none;">
                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope C</span>
                                        <span class="nav-link-title">Envelope C Submitted</span>
                                    </div>
                                    <div class="nav-link btn-secondary" id="notsubmittStatusEC"  >
                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope C</span>
                                        <span class="nav-link-title">Envelope C Not Submitted </span>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content_opening">
                                <div class="envelope_abc">
                                    <table class="table table-bordered table-hover table-checkable">
                                        <tbody>
                                            <tr class="tbl_row_bg">
                                                <th><span class="th_icn">Envelope</span> </th>
                                                <th><span class="th_icn"><i class="la la-map-marker"></i>IP</span></th>
                                                <th class="ip_browser"><span class="th_icn"><i class="la la-globe"></i>Browser</span></th>
                                                <th><span class="th_icn"><i class="la la-windows"></i>OS</span></th>
                                                <th><span class="th_icn"><i class="flaticon-calendar-with-a-clock-time-tools"></i>Date / Time</span></th>
                                            </tr>
                                            <tr>
                                                <th>Envelope A</th>
                                                <td><span class="rs_ic" id="ipAddressEA"></span></td>
                                                <td id="browser_forEA"></td>
                                                <td id="os_forEA"></td>
                                                <td><span class="rs_ic" id="dateTimeEA"></span></td>
                                            </tr>
                                            <tr id="EbRowId">
                                                <th>Envelope B</th>
                                                <td><span class="rs_ic" id="ipAddressEB"></span></td>
                                                <td id="browser_forEB"></td>
                                                <td id="os_forEB"></td>
                                                <td><span class="rs_ic" id="dateTimeEB"></span></td>
                                            </tr>
                                            <tr id="EcRowId">
                                                <th>Envelope C</th>
                                                <td><span class="rs_ic" id="ipAddressEC"></span></td>
                                                <td id="browser_forEC"></td>
                                                <td id="os_forEC"></td>
                                                <td><span class="rs_ic" id="dateTimeEC"></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="modal-footer mdl_footer_pd" id="beforeEndDatebtn">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <form action="proceedtoBid" method="post">
                            <input type="hidden" id="tender_Id" value="" name="tenderId">
                            <button type="submit" class="btn btn-success btn-sm" id="btnforProceedBid" >Proceed to Bid</button>

                        </form>
                        <form action="viewBid" method="post">
                            <input type="hidden" id="tender_Id1" value="" name="tenderId">
                            <button type="submit" class="btn btn-success btn-sm" id="btnforViewBid" >View Bid</button>

                        </form>

                        <!--<button type="button" class="btn btn-success btn-sm" >Proceed to Bid</button>-->
                    </div>
                    <!--                <div class="modal-footer mdl_footer_pd" id="afterEndDatebtn">
                                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                                        <form action="proceedtoBid" method="post">
                                            <input type="hidden" id="tender_Id" value="" name="tenderId">
                                            <button type="submit" class="btn btn-success btn-sm" id="btnforProceedBid" >Proceed to Bid</button>
                                          
                                        </form>
                                        <form action="viewBid" method="post">
                                            <input type="hidden" id="tender_Id1" value="" name="tenderId">
                                            <button type="submit" class="btn btn-success btn-sm" id="btnforViewBid" >View Bid</button>
                                          
                                        </form>
                                       
                                        <button type="button" class="btn btn-success btn-sm" >Proceed to Bid</button>
                                    </div>-->
                </div>
            </div>
        </div>
        <!-- end::Global Config -->


    </body>
    
    
    <script>

        var tenderIdd;

        function getTenderDetail(tenderId, viewStatus) {
     //    alert(" in "+viewStatus+"Tender Id"+tenderId);
            tenderIdd = tenderId;

            $.ajax({
                type: "post",
                url: 'getTenderDetail?tenderId=' + tenderId,
                success: function (response) {

                    $.each(JSON.parse(response), function (key, value) {

                        //                        
                      //  console.log(response);
                        if (key === 'tenderRebid' && value == 'Allowed') {
                            $("#" + key + "Allowed").text(value);
                              //alert("TenderRebid Allowed")
                              //console.log("TenderRebid Allowed")

                        } else if (key == 'tenderBidWithdraw' && value == 'Allowed') {
                            $("#" + key + "Allowed").text(value);
    //alert("TenderRebid TenderBidWithDraw")
    //console.log("TenderRebid TenderBidWithDraw")
                        } else if (key == 'tender_Id') {
                            //alert("key is "+key+ " value "+value);
                            $("#" + key).val(value);
                            $("#" + key + "1").val(value);
                        } else if (key == 'proceedtoBid' && value == true) {
                         // alert("ProcessToBid TRUE")
                            $('#btnforProceedBid').show();
//                            $('#btnforViewBid').hide();
                        } else if (key == 'proceedtoBid' && value == false) {
                            $('#btnforProceedBid').hide();
                           alert("ProcessToBid FALSE")
//                            $('#btnforViewBid').show();
                        }
                         else if (key == 'viewBid' && value == true) {
                
                            $('#btnforViewBid').show();
                        //alert("FOR VIEW")
                           // console.log("VIEW BID TRUE")
                        } else if (key == 'viewBid' && value == false) {
//                            $('#btnforProceedBid').hide();
                            $('#btnforViewBid').hide();
                        }
                        
        
        
        else {

                            $("#" + key).text(value);
                       // console.error("Error Occure");
                        }
                        if (key == 'envelopeASubmittStatus' && value === true) {

                          //alert("key is "+key+ " value "+value);
                            $('#submittStatusEA').show();
                            $('#notsubmittStatusEA').hide();
                            //                                     

                        }
                        if (key == 'envelopeBSubmittStatus' && value === true) {
                           // alert("key is "+key+ " value "+value);
                            $('#submittStatusEB').show();
                            $('#notsubmittStatusEB').hide();
       
                        }
                        
                         if (key == 'showQCBS' && value === true) {
                          // alert("key is "+key+ " value "+value);
                            $('#submittStatusEB').show();
                            $('#notsubmittStatusEB').hide();
       
                        }
                        if(key == 'showEB' && value === false)
                        {
                            $('#submittStatusEB').hide();
                            $('#notsubmittStatusEB').hide();
                            $('#EbRowId').hide();        
                        }
                        
                        if(key=='showEC' && value=== false)
                        {
                             $('#submittStatusEC').hide();
                            $('#notsubmittStatusEC').hide();
                            $('#EcRowId').hide();
                        }
                        if (key == 'envelopeCSubmittStatus' && value === true) {
                       //  alert("key is "+key+ " value "+value);
                            $('#submittStatusEC').show();
                            $('#notsubmittStatusEC').hide();
                        } else if (key == 'envelopeA_Logs') {
                            // alert("value is a "+value.osName);
                            $('#ipAddressEA').text(value.ipAddress);
                            $('#dateTimeEA').text(value.dateTime);
                            if (value.osName == 'Windows') {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-windows"></i>Windows</span>';
                                $('#os_forEA').html(spanforOS);

                            } else if (value.osName == 'Linux') {
                                var spanforOS = '<span class="rs_ic"><i class="fab fa-linux"></i>Linux</span>';
                                $('#os_forEA').html(spanforOS);
                            } else {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-apple"></i>Mac OS</span>';
                                $('#os_forEA').html(spanforOS);
                            }
                            if (value.browserName == 'Firefox') {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-firefox"></i>Mozilla Firefox</span>';
                                $('#browser_forEA').html(spanforOS);

                            } else if (value.browserName == 'Chrome') {
                                var spanforOS = '<span class="rs_ic"><i class="fab fa-chrome"></i>Google Chrome</span>';
                                $('#browser_forEA').html(spanforOS);
                            } else {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-apple"></i>Mac OS</span>';
                                $('#browser_forEA').html(spanforOS);
                            }



                        } else if (key == 'envelopeB_Logs') {
                            //  alert("value is b "+value.osName);
                            $('#ipAddressEB').text(value.ipAddress);
                            $('#dateTimeEB').text(value.dateTime);
                            if (value.osName == 'Windows') {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-windows"></i>Windows</span>';
                                $('#os_forEB').html(spanforOS);

                            } else if (value.osName == 'Linux') {
                                var spanforOS = '<span class="rs_ic"><i class="fab fa-linux"></i>Linux</span>';
                                $('#os_forEB').html(spanforOS);
                            } else {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-apple"></i>Mac OS</span>';
                                $('#os_forEB').html(spanforOS);
                            }
                            if (value.browserName == 'Firefox') {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-firefox"></i>Mozilla Firefox</span>';
                                $('#browser_forEB').html(spanforOS);

                            } else if (value.browserName == 'Chrome') {
                                var spanforOS = '<span class="rs_ic"><i class="fab fa-chrome"></i>Google Chrome</span>';
                                $('#browser_forEB').html(spanforOS);
                            } else {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-apple"></i>Mac OS</span>';
                                $('#browser_forEB').html(spanforOS);
                            }
                        } else if (key == 'envelopeC_Logs') {
                            //   alert("value is c "+value.osName);
                            $('#ipAddressEC').text(value.ipAddress);
                            $('#dateTimeEC').text(value.dateTime);
                            if (value.osName == 'Windows') {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-windows"></i>Windows</span>';
                                $('#os_forEC').html(spanforOS);

                            } else if (value.osName == 'Linux') {
                                var spanforOS = '<span class="rs_ic"><i class="fab fa-linux"></i>Linux</span>';
                                $('#os_forEC').html(spanforOS);
                            } else {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-apple"></i>Mac OS</span>';
                                $('#os_forEC').html(spanforOS);
                            }
                            if (value.browserName == 'Firefox') {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-firefox"></i>Mozilla Firefox</span>';
                                $('#browser_forEC').html(spanforOS);

                            } else if (value.browserName == 'Chrome') {
                                var spanforOS = '<span class="rs_ic"><i class="fab fa-chrome"></i>Google Chrome</span>';
                                $('#browser_forEC').html(spanforOS);
                            } else {
                                var spanforOS = '<span class="rs_ic"><i class="socicon-apple"></i>Mac OS</span>';
                                $('#browser_forEC').html(spanforOS);
                            }
                        }
                    });

                },
                error: function (e) {
                    alert('Error: ' + e);
                    document.getElementById('wait').style.display = 'none';
                }
            });


        }
        var minutes, remainingSeconds;
        var seconds;
        var countdownTimer = window.setInterval(bidTimeCounter, 1000);
        function bidTimeCounter() {

            var localdate = new Date();
            var year = localdate.getFullYear();
            //                      var month=localdate.getMonth();
            var date = localdate.getDate();

            var hrs = localdate.getHours();
            var min = localdate.getMinutes();
            var sec = localdate.getSeconds();
            var d = new Date();
            var weekday = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
            var monthName = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
            var day = weekday[d.getDay()];
            var month = monthName[d.getMonth()];

            $.ajax({
                type: "POST",
                url: "countDownTimer",
                data: {'tenderId': tenderIdd},
                success: function (response) {
                    seconds = response;

                    if (seconds === 0 || seconds < 0) {
                        clearInterval(countdownTimer);
                        document.getElementById('clock12345').innerHTML = "Bidding Closed";
                        $(':button').prop('disabled', true);
                        $(':input').prop('disabled', true);
                        return;
                    } else {
                        var days = ("00" + (Math.floor(seconds / 24 / 60 / 60))).substr(-2);
                        var hoursLeft = Math.floor((seconds) - (days * 86400));
                        var hours = ("00" + (Math.floor(hoursLeft / 3600))).substr(-2);
                        var minutesLeft = Math.floor((hoursLeft) - (hours * 3600));
                        minutes = ("00" + (Math.floor(minutesLeft / 60))).substr(-2);
                        remainingSeconds = ("00" + (seconds % 60)).substr(-2);
                        //                              
                        document.getElementById('clock12345').innerHTML = days + " Days " + hours + " hr " + minutes + " m " + remainingSeconds + " s ";
                        document.getElementById('time').innerHTML = hrs + ":" + min + ":" + sec;
                        document.getElementById('date').innerHTML = day + " | " + date + "-" + month + "-" + year;
                    }
                },
                error: function (e) {

                }
            });
        }


    </script>
    <!-- end::Body -->

</html> 