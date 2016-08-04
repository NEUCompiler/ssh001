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
				margin-top: 0px;
				border-color: blue;
				margin-top: 100px;
			}

		</style>
		
		<script>
		function test(){
				
				var am=$("#amount").val();	
				var ty=$("#type").val();
				var ti=$("#time").val();	
				var ex=$("#exectlytime").val();
				if(am==""||ex==""){
					alert("贷款金额和贷款时间不能为空");
					return;
				}
				var url="<%=path%>/getLoan"; 
				$.ajax({ 
					type:'post', 
					url:url, 
					data : {
						amount : am,type:ty,time:ti,exectlytime:ex,
					},
					dataType: 'json', 
					success:function(data){ 
				//		alert(JSON.stringify(data));
						//var d=eval('('+data.jsonstr+')');

						var aa = data.interest;
						var bb = data.backmoney;
						var cc = data.average;

						//var str=""+dd[0].backmoney;
						//$("#money").prop("innerHTML",dd);
						$("#interest").prop("innerHTML","利息：");
						$("#money").prop("innerHTML","还款金额：");
						$("#average").prop("innerHTML","平均每月还款金额:");
						
						$("#interest").append(aa);
						$("#money").append(bb);
						$("#average").append(cc);
					}	
				});
		}
		
			window.onload=function(){
		var ainput=document.getElementsByTagName("input");
		var amount=ainput[0];	
		var time=ainput[1];	
		var aP=document.getElementsByTagName("p");
		var amount_msg=aP[0];
		var time_msg=aP[1];
		amount.onfocus=function (){
			amount_msg.style.display="block";
			amount_msg.innerHTML="只能是整型数字";	
		}
		
		amount.onchange=function (){	
			var re_n=/[^\d]/g;					
			if(this.value==""){
				alert("存款金额不能为空");
				return;
			}else if(re_n.test(this.value)){
				alert("含有非法字符!");
				return;				
			}else{
				amount_msg.innerHTML="<strong style='color:blue'>OK!</strong>";	
			}
		}
		
		time.onfocus=function (){
			time_msg.style.display="block";
			time_msg.innerHTML="单位是：月份,只能是整型数字";	
		}
		
		time.onchange=function (){	
			var re_n=/[^\d]/g;					
			if(this.value==""){
				alert("存款时间不能为空");
				return;
			}else if(re_n.test(this.value)){
				alert("含有非法字符!");
				return;				
			}else{
				time_msg.innerHTML="<strong style='color:blue'>OK!</strong>";	
			}
		}		
			
	}
		
		</script>
  </head>
  
  <body>
  	 <div id="div1">
 				<h1>贷款计算器</h1>
  	 		<span style="color: blue;">贷款金额</span>
  			<input id="amount" name="amount" type="text"/>
  			<p></p>
	  		<span style="color: blue;margin-left: -90px;">贷款类型</span>
			<select id="type" name="type" >
	    			<option value="houseload">房贷</option>
	    			<option value="carload">车贷</option>
	    			<option value="load">生活贷款</option>
	    	</select>
	    	<br /><br />
	    	<span style="color: blue;margin-left: -90px;">贷款期限</span>
	    	<select id="time" name="time" >
	    			<option value="12">一年</option>
	    			<option value="60">五年</option>
	    			<option value="61">五年以上</option>
	    	</select> 
	    	<br><br>
	    	<span style="color: blue;">贷款时间</span>
	    	<input id="exectlytime" name="exectlytime" type="text"/>  <p></p>
	    	
	    	
	    	<input id="count" type="button" onclick="test()" value="计算" style="width: 80px;
			background:deepskyblue;"> <br>					
			<!--span style="color: red;">还款金额：${request.info}</span> -->
			<p id="interest" style="color: red;margin-left:-100px">利息：</p>	
			<p id="money" style="color: red;margin-left:-100px">还款金额：</p>	
			<p id="average" style="color: red;margin-left:-100px">平均每月还款金额：</p>	
	</div>
  </body>
</html>
