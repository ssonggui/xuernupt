var xmlHttp;//声明xmlHttp对象
//实例化xmlHttpRequest对象
function createXMLHttpRequest() {
	//表示当前浏览器不是ie,如ns,firefox
	if(window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}
//input失去焦点事件onblur（），调用这个js方法验证
function validate(field) {
	if (trim(field.value).length != 0) {
		//创建XMLHttpRequest
		createXMLHttpRequest();
		//每次请求的url地址不同，利用时间产生不同url地址，可以防止缓冲造成问题
		var url = "user_validate.jsp?userId=" + trim(field.value) + "×tamp=" + new Date().getTime();
		xmlHttp.open("GET", url, true);
		//方法地址，处理完成后自动调用，回调
		xmlHttp.onreadystatechange=function() { //匿名函数
			if(xmlHttp.readyState == 4) { //Ajax引擎初始化成功
				if (xmlHttp.status == 200) { //http协议成功
					document.getElementById("userIdSpan").innerHTML = "<font color='red'>" + xmlHttp.responseText + "</font>";
				}else {
					alert("请求失败，错误码=" + xmlHttp.status);
				}
			}
		};
		//将参数发送到Ajax引擎
		xmlHttp.send(null);
	}else {
		document.getElementById("userIdSpan").innerHTML = "";
	}
}
