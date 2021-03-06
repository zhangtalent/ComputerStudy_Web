<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<html><head>
<title>ZhangTalent</title>
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>

<script type="text/javascript" src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <style>
        body,html{
        	background-color:#fff;
            width:100%;
            height:100%;
            margin:0 auto;
            
        }
        
        
        
        #headerdiv{
            background:#fff;
            width:100%;
            height:100%;
            
            vertical-align:middle;
            margin:0 auto;
        }
        
        .showdiv{
            margin-top:50%;
            font-size:27px;
            color:#000;
            text-align:center;
            height:80%;
            
        }
        
        .imgofitem{
            vertical-align:middle;
            height:125px;
            margin:0 auto;
        }
        
        .item{
            background:#fff;
            height:125px;
            line-height:120px;
            font-size:20px;
            color:#000;
            font-weight:300;
            /*margin-top:25px;*/
            width:100%;box-shadow:0 10px 10px #ddd;
        }
        
        #mobile{
            
        }
        botton,bottom {
		-webkit-appearance:none;
		}
    </style>




</head>

<body>
	<ul class="layui-nav">
			  <li class="layui-nav-item"><a href="./index"><i class="layui-icon"></i> 首页</a></li>
			  <li class="layui-nav-item"><a href="index"><i class="layui-icon">&#xe62c;</i> 每日英语</a></li>
			  
		</ul>
    <div id="showDiv" style="height:100%;">
    
	    	
	        
			<ul class="layui-timeline" style="margin-left:5%;padding-right:5%;margin-top:10px;background-color:#fff;">
				<c:forEach items="${datas}" var="data">
		    		<li class="layui-timeline-item" >
				    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title"><c:out value="${data.createtime}"/></h3>
				      <pre><c:out value="${data.title}"/><a href='listenshow?uuid=<c:out value="${data.uuid}"/>'><br><br>|开始|</a>
				      </pre>
				      
				    </div>
				  </li>
				</c:forEach>
				  
			</ul>
			<div style="margin-left:5%;">
				<!-- 反野按钮 -->
				<c:if test="${previous > -1}" var="canup" scope="session">
		   			<a href='?page=<c:out value="${previous}"/>'><button type="button" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon"></i></button></a>
				</c:if>
				<c:if test="${not canup}">
		   			<button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-disabled"><i class="layui-icon"></i></button>
				</c:if>
			
				<c:if test="${next > 0}" var="cannext" scope="session">
		   			<a href='?page=<c:out value="${next}"/>'><button type="button" class="layui-btn layui-btn-sm layui-btn-primary "><i class="layui-icon"></i></button></a>
				</c:if>
				<c:if test="${not cannext}">
			   		<button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-disabled"><i class="layui-icon"></i></button>
				</c:if>
			</div>
			
	    </div>

  
</body>

<script>
	
	
		/*PC端居中缩小显示**/
		if(document.body.clientWidth > 1300&&document.body.clientWidth>document.body.clientHeight){
			//document.getElementById("showDiv").style.width = "90%";
			//document.getElementById("showDiv").style.marginLeft = "5%";
			document.getElementById("showDiv").style.backgroundColor = "#ffffff";
		}
		var arr = {}
		
		var Today=new Date();
		var m;
		if(Today.getMonth()+1 < 10){
			m="0"+(Today.getMonth()+1)
		}
		init_date = Today.getFullYear() + "-" + m
		getStudyData(init_date)
		
		function getStudyData(date){
			$.ajax({ url:'studydata', 
				type:'post',
				 data:{date:date},
				 async:false,
				 success:function (response) {
				     console.log(response);
				     var obj =JSON.parse(response);
				     if(obj.result != "fail"){var dd =obj.data; drawDate(dd);console.log(dd)}
				     else{alert("出错");}
				      //后台返回的数据。这里给  抓页面元素填上去就OK了
				 } 
			})
		}
		var d = init_date + "-" + Today.getDate()
		function drawDate(str){

			        
			arr = JsonAddKey(str)
			//document.getElementById('test2').innerHTML = "";
			layui.use('laydate', function(){
				lay('#test2').html("");		
			laydate = layui.laydate;
				  //执行一个laydate实例
				  laydate.render({
					  isInitValue: false
					  ,elem: '#test2'
					  ,position: 'static'
					  ,showBottom: false,
					  value:d
					  ,mark:arr
					  ,change: function(value, date){ //监听日期被切换
						  d=value
						  console.log(value.substring(0,7)); 
						  getStudyData(value.substring(0,7))
					    //
					  }
					});
				});
			
		}
		layui.use('element', function(){
			  var element = layui.element;
			  
			  //…
			});
		function JsonAddKey(json){
	        RiChengArr = {};
	        ah = json.split("|")
	        for(i = 0 ;i < ah.length;i++)RiChengArr[ah[i]] = ""
	        
	        return RiChengArr;
	    }
		
</script>

</html>