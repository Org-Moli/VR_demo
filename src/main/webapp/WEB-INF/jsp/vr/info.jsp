<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>全景详情</title>
    <script src="/script/jquery-1.11.0.js"></script>
    <style>
        *{margin: 0;padding: 0;}
        body{
            font-size:12px;
            font-size:0.3rem ; /* 12÷64=0.18 */
            color:white ;
            font-family: "微软雅黑";
        }
        .box{
            width: 8rem;
            height:4rem;
            position:absolute;
            z-index: 99;
            top:0.3rem;
            left:0.23rem;
        }
        .box p{
            font-size: 0.25rem;/*16px*/
            margin-bottom:20px;/*20px*/
            color: #FFFFFF;
            font-family: "微软雅黑";
        }
        .box #btn{
            color: #FFFFFF;
            font-size: 0.25rem;/*16px*/
            width: 100px;
            height: 34px;
            background: #1c7bed;
            border:none;
            margin-left: 20px;
        }
        .show{
            display: none;
            width:8rem;
            height: 0rem;
            position: absolute;
            z-index:100000;
            left:11rem;
            bottom:5rem;
            top:200px;
        }
        .show .inp{
            margin-right: 1.4rem;
            float: left;
            color: black;
        }
        p{margin:0;padding:0;}
        .jiaoliu_div{
            position: fixed;
            width:340px;
            height:600px;
            background: #fff;
            right:-354px;
            top:50%;
            margin-top:-300px;
            z-index: 111;
        }
        .jiaoliu_header{
            height:36px;
            background: #189FD9;
            padding:0 10px;
            cursor:pointer;
        }
        .jiaoliu_header span:nth-of-type(1){
            font-size: 12px;
            line-height: 36px;
            color: #666;
            float:right;
        }
        .jiaoliu_header_btn{
            height:36px;
            border:0;
            font-size: 28px;
            margin-top: 5px;
            color:#fff;
            background: #189FD9;
            margin:0;
            cursor:pointer;
        }
        .jiaoliu_header_btn small{
            font-size: 13px;
            position: absolute;
            top:10px;
            left:34px;
            cursor:pointer;
        }
        .jiaoliu_content{
            height:560px;
            overflow: auto;
            padding:0 20px;
        }
        .jiaoliu_content_list{
            padding:14px 12px;
            height:90px;
            box-sizing: border-box;
            border-bottom:1px solid #989898 ;
            position: relative;
            cursor:pointer;
        }
        .jiaoliu_content_list_left{
            float:left;
            width:46px;
            margin-right: 10px;
            text-align: center;
            font-size: 14px;
            color:#189FD9;
        }
        .jiaoliu_content_list_left>img{
            width:46px;
            height:46px;
        }
        .jiaoliu_content_list_right{
            font-size: 14px;
            color:#000;
        }
        .jiaoliu_content_list_time{
            position: absolute;
            font-size: 12px;
            color:#666;
            bottom:10px;
            right:12px;
        }
        .kuang{
            width:100%;
            height:100%;
            background: #999;
            filter:alpha(opacity=60); /*IE滤镜，透明度50%*/
            -moz-opacity:0.6; /*Firefox私有，透明度50%*/
            opacity:0.6;/*其他，透明度50%*/
            position: fixed;
            left: 0;
            top:0;
            display: none;
            z-index: 110;
        }
        .kuang_content1{
            width:416px;
            height:220px;
            position: fixed;
            box-sizing: border-box;
            left:50%;
            bottom: 30%;
            margin-left:-315px;
            background: #fff;
            display: none;
            z-index: 111;
        }
        .kuang_content1 p:nth-of-type(1){
            height:36px;
            background: #1c7bef;
            line-height: 36px;
            color:#fff;
            font-size: 14px;
            padding-left:10px ;
        }
        .kuang_content1>textarea{
            width:376px;
            height:100px;
            margin: 20px 20px 10px;
            border:none;
            background: #fafafa;
        }
        .kuang_content1_p2{
            padding:0 88px;
            height:35px;
            color:#000;
            cursor: pointer;
        }
        .kuang_content1 input,.kuang_content1 button{
            width:100px;
            height:35px;
            background: #fff;
            border:1px solid #000;
            border-radius: 10px;
            cursor: pointer;
        }
        .kuang_content1 input{
            float:left;
            background: #1c7bef;
            border:0;
        }
        .kuang_content1 button{
            float: right;
        }
        .kuang_content2{
            width:560px;
            height:440px;
            position: fixed;
            box-sizing: border-box;
            left:50%;
            bottom: 30%;
            margin-left:-280px;
            padding:28px 10px 10px 10px;
            background: #F3F3F3;
            display: none;
            z-index: 111;
        }
        .kuang_content2_close{
            width:40px;
            height:40px;
            line-height: 40px;
            text-align: center;
            background: none;
            position: absolute;
            right:0;
            top:0;
            border:none;
            font-size: 28px;
            color:#189FD9;
            cursor: pointer;
        }
        .kuang_content2_wen_left{
            float:left;
            width:54px;
            height:84px;

        }
        .kuang_content2_wen_left>img{
            width:38px;
            height:45px;
        }
        .kuang_content2_wen_right,.kuang_content2_da_right{
            float:right;
            width:484px;
        }
        .kuang_content2_wen_right small,.kuang_content2_da_right small{
            margin-left: 20px;
        }
        .kuang_content2_wen_right_time,.kuang_content2_da_right_time{
            font-size: 12px;
            color:#666;
            line-height: 30px;
        }
        .kuang_content2_wen_right_text,.kuang_content2_da_right_text{
            font-size: 14px;
            width:86%;
        }
        .kuang_content2_da{
            height:270px;
            background: #fff;
            border:1px solid #eee;
            border-radius: 10px;
            margin-top: 16px;
            overflow: auto;
            margin-left: 54px;
        }
        .kuang_content2_da>p{
            font-size: 14px;
            padding-left: 71px;
            color:#666;
            line-height: 22px;
            border:1px solid #eee;
        }
        .kuang_content2_da_right{
            padding:8px 0 0;
            position: relative;
        }
        .kuang_content2_da_right>img{
            width:30px;
            height:34px;
            position: absolute;
            left:-40px;
            top:10px;
        }
        .kuang_content2_da_right_text{
            border-bottom:1px solid #eee;
            padding-bottom: 4px;
            color:#000 ;
        }
        .kuang_content2_da_right_time{
            line-height: 20px;
            color:#000 ;
            padding-right: 10px;
        }
        .kuang_content2_da_right_time>span:nth-of-type(2){
            float:right;
            color:#333;
        }
        .kuang_content2_da_right{
            width:396px;
        }

        .kuang_content2_wen_right_text,.kuang_content2_da_right_text{
            margin-left: 30px;
            color:#000 ;
        }
        .kuang_content2_da_right_text{
            margin-top: 4px!important;
        }
        .kuang_content2_da_right>p{
            color:#000;
            margin-left: 0px;
        }
        .kuang_content2_da_footer{
            background: #fff;
            height: 41px;
            position: absolute;
            left:0;
            bottom:0;
            width:560px;
            font-family: "微软雅黑";
        }
        .kuang_content2_da_footer>input{
            height: 24px;
            border:0;
            width:454px;
            background: #ececec;
            border-radius:6px;
            margin:9px 18px;
            font-family: "微软雅黑";
        }
        .kuang_content2_da_footer>button{
            height:26px;
            width:50px;
            background: #1c7bef;
            border:0;
            border-radius: 8px;
            color: white;
            font-family: "微软雅黑";
            cursor:pointer;
        }
        .foot{
            width: 2.27rem;
            height: 2rem;
            margin-right: 0.5rem;
            float: left;
            margin-top: 0.1rem;
        }
        .foot img{
            width: 2.27rem;
            height: 2rem;
        }
        .jiaoliu_div_hide{
            position: absolute;
            left:-20px;
            top:50%;
            margin-top: -24px;
            height:48px;
            width:16px;
            background: #fff;
            color:#189FD9;
            padding:2px;
        }
        .bigbox{
            width: 100vw;
            height:100vh;
            box-sizing: border-box;
            position: relative;
        }
        .bigbox_l{
            width: 100%;
            height:100%;
            box-sizing: border-box;
            float: left;
            z-index: -1;
            position:absolute;
        }
        .bigbox_l iframe{
            width: 99.9%;
            height:99.42%;
            box-sizing: border-box;
            z-index: -1;
        }
        .jiaoliu_div_show{
            width:65px;
            height:100px;
            position:fixed;
            z-index: 100;
            background:url(/img/bg.png) no-repeat;
            background-size:65px 100px;
            right:-1px;
            top:50%;
            padding-top:7px;
            border-radius: 0.2rem 0 0.2rem 0;
            text-align: center;
            font-size: 16px;
            cursor:pointer;
        }
        .show_t{
            background:#1C7BEF;
            width:7.9rem;
            height: 0.7rem;
            line-height: 0.8rem;
            padding-left: 0.1rem;
            color: #FFFFFF;
        }
        .show_top{
            width:6.4rem;
            height: 0.5rem;
            background: white;
            padding: 0.3rem 0.8rem 0 0.8rem;
            color: black;
        }
        .show_center{
            width:6rem;
            height: 0.9rem;
            background: white;
            padding: 0.2rem 1rem 0.1rem 1rem;
        }
        .show_bottom{
            width:5.5rem;
            height:1rem;
            background: white;
            padding: 0 0 0.2rem 2.5rem;
        }
        #StarC{
            width:3rem;
            height: 0.8rem;
            background:#DFDFDF;
            border-radius: 5px;
            border:none;
            cursor:pointer;
            color: white;
            font-size: 14px;
            font-family: "微软雅黑";
        }
        .kuang_content1_hide{
            float:right;
            font-size: 28px;
            padding:0 10px;
            cursor: pointer;
        }
        #btn{
            font-family: "微软雅黑";
            cursor:pointer;
        }
    </style>
    <script>
        window.onload=function(){
            //通过window.screen.width获取屏幕的宽度//这里用宽度除以30表示1rem取得的px
            var offWidth = window.screen.width / 30;
            document.getElementsByTagName("html")[0].style.fontSize = offWidth + 'px'; //把rem的值复制给顶级标签html的font-size
            $("#StarC").click(function(){//当选择人数小于两个得时候 不比对
                if($("input[name='oneBox']:checked").length<2){
                    return false;
                }else{
                    var idArr = [];
                    $("input[name='oneBox']:checked").each(function(){
                        idArr.push($(this).val());
                    });
                    var url = '/vr/compare.do?idStr='+idArr;
                    openURL(url);
                    $("input[name='oneBox']:checked").each(function(){
                        $(this).prop("checked",false);
                    });
                    $(".kuang,.show").hide();
                    $("#StarC").css('background','');
                }
            });

        }
    </script>
