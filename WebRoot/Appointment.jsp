<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中国建设银行 个人网上银行</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

	<style>
			#div1{
				text-align: center;
				margin-top: 100px;
				border-color: blue;
			}
			input{
				width: 200px;
				height: 30px;
				border:blue solid 2px;
			}
		</style>
		<script type="text/javascript">
			window.onload=function (){
				var ainput=document.getElementsByTagName("input");
				var money=ainput[0];
	//			var date=ainput[1];
				var website=ainput[1];
				var aP=document.getElementsByTagName("p");
				var money_msg=aP[0];
	//			var date_msg=aP[1];
				var website_msg=aP[1];
		
     			website.onfocus=function (){
					website_msg.style.display="block";
					website_msg.innerHTML="请输入网点号";		
				}             
					
				website.onchange=function (){	
					var re_n=/[^\d]/g;					
					if(this.value==""){
						alert("网点号不能为空");
						return;
					}else if(re_n.test(this.value))
					{
						alert("网点格式有误!");
						return;
					}
					else{
						website_msg.innerHTML="<strong style='color:blue'>OK!</strong>";	
					}
				}				
			}
			
		</script>

  </head>
  
  <body>
		
	<div id="div1">
		<form action="<%=path%>/getMoney" method="get">		
		  取款金额(元)<br>   
		<input name="money" type="text"> <p></p>	
		<!--  
		取款日期<br>
		<input name="date" type="date"> <p></p>
		-->
		
		网点<br>
		<input name="website" type="text"> <p></p>
		<input type="submit" value="提交" style="width: 80px;
			background:deepskyblue;"> <br>
		</form>
	</div>	
  </body>
</html>
