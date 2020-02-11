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
	  <li class="layui-nav-item"><a href=""><i class="layui-icon">&#xe68e;</i> 后台</a></li>
	  <li class="layui-nav-item layui-this"><a href="types"><i class="layui-icon">&#xe60e;</i>类别</a></li>
	  <li class="layui-nav-item"><a href="journal"><i class="layui-icon">&#xe637;</i>日志</a></li>
	  <li class="layui-nav-item" ><a  href=""><i class="layui-icon">&#x1006;</i>退出</a></li>
	</ul>

 	<fieldset class="layui-elem-field"style="margin-top:15px;width:98%;margin-left:1%;">
  		<legend>添加类别</legend>
		<div class="layui-field-box">
		    <form class="layui-form layui-form-pane"  method="post" action="types_add">
		        <div class="layui-form-item layui-form-text">
		          <label class="layui-form-label">类别Id</label>
		          <div class="layui-input-block">
		            <input name="keyid" placeholder="赋予一个类别Id" class="layui-input"/>
		          </div>
		        </div>
		        <div class="layui-form-item layui-form-text">
		          <label class="layui-form-label">标题</label>
		          <div class="layui-input-block">
		            <input name="title" placeholder="请输入内容" class="layui-input"/>
		          </div>
		        </div>
		        
		        <div class="layui-form-item">
		          <button class="layui-btn" type="submit" lay-submit="" lay-filter="formDemoPane">立即添加</button>
		        </div>
		        
	      	</form>
		</div>
	</fieldset>
	 
 
	 <table class="layui-table" style="width:98%;margin-left:1%;">
	
		  <thead>
		    <tr>
		    <th>Id</th>
		    <th>显示名</th>  
		    <th>操作</th>  
		    </tr> 
		  </thead>
		  <tbody id="tb">
		    
		    
		    
		    <c:forEach items="${datas}" var="data">
		   		<tr>
			   		<th>
			   		<c:out value="${data.keyid}"/>
			   		</th>
			   		<th><c:out value="${data.title}"/>
			   		</th>
			   		<th>
			   		<button type="button" id="<c:out value="${data.uuid}"/>" onclick="del_jour('<c:out value="${data.uuid}"/>')" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon"></i></button>
			   		
			   		
			   		</th>
		   		</tr>	
			</c:forEach>
		    
		    
		  </tbody>
	</table>
 
 
 
 		<div id="previewDiv" style="margin:5%;"></div>
 
<script>
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	  console.log(element);
	  //…
	});
	
	
	function del_jour(uuid){
		$.ajax({ url:'deletejournaltype', 
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
	
	
	//上传图片
	layui.use('upload', function(){
	  var upload = layui.upload;
	   
	  //执行实例
	  var uploadInst = upload.render({
	    elem: '#uploadpic' //绑定元素
	    ,url: 'upload_photo' //上传接口
	    ,done: function(res){
	      if(res.result == 'ok'){
	    	  InsertString("content","<img style='width:100%;' src='"+res.url+"'/><br>")
	      }
	    }
	    ,error: function(){
	      //请求异常回调
	    }
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
				    			InsertString("content","<pre class=\"layui-code\">"+document.getElementById("tv").value+"</pre>")
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

	
	
	function preview(){
		document.getElementById("previewDiv").innerHTML = document.getElementById("content").value.replace(/\n/g, '<br>');
		layui.use('code', function(){ //加载code模块
			  layui.code(); //引用code方法
		});
	}
</script>



</body></html>