<!--WIZARD_MODAL_FORM-->
<!-- Large Modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" style="max-width:90%;">
        <div class="modal-content AuctionWizard">
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
                                    <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_1_tab_content_auction" role="tab">
                                        <span class="nav-link-title">1</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item" id="test2">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_tab_content_auction" role="tab">
                                        <span class="nav-link-title">2</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item" id="test3">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_3_tab_content_auction" role="tab">
                                        <span class="nav-link-title">3</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_4_tab_content_auction" role="tab">
                                        <span class="nav-link-title">4</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_5_tab_content_auction" role="tab">
                                        <span class="nav-link-title">5</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_6_tab_content_auction" role="tab">
                                        <span class="nav-link-title">6</span>
                                        <span class="fa fa-check" style="display:none;"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                        <div class="tab-content">
                            <!-- STEP_FIRST_FORM -->
                            <%@include file="CreateAuction.jsp" %>  
                             <!-- SECOND_STEP_FORM -->
                            <%@include file="DefineAuction.jsp" %>  
                            <!--THIRD_STEP_FORM -->
                            <%@include file="ItemDetails.jsp" %>  
                            <!-- FOURTH_STEP_FORM -->
                            <%@include file="AuctionDocuments.jsp" %>  
                            <!-- FIFTH_STEP_FORM -->
                            <%@include file="AuctionKeyDates.jsp" %> 
                            <!-- SIXTH_STEP_FORM -->
                            <%@include file="AuctionNotice.jsp" %> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-brand" id="previous">Previous</button>
                <button type="button" class="btn btn-success" id="save_next_btn">Save and Next</button>
            </div>
        </div>
    </div>
</div>

<!--END_WIZARD_MODAL_FORM-->