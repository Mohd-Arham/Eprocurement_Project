"use strict";
var DatatablesExtensionsKeytable = function() {

	var initTable1 = function() {
		// begin first table
		var table = $('#k_table_1').DataTable({
			responsive: true,
			select: true,
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
					targets: 8,
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
					targets: 9,
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

	var initTable2 = function() {
		// begin first table
		var table = $('#m_table_2').DataTable({
			responsive: true,
			select: {
				style: 'multi',
				selector: 'td:first-child .k-checkable',
			},
			headerCallback: function(thead, data, start, end, display) {
				thead.getElementsByTagName('th')[0].innerHTML = `
                    <label class="k-checkbox k-checkbox--single k-checkbox--solid k-checkbox--brand">
                        <input type="checkbox" value="" class="k-group-checkable">
                        <span></span>
                    </label>`;
			},
			columnDefs: [
				{
					targets: 0,
					orderable: false,
					render: function(data, type, full, meta) {
						return `
                        <label class="k-checkbox k-checkbox--single k-checkbox--solid k-checkbox--brand">
                            <input type="checkbox" value="" class="k-checkable">
                            <span></span>
                        </label>`;
					},
				},
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
					targets: 8,
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
					targets: 9,
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

		table.on('change', '.k-group-checkable', function() {
			var set = $(this).closest('table').find('td:first-child .k-checkable');
			var checked = $(this).is(':checked');

			$(set).each(function() {
				if (checked) {
					$(this).prop('checked', true);
					table.rows($(this).closest('tr')).select();
				}
				else {
					$(this).prop('checked', false);
					table.rows($(this).closest('tr')).deselect();
				}
			});
		});
	};

	return {

		//main function to initiate the module
		init: function() {
			initTable1();
			initTable2();
		},

	};

}();

jQuery(document).ready(function() {
	DatatablesExtensionsKeytable.init();
});