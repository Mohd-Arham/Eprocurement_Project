"use strict";
var DatatablesSearchOptionsAdvancedSearch = function() {

	$.fn.dataTable.Api.register('column().title()', function() {
		return $(this.header()).text().trim();
	});

	var initTable1 = function() {
		// begin first table
		var table = $('#k_table_1').DataTable({
			responsive: true,
			//== Pagination settings
			dom: `<'row'<'col-sm-12'tr>>
			<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7 dataTables_pager'lp>>`,
			// read more: https://datatables.net/examples/basic_init/dom.html

			lengthMenu: [5, 10, 25, 50],

			pageLength: 10,

			language: {
				'lengthMenu': 'Display _MENU_',
			},

			searchDelay: 500,
			processing: true,
			serverSide: true,
			ajax: {
				url: 'https://keenthemes.com/keen/themes/themes/keen/dist/preview/inc/api/datatables/demos/server.php',
				type: 'POST',
				data: {
					// parameters for custom backend script demo
					columnsDef: [
						'RecordID', 'OrderID', 'Country', 'ShipCity', 'CompanyAgent',
						'ShipDate', 'Status', 'Type', 'Actions',],
				},
			},
			columns: [
				{data: 'RecordID'},
				{data: 'OrderID'},
				{data: 'Country'},
				{data: 'ShipCity'},
				{data: 'CompanyAgent'},
				{data: 'ShipDate'},
				{data: 'Status'},
				{data: 'Type'},
				{data: 'Actions'},
			],

			initComplete: function() {
				this.api().columns().every(function() {
					var column = this;

					switch (column.title()) {
						case 'Country':
							column.data().unique().sort().each(function(d, j) {
								$('.k-input[data-col-index="2"]').append('<option value="' + d + '">' + d + '</option>');
							});
							break;

						case 'Status':
							var status = {
								1: {'title': 'Pending', 'class': 'k-badge--brand'},
								2: {'title': 'Delivered', 'class': ' k-badge--metal'},
								3: {'title': 'Canceled', 'class': ' k-badge--primary'},
								4: {'title': 'Success', 'class': ' k-badge--success'},
								5: {'title': 'Info', 'class': ' k-badge--info'},
								6: {'title': 'Danger', 'class': ' k-badge--danger'},
								7: {'title': 'Warning', 'class': ' k-badge--warning'},
							};
							column.data().unique().sort().each(function(d, j) {
								$('.k-input[data-col-index="6"]').append('<option value="' + d + '">' + status[d].title + '</option>');
							});
							break;

						case 'Type':
							var status = {
								1: {'title': 'Online', 'state': 'danger'},
								2: {'title': 'Retail', 'state': 'primary'},
								3: {'title': 'Direct', 'state': 'accent'},
							};
							column.data().unique().sort().each(function(d, j) {
								$('.k-input[data-col-index="7"]').append('<option value="' + d + '">' + status[d].title + '</option>');
							});
							break;
					}
				});
			},

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
					targets: 6,
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
					targets: 7,
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

		var filter = function() {
			var val = $.fn.dataTable.util.escapeRegex($(this).val());
			table.column($(this).data('col-index')).search(val ? val : '', false, false).draw();
		};

		var asdasd = function(value, index) {
			var val = $.fn.dataTable.util.escapeRegex(value);
			table.column(index).search(val ? val : '', false, true);
		};

		$('#m_search').on('click', function(e) {
			e.preventDefault();
			var params = {};
			$('.k-input').each(function() {
				var i = $(this).data('col-index');
				if (params[i]) {
					params[i] += '|' + $(this).val();
				}
				else {
					params[i] = $(this).val();
				}
			});
			$.each(params, function(i, val) {
				// apply search params to datatable
				table.column(i).search(val ? val : '', false, false);
			});
			table.table().draw();
		});

		$('#m_reset').on('click', function(e) {
			e.preventDefault();
			$('.k-input').each(function() {
				$(this).val('');
				table.column($(this).data('col-index')).search('', false, false);
			});
			table.table().draw();
		});

		$('#m_datepicker').datepicker({
			todayHighlight: true,
			templates: {
				leftArrow: '<i class="la la-angle-left"></i>',
				rightArrow: '<i class="la la-angle-right"></i>',
			},
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
	DatatablesSearchOptionsAdvancedSearch.init();
});