</head>

<body>
<div class="bigbox">
    <div class="bigbox_l" style="z-index: 9988">
        <iframe src="http://720yun.com/t/6fdjO7tmrk3"></iframe>
    </div>
    <div class="box" style="z-index:9989;">
        <p>当前项目:  ${infoMap.projects}</p>
        <p>拍摄时间:  <fmt:formatDate value="${infoMap.upload_time}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
        <p>拍摄楼层:  ${infoMap.chuang}幢${infoMap.storey}层</p>
        <p>采集员   :   ${infoMap.user_name}</p>
        <p>所属职位:   ${infoMap.post}</p>
        <button id="btn">图片对比</button>
    </div>
    <!--<div class="jiaoliu_div_show">
        <p>交</p>
        <p>流</p>
        <p>区</p>
        <p style="color: red;">（5）</p>
    </div>-->
    <div class="show" style="z-index:9990;">
        <div class="show_t">图片比对</div>
        <div class="show_top">当前楼层三位人员拍照，请选择两人进行对比。</div>
        <div class="show_center">
            <c:forEach items="${listChuang}" var="chuang" varStatus="st">
                <c:choose>
                    <c:when test="${st.count % 3 == 0}">
                        <div class="inp" style="margin-right:0 ;"><input name="oneBox" value="${chuang.id}" onclick="changeCmp();" type="checkbox"/>${chuang.user_name}</div>
                    </c:when>
                    <c:otherwise>
                        <div class="inp"><input name="oneBox" type="checkbox" value="${chuang.id}" onclick="changeCmp();"/>${chuang.user_name}</div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <div class="show_bottom">
            <button id="StarC">开始对比</button>
        </div>
    </div>
