/**
 *  util.js
 *  공통 사용 util 함수
 *  2018.12.01 최상일
 */

var util;
if(util == null) util = {};

/*
 * null 체크
 */
util.isNull = function(value){ 
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true 
	}else{ 
		return false 
	} 
};
