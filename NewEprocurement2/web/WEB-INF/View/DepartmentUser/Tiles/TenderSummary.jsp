<!-- Modal -->
<div class="modal fade" id="tableViewTender" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Tender Summary</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">                                            <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">                                                  <table class="table table-striped- table-bordered table-hover table-checkable table_th">                                            <tbody>                                                               <tr>                                                                 <th>Tender No.</th>                                                  <td colspan="2">{{previousTenderSummary.tenderNumber}}</td>                                                                  <th>NIT No.</th>                                                     <td colspan="2">{{previousTenderSummary.nitNumber}}</td>
                            </tr>                           <tr>                                                                            <th>Name of Work</th>                                                           <td colspan="5">{{previousTenderSummary.nameOfWork}}</td>
                            </tr>

                            <tr>
                                <th>Tender Stage</th>
                                <td colspan="2">{{previousTenderSummary.tenderStageName}}</td>
                                <th>Selective Tenderer</th>
                                <td colspan="2">{{previousTenderSummary.selectiveTenderName}}</td>
                            </tr>
                            <tr>
                                <th>Envelope Type</th>
                                <td colspan="2">{{previousTenderSummary.envelopeTypeName}}</td>
                                <th>Type of Tender</th>
                                <td colspan="2">{{previousTenderSummary.typeOfTenderName}}</td>
                            </tr>
                            <tr>
                                <th>Tender Categories</th>
                                <td colspan="2">{{previousTenderSummary.tenderCategoryName}}</td>
                                <th>Area of Work</th>
                                <td colspan="2">{{previousTenderSummary.areaOfWorkName}}</td>
                            </tr>

                            <!--                <tr>
                                                <th>PAC Value</th>
                                                <td colspan="2"><span class="rs_ic"><i class="la la-rupee"></i>100000</span></td>
                                                <th>EMD Amount</th>
                                                <td colspan="2"><span class="rs_ic"><i class="la la-rupee"></i>100000</span></td>
                                            </tr>
                                            <tr>
                                                <th>Tender  Cost</th>
                                                <td colspan="2"><span class="rs_ic"><i class="la la-rupee"></i>100000</span></td>
                                                <th>Portal Charge</th>
                                                <td colspan="2"><span class="rs_ic"><i class="la la-rupee"></i>100000</span></td>
                                            </tr>-->


                            <tr class="row_bg_sec">
                                <th colspan="3">Purchase End Date</th>
                                <th colspan="3">Bidding End Date</th>
                                <!--                    <th colspan="2">Opening Start Date</th>-->
                            </tr>
                            <tr>
                                <td colspan="3">{{previousTenderSummary.tenderKeyDates.tenderPurchaseDate}}</td>
                                <td colspan="3">{{previousTenderSummary.tenderKeyDates.bidSubmissionDate}}</td>
                                <!--                    <td colspan="2">{{previousTenderSummary.tenderKeyDates.tenderPurchaseDate}}</td>-->
                            </tr>

                            <tr class="row_bg_sec">
                                <th colspan="2">Opening EA</th>
                                <th colspan="2">Opening EB</th>
                                <th colspan="2">Opening EC</th>
                            </tr>
                            <tr>
                                <td colspan="2">{{previousTenderSummary.tenderKeyDates.openingEA}}</td>
                                <td colspan="2">{{previousTenderSummary.tenderKeyDates.openingEB}}</td>
                                <td colspan="2">{{previousTenderSummary.tenderKeyDates.openingEC}}</td>
                            </tr>


                            <!--                <tr>
                                                <th>Pre-Bid Date & Venue</th>
                                                <td colspan="5">{{previousTenderSummary.preBidMeetingDate}}, {{previousTenderSummary.preBidMeetingVenue}}</td>
                                            </tr>-->

                            <tr class="row_bg_sec">
                                <th colspan="2"><span class="dwn_arrow"><i class="la la-long-arrow-down"></i>Opening Officer For EA</span></th>
                                <th colspan="2"><span class="dwn_arrow"><i class="la la-long-arrow-down"></i>Opening Officer For EB</span></th>
                                <th colspan="2"><span class="dwn_arrow"><i class="la la-long-arrow-down"></i>Opening Officer For EC</span></th>
                            </tr>
                            <tr>
                                <td colspan="2"><span ng-repeat="(key, value) in previousTenderSummary.envelopeAOfficersName">{{value}}<br/></span></td>
                                <td colspan="2"><span ng-repeat="(key, value) in previousTenderSummary.envelopeBOfficersName">{{value}}<br/></span></td>
                                <td colspan="2"><span ng-repeat="(key, value) in previousTenderSummary.envelopeCOfficersName">{{value}}<br/></span></td>
                            </tr>
                        </tbody>                            
                    </table>                             
                </div>                                   
            </div>                                    
        </div>                                       
    </div>                                       
</div>



<!-- begin:: Page -->
