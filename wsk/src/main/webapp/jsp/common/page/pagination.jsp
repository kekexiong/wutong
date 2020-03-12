<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<div class="row no-margin" id="pagination-bar">
    <div class="col-sm-4 left no-padding">
        <div class="inline fl">
            记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/ <span id="toalPage"></span>页 每页显示:
        </div>
        <div class="inline fl">
            <select id="limit" class=" form-control " onchange="onChange4PageSize(this)">
                <option value="10">10</option>
                <option value="20" selected="selected">20</option>
                <option value="30">30</option>
                <option value="50">50</option>
                <option value="75">75</option>
                <option value="100">100</option>
                <option value="200">200</option>
                <option value="500">500</option>
            </select>
        </div>
        <div class="inline fl">条</div>
    </div>

    <div class="col-sm-6 pull-right no-padding">
        <div id="pagination"
             class="dataTables_paginate paging_simple_numbers clearfix pull-right">
            <nobr>
                <ul class="pagination no-padding" style="float: left">
                    <li class="prev "><a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a></li>
                    <li class="prev "><a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a></li>
                    <li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
                    <li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
                </ul>
                <div class="input-group pull-right col-sm-2" style="float: left;">
                    <input min="1" class="form-control p" style="height: 31px; width: 80px;" type="number">
                    <a href="javascript:;" class="input-group-addon" onclick="javascript:pageing($('.p').val())"><i class="fa fa-mail-forward brown"></i></a>
                </div>
            </nobr>
        </div>
    </div>
</div>