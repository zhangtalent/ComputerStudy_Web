<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html><head>
<title>ZhangTalent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
    <style>
        body,html{
        	background-color:#fefefe;
            width:100%;
            height:100%;
            margin:0 auto;
            
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
    
    
	<ul class="layui-nav" >
	  <li class="layui-nav-item layui-this"><a href=""><i class="layui-icon">&#xe68e;</i> 后台</a></li>
	  <li class="layui-nav-item"><a href="types"><i class="layui-icon">&#xe60e;</i>类别</a></li>
	  <li class="layui-nav-item"><a href="journal"><i class="layui-icon">&#xe637;</i>日志</a></li>
	  <li class="layui-nav-item"><a href="english/audio"><i class="layui-icon">&#xe60e;</i>英语听力</a></li>
	  <li class="layui-nav-item"><a href="english/read"><i class="layui-icon">&#xe637;</i>英语阅读</a></li>
	  <li class="layui-nav-item" ><a  href=""><i class="layui-icon">&#x1006;</i>退出</a></li>
	</ul>
	
	<div class="layui-card">
	  <div class="layui-card-header"><i class="layui-icon layui-icon-water"></i>数据使用情况</div>
	  <br>
	  <div class="layui-card-body">
	  	<b>&nbsp;类别</b><br>
	    <div class="layui-progress layui-progress-big" style="margin-top:5px;"  lay-showPercent="true">
	  		
  			<div class="layui-progress-bar layui-bg-blue" lay-percent="${tcount}"></div>
		</div>
	  </div>
	  
	  
	  <br>
	  <div class="layui-card-body">
	  	<b>&nbsp;日志</b><br>
	    <div class="layui-progress layui-progress-big" style="margin-top:5px;"  lay-showPercent="true">
	  		
  			<div class="layui-progress-bar layui-bg-blue" lay-percent="${jcount}"></div>
		</div>
	  </div>
	  
	  
	  <br>
	  
	  
	</div>
	
	
 
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  console.log(element);
  //…
});
</script>



</body></html>