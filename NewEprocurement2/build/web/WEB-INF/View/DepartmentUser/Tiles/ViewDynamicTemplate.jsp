<!--begin::Modal-View-template -->
    <div class="modal fade mdl-bg" id="m_select_modal_view_template" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">View Template</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="modal-body" >
                    <form class="k-form" ng-repeat="dynamicTemplate in dynamicTemplate">
                         <label class="upr_text">{{ dynamicTemplate.labelNameA }}</label>
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'true'" style="color:red;">*</i>
                        <div class="form-group" ng-if="dynamicTemplate.labelTypeA === '1'">
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'true'">
                                <input type="text" class="form-control" placeholder="Alpha Numeric" ng-readonly="true">
                            </i>
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'false'">
                                <input type="text" class="form-control" placeholder="Alpha Numeric" ng-readonly="true">
                            </i>
                        </div>
                        <div class="form-group" ng-if="dynamicTemplate.labelTypeA === '2'">
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'true'">
                                <input type="text" class="form-control" placeholder="Numeric" ng-readonly="true">
                            </i>
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'false'">
                                <input type="text" class="form-control" placeholder="Numeric" ng-readonly="true">
                            </i>
                        </div>
                        <div class="form-group" ng-if="dynamicTemplate.labelTypeA === '3'">
                            <i class="custom-file" ng-if="dynamicTemplate.labelMandatoryA === 'true'" >
                                    <input type="file" class="custom-file-input" id="customFile" ng-readonly="true">
                                    <label class="custom-file-label selected" for="customFile"></label>
                            </i>
                            <i class="custom-file" ng-if="dynamicTemplate.labelMandatoryA === 'false'" >
                                    <input type="file" class="custom-file-input" id="customFile" ng-readonly="true">
                                    <label class="custom-file-label selected" for="customFile"></label>
                            </i>
                        </div>
                       
                        <div class="form-group" ng-if="dynamicTemplate.labelTypeA === '4'">
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'true'"> 
                                <input type="text" onKeyup="dynamicTemplateConv(this.value, this.id);" id="{{dynamicTemplate.tender_EnvelopeA_Id}}" class="form-control" placeholder="Currency" ng-model="Currency" ng-readonly="true">
                                <input type="text" id="dynamicTemplateValue{{dynamicTemplate.tender_EnvelopeA_Id}}" tabindex="-1" class="form-control" readonly="readonly" value="{{Currency | words}}" ng-readonly="true">
                            </i> 
                            <i ng-if="dynamicTemplate.labelMandatoryA === 'false'">
                                <input type="text" onKeyup="dynamicTemplateConv(this.value, this.id);" id="{{dynamicTemplate.tender_EnvelopeA_Id}}" class="form-control" placeholder="Currency" ng-model="Currency" ng-readonly="true">
                                <input type="text" id="dynamicTemplateValue{{dynamicTemplate.tender_EnvelopeA_Id}}" tabindex="-1" class="form-control" readonly="readonly" value="{{Currency | words}}" ng-readonly="true">
                            </i> 
                        </div>
                    </form>
<!--                    <div class="form-group">
                        <button type="button" class="btn btn-success btn-sm" ng-click="testingDynamicTemplate();" data-dismiss="modal">Add</button>
                        <button type="button" class="btn btn-secondary btn-sm">Reset</button>
                    </div>-->
                </div>
            </div>
        </div>
    </div>

    <!--end::Modal--> 