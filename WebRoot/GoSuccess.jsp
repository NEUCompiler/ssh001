<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>中国建设银行 个人网上银行</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/JavaScript" src="jquery.js"></script>
	
			<style>
			#div1{
				text-align: center;
				margin-top: 0px;
				border-color: blue;
			}
			input{
				width: 200px;
				height: 30px;
				border:blue solid 2px;
				position:relative;
			}
		</style>
		<script type="text/javascript">
		function test1(username){
				var url = "<%=path%>/register2";	
				$.ajax({ 
					type:'post', 
					url:url, 
					data : {
						username:username,
					},
					dataType: 'json', 
					success:function(data){			
						var aa = data.remind;
						$("#remind1").prop("innerHTML", aa);	 
					}	
			});
		};

		window.onload=function (){
				var ainput=document.getElementsByTagName("input");
				
				var truename=ainput[0];
				var username=ainput[1];
				var identityid=ainput[2];
				var phone=ainput[3];
				var mail=ainput[4];
				var pwd=ainput[5];
				var pwd2=ainput[6];
				
				var aP=document.getElementsByTagName("p");
				var truename_msg=aP[0];
				var username_msg=aP[1];
				var identityid_msg=aP[2];
				var phone_msg=aP[3];
				var mail_msg=aP[4];
				var pwd_msg=aP[5];
				var pwd2_msg=aP[6];
				
				username.onfocus=function (){
					username_msg.style.display="block";
					username_msg.innerHTML="3-20个字符,(汉字字母均表示一个字符)";		
				}
				username.onblur=function (){
					var  re=/[^\w\u4e00-\u9fa5]/g;
					
					if(this.value==""){
						alert("用户名为空");
						return;
					}
					
					else if(re.test(this.value)){
						alert("含有非法字符！");
						return;
					}
					
					else if(this.value.length>20){
						alert("超过20个字符");
						return;
					}
					else if(this.value.length<3){
						alert("少于3个字符");
						return;
					}
					else{
						username_msg.innerHTML="<strong style='color:blue'>OK！</strong>";
					}
				}
				
				identityid.onfocus=function (){
					identityid_msg.style.display="block";
					identityid_msg.innerHTML="15位或者18位由数字和字符组成";		
				}
				identityid.onblur=function (){
					var re_n=/[^A-Za-z0-9]/g;
					if(this.value==""){
						alert("身份证号为空!"); 	
						return;					
					}
					else if(this.value.length!=18||this.value.length!=15){
						alert("身份证号位数不对！");
					}
					else if(re_n.test(this.value))
					{
						alert("含有非法字符!");
						return;
					}
					else{
						identityid_msg.innerHTML="<strong style='color:blue'>OK！</strong>";
					}	
				}
				
				phone.onfocus=function (){
					phone_msg.style.display="block";
					phone_msg.innerHTML="15位或者18位由数字和字符组成";		
				}
				phone.onblur=function (){
					var re_n=/[^\d]/g;
					if(this.value==""){
						alert("手机号号为空!"); 	
						return;					
					}
					else if(this.value.length!=11){
						alert("手机号位数不对！");
						return;
					}
					else if(re_n.test(this.value))
					{
						alert("含有非法字符!");
						return;
					}
					else{
						identityid_msg.innerHTML="<strong style='color:blue'>OK！</strong>";
					}	
				}
				
				
				mail.onfocus=function (){
					mail_msg.style.display="block";
					mail_msg.innerHTML="<strong style='color: blue;'>不超过20字符，例如：(eg.925781291@qq.com）</strong> "	
				}
				mail.onblur=function (){
					if(this.value==""){
						alert("邮箱为空");
						return;
					}else if(this.value.length>20){
						alert("邮箱超过二十字符");								
						return;	
					}else{
						mail_msg.innerHTML="<strong style='color: blue;'>OK</strong> "
					}
				}
				
				
				pwd.onfocus=function (){
					pwd_msg.style.display="block";
					pwd_msg.innerHTML="6-16个字符，字母数字或者符号的组合，不能单独使用字母数字或者符号"		
				}
				pwd.onkeyup=function(){
					if(this.value.length>5){
						pwd2.removeAttribute("disabled");
						pwd2_msg.style.display="block";
					}
					else{
						pwd2.setAttribute("disabled");
					}	
				}
				pwd.onblur=function(){
					var m=findStr(pwd.value,pwd.value[0]);
					var re_n=/[^\d]/g;
					var re_t=/[^a-zA-Z]/g;
					if(this.value==""){
						pwd_msg.innerHTML="不能为空";
					}
					else if(this.value.length==m){
						pwd_msg.innerHTML="字符不能都相同";
					}
					else if(this.value.length<6||this.value.length>26){
						pwd_msg.innerHTML="字符长度应为6——16";
					}
					else if(!re_n.test(this.value)){
						pwd_msg.innerHTML="不能全为数字";
					}
					
					else if(!re_t.test(this.value)){
						pwd_msg.innerHTML="不能全为字母";
					}
					else{
						pwd_msg.innerHTML="OK";
					}
				}
				pwd2.onblur=function (){
					if(this.value!=pwd.value){
						pwd2_msg.innerHTML="<i style='background-position: 0-39px;'>两次输入的密码不一致！！</i>";
					}
				}		
				
				
				
		}
	
		</script>
	
  </head>
  
  <body>
		<div id="div1">
			<!-- <form action="<%=path%>/register1" method="get"> -->
					
				真实姓名
				<input id="truename" name="truename" type="text">	<p></p>
				 用 户 名
				<input id="username" name="username" type="text" onchange="test1(this.value)">	<p id="remind1"></p>			
				身份证号
				<input id="identityid" name="identityid" type="text"><p></p>
				手 机 号
				<input id="phone" name="phone" type="text"> <p></p>
				电子邮箱 
				<input id="mail" name="mail" type="text"> <p></p>
				<div style="margin-left: -140px;">
					性    别
					<select id="sex" name="sex">
		    			<option value="男">男</option>
		    			<option value="女">女</option>
	    			</select>
    			</div>
					<br><br>
			              安全密码
			    <input id="userpassword" name="userpassword" type="password"> <p></p>
			              密码验证
			    <input id="userpassword1" name="userpassword1" type="password"><p></p>  <br>
			    
				<input id="submit" type="button" value="注册" style="width: 80px;
				background:deepskyblue;"> <br>

				<!-- </form>   ${request.info}
				-->	
					
		</div>
		
  </body>
</html>