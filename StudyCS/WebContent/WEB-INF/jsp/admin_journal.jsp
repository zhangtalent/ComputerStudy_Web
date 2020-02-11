<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html><head>
<title>52镂空</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.js"></script>
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
    <style>
        body,html{
            width:98%;
            height:100%;
            margin:0 auto;
            padding-top:5px;
        }
        
        
        
        #headerdiv{
            background:#fff;
            width:100%;
            height:100%;
            
            text-align:center;
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
   
   
   <span style="margin-left:10px;" class="layui-breadcrumb" lay-separator="|">
    	  <a href="journal/add"><button type="button" class="layui-btn-radius layui-btn layui-btn-normal" id="test1">
			  <i class="layui-icon">&#xe67c;</i>添加日志
		  </button></a>
		  <a href="index"  style="margin-left:10px;"><i class="layui-icon">&#xe68e;</i> 后台</a>
		  <a href=""><i class="layui-icon">&#xe60d;</i> 日志</a>
		  <a href=""><i class="layui-icon">&#x1006;</i> 退出</a>
		
		
	</span> 

 
 <table class="layui-table">

  <thead>
    <tr>
    <th>编写时间</th>
    <th>日志</th>  
    <th>操作</th>  
    </tr> 
  </thead>
  <tbody id="tb">
    
    
    
    <c:forEach items="${datas}" var="data">
   		<tr>
	   		<th>
	   		<c:out value="${data.time}"/><p>
	   		</th>
	   		<th><a href='journal/show?uuid=<c:out value="${data.uuid}"/>'>
	   		<c:out value="${data.title}"/></a><p>
	   		</th>
	   		<th>
	   		<button type="button" id="<c:out value="${data.uuid}"/>" onclick="del_jour('<c:out value="${data.uuid}"/>')" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon"></i></button>
	   		<a href = 'journal/edit?uuid=<c:out value="${data.uuid}"/>'><button type="button" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe60a;</i></button></a>
	   		
	   		</th>
   		</tr>	
	</c:forEach>
    
    
  </tbody>
</table>
	<!-- 反野按钮 -->
	<c:if test="${previous > -1}" var="canup" scope="session">
   		<a href='journal?page=<c:out value="${previous}"/>'><button type="button" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon"></i></button></a>
	</c:if>
	<c:if test="${not canup}">
   		<button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-disabled"><i class="layui-icon"></i></button>
	</c:if>
	
	<c:if test="${next > 0}" var="cannext" scope="session">
   		<a href='journal?page=<c:out value="${next}"/>'><button type="button" class="layui-btn layui-btn-sm layui-btn-primary "><i class="layui-icon"></i></button></a>
	</c:if>
	<c:if test="${not cannext}">
   		<button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-disabled"><i class="layui-icon"></i></button>
	</c:if>
	
	
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  console.log(element);
  //…
});
function del_jour(uuid){
	$.ajax({ url:'journal/deletejournal', 
		type:'post',
		 data:{uuid:uuid},
		 async:false,
		 success:function (response) {
		     console.log(response);
		     if(response.result != "fail"){alert("删除成功");window.location.reload()}
		     else{alert("删除出错");}
		      //后台返回的数据。这里给  抓页面元素填上去就OK了
		 } 
	})
}
</script>



</body></html>