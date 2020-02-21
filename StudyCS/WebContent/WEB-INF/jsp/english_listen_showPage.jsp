<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html><head>
<title>ZhangTalent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
<script type="text/javascript" src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.js"></script>
    <style>
        body,html{
        	background-color:#f4f4f4;
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
    


		<div id="showDiv" style = "background-color:#fff;">
			<div style="font-size:15pt;color: #000;padding:5%;font-weight:180;">
				<fieldset class="layui-elem-field">
				  <legend>${data.createtime }</legend>
				  <div class="layui-field-box"style="font-size:15pt;">
				    	${data.title}<br>
				  </div>
				  
				</fieldset>
			
			</div>
			<blockquote class="layui-elem-quote">录音</blockquote>
			<audio style="margin-left:10px;" src="${data.audiourl}" controls="controls">
			</audio>
			
			<br><br>
			<blockquote class="layui-elem-quote">请听写</blockquote>
			<div style="padding:10px;text-align:center;" id="solutionarea">
				
			</div>
			<blockquote class="layui-elem-quote">原文</blockquote>
	    	<pre id="previewDiv" style="margin-left:5%;margin-right:5%;"><br>${data.content}</pre>
	    	
	    	<br><br><br>
		</div>
	    
 
<script>


	var timepass = 0;
	var correct = 0;
	var con = "${data.content.replaceAll("\"","")}";
	con = con.replace(/\n/g," $enter$ ")
	con = con.replace(/,/g,"")
	con = con.replace(/\./g,"")
	con = con.replace(/:/g,"")
	console.log(con);
	var arr = con.split(" ");
	var len = arr.length;
	console.log(arr)
	var solutionarea = document.getElementById("solutionarea")
	for(var i = 0;i<len;i++){
		var value = arr[i];
		if(value == "$enter$"){solutionarea.innerHTML = solutionarea.innerHTML + "<br>"}
		else{
			solutionarea.innerHTML = solutionarea.innerHTML +
				"<input style = 'text-align:center;height:40px;width:70px;border-left-width:0px;border-top-width:0px;border-right-width:0px;border-bottom-color:black' id='word" + i + "'/>&nbsp;&nbsp;&nbsp;";
		}
	}
	var rightlen = 0 ;
	var wordlen = len;
	function cal_correct(){
		rightlen = 0;
		wordlen = len;
		for(var i = 0;i<len;i++){
			var value = arr[i];
			if(value == "$enter$"){wordlen--;}
			else{
				var v = document.getElementById("word" + i).value;
				//console.log(v+"---"+value)
				
				if(v == value){document.getElementById("word" + i).style.borderBottomColor = "green";rightlen++;}else{document.getElementById("word" + i).style.borderBottomColor = "red";}
			}
		}
		correct = parseInt(rightlen/wordlen*100);
		//console.log(correct+"--"+rightlen/wordlen)
	}
	//开启计时器
	var timeo = self.setInterval("updateData()",60000);
	
	var uuid = '${data.uuid}'
	
	function updateData(){
			cal_correct();
			timepass += 1;
			$.ajax({ url:'updatelistendata', 
				type:'post',
				 data:{audioid:uuid,rateofcorrect:correct,listentime:timepass},
				 async:false,
				 success:function (response) {
				     console.log(response);
				     var obj =JSON.parse(response);
				     if(obj.result != "fail"){console.log('update complete')}
				     else{alert("出错");}
				      //后台返回的数据。这里给  抓页面元素填上去就OK了
				 } 
			})
		}

	

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
		}
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.open({
					id:1,
				        type: 1,
				        title:typename,
				        content: ''+
				        				'<textarea id="tv"  name="tv" placeholder="请输入内容" class="layui-textarea"></textarea>'+
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
	
	/*PC端居中缩小显示**/
	if(document.body.clientWidth > 1300&&document.body.clientWidth>document.body.clientHeight){
		document.getElementById("showDiv").style.width = "50%";
		document.getElementById("showDiv").style.marginLeft = "25%";
		document.getElementById("showDiv").style.backgroundColor = "#ffffff";
	}
	layui.use('code', function(){ //加载code模块
		layui.code({
			encode: false //是否转义html标签。默认不开启
		});
	});
</script>



</body></html>