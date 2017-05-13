<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/index/index.css"/>
		<script type="text/javascript" src="../script/index.js" ></script>
		<link rel="stylesheet" href="../css/index/daterangepicker.css" />
		<script src="../script/jquery-2.1.3.min.js"></script>
		<script src="../script/moment.min.js"></script>
		<script src="../script/jquery.daterangepicker.js"></script>
		<script src="../script/demo.js"></script>
		<title></title>
	</head>
	<body>
	  <form  id="searchForm">
		<div class="header_box">
			<div class="header">
				<div class="height_l">
					<img src="../img/index/logo.png" />
				</div>
				<div class="height_r">
					<input type="text" placeholder="输入采集人姓名" class="header_r_inp" name="cjUserName"/>
					<img src="../img/index/sousuo.png" class="sousuo" id="searchImgBtn"/>
					<div class="touxiang">
						<img src="../img/index/touxiang.png" />
						<span>${org_userName}</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="box">
			<div class="box_l">
				<div class="l_h">
					<span class="h_left">腾飞创新园</span>
					<!--<img src="../img/index//index_25.gif" />-->
					<span class="h_right" id="qjhcBtn">全景合成</span>
				</div>
				<div class="l_h_img">
					<img src="../img/index/yuanzi.jpg" />
				</div>
			</div>
			<div class="box_r">
				<div class="r_h">
					<span class="header_new" id="newUp">最新上传</span>
					<span class="header_new header_new_1" id="result" style="display: none;">筛选结果</span>
					<!--<input id="date-range0" size="30" value="">-->
					<div class="delect" id="cleanFormBtn">
						
					</div>
					<div class="select">
						<div>
							<h2 class="first"><input id="date-range0" size="30" value="" class="inp" placeholder="点击选择日期" name="searchTime"><!--<span id="date-range0">日期</span>--><!--<img src="../img/index/xia.png"/>--></h2>
							<!--<ul>
								<li>35345</li>
								<li>35345</li>
								<li>35345</li>
							</ul>-->
						</div>
						<div>
							<h2 class="xiala"><span style="font-weight: normal;" id="chuang">幢</span><img src="../img/index/xia.png"/></h2>
							<ul id="chuangUl">
								<li value="1">一幢</li>
								<li value="2">二幢</li>
							</ul>
							<input type="hidden" name="dName" id="dName">
						</div>
						<div>
							<h2 class="xiala"><span style="font-weight: normal;width:24px;" id="cengshu">层数</span><img src="../img/index/xia.png"/></h2>
							<ul id="lcUl">
								<li value="1">一层</li>
								<li value="2">二层</li>
								<li value="3">三层</li>
								<li value="4">四层</li>
								<li value="5">五层</li>
								<li value="6">六层</li>
								<li value="7">七层</li>
								<li value="8">八层</li>
								<li value="9">九层</li>
								<li value="10">十层</li>
							</ul>
							<input type="hidden" name="lcNum" id="lcNum">
						</div>
					</div>
				</div>
				</form>
				<div class="connent_box" >
				  <div class="connent_box_z"  id="showMainDiv" >
				     <c:forEach  var="gatherInfo" items="${gatherInfoList}" varStatus="status">
							<div class="connent" onclick="gotoDetail(${gatherInfo.id});">
								<img src="${gatherInfo.pic_url}"/>
								<p class="title"><span>${gatherInfo.chuang}</span>幢<span>${gatherInfo.storey}</span>层全景图</p>
								<p style="color:#999999">更新于<span><fmt:formatDate value="${gatherInfo.upload_time}" pattern="yyyy年MM月dd HH:mm"/></span></p>
								<div class="pinlun">
									<img src="../img/index/tupiancion.png"/>
									<span>${gatherInfo.pic_num}</span>
								</div>
								<div class="xiaoxi">
									<img src="../img/index/xiaoxicion.png"/>
									<span>${gatherInfo.comment_num}</span>
								</div>
							</div>
				 </c:forEach>
				</div>	
			</div>
			</div>
		</div>
		<script>
			$(".select h2").click(function(){
				$(this).next().slideToggle(200);
			});
			$(".select ul li").click(function(){
				var cont = $(this).html();
				$(this).parent().prev().find("span").html(cont);
				$(this).parent().slideToggle(200);
			});
			$("#chuangUl > li").click(function(){
				 $("#dName").val($(this).val());
                doSearch();
			});
			$("#lcUl > li").click(function(){
				 $("#lcNum").val($(this).val());
                doSearch();
			})
			$("#cleanFormBtn").click(function(){
				 $("#searchForm")[0].reset();
				 $("#chuang").html("幢");
				 $("#cengshu").html("层数");
				 $("#dName").val("");
				 $("#lcNum").val("");
				 doSearch(false,true);
			})
			$("#qjhcBtn").click(function(){
				 var a = document.createElement('a');  
	              a.setAttribute('href', "http://vr.uranusvr.com.cn/member/login");  
	              a.setAttribute('target','_blank');  
	              a.setAttribute('id', "qjhcId");  
	              // 防止反复添加  
	              if(!document.getElementById("qjhcId")) {                       
	                  document.body.appendChild(a);  
	              }  
	              a.click();  
			});
            function doSearch(isAppend,isSreach)
            {
                $.post("../pc/sreachIndexInfo.do",$("#searchForm").serialize(),function(data) {
                    if(true==data.success){
                    	if(isSreach==true){
                    		$("#newUp").show();
	                        $("#result").hide();
                    	}else{
                    		$("#newUp").hide();
                            $("#result").show();
                    	}
                        
                        var list=data.gatherInfoList;
                        var showDiv=$("#showMainDiv");
                        if(isAppend==true){
                        }else{
                        	showDiv.html("");
                        }
                        $.each(list,function(i,obj){
                        	var html="";
                            html+='<div class="connent" onclick="gotoDetail('+obj.id+');"><img src="'+obj.pic_url+'"/>';
                            html+='<p class="title"><span>'+obj.chuang+'</span>幢<span>'+obj.storey+'</span>层全景图</p>';
                            html+='<p style="color:#999999">更新于<span>'+new Date(obj.upload_time).Format("yyyy年MM月dd hh:mm")+'</span></p>';
                            html+='<div class="pinlun"><img src="../img/index/tupiancion.png"/><span>'+obj.pic_num+'</span></div>';
                            html+='<div class="xiaoxi"><img src="../img/index/xiaoxicion.png"/><span>'+obj.comment_num+'</span></div></div>';
                            $(html).css('opacity',0).appendTo(showDiv).fadeTo(1000,1);  
                        });
                    }
                });
            }
			$("#searchImgBtn").click(function(){
                doSearch();
			});

            function gotoDetail(id)
            {
                var url = '/vr/info.do?id=' + id;
                openURL(url);
            }

            function openURL(url)
            {
                var tempwindow=window.open();
                tempwindow.location = url;
            }

			Date.prototype.Format = function(fmt)   
			{ 
			  var o = {   
			    "M+" : this.getMonth()+1,                 //月份   
			    "d+" : this.getDate(),                    //日   
			    "h+" : this.getHours(),                   //小时   
			    "m+" : this.getMinutes(),                 //分   
			    "s+" : this.getSeconds(),                 //秒   
			    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
			    "S"  : this.getMilliseconds()             //毫秒   
			  };   
			  if(/(y+)/.test(fmt))   
			    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
			  for(var k in o)   
			    if(new RegExp("("+ k +")").test(fmt))   
			  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
			  return fmt;   
			}  
			
	        $(window).scroll(function() {
	                if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
	                    doSearch(true);
	                }
	            });
		
		</script>
	</body>
</html>
