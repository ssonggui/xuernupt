var xmlHttp;//����xmlHttp����
//ʵ����xmlHttpRequest����
function createXMLHttpRequest() {
	//��ʾ��ǰ���������ie,��ns,firefox
	if(window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}
//inputʧȥ�����¼�onblur�������������js������֤
function validate(field) {
	if (trim(field.value).length != 0) {
		//����XMLHttpRequest
		createXMLHttpRequest();
		//ÿ�������url��ַ��ͬ������ʱ�������ͬurl��ַ�����Է�ֹ�����������
		var url = "user_validate.jsp?userId=" + trim(field.value) + "��tamp=" + new Date().getTime();
		xmlHttp.open("GET", url, true);
		//������ַ��������ɺ��Զ����ã��ص�
		xmlHttp.onreadystatechange=function() { //��������
			if(xmlHttp.readyState == 4) { //Ajax�����ʼ���ɹ�
				if (xmlHttp.status == 200) { //httpЭ��ɹ�
					document.getElementById("userIdSpan").innerHTML = "<font color='red'>" + xmlHttp.responseText + "</font>";
				}else {
					alert("����ʧ�ܣ�������=" + xmlHttp.status);
				}
			}
		};
		//���������͵�Ajax����
		xmlHttp.send(null);
	}else {
		document.getElementById("userIdSpan").innerHTML = "";
	}
}