</div>
<div class="jiaoliu_div_show" style="z-index: 9990">
    <p>交</p>
    <p>流</p>
    <p>区</p>
    <p style="color: red;" id="pCnt">（${fun:length(listQuestionInfo)}）</p>
</div>
<div class="jiaoliu_div" style="z-index:9990;">
    <!--<p class="jiaoliu_div_hide">&gt;&gt;隐藏</p>-->
    <input type="hidden" value="${fun:length(listQuestionInfo)}" id="questionCnt"/>
    <div class="jiaoliu_header">
        <button class="jiaoliu_header_btn">+<small>新增问题</small></button>
        <span id="cntText">共${fun:length(listQuestionInfo)}条</span>
    </div>
    <div class="jiaoliu_content" id="jiaoliuContent">
        <c:forEach items="${listQuestionInfo}" var="question">
            <div class="jiaoliu_content_list" onclick="showContent(${question.id});">
                <p class="jiaoliu_content_list_left">
                    <img src="/img/touxiang.jpg"  />${question.userName}
                </p>
                <p class="jiaoliu_content_list_right">${question.content}</p>
                <p class="jiaoliu_content_list_time"><fmt:formatDate value="${question.createTime}" pattern="MM月dd日 HH:mm"/></p>
            </div>
        </c:forEach>
    </div>
