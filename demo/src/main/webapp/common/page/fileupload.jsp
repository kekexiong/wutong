<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal fade" id="b_q_w" tabindex="-1" data-backdrop="static"
	data-width="640px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="ddTitle"></h4>
	</div>
	<div class="modal-body">
		<div class="portlet-body form">
			<form class="form-horizontal">
				<div class="form-body">
					<div class="row norow">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="form-group">
								<label for="span-medium-2"
									class="control-label col-md-1 text-right"><font
									color="red">*</font></label> <label class="checkbox-inline"> <input
									type="file" name="" b_q_f" id="b_q_f" checked aria-label="...">
								</label>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="row norow">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div id='dderror'></div>
						</div>
					</div>
				</div>
				<div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12" style="text-align: center;">
									<button type="button" id="b_q_o" class="btn btn-success">
										<i class="fa fa-save"></i> 确认
									</button>
									<button type="button" id="b_q_c" class="btn red">
										<i class="fa fa-share"></i> 取消
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>