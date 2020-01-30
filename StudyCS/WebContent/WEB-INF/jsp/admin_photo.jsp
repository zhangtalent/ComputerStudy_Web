<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html><head>
<title>52镂空</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
    <style>
        body,html{
        	padding-top:5px;
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
		.modules{
			height:19%;
			overflow:hidden;
		}
    </style>




</head>

<body>
    <span style="margin-left:10px;" class="layui-breadcrumb" lay-separator="|">
    	  <button type="button" class="layui-btn-radius layui-btn layui-btn-normal" id="test1">
			  <i class="layui-icon">&#xe67c;</i>上传图片
		  </button>
		  <a href="index"  style="margin-left:10px;"><i class="layui-icon">&#xe68e;</i> 后台</a>
		  <a href=""><i class="layui-icon">&#xe60d;</i> 相片</a>
		  <a href=""><i class="layui-icon">&#x1006;</i> 退出</a>
		
		
	</span>
      
    

	
	<!--  -->
	

	
	<div id="photowall" style="margin-top:5px;margin-left:10px;margin-right:10px;" class="layui-row layui-col-space3">
	  
	</div>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  console.log(element);
  //…
});
</script>

<script>
//读取照片
var length_photos = ${number}
for(i = 1;i<length_photos;i++){
	var parentele = document.getElementById("photowall")
	var htmdata = '<div class="layui-col-xs4 layui-col-md2 layui-col-lg1 modules"><img id="img'+i+'" style="width: 100%; overflow: hidden;  height: auto;" src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/000'+i+'.png"></div>'
	parentele.innerHTML = parentele.innerHTML+htmdata
}
//上传照片
layui.use('upload', function(){
  var upload = layui.upload;
   
  //执行实例
  var uploadInst = upload.render({
    elem: '#test1' //绑定元素-
    ,url: 'upload_photo' //上传接口
    ,done: function(res){
      //上传完毕回调
    	window.location.reload(true);
    }
    ,error: function(){
      //请求异常回调
    }
  });
});
</script>

</body></html>