</div>
<div class="kuang" onclick="hideQuestion();" style="z-index:9989;"></div>
<div class="kuang_content1" style="z-index:9990;">
    <p>问题详情<span  class="kuang_content1_hide">×</span></p>
    <textarea name="questionContent" id="questionContent" rows="" cols="" placeholder="请输入全景图中发现的问题"></textarea>
    <p class="kuang_content1_p2"><input type="button" value="发布" onclick="askQuestion();"></button><button type="button" id="cancleBtn">取消</button></p>
</div>
<div class="kuang_content2" style="z-index:9990;">
    <span class = "kuang_content2_close">×</span>
    <div class="kuang_content2_wen">
        <div  class="kuang_content2_wen_left">
            <img src="/img/touxiang.jpg" />
        </div>
        <div class="kuang_content2_wen_right" id="conte_tmplDiv">
            <p style="color:#000 ;"><big style="color:#189FD9;font-size: 16px;" id="userNameTr"></big><small id="postTr"></small></p>
            <p class="kuang_content2_wen_right_time" id="dateTr"></p>
            <p class="kuang_content2_wen_right_text" id="contetnTr"></p>
        </div>
    </div>
    <div style="clear: both;"></div>
    <div class="kuang_content2_da" id="kuang_content2_daDiv">
        <p id="kuangCnt" alt="">0个回答</p>
        <script type="text/x-jquery-tmpl" id="kuangTmpl">
        <div class="kuang_content2_da_right">
            <img src="/img/touxiang.jpg" />
            <p style="color:#189FD9;font-size: 16px;">#[$data.userName]</p>
            <p class="kuang_content2_da_right_time"><span>#[$data.post]</span><span>#[$data.createDate]</span></p>
            <p class="kuang_content2_da_right_text">#[$data.content]</p>
        </div>
        </script>
    </div>
    <div class="kuang_content2_da_footer">
        <input type="text" placeholder="请输入评论" alt="" id="remarkContent"/><button type="button" onclick="saveRemark();">回复</button>
    </div>
