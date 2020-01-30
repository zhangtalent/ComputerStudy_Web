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
		<div style="padding:5%;">
			
	    <p style="color:#4e4e4e;font-size:30px;font-weight:200;">管理员登陆</p>
		<hr class="layui-bg-cyan">
		</div>
		<form class="layui-form layui-form-pane" style="width:70%;margin-left:5%;" method="post" action="login">
        <div class="layui-form-item">
          <label class="layui-form-label">用户名</label>
          <div class="layui-input-inline">
            <input type="text" name="username" required="" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">密 码</label>
          <div class="layui-input-inline">
            <input type="password" name="password" required="" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
          </div>
          
        </div>
       
        <div class="layui-form-item">
          <button class="layui-btn" type="submit" lay-filter="formDemoPane">登陆</button>
        </div>
      </form>
	
	

</body></html>