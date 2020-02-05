<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal fade" id="b_q_e_w" tabindex="-1" role="dialog"
	data-backdrop="static" data-width="60%" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="">请处理以下错误</h4>
	</div>
	<div class="modal-body">
		<div class="portlet-body wheel">
			<table
				class="table table-striped table-bordered table-hover table-checkable order-column"
				id="b_q_e_g">
				<thead>
					<tr>
						<th>序号</th>
						<th>商编</th>
						<th>错误信息</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align: center;">
				<div class="row">
					<div style="margin-left: 4%;" class=" col-md-11">
						<button type="button" class="btn btn-success"
							onclick="$('#b_q_e_w').modal('hide');">
							<i class="fa fa-sign-out"></i> 关闭
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>