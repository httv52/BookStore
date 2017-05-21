// 创建request对象
function createXMLHttpRequest() {
	try {
		return new XMLHttpRequest();//大多数浏览器
	}catch(e){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");  //IE 6.0
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");  //IE 5.5
			}catch(e){
				alert("浏览器不支持");
				throw e;
			}
		}
	}
}

/*
 * option对象有如下属性
 */
 		/*请求方式*/method, 
		/*请求的url*/ url, 
		/*是否异步*/asyn, 
		/*请求体*/params, 
		/*回调方法*/callback,
		/*服务器响应数据转换成什么类型*/type

function ajax(option){
	var xmlHttp = createXMLHttpRequest();
	if(!option.method){ //默认GET请求
		option.method = "GET";
	}
	if(option.asyn == undefined){
		option.asyn = true;
	}
	xmlHttp.open(option.method, option.url,option.asyn);
	
	if("POST" == option.method){
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	}
	xmlHttp.send(option.params);

	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState==4&&xmlHttp.status==200){
			var data;
			if(!option.type){ //默认text
				data = xmlHttp.responseText;
			}else if("xml"==option.type){
				data = xmlHttp.responseXML;
			}else if("text"==option.type){
				data = xmlHttp.responseText;
			}else if("json"==option.type){
				var text = xmlHttp.responseText;
				data = eval("("+text+")");
			}

			// 调用回调方法
			option.callback(data);
		}
	};

};