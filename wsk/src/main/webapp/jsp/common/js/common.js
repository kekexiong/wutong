String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
 var o = {
     "M+": this.getMonth() + 1, //月份 
     "d+": this.getDate(), //日 
     "h+": this.getHours(), //小时 
     "m+": this.getMinutes(), //分 
     "s+": this.getSeconds(), //秒 
     "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     "S": this.getMilliseconds() //毫秒 
 };
 if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 for (var k in o)
 if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 return fmt;
}



/** SXF 全局对象 **/
if(!window["SXF"]) window["SXF"] = {};

/** 对象元素复制 **/
SXF.apply = function(o, c, x){
    if(x){
        M.apply(o, x);
    }
    if(o && c && typeof c == 'object'){
        for(var p in c){
            o[p] = c[p];
        }
    }
    return o;
};
SXF.apply(SXF, {
	mMax:9999999999, //金额最大值
	mMin:0, 	     //金额的最小值
	/** 数字类型数据小数位数的截取（保留几位小数）**/
	subNum:function (num,decim){
		if(typeof(decim)=='undefined'){
			decim=2;
		}
		var zhengVal,tempVal,numDl;
		try { 
			zhengVal=num.toString().split(".")[0]
			 tempVal=num.toString().split(".")[1];
			 numDl = num.toString().split(".")[1].length;  
			if(numDl>decim){
				tempVal=tempVal.substring(0, decim);
			}
		} catch(e){ 
		      tempVal ='@'; 
		      numDl=0
		} 
		var newVal=zhengVal;
		if(tempVal!='@'){
			newVal+="."+tempVal;
		}
		var   reg   =/^-?\d+$/ ;　　　//整数      
	    if(!reg.test(zhengVal) && zhengVal!='-'){
	    	 newVal=0;
	    }
		return newVal;
	},
	/** Number类型数据相加**/
	add:function(num1,num2){   
		var baseNum,baseNum1,baseNum2;  
		if(num1=='-'||num1=='-.'||num1=='-0'||num1=='-0.'){
			num1=0;
		}
		if(num2=='-'||num2=='-.'||num2=='-0'||num2=='-0.'){
			num2=0;
		}
		try {     
			baseNum1 = num1.toString().split(".")[1].length;  
		} catch(e){     
				baseNum1 = 0;  
		}   
		try {     
			baseNum2 = num2.toString().split(".")[1].length;  
		} catch(e){     
			baseNum2 = 0;  
		}   
		baseNum = Math.pow(10,Math.max(baseNum1,baseNum2));   
		var r= (num1 * baseNum + num2 * baseNum) / baseNum; 
		return r;
	},

	/**
	 * Number类型相减
	 */
	sub:function(num1,num2){ 
		var baseNum,baseNum1,baseNum2; 
		var precision;//精度   
		if(num1=='-'||num1=='-.'||num1=='-0'||num1=='-0.'){
			num1=0;
		}
		if(num2=='-'||num2=='-.'||num2=='-0'||num2=='-0.'){
			num2=0;
		}
		try { 
			baseNum1 = num1.toString().split(".")[1].length;     
		} catch(e){ 
			baseNum1 = 0;     
		} 
	    try { 
		   baseNum2 = num2.toString().split(".")[1].length;  
		} catch(e){ 
		      baseNum2 = 0;     
		} 
	    baseNum = Math.pow(10,Math.max(baseNum1,baseNum2));    
	    precision = (baseNum1>=baseNum2)?baseNum1:baseNum2;     
	   var r= ((num1*baseNum-num2*baseNum)/baseNum);
	   return r; 
	},
	
	/**
	 * 日期转换
	 */
	dateTransful:function(val){ 
		var dt=val.substring(0,4)+"-"+val.substring(4,6)+"-"+val.substring(6,8);
		return dt;
	}

})