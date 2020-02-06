var $b_q_win = $("#" + config.win);
var $b_q_e_win = $('#' + config.errorWin);
var $b_q_e_grid = $('#' + config.errorGrid);
//批量查询操作
$("#" + config.uploadButton).on('click', function () {
    $("#contentDiv").hide();
    $("#actDiv").hide();
    $("#ddTitle").text(config.winTitle || '选择上传文件');
    $b_q_win.modal('show');
});

$("#b_q_c").off('click').on('click', function () {
    $b_q_win.modal('hide');
});

$("#b_q_o").off('click').on('click', function () {
    var $b_q_f = $("#b_q_f");
    var filepath = $b_q_f.val();
    if (!filepath) {
        bootbox.alert("请选择上传文件!");
        return;
    }
    var fileArr = filepath.split("\\");
    var fileTArr = fileArr[fileArr.length - 1].toLowerCase().split(".");
    if ("xlsx" != fileTArr[fileTArr.length - 1]) {
        bootbox.alert("上传文件必须为07版Excel文件(后缀.xlsx)!");
        return;
    }
    $("#dderror").html("");
    bootbox.confirm("确定导入Excel文件吗", function (data) {
        if (data) {
            var fileObj = document.getElementById("b_q_f").files[0]; // 获取文件对象
            var form = new FormData();
            form.append("file", fileObj);
            $b_q_win.modal('hide');
            App.blockUI({target: "body", boxed: !0, message: '请求处理中......'});
            $.ajax({
                url: config.uploadUrl,
                type: "post", data: form, processData: false, contentType: false,
                success: function (result) {
                    result = jQuery.parseJSON(result);
                    if (!result.success) {
                        if (result.hasError) {
                            var errors = result.errors || [];
                            var errorTip = '';
                            for (var index in errors) {
                                errorTip += errors[index].error;
                            }
                            var errorTitle = "<font color='red'>数据导入失败</font><hr>";
                            bootbox.confirm(errorTitle + errorTip + '需要重新选择文件后上传吗?', function (y) {
                                if (y) {
                                    $b_q_win.modal('show');
                                } else {
                                    $b_q_f.val('');
                                }
                            });
                            //bootbox.alert("数据导入失败" + errorTip + " 请检查数据后重试!");
                            //$b_q_win.modal('show');
                            //、$("#dderror").innerText = "数据导入失败" + errorTip + " 请检查数据后重试!";
                            //$("#dderror").html( "数据导入失败" + errorTip + " 请检查数据后重试!");
                        } else {
                            $b_q_f.val('');
                            var inValidItems = result.inValidItems || [];
                            var $dataTable = $b_q_e_grid.DataTable();
                        	$dataTable.clear().draw();
                            var rows = [];
                            for (var i = 0; i < inValidItems.length; i++) {
                                var obj = inValidItems[i];
                                var current = [i + 1+''];
                                current.push(obj.key || '');
                                current.push(obj.error || '');
                                //$dataTable.row.add(current).draw();
                                rows.push(current);
                            }
                            $dataTable.rows.add(rows).order([0, 'asc']).draw();
                            $b_q_e_win.modal("show");
                        }
                    } else {
                        $b_q_f.val('');
                        config.successCallback();
                    }
                },
                error: function (e) {
                    bootbox.alert("导入错误！！");
                }
            });
        }
    })
});