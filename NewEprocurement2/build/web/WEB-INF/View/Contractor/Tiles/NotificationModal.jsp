<!-- Modal -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="modal fade" id="contractor_notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Notifications</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="k-portlet__body">
                    <div class="k-notification k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="300" style="height: 300px; overflow: hidden;">
                        <a href="#" class="k-notification__item">
                            <div class="k-notification__item-icon">
                                <i class="flaticon-time-2"></i>
                            </div>
                            <div class="k-notification__item-details">
                                <div class="k-notification__item-title">
                                   Please Verify Your Mobile Number 
                                </div>
                                <div class="k-notification__item-time">
                                    2 hrs ago
                                </div>
                            </div>
                        </a>
                        <a href="#" class="k-notification__item">
                            <div class="k-notification__item-icon">
                                <i class="flaticon-upload-1"></i>
                            </div>
                            <div class="k-notification__item-details">
                                <div class="k-notification__item-title">
                                 Please Verify Your Email (Verification link has been sent to your email account)
                                </div>
                                <div class="k-notification__item-time">
                                    3 hrs ago
                                </div>
                            </div>
                        </a>
                          
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- begin::Global Config -->