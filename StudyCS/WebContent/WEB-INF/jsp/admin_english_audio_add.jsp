<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<html><head>
<title>ZhangTalent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
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
    
    <ul class="layui-nav layui-bg-blue" >
	  <li class="layui-nav-item"><a href="../index"><i class="layui-icon">&#xe68e;</i> 后台</a></li>
	  <li class="layui-nav-item"><a href="audio"><i class="layui-icon">&#xe637;</i>听力</a></li>
	  <li class="layui-nav-item  layui-this"><a href="">新增听力</a></li>
	  <li class="layui-nav-item" ><a  href=""><i class="layui-icon">&#x1006;</i>退出</a></li>
	</ul>

 
	 <form class="layui-form layui-form-pane" style="margin-top:15px;width:90%;margin-left:5%;" method="post" action="audio_add">
        

        
        
        <div class="layui-form-item layui-form-text">
          <label class="layui-form-label">标题</label>
          <div class="layui-input-block">
            <input name="title" placeholder="请输入内容" class="layui-input"/>
          </div>
        </div>
        
        <div class="layui-form-item">
			<label class="layui-form-label">音频地址(勿手动输入)</label>
			<div class="layui-input-block">
			  <input id="audiourl" name="audiourl" placeholder="请输入内容" class="layui-input"/>
			</div>
		 </div>
        
        
        <p><button type="button" id="uploadpic" class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe60d;</i>上传音频</button>
		</p>
      	<br>
        <div class="layui-form-item layui-form-text">
          <label class="layui-form-label">内容</label>
          <div class="layui-input-block">
            <textarea style="height:35%;word-wrap:normal;" id="content" name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
          </div>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn" type="submit" lay-submit="" lay-filter="formDemoPane">立即提交</button>
        </div>
      </form>
 
 		<div id="previewDiv" style="margin:5%;"></div>
 
<script>
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	  console.log(element);
	  //…
	});
	//上传图片
	layui.use('upload', function(){
	  var upload = layui.upload;
	   
	  //执行实例
	  var uploadInst = upload.render({
	    elem: '#uploadpic' //绑定元素
	    ,url: 'upload_file' //上传接口
	    ,done: function(res){
	      if(res.result == 'ok'){
	    	  document.getElementById("audiourl").value = res.url;
	      }
	    }
	    ,error: function(){
	      //请求异常回调
	    },accept: 'file'
	  });
	});
	//添加文本
	function insertText(type){
		var typename = '';
		if(type == 1){
			typename = "粗体文本"
		}else if(type == 2){
			typename = "下划线文本"
		}else if(type == 3){
			typename = "斜体文本"
		}else if(type == 5){
			typename = "代码文本"
		}else if(type == 6){
			typename = "链接文本"
		}else if(type == 7){
			typename = "引用文本"
		}
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.open({
					id:1,
				        type: 1,
				        title:typename,
				        area: ['90%', 'auto'],
				        content: ''+
				        				'<textarea id="tv" style="word-wrap:normal;"  name="tv" placeholder="请输入内容" class="layui-textarea"></textarea>'+
				        		''
				        ,
				        btn:['确定','取消'],
				        btn1: function (index,layero) {
				        	if(type == 1){
				        		InsertString("content","<b style='font-weight:200;font-size:15pt;color:#000;'>"+document.getElementById("tv").value+"</b>")
				    		}else if(type == 2){
				    			InsertString("content","<u style='font-weight:200;'>"+document.getElementById("tv").value+"</u>")
				    		}else if(type == 3){
				    			InsertString("content","<i style='font-weight:200;'>"+document.getElementById("tv").value+"</i>")
				    		}else if(type == 5){
				    			InsertString("content","<pre class=\"layui-code\">"+document.getElementById("tv").value.replace(/</g,"&lt;")+"</pre>")
				    		}else if(type == 6){
				    			InsertString("content","<a style='font-weight:200;' href='"+document.getElementById("tv").value+"'>"+document.getElementById("tv").value+"</a>")
				    		}else if(type == 7){
				    			InsertString("content","<blockquote class='layui-elem-quote'>"+document.getElementById("tv").value+"</blockquote>")
				    		}
				        	document.getElementById("tv").value = '';
			        		layer.close(index);
				    	},
				        btn2:function (index,layero) {
				        	 layer.close(index);
				        }
				 
				    });
				
		});  
		
	}
	
	function InsertString(tbid, str){
	    var tb = document.getElementById(tbid);
	    tb.focus();
	    if (document.all){
	        var r = document.selection.createRange();
	        document.selection.empty();
	        r.text = str;
	        r.collapse();
	        r.select();
	    }
	    else{
	        var newstart = tb.selectionStart+str.length;
	        tb.value=tb.value.substr(0,tb.selectionStart)+str+tb.value.substring(tb.selectionEnd);
	        tb.selectionStart = newstart;
	        tb.selectionEnd = newstart;
	    }
	}
	
	
	
	function GetSelection(tbid){

	    var sel = '';
	    if (document.all){
	        var r = document.selection.createRange();
	        document.selection.empty();
	        sel = r.text;
	    }
	    else{
	    	var tb = document.getElementById(tbid);
	    	   // tb.focus();
	        var start = tb.selectionStart;
	        var end = tb.selectionEnd;
	        sel = tb.value.substring(start, end);
	    }
	    return sel;
	}
	function ShowSelection(tbid){
		var sel = GetSelection(tbid);
	    if (sel)
	        alert('选中的文本是：'+sel);
	    else
	        alert('未选择文本！');
	}

	layui.use('form', function(){
		  
		});

	function preview(){
		document.getElementById("previewDiv").innerHTML = document.getElementById("content").value.replace(/\n/g, '<br>');
		layui.use('code', function(){ //加载code模块
			  layui.code(); //引用code方法
		});
	}
</script>



</body></html>