</div>
<script type="text/javascript" src="/script/jquery.tmpl.min.js"></script>
<script>
    function askQuestion()
    {
        var _questionContent = $("#questionContent").val();
        if(_questionContent.length == 0)
        {
            alert("请输入问题内容");
            return;
        }
        $.ajax({
            url:'/questionAjax/saveQuestionInfo.do',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            data:{
                userId:-1,
                id:${id},
                userName:"${org_userName}",
                post:"${org_post}",
                content:_questionContent
            },
            success: function ( result )
            {
                if(result.success)
                {
                    var date = new Date();
                    var _month = (date.getMonth() + 1) < 10 ? ("0" + (date.getMonth() + 1)) : date.getMonth() + 1;
                    var _day = date.getDay() < 10 ? ("0" + date.getDay()) : date.getDay() ;
                    $(".kuang_content1").hide();
                    $("#questionContent").val("");
                    var _html = "<div class=\"jiaoliu_content_list\" onclick='showContent("+result.id+");'>";
                    _html += "  <p class=\"jiaoliu_content_list_left\"><img src=\"/img/touxiang.jpg\"  />${org_userName}</p>";
                    _html += "  <p class=\"jiaoliu_content_list_right\">"+_questionContent+"</p>";
                    _html += "<p class=\"jiaoliu_content_list_time\">"+ _month  +"月"+ _day +"日"+date.getHours()+":"+date.getMinutes()+"</p>";
                    $("#jiaoliuContent").prepend(_html);

                    var _questionCnt = parseInt($("#questionCnt").val());
                    $("#questionCnt").val(_questionCnt + 1);
                    $("#cntText").text("共" + (_questionCnt + 1) + "条");
                    $("#pCnt").text("（"+(_questionCnt + 1)+"）");

                }
            }
        });
    }
    function openURL(url)
    {
        var tempwindow=window.open();
        tempwindow.location = url;
    }
    function changeCmp()
    {
        if($("input[name='oneBox']:checked").length>=2)
        {
            $("input[name='oneBox']:not(:checked)").each(function() {
                $(this).attr("disabled",true);
            });
            $("#StarC").css('background','#1C7BEF');
        }
        else
        {
            $("input[name='oneBox']:not(:checked)").each(function() {
                $(this).attr("disabled",false);
            });
            $("#StarC").css('background','');
        }
    }
    $("#btn").click(function(){//点击对比图片
        $(this).css({'background-color':'#1264c8'});
        $(".kuang").animate({opacity:"0.6"}, 0);
        $(".kuang,.show").show();
        $(".show").animate({height : "4rem"}, 500);
    });
    $(".jiaoliu_header_btn").click(function(){//点击新增问题
        //$(".kuang_content2_close").click();
        $(".kuang_content2").hide();
        $(".kuang").animate({opacity:"0.6"}, 0);
        $(".kuang,.kuang_content1").show();
        $(".kuang_content1").animate({height : "220px"}, 500);
    });
    $(".kuang_content1 button").click(function(){
        $(".kuang_content1").hide();
        $(".kuang").animate({opacity:"0"}, 500,function(){
            $(".kuang").hide();
        });
    });
    $(".kuang").click(function(){
        $(".kuang,.kuang_content1,.kuang_content2,.show").hide();
    });
    $(".kuang_content1 input").click(function(){
        //$(".kuang,.kuang_content1").hide();
    });

    $(".kuang_content2_close").click(function(){
        $(this).css({background:"#1264c8",color:"#fff"});
        setTimeout(function(){
            $(".kuang_content2").hide();
            $(".kuang").animate({opacity:"0"}, 300,function(){
                $(".kuang").hide();
                $(".kuang_content2_close").css({background:"none",color:"#189FD9"});
            });
        },200);

    });
    function showContent(id){
        $('.kuang_content1').hide();
        $("#remarkContent").attr("alt",id);
        $.ajax({
            url:'/questionAjax/getQuestionById.do',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            data:{
                id:id
            },
            success: function ( result )
            {
                $("#userNameTr").text(result.questionMap.userName);
                $("#postTr").text(result.questionMap.post);
                $("#dateTr").text(result.questionMap.date);
                $("#contetnTr").text(result.questionMap.content);

                loadRemarkInfo(id);
            }
        });

        $(".kuang").animate({opacity:"0.6"}, 0);
        $(".kuang,.kuang_content2").show();
        $(".kuang_content1").animate({height : "220px"}, 500);
    }

    function loadRemarkInfo(id)
    {
        $.ajax({
            url:'/questionAjax/listQuestionRemarkByQuestionId.do',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            async:false,
            data:{
                questionId:id
            },
            success: function ( result )
            {
                $(".kuang_content2_da_right").remove();
                if(result.remarkList != undefined && result.remarkList.length > 0)
                {
                    $("#kuang_content2_daDiv").css("display","block");
                    $("#kuangCnt").text(result.remarkList.length + "个回答");
                    $("#kuangTmpl").tmpl(result.remarkList).insertAfter("#kuangCnt");
                    $("#kuangCnt").attr("alt",result.remarkList.length);
                }
                else
                {
                    $("#kuang_content2_daDiv").css("display","none");
                    $("#kuangCnt").attr("alt","0");
                }
            }
        });
    }
    function saveRemark()
    {
        var _remarkContent = $("#remarkContent").val();
        if(_remarkContent.length == 0)
        {
            alert("请输入评论内容");
            return;
        }
        $.ajax({
            url:'/questionAjax/saveQuestionRemark.do',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            data:{
                userId:-1,
                userName:"${org_userName}",
                content:_remarkContent,
                post:"${org_post}",
                questionId:$("#remarkContent").attr("alt")
            },
            success: function ( result )
            {
                if(result.success)
                {
                    var date = new Date();
                    var _month = (date.getMonth() + 1) < 10 ? ("0" + (date.getMonth() + 1)) : date.getMonth() + 1;
                    var _day = date.getDay() < 10 ? ("0" + date.getDay()) : date.getDay() ;
                    var _html = "<div class=\"kuang_content2_da_right\">";
                        _html +=    "<img src=\"/img/touxiang.jpg\" />";
                        _html +=    "<p style=\"color:#189FD9;font-size: 16px;\">${org_userName}</p>";
                        _html +=    "<p class=\"kuang_content2_da_right_time\"><span>${org_post}</span><span>"+_month+"月"+_day+"日"+date.getHours()+":"+date.getMinutes()+"</span></p>";
                        _html +=    "<p class=\"kuang_content2_da_right_text\">"+_remarkContent+"</p>";
                        _html += "</div>";
                    $("#kuangCnt").after(_html);
                    var _kuangCnt = $("#kuangCnt").attr("alt");
                    $("#kuangCnt").attr("alt",parseInt(_kuangCnt) + 1);
                    $("#kuangCnt").text((parseInt(_kuangCnt) + 1) + "个回答");
                    $("#remarkContent").val("");
                    $("#kuang_content2_daDiv").css("display","block");
                }
            }
        });
    }
    $(".jiaoliu_div_show p").click(function(){
        console.log(parseInt($(".jiaoliu_div").css('right')))
        if(parseInt($(".jiaoliu_div").css('right')) < -40){
            $(".jiaoliu_div").animate({right : "0px"}, 500);
            $(".jiaoliu_div_show").animate({right : "334px"}, 500);
        }else{
            $(".jiaoliu_div").animate({right : "-344px"}, 500);
            $(".jiaoliu_div_show").animate({right : "-10px"}, 500);
        }
        $(".kuang").show();
    });
    $(".jiaoliu_div_hide").click(function(){
        $(".jiaoliu_div").animate({right : "-354px"}, 500);
    });
    $(".kuang_content1_hide").click(function(){
        $(this).css({background:"#1264c8"});
        setTimeout("$('.kuang,.kuang_content1').hide();$('.kuang_content1_hide').css({background:'#1c7bef'});",200)
    });
    function hideQuestion()
    {
        if(parseInt($(".jiaoliu_div").css('right')) > -40){
            $(".jiaoliu_div").animate({right : "-344px"}, 500);
            $(".jiaoliu_div_show").animate({right : "-10px"}, 500);
        }
    }
</script>
</body>
</html>
