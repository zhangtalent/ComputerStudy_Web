<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<html><head>
<title>ZhangTalent</title>
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <style>
        body,html{
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
    
    
    <div id="headerdiv" style="padding-left:3%;padding-top:5%;margin-right:5%;position:absolute;top:0;z-index:3;overflow:hidden;max-height:100%;">
        <div style = "text-align:center;font-size:11px;"><b style="font-size:21px;"></b><b style="font-size:19px;">Zhang Talent</b><br><div style="margin:0 auto;margin-top:8px;height:2px;width:50px;background-color:#4e4e4e;box-shadow:0 0 0px #4e4e4e;"></div></div>
        <img style="margin-top:5%;margin-left:7%;width:70px;max-height:70px;" src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/icon2.png">
		

		<ul class="layui-timeline" style="margin-left:5%;padding-right:5%;">
			<c:forEach items="${datas}" var="data">
	    		<li class="layui-timeline-item" >
			    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
			    <div class="layui-timeline-content layui-text">
			      <h3 class="layui-timeline-title"><c:out value="${data.time}"/></h3>
			      <pre><c:out value="${data.title}"/><a href='show?uuid=<c:out value="${data.uuid}"/>'>-查看</a>
			      </pre>
			      
			    </div>
			  </li>
			</c:forEach>
			  
		</ul>
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
    
    
  
</body></html>