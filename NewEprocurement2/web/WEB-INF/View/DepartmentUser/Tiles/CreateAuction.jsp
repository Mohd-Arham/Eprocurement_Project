<div class="tab-pane active" id="k_portlet_base_demo_1_tab_content_auction" role="tabpanel">
                                                    <form class="k-form k-form--label-right">
                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
													<i class="flaticon-cogwheel"></i>
												</span>
                                                                <h3 class="k-portlet__head-title">
											Create Auction
													<small>some sub title</small>
												</h3>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-lg-4">
                                                                <label>Auction Dispatcher Number :</label>
                                                                <input type="email" class="form-control" placeholder="Enter NIT number">
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <label class="">Auction Dispatcher Date :</label>
                                                                <div class="input-group date">
                                                                    <input type="text" class="form-control" readonly placeholder="Select date & time" id="k_datetimepicker_2" />
                                                                    <div class="input-group-append">
                                                                        <span class="input-group-text"><i class="la la-calendar-check-o glyphicon-th"></i></span>
                                                                    </div>
                                                                </div>
                                                                <span class="form-text text-muted">Please select nit date</span>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <label>Officer Name :</label>
                                                                <select class="form-control" id="exampleSelect1">
                                                                    <option value="0">Select Officer Name</option>
                                                                    <option value="Atul Pathak">Atul Pathak</option>
                                                                    <option value="Amit Pathak">Amit Pathak</option>
                                                                </select>
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-lg-4">
                                                                <label>Auction Pattern :</label>
                                                                <select class="form-control" id="exampleSelect1">
                                                                    <option value="-1">Select Auction Pattern</option>
                                                                    <option value="Forward Auction">Forward Auction</option>
                                                                    <option value="Reverse Auction">Reverse Auction</option>
                                                                </select>
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <label>Auction Categories :</label>
                                                                <select class="form-control" id="exampleSelect1">
                                                                    <option value="-1">Select Auction Categories</option>
                                                                    <option value="Open">Open</option>
                                                                    <option value="Limited">Limited</option>
                                                                </select>
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <label>Auction Type :</label>
                                                                <select class="form-control" id="exampleSelect1">
                                                                    <option value="-1">Select Auction Pattern</option>
                                                                    <option value="-1">Select Auction Type</option>
                                                                    <option value="LiveAuction">Live Auction</option>
                                                                    <option value="EnvelopeBaseAuction">Envelope Base Auction</option>
                                                                </select>
                                                                <span class="form-text text-muted">Please enter your nit number</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <button type="button" class="btn btn-success btn-sm btn-brand" data-toggle="popover" title="Get Tender Number" data-content="And here's some amazing content. It's very engaging. Right?">
                                                                Get Auction Number
                                                            </button>

                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="col-lg-4">
                                                                <label class="">Generate Auction Number :</label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    <input type="text" class="form-control" placeholder="Enter your postcode">
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-bookmark-o"></i></span></span>
                                                                </div>
                                                                <span class="form-text text-muted">Please enter your postcode</span>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <label class="">User Group:</label>
                                                                <div class="k-radio-inline">
                                                                    <label class="k-radio k-radio--primary">
                                                                        <input type="radio" name="example_2" checked value="2"> New Auction
                                                                        <span></span>
                                                                    </label>
                                                                    <label class="k-radio k-radio--primary">
                                                                        <input type="radio" name="example_2" value="2"> Copy From Auction
                                                                        <span></span>
                                                                    </label>
                                                                </div>
                                                                <span class="form-text text-muted">Please select user group</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="col-lg-4">
                                                                <label class="">Copy Auction Number:</label>
                                                                <input type="email" class="form-control" placeholder="Enter contact number">
                                                                <span class="form-text text-muted">Please enter your contact</span>
                                                            </div>
                                                            <!-- <div class="col-lg-4"> -->
                                                                <!-- <label class="">Number of Copy:</label> -->
                                                                <!-- <select class="form-control" id="exampleSelect1"> -->
                                                                    <!-- <option>1</option> -->
                                                                    <!-- <option>2</option> -->
                                                                    <!-- <option>3</option> -->
                                                                    <!-- <option>4</option> -->
                                                                    <!-- <option>5</option> -->
                                                                <!-- </select> -->
                                                                <!-- <span class="form-text text-muted">Please enter fax</span> -->
                                                            <!-- </div> -->
                                                            <div class="col-lg-4">
                                                                <label class="">Copy Auction Number:</label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    <button type="button" class="btn btn-primary btn-sm">Copy Auction</button>
                                                                    <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#m_select_modal_view_tender_number">View Auction Number</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>