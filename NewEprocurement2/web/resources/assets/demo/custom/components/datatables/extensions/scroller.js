"use strict";
var DatatablesExtensionsScroller = function() {

	var initTable1 = function() {
		var table = $('#k_table_1');

		// begin first table
		table.DataTable({
			responsive: true,
			ajax: 'https://keenthemes.com/keen/themes/themes/keen/dist/preview/inc/api/datatables/demos/server.php',
			deferRender: true,
			scrollY: '500px',
			scrollCollapse: true,
			scroller: true,
			columns: [
				{data: 'RecordID', visible: false},
				{data: 'OrderID'},
				{data: 'ShipCity'},
				{data: 'ShipAddress'},
				{data: 'CompanyAgent'},
				{data: 'CompanyName'},
				{data: 'ShipDate'},
				{data: 'Status'},
				{data: 'Type'},
				{data: 'Actions'},
			],
			columnDefs: [
				{
					targets: -1,
					title: 'Actions',
					orderable: false,
					render: function(data, type, full, meta) {
						return `
                        <span class="dropdown">
                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="true">
                              <i class="la la-ellipsis-h"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#"><i class="la la-edit"></i> Edit Details</a>
                                <a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>
                                <a class="dropdown-item" href="#"><i class="la la-print"></i> Generate Report</a>
                            </div>
                        </span>
                        <a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View">
                          <i class="la la-edit"></i>
                        </a>`;
					},
				},
				{
					targets: -3,
					render: function(data, type, full, meta) {
						var status = {
							1: {'title': 'Pending', 'class': 'k-badge--brand'},
							2: {'title': 'Delivered', 'class': ' k-badge--metal'},
							3: {'title': 'Canceled', 'class': ' k-badge--primary'},
							4: {'title': 'Success', 'class': ' k-badge--success'},
							5: {'title': 'Info', 'class': ' k-badge--info'},
							6: {'title': 'Danger', 'class': ' k-badge--danger'},
							7: {'title': 'Warning', 'class': ' k-badge--warning'},
						};
						if (typeof status[data] === 'undefined') {
							return data;
						}
						return '<span class="k-badge ' + status[data].class + ' k-badge--inline k-badge--pill">' + status[data].title + '</span>';
					},
				},
				{
					targets: -2,
					render: function(data, type, full, meta) {
						var status = {
							1: {'title': 'Online', 'state': 'danger'},
							2: {'title': 'Retail', 'state': 'primary'},
							3: {'title': 'Direct', 'state': 'accent'},
						};
						if (typeof status[data] === 'undefined') {
							return data;
						}
						return '<span class="k-badge k-badge--' + status[data].state + ' k-badge--dot"></span>&nbsp;' +
							'<span class="k-font-bold k-font-' + status[data].state + '">' + status[data].title + '</span>';
					},
				},
			],
		});
	};

	return {

		//main function to initiate the module
		init: function() {
			initTable1();
		},

	};

}();

jQuery(document).ready(function() {
	DatatablesExtensionsScroller.init();
});