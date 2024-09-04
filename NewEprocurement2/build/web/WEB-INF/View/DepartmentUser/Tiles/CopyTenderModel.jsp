<div class="modal fade mdl-bg" id="m_select_modal_view_tender_number" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog  modal-lg modal-dialog-centered" role="document" style="max-width: 90%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">View Tenders Number</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                    <div class="modal-body">
                        <div class="k-portlet k-portlet--mobile">

                            <!--begin: Datatable -->
                            <table class="table table-striped- table-bordered table-hover table-checkable" id="k_table_1">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT Date</th>
                                        <th>NIT No.</th>
                                        <th>Name Of Work</th>
                                        <th>Description</th>
                                        <th>View Details</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="Details in previousTenderDetails">
                                        <td>{{Details.tenderNumber}}</td>
                                        <td>{{Details.nitDate}}</td>
                                        <td>{{Details.nitNumber}}</td>
                                        <td>{{Details.nameOfWork}}</td>
                                        <td>{{Details.descriptionOfWork}}</td>
                                        <td><a href="#" class="btn btn-primary btn-sm" ng-click='fetchPreviouTenderDetail(Details.tender_Id)' data-toggle="modal" data-target="#tableViewTender">View Details</a></td>
                                        <td nowrap><a href="#" class="btn btn-primary btn-sm" data-dismiss="modal" ng-click='copyTenderNumber(Details.tenderNumber, Details.tender_Id)'><i class="fa fa-clipboard copytender" ></i>Copy Tender</a></td>
                                    </tr>
                                </tbody>
                            </table>

                            <!--end: Datatable -->

                        </div>

                    </div>
                </div>
                <!--Start::Modal::Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                </div>
                <!--end::Modal::Footer-->
            </div>
        </div>
    </div>
