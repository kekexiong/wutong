/**
 * 
 */
var emptyOption = "<option></option>";
var selectedOption = "<option selected='selected'></option>";

// 分页默认隐藏
$("#pagination-bar").hide();

// 每页多少条
var limit = 0;
// 当前页
var page = 1;
// 起始条
var start = 0;
// 总页数
var toalPage;
// 数据列表缓存
var tableData;

var constTotalCount = 0;

// 分页
function pageing(opp) {
	$(window.top.document).scrollTop(0, 500);
	limit = $("#limit  option:selected").text();
	if (opp == 'pro') {
		if (page > 1) {
			page = page - 1;
			start = (page - 1) * limit;
		} else {
			bootbox.alert('已经是第一页');
			return;
		}
	} else if (opp == 'next') {
		if (page == toalPage) {
			bootbox.alert('已经是最后一页');
			return;
		}
		page = page + 1;
		start = (page - 1) * limit;
	} else if (opp == 'last') {
		if (page == toalPage) {
			return;
		}
		page = $("#toalPage").text();
		if (page > toalPage) {
			bootbox.alert('对不起没有你要跳转的页面');
			return;
		} else if (page < 1) {
			bootbox.alert('对不起没有你要跳转的页面');
			return;
		}
		start = (page - 1) * limit;
	} else {
		if (page == 1 && opp == 1) {
			return;
		}
		if (opp > toalPage) {
			bootbox.alert('对不起没有你要跳转的页面');
			return;
		} else if (opp < 1) {
			bootbox.alert('对不起没有你要跳转的页面');
			return;
		}
		page = opp * 1;
		start = (page - 1) * limit;
	}
	$('table > tbody').empty();
	// $("table tbody [id^='resutl_']").remove();
	reloadGrid();
}

// 全选列表数据
function checkAll($grid,checked) {
	$grid.find("tbody :checkbox").prop('checked', checked);
}

function onChange4PageSize(select) {
	limit = select.value;
	reloadGrid();
}
/**
 * 页面按钮权限
 * 
 * @param authorization
 */
function authorize(authorizations) {
	if(!authorizations||$.isEmptyObject({authorizations})){
		return ;
	}
	$.each(authorizations,function(authorization,id){
		if(!authorization||!id){
			return;
		}
		console.info(authorization+"~"+id+'~'+hasPermission(authorization));
		if (!hasPermission(authorization)) {
			$('#'+id).hide();
		}
		});
}

function fixPaginationApperance(){
	$("#pagination-bar").show();
    if (page == 1) {
        $("#pagination .prev a").css({'color': 'gray', 'cursor': 'not-allowed'});
    } else {
        $("#pagination .prev a").css({'color': '#23527c', 'cursor': 'pointer'});
    }
    if (page == toalPage) {
        $("#pagination .next a").css({'color': 'gray', 'cursor': 'not-allowed'});
    } else {
        $("#pagination .next a").css({'color': '#23527c', 'cursor': 'pointer'});
    }
}

/**
 * 获取勾选的数据
 * 
 * @param $grid
 * @returns
 */
function checkedRocords($grid){
	return $grid.find("tbody input:checked");
}

function freezeForm($form,$except){
	$except = !$except?'':$except;
	$form.find('input,textarea,select').not($except)
	.attr('readonly', true).attr("disabled","disabled");
}

function unfreezeForm($form,$except){
	$except = !$except?'':$except;
	$form.find('input,textarea,select').not($except)
	.removeAttr('readonly').removeAttr("disabled");
}

/**
 * 加载数据到指定的表单
 * 
 * @param $form
 * @param json
 * @returns
 */
function loadData($form,json){
    try{  
        for(var key in json){
        	var value = json[key]; 
        	var selector = "[name='"+key+"'],[name='"+key+"[]']";
            $form.find(selector).each(function(){
            	var tagName = $(this)[0].tagName;
            	tagName = tagName?tagName.toUpperCase():'INPUT';
                var type = $(this).attr('type');
                type = type?type.toLowerCase():'';
                console.info(key+':::'+tagName+':::'+type);
                if(tagName=='INPUT'){
                    if(type=='radio'){
                        $(this).attr('checked',$(this).val()==value);
                    }else if(type=='checkbox'){
                    	var arr = value.split(',');
                        for(var i =0;i<arr.length;i++){
                            if($(this).val()==arr[i]){
                                $(this).attr('checked',true);
                                break;
                            }
                        }
                    }else{
                        $(this).val(value);
                    }
                }else if( tagName=='TEXTAREA'){
                    $(this).val(value);
                }else if(tagName=='SELECT'){ 
                    $(this).selectpicker('val',value);
                }
            });
        } 
        $form.find('.datepicker').each(function(){ 
          	$(this).datepicker('update', $(this).val());
        });
    }catch(e){
    	bootbox.alert("加载表单："+e.message+",数据内容"+JSON.stringify(json ));
    }
}