/**
 * 
 */
jQuery.extend(jQuery.validator.messages, {
	required : "该字段为必填字段",
	remote : "请修正该字段",
	email : "请输入正确格式的电子邮件",
	url : "请输入合法的网址",
	date : "请输入合法的日期",
	dateISO : "请输入合法的日期 (ISO).",
	number : "请输入合法的数字",
	digits : "只能输入数字",
	creditcard : "请输入合法的信用卡号",
	equalTo : "请再次输入相同的值",
	accept : "请输入拥有合法后缀名的字符串",
	maxlength : jQuery.validator.format("超出出大长度 {0} "),
	minlength : jQuery.validator.format("小于最小长度 {0} "),
	rangelength : jQuery.validator.format("超出允许长度范围 {0}~ {1} "),
	range : jQuery.validator.format("超出允许的范围 {0} ~ {1}"),
	max : jQuery.validator.format("超出最大值{0} "),
	min : jQuery.validator.format("小于最小值{0} ")
});

jQuery.validator.addMethod("maxDigitLength",function(value, element,maxLength){
	debugger
    if(!value){
    	return true;
    }
    var arr = (''+value).split("\.");
    var digits = arr.length==1?'':arr[1];
    return digits.length<=maxLength;
},"小数点后不能超过{0}位!");  