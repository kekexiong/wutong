var dtable;//表格对象变量

$.extend(true, $.fn.dataTable.defaults, {
    "dom": "<'row'<'table-scrollable't><'row'<'col-md-2 col-sm-2'l><'col-md-4 col-sm-4'i><'col-md-6 col-sm-6'p>>", // default layout with horizobtal scrollable datatable
    //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // datatable layout without  horizobtal scroll(used when bootstrap dropdowns used in the datatable cells)
    "language": {
        "lengthMenu": " _MENU_ records ",
        "paginate": {
            "previous": 'Prev',
            "next": 'Next',
            "page": "页数",
            "pageOf": "共计"
        }
    },
    "pagingType": "bootstrap_number"
});
var sxpDatatable = function() {
    var e = function() {
        var e = $("table.table");
        dtable = e.dataTable({
        	"paging" : false,
    		"info" : false,
    		"searching" : false,
    		"ordering": true, //排序功能
            language: {
                aria: {
                    sortAscending: ": 升序",
                    sortDescending: ": 降序"
                },
                emptyTable: "没有数据。",
                info: "显示第 _PAGE_ 页，共 _PAGES_ 页，一共 _TOTAL_ 条记录",
                infoEmpty: "没有数据",
                infoFiltered: "(filtered1 from _MAX_ total records)",
                lengthMenu: "显示 _MENU_",
                search: "查找:",
                zeroRecords: "没有找到匹配数据",
                paginate: {
                    previous: "上页",
                    next: "下页",
                    last: "尾页",
                    first: "首页"
                }
            },
            bStateSave: !0,
            columnDefs: [{
                targets: 0,
                orderable: !1,
                searchable: !1
            }],
            //lengthMenu: pageLengthMenu,
            //pageLength: limit,
            //pagingType: "bootstrap_full_number",
            columnDefs: [{
                orderable: !1,
                targets: [0]
            },
            {
                searchable: !1,
                targets: [0]
            }],
            order: [[1, "asc"]]
        });
        e.find(".group-checkable").change(function() {
            var e = jQuery(this).attr("data-set"),
            a = jQuery(this).is(":checked");
            jQuery(e).each(function() {
                a ? ($(this).prop("checked", !0), $(this).parents("tr").addClass("active")) : ($(this).prop("checked", !1), $(this).parents("tr").removeClass("active"))
            })//,
            //jQuery.uniform.update(e)
        }),
        e.on("change", "tbody tr .checkboxes",
        function() {
            $(this).parents("tr").toggleClass("active")
        })
    };
    return {
        init: function() {
            jQuery().dataTable && (e())
        }
    }
} ();
App.isAngularJsApp() === !1 && jQuery(document).ready(function() {
    sxpDatatable.init();
});
