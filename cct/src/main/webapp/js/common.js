/**
	字符串转javascript对象报语法错误时使用该函数
*/
function evalproxy(str){
	return eval('('+str+')');		
}