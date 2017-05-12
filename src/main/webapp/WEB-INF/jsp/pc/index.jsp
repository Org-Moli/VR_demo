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
					<input type="text" placeholder="输入关键字" class="header_r_inp" name="cjUserName"/>
					<img src="../img/index/sousuo.png" class="sousuo" id="searchImgBtn"/>
					<div class="touxiang">
						<img src="../img/index/touxiang.png" />
						<span>李奇峰</span>
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
							<h2 class="first"><input id="date-range0" size="30" value="" class="inp" placeholder="日期" name="searchTime"><!--<span id="date-range0">日期</span>--><!--<img src="../img/index/xia.png"/>--></h2>
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
							<div class="connent">
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
			});
			$("#lcUl > li").click(function(){
				 $("#lcNum").val($(this).val());
			})
			$("#cleanFormBtn").click(function(){
				 $("#searchForm")[0].reset();
				 $("#chuang").html("幢");
				 $("#cengshu").html("层数");
				 $("#dName").val("");
				 $("#lcNum").val("");
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
			$("#searchImgBtn").click(function(){
				$.post("../pc/sreachIndexInfo.do",$("#searchForm").serialize(),function(data) {
					   if(true==data.success){
						    $("#newUp").hide();
						    $("#result").show();
						    var list=data.gatherInfoList;
						    var showDiv=$("#showMainDiv");
						    var html="";
						   $.each(list,function(i,obj){
							       html+='<div class="connent"><img src="'+obj.pic_url+'"/>';
							       html+='<p class="title"><span>'+obj.chuang+'</span>幢<span>'+obj.storey+'</span>层全景图</p>';
							       html+='<p style="color:#999999">更新于<span>'+new Date(obj.upload_time).Format("yyyy年MM月dd hh:mm")+'</span></p>';
								   html+='<div class="pinlun"><img src="../img/index/tupiancion.png"/><span>'+obj.pic_num+'</span></div>';
								   html+='<div class="xiaoxi"><img src="../img/index/xiaoxicion.png"/><span>'+obj.comment_num+'</span></div></div>';
						   });
						   showDiv.html(html);
					   }
					});
			});
			
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
			
			
			
			
			
			
			
			
// 			;(function($){
// 				   var 
// 				   //参数
// 				   setting={
// 				      column_width:240,//列宽
// 					  column_className:'waterfall_column',//列的类名
// 					  column_space:10,//列间距
// 					  cell_selector:'.cell',//要排列的砖块的选择器，context为整个外部容器
// 					  img_selector:'img',//要加载的图片的选择器
// 					  auto_imgHeight:true,//是否需要自动计算图片的高度
// 					  fadein:true,//是否渐显载入
// 					  fadein_speed:600,//渐显速率，单位毫秒
// 					  insert_type:1, //单元格插入方式，1为插入最短那列，2为按序轮流插入
// 					  getResource:function(index){ }  //获取动态资源函数,必须返回一个砖块元素集合,传入参数为加载的次数
// 				   },
// 				   //
// 				   waterfall=$.waterfall={},//对外信息对象
// 				   $waterfall=null;//容器
// 				   waterfall.load_index=0, //加载次数
// 				   $.fn.extend({
// 				       waterfall:function(opt){
// 						  opt=opt||{};  
// 					      setting=$.extend(setting,opt);
// 						  $waterfall=waterfall.$waterfall=$(this);
// 						  waterfall.$columns=creatColumn();
// 						  render($(this).find(setting.cell_selector).detach(),false); //重排已存在元素时强制不渐显
// 						  waterfall._scrollTimer2=null;
// 						  $(window).bind('scroll',function(){
// 						     clearTimeout(waterfall._scrollTimer2);
// 							 waterfall._scrollTimer2=setTimeout(onScroll,300);
// 						  });
// 						  waterfall._scrollTimer3=null;
// 						  $(window).bind('resize',function(){
// 						     clearTimeout(waterfall._scrollTimer3);
// 							 waterfall._scrollTimer3=setTimeout(onResize,300);
// 						  });
// 					   }
// 				   });
// 				   function creatColumn(){//创建列
// 				      waterfall.column_num=calculateColumns();//列数
// 					  //循环创建列
// 					  var html='';
// 					  for(var i=0;i<waterfall.column_num;i++){
// 					     html+='<div class="'+setting.column_className+'" style="width:'+setting.column_width+'px; display:inline-block; *display:inline;zoom:1; margin-left:'+setting.column_space/2+'px;margin-right:'+setting.column_space/2+'px; vertical-align:top; overflow:hidden"></div>';
// 					  }
// 					  $waterfall.prepend(html);//插入列
// 					  return $('.'+setting.column_className,$waterfall);//列集合
// 				   }
// 				   function calculateColumns(){//计算需要的列数
// 				      var num=Math.floor(($waterfall.innerWidth())/(setting.column_width+setting.column_space));
// 					  if(num<1){ num=1; } //保证至少有一列
// 					  return num;
// 				   }
// 				   function render(elements,fadein){//渲染元素
// 				      if(!$(elements).length) return;//没有元素
// 				      var $columns = waterfall.$columns;
// 				      $(elements).each(function(i){										
// 						  if(!setting.auto_imgHeight||setting.insert_type==2){//如果给出了图片高度，或者是按顺序插入，则不必等图片加载完就能计算列的高度了
// 						     if(setting.insert_type==1){ 
// 							    insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
// 							 }else if(setting.insert_type==2){
// 							    insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
// 						     }
// 							 return true;//continue
// 						  }						
// 						  if($(this)[0].nodeName.toLowerCase()=='img'||$(this).find(setting.img_selector).length>0){//本身是图片或含有图片
// 						      var image=new Image;
// 							  var src=$(this)[0].nodeName.toLowerCase()=='img'?$(this).attr('src'):$(this).find(setting.img_selector).attr('src');
// 							  image.onload=function(){//图片加载后才能自动计算出尺寸
// 							      image.onreadystatechange=null;
// 								  if(setting.insert_type==1){ 
// 								     insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
// 								  }else if(setting.insert_type==2){
// 									 insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
// 								  }
// 								  image=null;
// 							  }
// 							  image.onreadystatechange=function(){//处理IE等浏览器的缓存问题：图片缓存后不会再触发onload事件
// 							      if(image.readyState == "complete"){
// 									 image.onload=null;
// 									 if(setting.insert_type==1){ 
// 									    insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
// 									 }else if(setting.insert_type==2){
// 									    insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
// 									 }
// 									 image=null;
// 								  }
// 							  }
// 							  image.src=src;
// 						  }else{//不用考虑图片加载
// 						      if(setting.insert_type==1){ 
// 								 insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
// 							  }else if(setting.insert_type==2){
// 								 insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
// 							  }
// 						  }						
// 					  });
// 				   }
// 				   function public_render(elems){//ajax得到元素的渲染接口
// 				   	  render(elems,true);	
// 				   }
// 				   function insert($element,fadein){//把元素插入最短列
// 				      if(fadein){//渐显
// 					     $element.css('opacity',0).appendTo(waterfall.$columns.eq(calculateLowest())).fadeTo(setting.fadein_speed,1);
// 					  }else{//不渐显
// 				         $element.appendTo(waterfall.$columns.eq(calculateLowest()));
// 					  }
// 				   }
// 				   function insert2($element,i,fadein){//按序轮流插入元素
// 				      if(fadein){//渐显
// 					     $element.css('opacity',0).appendTo(waterfall.$columns.eq(i%waterfall.column_num)).fadeTo(setting.fadein_speed,1);
// 					  }else{//不渐显
// 				         $element.appendTo(waterfall.$columns.eq(i%waterfall.column_num));
// 					  }
// 				   }
// 				   function calculateLowest(){//计算最短的那列的索引
// 				      var min=waterfall.$columns.eq(0).outerHeight(),min_key=0;
// 					  waterfall.$columns.each(function(i){						   
// 						 if($(this).outerHeight()<min){
// 						    min=$(this).outerHeight();
// 							min_key=i;
// 						 }							   
// 					  });
// 					  return min_key;
// 				   }
// 				   function getElements(){//获取资源
// 				      $.waterfall.load_index++;
// 				      return setting.getResource($.waterfall.load_index,public_render);
// 				   }
// 				   waterfall._scrollTimer=null;//延迟滚动加载计时器
// 				   function onScroll(){//滚动加载
// 				      clearTimeout(waterfall._scrollTimer);
// 					  waterfall._scrollTimer=setTimeout(function(){
// 					      var $lowest_column=waterfall.$columns.eq(calculateLowest());//最短列
// 						  var bottom=$lowest_column.offset().top+$lowest_column.outerHeight();//最短列底部距离浏览器窗口顶部的距离
// 						  var scrollTop=document.documentElement.scrollTop||document.body.scrollTop||0;//滚动条距离
// 						  var windowHeight=document.documentElement.clientHeight||document.body.clientHeight||0;//窗口高度
// 						  if(scrollTop>=bottom-windowHeight){
// 							 render(getElements(),true);
// 						  }
// 					  },100);
// 				   }
// 				   function onResize(){//窗口缩放时重新排列
// 				      if(calculateColumns()==waterfall.column_num) return; //列数未改变，不需要重排
// 				      var $cells=waterfall.$waterfall.find(setting.cell_selector);
// 					  waterfall.$columns.remove();
// 					  waterfall.$columns=creatColumn();
// 				      render($cells,false); //重排已有元素时强制不渐显
// 				   }
// 				})(jQuery);
			
			
// 			var opt={
// 					  getResource:function(index,render){//index为已加载次数,render为渲染接口函数,接受一个dom集合或jquery对象作为参数。通过ajax等异步方法得到的数据可以传入该接口进行渲染，如 render(elem)
// 						  if(index>=7) index=index%7+1;
// 						  var html='';
// 						  for(var i=20*(index-1);i<20*(index-1)+20;i++){
// 							 var k='';
// 							 for(var ii=0;ii<3-i.toString().length;ii++){
// 						        k+='0';
// 							 }
// 							 k+=i;
// 						     var src="http://cued.xunlei.com/demos/publ/img/P_"+k+".jpg";
// 							 html+='<div class="cell"><a href="#"><img src="'+src+'" /></a><p>'+k+'</p></div>';
// 						  }
// 						  return $(html);
// 					  },
// 					  auto_imgHeight:true,
// 					  insert_type:1
// 					}
// 					$('#showMainDiv').waterfall(opt);
			
			
			
			
		</script>
	</body>
</html>
