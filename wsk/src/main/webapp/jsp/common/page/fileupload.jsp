<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="modal fade" id="importOpenWin" tabindex="-1" role="dialog" data-backdrop="static" data-height="200px" data-width="500px" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="Select_title">文件</h4>
	</div>
	<div class="modal-body">
		<div class="portlet-body form">
			<div class="form-body">
				<div class="row norow">
					<div class="panel panel-primary">
						<form action="" class="form-horizontal" id="importOpenWinform" enctype="multipart/form-data">
							<div class="panel-body">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="form-group">
										<label class="control-label col-md-3 text-right">请选择文件:</label>
										<div class="col-md-8 paddingnone">
											<input id="importFile" name="file" type="file" class="file" accept=".xlsx"> <input type="hidden" id="type" name="type">
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-12" style="text-align: center;">
													<button type="button" id="importOpenform_save_btn" class="btn btn-success">
														<i class="fa fa-save"></i> 确认
													</button>
													<button type="button" id="importOpenform_cancel_btn" class="btn red">
														<i class="fa fa-refresh"></i> 关闭
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="ResultWin" tabindex="-1" role="dialog" data-backdrop="static" data-height="500px" data-width="750px" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="Resulttitle">批量导入操作结果</h4>
	</div>
	<div class="modal-body">
		<div class="portlet-body form">
			<div class="form-body">
				<div class="row norow">
					<div class="panel panel-primary">
						<div class="row norow">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h4 class="panel-title" id="importResult"></h4>
								</div>
								<input type="hidden" name="errorCount" id="errorCount" value="" />
								<div class="portlet-body wheel height-auto">
									<table class="table table-striped table-bordered table-hover table-checkable order-column" id="importResultPanel">
										<thead style="font-size: 2px">
										<tr>
											<th>序号</th>
											<th>位置</th>
											<th>导入值</th>
                                            <th>失败编码</th>
											<th>失败原因</th>
										</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-12" style="text-align: center;">
											<button type="button" id="errorImExcel" class="btn red">
												<i class="fa fa-share"></i> 导出excel
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>