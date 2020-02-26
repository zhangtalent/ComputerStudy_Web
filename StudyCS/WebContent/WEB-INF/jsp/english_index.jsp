<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<html><head>
<title>ZhangTalent</title>
<link rel="stylesheet" href="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/css/layui.css">
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/loukong/resource/layui/layui.js"></script>
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/html/highcharts-more.js"></script>
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/html/exporting.js"></script>
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/html/oldie.js"></script>
<script src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/html/oldie.src.js"></script>
<script type="text/javascript" src="https://yss-1253784481.cossh.myqcloud.com/js/jquery.js"></script>
<script type="text/javascript" src="https://yss-1253784481.cos.ap-shanghai.myqcloud.com/html/highcharts.js"></script>
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
			  <li class="layui-nav-item"><a href="../"><i class="layui-icon"></i> 返回首页</a></li>
			  <li class="layui-nav-item"><a href="index"><i class="layui-icon">&#xe62c;</i>每日英语</a></li>
			  <li class="layui-nav-item"><a href="listen"><i class="layui-icon">&#xe62c;</i>听力</a></li>
			  <li class="layui-nav-item"><a href="read"><i class="layui-icon">&#xe62c;</i>阅读</a></li>
		</ul>
		<br>
		
		<div style="margin-left:35px;">
				<!-- 反野按钮 -->
				<c:if test="${previous > -1}" var="canup" scope="session">
		   			<a href='?page=<c:out value="${previous}"/>'><button type="button" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon"></i>向前五天</button></a>
				</c:if>
				<c:if test="${not canup}">
		   			<button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-disabled"><i class="layui-icon"></i>向前五天</button>
				</c:if>
			
				<c:if test="${next > 0}" var="cannext" scope="session">
		   			<a href='?page=<c:out value="${next}"/>'>向后五天<button type="button" class="layui-btn layui-btn-sm layui-btn-primary "><i class="layui-icon"></i></button></a>
				</c:if>
				<c:if test="${not cannext}">
			   		<button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-disabled">向后五天<i class="layui-icon"></i></button>
				</c:if>
		</div>	
		<br>
		<div class="layui-row">
		  <div  id = "chartshow" class="layui-col-xs12 layui-col-sm6 layui-col-md4">
		
		  </div>
		  <div  id = "processchartshow" class="layui-col-xs12 layui-col-sm6 layui-col-md4">
		
		  </div>
		  <div  id = "errordiv" class="layui-col-xs12 layui-col-sm6 layui-col-md4">
		
		  </div>
		</div>
	        
			
		
  
</body>

<script>
	var chart = Highcharts.chart('chartshow', {
		chart: {
			type: 'line'
		},
		title: {
			text: '听力正确率'
		},
		subtitle: {
			text: '取当日最高'
		},
		xAxis: {
			categories: ['${listendata.get(4).createtime}', '${listendata.get(3).createtime}', '${listendata.get(2).createtime}', '${listendata.get(1).createtime}', '${listendata.get(0).createtime}']
		},
		yAxis: {
			title: {
				text: '百分比 '
			}
		},
		plotOptions: {
			line: {
				dataLabels: {
					// 开启数据标签
					enabled: true          
				},
				// 关闭鼠标跟踪，对应的提示框、点击事件会失效
				enableMouseTracking: false
			}
		},
		series: [{
			name: '',
			data: [${listendata.get(4).rateofcorrect}, ${listendata.get(3).rateofcorrect}, ${listendata.get(2).rateofcorrect}, ${listendata.get(1).rateofcorrect}, ${listendata.get(0).rateofcorrect}]
		}]
	});
	var chart1 = Highcharts.chart('processchartshow', {
		chart: {
			type: 'line'
		},
		title: {
			text: '学习时长进度'
		},
		subtitle: {
			text: ''
		},
		xAxis: {
			categories: ['${listendata.get(4).createtime}', '${listendata.get(3).createtime}', '${listendata.get(2).createtime}', '${listendata.get(1).createtime}', '${listendata.get(0).createtime}']
		},
		yAxis: {
			title: {
				text: '时长 (min)'
			}
		},
		plotOptions: {
			line: {
				dataLabels: {
					// 开启数据标签
					enabled: true          
				},
				// 关闭鼠标跟踪，对应的提示框、点击事件会失效
				enableMouseTracking: false
			}
		},
		series: [{
			name: '阅读',
			data: [${readdata.get(4).readtime}, ${readdata.get(3).readtime}, ${readdata.get(2).readtime}, ${readdata.get(1).readtime}, ${readdata.get(0).readtime}]
		}, {
			name: '听力',
			data: [${listendata.get(4).listentime}, ${listendata.get(3).listentime}, ${listendata.get(2).listentime}, ${listendata.get(1).listentime}, ${listendata.get(0).listentime}]
		}]
	});
	Highcharts.chart('errordiv', {
		chart: {
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: 'pie'
		},
		title: {
			text: '错误词汇TOP15'
		},
		tooltip: {
			pointFormat: '{series.name}: <b>{point.y}</b>'
		},
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				dataLabels: {
					enabled: true,
					format: '<b>{point.name}</b>: {point.y}',
					style: {
						color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
					}
				}
			}
		},
		series: [{
			name: 'Brands',
			colorByPoint: true,
			data: [{
				name: "${errordata.get(14).word}",
				y: ${errordata.get(14).wordcount}
			},
			{
				name: "${errordata.get(13).word}",
				y: ${errordata.get(13).wordcount}
			},{
				name: "${errordata.get(12).word}",
				y: ${errordata.get(12).wordcount}
			},{
				name: "${errordata.get(11).word}",
				y: ${errordata.get(11).wordcount}
			},{
				name: "${errordata.get(10).word}",
				y: ${errordata.get(10).wordcount}
			},{
				name: "${errordata.get(9).word}",
				y: ${errordata.get(9).wordcount}
			},{
				name: "${errordata.get(8).word}",
				y: ${errordata.get(8).wordcount}
			},{
				name: "${errordata.get(7).word}",
				y: ${errordata.get(7).wordcount}
			},{
				name: "${errordata.get(6).word}",
				y: ${errordata.get(6).wordcount}
			},{
				name: "${errordata.get(5).word}",
				y: ${errordata.get(5).wordcount}
			},{
				name: "${errordata.get(4).word}",
				y: ${errordata.get(4).wordcount}
			},{
				name: "${errordata.get(3).word}",
				y: ${errordata.get(3).wordcount}
			},{
				name: "${errordata.get(2).word}",
				y: ${errordata.get(2).wordcount}
			},{
				name: "${errordata.get(1).word}",
				y: ${errordata.get(1).wordcount}
			},{
				name: "${errordata.get(0).word}",
				y: ${errordata.get(0).wordcount}
			}]
		}]
	});



		
</script>

</html>