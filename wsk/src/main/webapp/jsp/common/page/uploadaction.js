//导入按钮
$("#isImport_btn").on('click', function(){
    importOpen();
});
function importOpen(){
    $("#importOpenWinform")[0].reset();
    $("#importOpenWin").modal("show");
}
//导入弹出页面取消按钮
$("#importOpenform_cancel_btn").on('click', function(){
    $("#importOpenWin").modal('hide');
});
//导入弹出页面确定按钮
$("#importOpenform_save_btn").on('click', function () {
    var file = $("#importFile").val();
    if (file != null && $.trim(file) != '') {
        if (file.lastIndexOf('.') != -1) {
            var index = file.lastIndexOf(".");
            var ext = file.substring(index + 1, file.length);
            if (ext == "xlsx") {
                App.blockUI({target: "body", boxed: !0, message: "导入中，请稍后...", zIndex: 12000});
                $("#importOpenWinform").ajaxSubmit({
                    type: 'post',
                    url: importUrl,
                    dataType: "json",
                    success: function (data) {
                        if (data.msgCd == 'FILE0000') {
                            var type = $("#type").val();
                            $('#importResultPanel > tbody').empty();
                            var successCount = data.successCount;
                            var failureCount = data.failureCount;
                            $("#ResultWin").modal('show');
                            if (data.errorList == null) {
                                $("#errorCount").val("1");
                            }
                            if (data.hasError == true) {
                                $("#importResult").html(getInfo(successCount, failureCount, "条，失败信息及原因如下："));
                                $.each(data.errorList, function (index, obj) {
                                    var tr = $("<tr></tr>").append($("<td></td>").text(index + 1));
                                    tr.append($("<td></td>").text(obj.position));
                                    tr.append($("<td></td>").text(obj.importValue));
                                    tr.append($("<td></td>").text(obj.failReason));
                                    $("#importResultPanel > tbody").append(tr);
                                });
                            } else {
                                $("#importResult").html(getInfo(successCount, failureCount, "条，失败信息及原因如下："));
                            }
                        } else {
                            bootbox.alert("导入文件错误，原因：" + data.msgInfo);
                        }
                        reloadGrid();
                        $("#importOpenWin").modal('hide');
                    },
                    error: function (data) {
                        bootbox.alert("导入失败..." + data.msgInfo);
                    }
                });

            } else {
                bootbox.alert("文件格式不正确，请使用07版的excel!");
                return false;
            }

        } else {
            bootbox.alert("文件格式不正确，请使用07版的excel!");
            return false;
        }
    } else {
        bootbox.alert("文件格式不正确，请使用07版的excel!");
        return false;
    }
});
function getInfo(successCount, failureCount, msg) {
    var info = "<font>本次批量导入操作共成功" + successCount + "条，失败" + failureCount + msg;
    return info;
}