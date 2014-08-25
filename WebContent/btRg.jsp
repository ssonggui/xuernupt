<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="./img/logo.png">
    <title>学耳南邮--注册</title>
    
        <!-- Bootstrap core CSS -->
    <link href="bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.js"></script>
	<script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="js/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
	<script src="js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
	<script src="js/DateTimeMask.js" type="text/javascript"></script>
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"rg",submitOnce:true,
		onError:function(msg,obj,errorlist){
			$("#errorlist").empty();
			$.map(errorlist,function(msg){
				$("#errorlist").append("<li>" + msg + "</li>");
			});
			//alert(msg);
		},
		ajaxPrompt : '有数据正在异步验证，请稍等...'
	});


	$("#name").formValidator({onShow:"请输入账户名",onFocus:"用户名至少5个字符,最多18个字符",onCorrect:"该账户名可注册"}).inputValidator({min:5,max:18,onError:"你输入的账户名非法,请确认"})//.regexValidator({regExp:"username",dataType:"enum",onError:"用户名格式不正确"})	.ajaxValidator({
	.ajaxValidator({
	type : "post",
	dataType : "json",
	async : true,
	data : $("#name").val(),
	url : "<%=request.getContextPath()%>/check",
	success : function(data){
        if( data.name == "1" ) return true;
		return "该用户名已存在，请更换用户名";
	},
	
	error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
	onError : "该用户名不可用，请更换用户名",
	onWait : "正在对用户名进行合法性校验，请稍候..."
	});
	
	$("#passwd").formValidator({onShow:"请输入密码",onFocus:"至少6个长度",onCorrect:"密码合法"}).inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"});
	$("#passwd2").formValidator({onShow:"输再次输入密码",onFocus:"至少6个长度",onCorrect:"密码一致"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"}).compareValidator({desID:"passwd",operateor:"=",onError:"2次密码不一致,请确认"});
	$("#idcard").formValidator({ajax:true,onShow:"请输入15或18位的身份证",onFocus:"输入15或18位的身份证",onCorrect:"输入正确"}).functionValidator({fun:isCardID});
	$("#email").formValidator({onShow:"请输入邮箱",onFocus:"邮箱6-100个字符,输入正确了才能离开焦点",onCorrect:"恭喜你,你输对了",defaultValue:"@"}).inputValidator({min:6,max:100,onError:"你输入的邮箱长度非法,请确认"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"你输入的邮箱格式不正确"});
	$("#telephone").formValidator({empty:true,onShow:"请输入你的手机或电话，可以为空哦",onFocus:"格式例如：0577-88888888或11位手机号码",onCorrect:"谢谢你的合作",onEmpty:"你真的不想留手机或电话了吗？"}).regexValidator({regExp:["tel","mobile"],dataType:"enum",onError:"你输入的手机或电话格式不正确"});

});
	
</script>    

	
	
</head>


<body class="home">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">


        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=request.getContextPath()%>/"><div><img width="15" height="15" src="./img/logo.png" alt="logo" class="img-rounded">XUERNUPT</div></a>         
        </div>
        <div class="navbar-collapse collapse">
        	<ul class="nav navbar-nav">
        		<li><a href="<%=request.getContextPath()%>/course">课程互动</a></li>
        		<li><a href="<%=request.getContextPath()%>/bfg">凤逑凰</a></li>
        		<li><a href="<%=request.getContextPath()%>/WeChat">微信</a></li>
        		<li><a href="<%=request.getContextPath()%>/about">关于</a></li>
        	</ul>


        </div><!--/.navbar-collapse -->
      </div>
    </nav>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<p><h2>注册您的账户</h2></p>
				<form role="form" action="<%=request.getContextPath()%>/rgover" method="post" id="rg" name="rg">
					<div class="form-group">
						<label for="name" for="name">账户</label>							
						<input type="text" class="form-control" name="name" id="name" placeholder="输入帐户名" />															
						<span id="nameTip"></span>
						<label for="name">密码</label>							
						<input type="password" class="form-control" name="passwd" id="passwd" placeholder="密码" />															
						<span id="passwdTip"></span>						
						<label for="name">确认密码</label>							
						<input type="password" class="form-control" name="passwd2" id="passwd2" placeholder="确认密码" />															
						<span id="passwd2Tip"></span>						
						<label for="name">邮箱</label>							
						<input type="text" class="form-control" name="email" id="email" placeholder="输入邮箱" />															
						<span id="emailTip"></span>						
						<label for="name">身份证</label>							
						<input type="text" class="form-control" name="idcard" id="idcard" placeholder="输入身份证" />															
						<span id="idcardTip"></span>						
						<label for="name">手机</label>							
						<input type="text" class="form-control" name="telephone" id="telephone" placeholder="输入手机号" />															
						<span id="telephoneTip"></span>						
						<div>
							<button type="submit" class="btn btn-info">注册</button>
							<a href="<%=request.getContextPath()%>/login" class=" pull-right">已有账户?请登录</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<footer>
        <p>&copy; xuernupt 2014</p>
    </footer>
</body>
</html>