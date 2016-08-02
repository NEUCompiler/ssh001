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
	
	<script type="text/JavaScript" src="jquery.js"></script>
	
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
				position:relative;
			}
		</style>
	<script>		
		function test(){
//				alert("存款金额和存款时间不能为空");	
				var am=$("#amount").val();	
				var ex=$("#exectlytime").val();
				if(am==""||ex==""){
					alert("存款金额和存款时间不能为空");
					return;
				}
				var url="<%=path%>/currentdeposit"; 
				$.ajax({ 

					type:'post', 
					url:url, 
					data : {
						amount : am,exectlytime:ex,
					},
					dataType: 'json', 
					success:function(data){ 
				//		alert(JSON.stringify(data));
						//var d=eval('('+data.jsonstr+')');
						var aa = data.interest;
						var bb = data.revenue;
						var cc = data.total;
						var dd = data.average;
						//var str=""+dd[0].backmoney;
						//$("#money").prop("innerHTML",dd);
						$("#interest").prop("innerHTML","利息(元):");
						$("#revenue").prop("innerHTML","利息税(元)：");
						$("#total").prop("innerHTML","总额(元)：");
						$("#average").prop("innerHTML","平均每月应还金额(元):");
						$("#interest").append(aa);
						$("#revenue").append(bb);
						$("#total").append(cc);
						$("#average").append(dd);
					}	
				});
		}
	</script>		

  </head>
  
  <body>
    <div id="div1">
    <h1>活期存款计算器</h1>
  		 <span style="color: blue;">存款金额</span>
  		<input id="amount" name="amount" type="text"/>
  		<br><br />
  	
    	<span style="color: blue;">存款时间</span>
  		<input id="exectlytime" name="exectlytime" type="text"/>
  		<br><br />  	
  			  	
    	<input id="count" type="button" onclick="test()" value="计算" style="width: 80px;
			background:deepskyblue;"> <br>
			
   		 <p id="interest" style="margin-left: -200px; color: blue;">利息:</p>
		 <p id="revenue" style="margin-left: -180px; color: blue;">利息税：</p>
		 <p id="total" style="margin-left: -200px; color: blue;">总额：</p>
    </div>
  </body>
</html>
