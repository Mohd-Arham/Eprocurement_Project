	
<!--STAR_TENDER_WIZARD_MODAL -->
<!-- Large Modal -->
<div class="modal fade" id="createAuctionWizard" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"  aria-hidden="true"> 
    <div class="modal-dialog modal-lg" style="max-width:90%;">
        <div class="modal-content">
            <!--<div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                    </button>
            </div>-->
            <div class="modal-body" style="background-color: #f8f8f8;">
                <div class="k-portlet" style="margin-bottom:0;">
                    <div class="k-portlet__head" style="padding: 12px 25px;"> 
                        <div class="wizard_tb" style="position:relative;">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-pills nav-tabs-btn" role="tablist" style="padding-bottom:0px;position:relative;z-index:1;">

                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_1_tab_content" role="tab">
                                        <span class="nav-link-title">1</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item" id="test2">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_tab_content" role="tab">
                                        <span class="nav-link-title">2</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item" id="test3"> 
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_3_tab_content" role="tab">
                                        <span class="nav-link-title">3</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_4_tab_content" role="tab">
                                        <span class="nav-link-title">4</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_5_tab_content" role="tab">
                                        <span class="nav-link-title">5</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_6_tab_content" role="tab">
                                        <span class="nav-link-title">6</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_7_tab_content" role="tab">
                                        <span class="nav-link-title">7</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_8_tab_content" role="tab">
                                        <span class="nav-link-title">8</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;">
                        <div class="tab-content">
                            <!-- STEP_FIRST_FORM -->
                            <div class="tab-pane active" id="k_portlet_base_demo_1_tab_content" role="tabpanel"> 	
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Get Tender Number
                                                <small>some sub title</small>
                                            </h3>
                                        </div>

                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-6">
                                            <label>NIT Number :</label>
                                            <input type="email" class="form-control" placeholder="Enter NIT number">
                                            <span class="form-text text-muted">Please enter your nit number</span>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="">NIT Date :</label>
                                            <div class="input-group date">
                                                <input type="text" class="form-control" readonly placeholder="Select date & time" id="k_datetimepicker_2" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o glyphicon-th"></i></span>
                                                </div>
                                            </div>

                                            <span class="form-text text-muted">Please select nit date</span>
                                        </div> 
                                    </div>

                                    <div class="form-group">
                                        <button type="button" class="btn btn-success btn-sm btn-brand" data-toggle="popover" title="Get Tender Number" data-content="And here's some amazing content. It's very engaging. Right?">
                                            Get Tender Number
                                        </button>
                                        &nbsp;
                                        <button type="button" class="btn btn-info btn-sm btn-focus" data-toggle="popover" data-trigger="hover" title="Reset" data-content="And here's some amazing content. It's very engaging. Right?">
                                            Reset
                                        </button>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-4">
                                            <label class="">Tender Number :</label>
                                            <div class="k-input-icon k-input-icon--right">
                                                <input type="text" class="form-control" placeholder="Enter your postcode">
                                                <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-bookmark-o"></i></span></span>
                                            </div>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="">User Group:</label>
                                            <div class="k-radio-inline">
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" checked value="2"> New Tender
                                                    <span></span>
                                                </label>
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" value="2"> Copy From Tender
                                                    <span></span>
                                                </label>
                                            </div>
                                            <span class="form-text text-muted">Please select user group</span>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-4">
                                            <label class="">Copy Tender Number:</label>
                                            <input type="email" class="form-control" placeholder="Enter contact number">
                                            <span class="form-text text-muted">Please enter your contact</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="">Number of Copy:</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                            <span class="form-text text-muted">Please enter fax</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="">Copy TenderNumber:</label>
                                            <div class="k-input-icon k-input-icon--right">
                                                <button type="button" class="btn btn-primary btn-sm">Copy Tender</button>
                                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#m_select_modal_view_tender_number">View Tenders Number</button>

                                            </div>  
                                        </div>
                                    </div>
                                </form>

                            </div> 

                            <!-- SECOND_STEP_FORM -->
                            <div class="tab-pane" id="k_portlet_base_demo_2_tab_content" role="tabpanel">
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Information
                                                <small>some sub title</small>
                                            </h3>
                                        </div>

                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-6">
                                            <label>Tender Stage :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option>Single</option>
                                                <option>Two Stage</option>
                                            </select>
                                            <span class="form-text text-muted">Please enter your nit number</span>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="">Selective Tender :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option> 
                                                <option value="1">Open</option> 
                                                <option value="2">Limited</option> 
                                                <option value="3">Single/nomination basis</option> 
                                                <option value="4">Global Tender Enquire(GTE)</option> 
                                            </select>

                                            <span class="form-text text-muted">Please select nit date</span>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Tender Categories :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option> 
                                                <option value="1">Work</option> 
                                                <option value="2">Procurement</option> 
                                                <option value="3">Service</option> 
                                            </select>
                                            <span class="form-text text-muted">Please Select Tender Categories</span>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Area Of Work:</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option> 
                                                <option value="1">Civil</option> 
                                                <option value="2">Civil Works</option> 
                                            </select>
                                            <span class="form-text text-muted">Please Select Tender Categories</span>
                                        </div> 
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-12">
                                            <label class="">Tender Keywords :</label>
                                            <select class="form-control k_selectpicker" multiple>
                                                <option>Mustard</option>
                                                <option>Ketchup</option>
                                                <option>Relish</option>
                                                <option>Mustard</option>
                                                <option>Ketchup</option>
                                                <option>Relish</option>
                                                <option>Mustard</option> 
                                            </select>

                                        </div>
                                    </div>	
                                    <div class="form-group row">

                                        <div class="col-lg-4">
                                            <label class="">SOR Documents:</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>

                                        </div>	
                                        <div class="col-lg-4">
                                            <!-- Procurement Select -->
                                            <label class="">Is This Tender Include Buy Back Offer Policy?:</label>
                                            <div class="k-radio-inline">
                                                <label class="k-radio  k-radio--success">
                                                    <input type="radio" name="example_2" checked="" value="2"> Yes
                                                    <span></span>
                                                </label>
                                                <label class="k-radio k-radio--brand">
                                                    <input type="radio" name="example_2" value="2"> No
                                                    <span></span>
                                                </label>
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>

                                        <div class="col-lg-4">
                                            <!-- Procurement Select upload sor document -->
                                            <label class="">Upload Document for Buy Back Offer Policy:</label>
                                            <div class="dropzone dropzone-primary form-control" action="inc/api/dropzone/upload.php" id="k-dropzone-one" style="min-height: auto;padding:0;border: 1px solid #dedede!important;">
                                                <div class="dropzone-msg dz-message needsclick "style="margin:2px 0;">
                                                    <!-- <h3 class="dropzone-msg-title">Drop files here or click to upload.</h3> -->
                                                    <span class="dropzone-msg-desc">Upload Document for Buy Back Offer Policy.</span>
                                                </div>
                                            </div> 
                                            <span class="form-text text-muted">Please select user group</span>
                                        </div>		 
                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-4">
                                            <label>Default Checkboxes</label>
                                            <div class="k-checkbox-list"> 
                                                <label class="k-checkbox k-checkbox--success">
                                                    <input type="checkbox">Allowed Tender Re-Bid
                                                    <span></span>
                                                </label>

                                            </div>
                                            <span class="form-text text-muted">Some help text goes here</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <label>Default Checkboxes</label>
                                            <div class="k-checkbox-list">   
                                                <label class="k-checkbox k-checkbox--brand">
                                                    <input type="checkbox">Allowed Bid-Withdraw
                                                    <span></span>
                                                </label>
                                            </div>
                                            <span class="form-text text-muted">Some help text goes here</span>
                                        </div>
                                    </div>

                                </form>

                            </div>

                            <!-- THIRD_STEP_FORM -->	
                            <div class="tab-pane" id="k_portlet_base_demo_3_tab_content" role="tabpanel">
                                <!--begin::Form-->
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Documents
                                                <small>some sub title</small>
                                            </h3>
                                        </div>

                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-6">
                                            <label>Name of work:</label>
                                            <textarea class="form-control" id="k_autosize_1" rows="3"></textarea>
                                            <span class="form-text text-muted">Please enter your nit number</span>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="">Short Description of Work:</label>
                                            <textarea class="form-control" id="k_autosize_2" rows="3"></textarea>	
                                            <span class="form-text text-muted">Please select nit date</span>
                                        </div>
                                    </div>



                                    <div class="form-group row">
                                        <div class="col-lg-3">
                                            <label class="">Estimate Value (In fig):</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-9">
                                            <label class="">Estimate Value (In Word):</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>

                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-3">
                                            <label class="">Tender Fees (In figure) :</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-9">
                                            <label class="">Tender Fees (In Word):</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>

                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-3">
                                            <label class="">Bid Validate Type:</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option>
                                                <option value="1">Days</option>
                                                <option value="2">Month</option> 
                                            </select>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="">Bid Validate Period:</label>
                                            <input type="email" class="form-control" placeholder="Enter contact number">
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="">Work Completion Type:</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option>
                                                <option value="1">Days</option>
                                                <option value="2">Month</option>                            
                                            </select>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>

                                        <div class="col-lg-3">
                                            <label class="">Work Completion Period:</label>
                                            <input type="email" class="form-control" placeholder="Enter contact number">
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>


                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-12">
                                            <label class="">Rainy Season :</label>
                                            <div class="k-radio-inline">
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" checked="" value="2"> Include
                                                    <span></span>
                                                </label>
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" value="2"> Exclude
                                                    <span></span>
                                                </label>
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" value="2"> Not Applicable
                                                    <span></span>
                                                </label>
                                            </div>
                                            <span class="form-text text-muted">Please select user group</span>
                                        </div> 
                                    </div>
                                </form>

                            </div>
                            <!-- FOURTH_STEP_FORM --> 
                            <div class="tab-pane" id="k_portlet_base_demo_4_tab_content" role="tabpanel">
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Category
                                                <small>some sub title</small>
                                            </h3>
                                        </div>

                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-3">
                                            <label class="">Envelope Type :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option>

                                                <option value="1">2 Envelope Tender</option> 

                                                <option value="2">3 Envelope Tender</option> 

                                                <option value="3">QCBS</option> 
                                            </select>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="">Contractor Class :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option>

                                                <option value="1">Class A</option> 

                                                <option value="2">Class B</option> 

                                                <option value="3">Class C</option> 

                                                <option value="4">Open</option> 

                                            </select>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="">Type of Tenders :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option>

                                                <option value="1">Percentage Rate Tender</option> 

                                                <option value="2">Lumpsum Tender</option> 

                                                <option value="3">Supply Tender</option> 

                                                <option value="4">Item Wise Tender</option> 

                                                <option value="5">Item Rate Tender</option> 

                                            </select>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>

                                        <div class="col-lg-3">
                                            <label class="">EMD Applicable :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="0">Select</option>

                                                <option value="1">Tender Wise</option> 

                                                <option value="2">Item Wise</option> 

                                            </select>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>


                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-3">
                                            <label class="">Earnest Money Deposit Payment Mode:</label>

                                        </div> 
                                        <div class="col-lg-9">
                                            <div class="k-radio-inline" style="margin-top: 0;">
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" checked="" value="2"> Online
                                                    <span></span>
                                                </label>
                                                <label class="k-radio k-radio--solid">
                                                    <input type="radio" name="example_2" value="2"> Offline
                                                    <span></span>
                                                </label>
                                                <!-- <label class="k-radio k-radio--solid"> -->
                                                <!-- <input type="radio" name="example_2" value="2"> Both -->
                                                <!-- <span></span> -->
                                                <!-- </label> -->
                                                <!-- <label class="k-radio k-radio--solid"> -->
                                                <!-- <input type="radio" name="example_2" value="2"> Not Applicable -->
                                                <!-- <span></span> -->
                                                <!-- </label> -->
                                            </div>
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-3">
                                            <label class="">EMD (In Fig):</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>
                                        <div class="col-lg-9">
                                            <label class="">EMD (In Word):</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                            </div> 
                                            <span class="form-text text-muted">Please enter your postcode</span>
                                        </div>

                                    </div>


                                    <div class="form-group row">
                                        <div class="col-lg-4">
                                            <label class="">Social Category Exemption:</label>
                                            <div class="k-checkbox-list"> 
                                                <label class="k-checkbox k-checkbox--success">
                                                    <input type="checkbox">Not Allowed SC/ST Exemption
                                                    <span></span>
                                                </label>

                                            </div> 
                                            <span class="form-text text-muted">Please select user group</span>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <label class="">Tender Fees:</label>  
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
                                                        <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div>
                                                    </div>
                                                    <span class="form-text text-muted">Please select user group</span>
                                                </div> 
                                                <div class="col-lg-6">
                                                    <label class="">EMD:</label>  
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
                                                        <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div>
                                                    </div>
                                                    <span class="form-text text-muted">Please select user group</span>
                                                </div> 
                                            </div>
                                        </div> 
                                        <div class="col-lg-4">
                                            <label class="">Social Category Exemption </label>
                                            <div class="k-checkbox-list"> 
                                                <label class="k-checkbox k-checkbox--brand">
                                                    <input type="checkbox">Not Allowed OBC Exemption
                                                    <span></span>
                                                </label>

                                            </div> 

                                            <span class="form-text text-muted">Please select user group</span>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <label class="">Tender Fees:</label>  
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
                                                        <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div>
                                                    </div>
                                                    <span class="form-text text-muted">Please select user group</span>
                                                </div> 
                                                <div class="col-lg-6">
                                                    <label class="">EMD:</label>  
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
                                                        <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div>
                                                    </div>
                                                    <span class="form-text text-muted">Please select user group</span>
                                                </div> 
                                            </div>

                                        </div> 
                                        <div class="col-lg-4">
                                            <label class="">MSME / NSIC Exemption:</label>
                                            <!-- <span class="k-switch k-switch--sm k-switch--icon"> -->
                                            <!-- <label> -->
                                            <!-- <input type="checkbox" checked="checked" name=""> -->
                                            <!-- <span></span>Not Allowed MSME / NSIC Exemption -->
                                            <!-- </label> -->
                                            <!-- </span>  -->
                                            <div class="k-checkbox-list"> 
                                                <label class="k-checkbox k-checkbox--brand">
                                                    <input type="checkbox">Not Allowed MSME / NSIC Exemption
                                                    <span></span>
                                                </label>

                                            </div> 

                                            <span class="form-text text-muted">Please select user group</span>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <label class="">Tender Fees:</label>  
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
                                                        <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div>
                                                    </div>
                                                    <span class="form-text text-muted">Please select user group</span>
                                                </div> 
                                                <div class="col-lg-6">
                                                    <label class="">EMD:</label>  
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
                                                        <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div>
                                                    </div>
                                                    <span class="form-text text-muted">Please select user group</span>
                                                </div> 
                                            </div>

                                        </div> 
                                    </div>

                                </form>


                            </div>
                            <!-- FIFTH_STEP_FORM --> 
                            <div class="tab-pane" id="k_portlet_base_demo_5_tab_content" role="tabpanel">
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Bidder Template
                                                <small>some sub title</small>
                                            </h3>
                                        </div>

                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">Envelope A :</h5>
                                                    <a href="#" class="card-link btn btn-primary btn-sm" data-toggle="modal" data-target="#m_select_modal"><i class="fa fa-plus-circle"></i> Add Template</a>
                                                    <a href="#" class="card-link btn btn-accent btn-sm" data-toggle="modal" data-target="#m_select_modal_view_template"><i class="fa fa-plus-circle"></i> View Template</a>
                                                    <span class="form-text text-muted">Please enter your postcode</span>
                                                </div> 	
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">Envelope B :</h5>
                                                    <a href="#" class="card-link btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i> Add Template</a>
                                                    <a href="#" class="card-link btn btn-accent btn-sm"><i class="fa fa-plus-circle"></i> View Template</a>
                                                    <span class="form-text text-muted">Please enter your postcode</span>
                                                </div> 	
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">Envelope C :</h5>
                                                    <a href="#" class="card-link btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i> Add Template</a>
                                                    <a href="#" class="card-link btn btn-accent btn-sm"><i class="fa fa-plus-circle"></i> View Template</a>
                                                    <span class="form-text text-muted">Please enter your postcode</span>
                                                </div> 	
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="form-group col-lg-12">
                                            <label>Default Checkboxes</label>
                                            <div class="k-checkbox-list"> 
                                                <label class="k-checkbox k-checkbox--success">
                                                    <input type="checkbox">Ammendment Privilege
                                                    <span></span>
                                                </label> 
                                            </div>

                                        </div>
                                        <div class="col-lg-12"> 
                                            <select class="form-control k_selectpicker" multiple>
                                                <option>Mustard</option>
                                                <option>Ketchup</option>
                                                <option>Relish</option>
                                                <option>Mustard</option>
                                                <option>Ketchup</option>
                                                <option>Relish</option>
                                                <option>Mustard</option> 
                                            </select>

                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- SIXTH_STEP_FORM -->
                            <div class="tab-pane" id="k_portlet_base_demo_6_tab_content" role="tabpanel">
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Documents
                                                <small>some sub title</small>
                                            </h3>
                                        </div>

                                    </div> 
                                    <div class=" documentts">
                                        <!-- <div class="form-group"> -->
                                        <!-- <label class="">Template Name</label> -->
                                        <!-- <div class=""> -->
                                        <!-- <input type="text" class="form-control" id="recipient-name" placeholder="Template Name"> -->
                                        <!-- <span class="form-text text-muted">Select boxes with optgroups</span> -->
                                        <!-- </div> -->
                                        <!-- </div> -->
                                        <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                                        <div class="k-repeater">
                                            <div class="k-repeater__data-set"> 
                                                <div data-repeater-list="demo3-list2">
                                                    <div data-repeater-item class="k-repeater__item"> 
                                                        <div class="form-group row">
                                                            <div class="col-lg-3">
                                                                <label>Label Name :</label>
                                                                <input type="email" class="form-control" placeholder="Enter NIT number">
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <label>Label Type :</label>
                                                                <div class="dropzone dropzone-primary dz-clickable" action="inc/api/dropzone/upload.php" id="k-dropzone-one" style="min-height: auto;padding:0;    border: 1px solid #dedede;">
                                                                    <div class="dropzone-msg dz-message needsclick" style="margin:2px 0;">
                                                                        <span class=" btn btn-sm">Upload Document</span>
                                                                    </div> 
                                                                </div>
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <label>Document Link </label>
                                                                <div><a href="#" target="_blank" class="k-link">info@osmoindia.com</a></div>
                                                            </div>
                                                            <div class="col-lg-2"> 
                                                                <label>After purchase</label>
                                                                <div class="k-checkbox-list">
                                                                    <label class="k-checkbox k-checkbox--brand">
                                                                        <input type="checkbox"> 
                                                                        <span></span>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                            <div class="col-lg-1">  
                                                                <label>Action</label>
                                                                <div class="k-repeater__close k-repeater__data form-group">
                                                                    <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                                        <i class="la la-close"></i> Remove
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div> 
                                                        <div class="k-separator k-separator--border-dashed"></div>
                                                        <div class="k-separator k-separator--height-sm"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-repeater__add-data">
                                                <span data-repeater-create="" class="btn btn-info btn-sm">
                                                    <i class="la la-plus"></i> Add More
                                                </span>
                                            </div>
                                        </div> 
                                    </div> 

                                </form>

                            </div>
                            <!-- SEVENTH_STEP_FORM -->
                            <div class="tab-pane" id="k_portlet_base_demo_7_tab_content" role="tabpanel">
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Key Dates
                                                <small>some sub title</small>
                                            </h3>
                                        </div> 
                                    </div> 
                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <label>Serial No.</label> 
                                        </div>
                                        <div class="col-lg-5">
                                            <label class="">Stages Name</label> 
                                        </div>
                                        <div class="col-lg-3">
                                            <label>Start Date and Time </label>  
                                        </div>
                                        <div class="col-lg-3">
                                            <label>End Date and Time</label>  
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="1"> 
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="TENDER PURCHASE"> 
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_58">
                                                <input type='text' class="form-control" readonly placeholder="Select date & time range" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>	

                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="2"> 
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="TENDER PURCHASE"> 
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_57">
                                                <input type='text' class="form-control " readonly placeholder="Select date & time range" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>	
                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="3"> 
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="TENDER PURCHASE"> 
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_56">
                                                <input type='text' class="form-control " readonly placeholder="Select date & time range" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>	

                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="4"> 
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="TENDER PURCHASE"> 
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_55">
                                                <input type='text' class="form-control " readonly placeholder="Select date & time range" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>	

                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="5"> 
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="TENDER PURCHASE"> 
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_5">
                                                <input type='text' class="form-control " readonly placeholder="Select date & time range" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>	





                                </form>

                            </div> 
                            <!-- EIGHTH_STEP_FORM -->
                            <div class="tab-pane" id="k_portlet_base_demo_8_tab_content" role="tabpanel"> 
                                <form class="k-form k-form--label-right"> 
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Notice
                                                <small>some sub title</small>
                                            </h3>
                                        </div>  	
                                    </div> 

                                    <div class="summernote" id="m_summernote_1" style="height:390px;"></div>

                                </form>

                            </div> 

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-brand btn_prev">Previous</button>
                <button type="button" class="btn btn-success btn_next">Save and Next</button>
            </div>
        </div>
    </div>
</div>



<!--END_TENDER_WIZARD_MODAL_FORM-->