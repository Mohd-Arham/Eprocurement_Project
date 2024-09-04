 <!-- Modal -->
    <div class="modal fade" id="contractor_notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:63%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Digital Signature Certificate (DSC) Information</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body notification_md">
                    <div class="k-portlet__body">
                       <table class="table table-bordered tenderData"> 
								<thead> 
									<tr class="table_th tbl_row_bg"> 
										<th class="k-font-bolder">Certificate Type</th>
										<th class="k-font-bolder">Status</th>
										<th class="k-font-bolder">Verify Certificate</th>
									</tr>
								</thead>
									<tbody>
										<tr class="table_data_viewDSC">
										<td><p class="td_data">Signing</p></td>
										<td><p class="td_data">Verified</p></td>
<td><p class="td_data"><a href="#" class="btn btn-info btn-sm">Verify Now</a></p></td>										
										</tr>
										<tr class="table_data_viewDSC">
										<td><p class="td_data">Encryption</p></td>
										<td><p class="td_data">Not Verified</p></td> 
										<td><p class="td_data"><a href="#" class="btn btn-info btn-sm">Verify Now</a></p></td>
										</tr> 
									</tbody>
							</table>
							
							
							
							<style>
							.table_data_viewDSC{
							
							}
							.table_data_viewDSC p{
							margin:0px;
							}
							.fa_lineheight{
							line-height:inherit;}
							.important_note .alert .alert-icon i{
							font-size:1.6rem;
							}
							.important_note .alert .alert-text{
							font-weight:600;
							}
							</style>
								<div class="important_note">
							<div class="row">
								<div class="col-md-4">
								<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="flaticon-close k-font-danger"></i></div>
														<div class="alert-text">
															Not Verified / Revoked
														</div>
													</div>
												</div>
								</div>
								<div class="col-md-4">
								<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="flaticon-exclamation-1 k-font-warning"></i></div>
														<div class="alert-text">
															About to Expired
														</div>
													</div>
												</div>
								</div>
								<div class="col-md-4">
								<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="fa fa-check-circle k-font-success fa_lineheight"></i></div>
														<div class="alert-text">
															Verified & Valid
														</div>
													</div>
												</div>
								</div> 
							</div> 
							</div>
                    </div> 	
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
