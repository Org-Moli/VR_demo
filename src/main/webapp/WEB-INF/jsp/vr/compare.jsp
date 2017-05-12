<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<style>
    *{margin: 0;padding: 0;}
    body{
        font-size:12px;
        font-size:0.3rem ; /* 12÷64=0.18 */
        color:white ;
    }
    .box p{
        margin-bottom: 0.1rem;
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
</style>
<script>
    //通过window.screen.width获取屏幕的宽度//这里用宽度除以30表示1rem取得的px
    var offWidth = window.screen.width / 30;
    document.getElementsByTagName("html")[0].style.fontSize = offWidth + 'px'; //把rem的值复制给顶级标签html的font-size
</script>
<body>
<div style="width: 30rem;height:12rem;">
    <div style="width: 15rem;height:12rem;float: left;">
        <iframe src="http://720yun.com/t/6fdjO7tmrk3" style="width:15rem;height:12rem;"></iframe>
        <div class="box" style="width: 8rem;height:4rem;position:absolute;z-index: 99;top:0.3rem;left:0.23rem">
            <p>当前项目:  ${infoMap.projects}</p>
            <p>拍摄时间:  <fmt:formatDate value="${infoMap.upload_time}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
            <p>拍摄楼层:  ${infoMap.chuang}幢${infoMap.storey}层</p>
            <p>采集员   :   ${infoMap.user_name}</p>
            <p>所属职位:   ${infoMap.post}</p>
        </div>
    </div>
    <div style="width: 15rem;height:12rem;float: left;">
        <iframe src="http://720yun.com/t/662jO7tmrk4" style="width: 15rem;height: 12rem;"></iframe>
        <div class="box" style="width: 8rem;height:4rem;position:absolute;z-index: 99;top:0.3rem;left:15.23rem">
            <p>当前项目:  ${infoMap1.projects}</p>
            <p>拍摄时间:  <fmt:formatDate value="${infoMap1.upload_time}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
            <p>拍摄楼层:  ${infoMap1.chuang}幢${infoMap1.storey}层</p>
            <p>采集员   :   ${infoMap1.user_name}</p>
            <p>所属职位:   ${infoMap1.post}</p>
        </div>
    </div>
</div>
</body>
</html>

