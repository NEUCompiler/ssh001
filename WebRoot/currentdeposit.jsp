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
				if(am==""){
					alert("存款金额和存款时间不能为空");
					return;
				}
				
				var ainput=document.getElementsByTagName("input");
				var date1=ainput[1];
				var date2=ainput[2];
				var intDays=DateDiff(date1.value,date2.value);
		
				function DateDiff(sDate1,sDate2){ 
					var arrDate,objDate1,objDate2,intDays;
					arrDate=sDate1.split("-");
					objDate1=new Date(arrDate[1]+'-'+arrDate[2]+'-'+arrDate[0]);//转换为月-日-年格式 
					arrDate=sDate2.split("-");
					objDate2=new Date(arrDate[1] + '-'+arrDate[2]+'-'+arrDate[0]);
					intDays=parseInt((Math.ceil((Math.abs(objDate1-objDate2)/1000/60/60/24)/30)));
					return intDays;
				}

				
				var url="<%=path%>/currentdeposit"; 
				$.ajax({ 

					type:'post', 
					url:url, 
					data : {
						amount : am,intDays:intDays,
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
	window.onload=function(){
		var ainput=document.getElementsByTagName("input");
		var amount=ainput[0];	
		var aP=document.getElementsByTagName("p");
		var amount_msg=aP[0];
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
		
	}
	
	
	</script>		

  </head>
  
  <body>
    <div id="div1">
    <h1>活期存款计算器</h1>
  		 <span style="color: blue;">存款金额</span>
  		<input id="amount" name="amount" type="text"/>
  		<p></p>

    	<span style="color: blue;">存款日期</span>
  		<input name="depositdate" type="date"/>
  		<br><br />  
  		
    	<span style="color: blue;">取款日期</span>
  		<input name="getmoneydate" type="date"/>
  		<br><br />    			
  			  	
    	<input id="count" type="button" onclick="test()" value="计算" style="width: 80px;
			background:deepskyblue;"> <br>
			
   		 <p id="interest" style="margin-left: -100px; color: red;">利息:</p>
		 <p id="revenue" style="margin-left: -100px; color: red;">利息税：</p>
		 <p id="total" style="margin-left: -100px; color: red;">总额：</p>
    </div>
  </body>
</html>
