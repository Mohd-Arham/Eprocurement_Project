"use strict";
var KBootstrapDaterangepicker = {
    init: function() {
        ! function() {
            $("#k_daterangepicker_1, #k_daterangepicker_1_modal").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary"
            }), $("#k_daterangepicker_2").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary"
            }, function(a, t, e) {
                $("#k_daterangepicker_2 .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
            }), $("#k_daterangepicker_2_modal").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary"
            }, function(a, t, e) {
                $("#k_daterangepicker_2 .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
            }), $("#k_daterangepicker_3").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary"
            }, function(a, t, e) {
                $("#k_daterangepicker_3 .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
            }), $("#k_daterangepicker_58").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary"
            }, function(a, t, e) {
                $("#k_daterangepicker_58 .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
            }), $("#k_daterangepicker_57").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                timePicker: !0,
                timePickerIncrement: 30,
                locale: {
                    format: "MM/DD/YYYY h:mm A"
                }
            }, function(a, t, e) {
                $("#k_daterangepicker_57 .form-control").val(a.format("MM/DD/YYYY h:mm A") + " / " + t.format("MM/DD/YYYY h:mm A"))
            }),$("#k_daterangepicker_56").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                timePicker: !0,
                timePickerIncrement: 30,
                locale: {
                    format: "MM/DD/YYYY h:mm A"
                }
            }, function(a, t, e) {
                $("#k_daterangepicker_56 .form-control").val(a.format("MM/DD/YYYY h:mm A") + " / " + t.format("MM/DD/YYYY h:mm A"))
            }),
			$(".k_daterangepicker_55").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                timePicker: !0,
                timePickerIncrement: 30,
                locale: {
                    format: "MM/DD/YYYY h:mm A"
                }
            }, function(a, t, e) {
                $(".k_daterangepicker_55 .form-control").val(a.format("MM/DD/YYYY h:mm A") + " / " + t.format("MM/DD/YYYY h:mm A"))
            });
            var a = moment().subtract(29, "days"),
                t = moment();
            $("#k_daterangepicker_6").daterangepicker({
                buttonClasses: "btn btn-sm",
                applyClass: "btn-primary",
                cancelClass: "btn-secondary",
                startDate: a,
                endDate: t,
                ranges: {
                    Today: [moment(), moment()],
                    Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
                    "Last 7 Days": [moment().subtract(6, "days"), moment()],
                    "Last 30 Days": [moment().subtract(29, "days"), moment()],
                    "This Month": [moment().startOf("month"), moment().endOf("month")],
                    "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
                }
            }, function(a, t, e) {
                $("#k_daterangepicker_6 .form-control").val(a.format("MM/DD/YYYY") + " / " + t.format("MM/DD/YYYY"))
            })
        }(), $("#k_daterangepicker_1_validate").daterangepicker({
            buttonClasses: "btn btn-sm",
            applyClass: "btn-primary",
            cancelClass: "btn-secondary"
        }, function(a, t, e) {
            $("#k_daterangepicker_1_validate .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
        }), $("#k_daterangepicker_2_validate").daterangepicker({
            buttonClasses: "btn btn-sm",
            applyClass: "btn-primary",
            cancelClass: "btn-secondary"
        }, function(a, t, e) {
            $("#k_daterangepicker_3_validate .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
        }), $("#k_daterangepicker_3_validate").daterangepicker({
            buttonClasses: "btn btn-sm",
            applyClass: "btn-primary",
            cancelClass: "btn-secondary"
        }, function(a, t, e) {
            $("#k_daterangepicker_3_validate .form-control").val(a.format("YYYY-MM-DD") + " / " + t.format("YYYY-MM-DD"))
        })
    }
};
jQuery(document).ready(function() {
    KBootstrapDaterangepicker.init()
});