<%--
  Created by IntelliJ IDEA.
  User: jzb
  Date: 2017/5/9
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style>
        .content{
            padding: 25px;
            background-color: rgba(0,0,0,0.1);/* IE9、标准浏览器、IE6和部分IE7内核的浏览器(如QQ浏览器)会读懂 */
        }
        .content p{
            color: #FFFFFF;
        }
        @media \0screen\,screen\9 {/* 只支持IE6、7、8 */
            .demo{
                background-color:#000000;
                filter:Alpha(opacity=50);
                position:static; /* IE6、7、8只能设置position:static(默认属性) ，否则会导致子元素继承Alpha值 */
                *zoom:1; /* 激活IE6、7的haslayout属性，让它读懂Alpha */
            }
            .demo p{
                position: relative;/* 设置子元素为相对定位，可让子元素不继承Alpha值 */
            }
        }
    </style>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
</head>
<body>
    测试页面

    <div style="width:500px; height:500px; position:absolute; top:1px; left:1px; z-index:9">
        <iframe width="100%" height="100%" src="http://www.cnquanjing.com/tour/97d6e47bd48ed22b"></iframe>
    </div>
    <div class="content" style="width:180px; height:180px; position:absolute; top:30px; left:1px; z-index:99;opacity: 0.8;">
        <p>2017.05.08</p>
        <p>1幢1层</p>
        <p>张萍
            <a data-toggle="collapse" data-parent="#accordion"
              href="#collapseOne">展开</a>
        </p>
        <div id="collapseOne" class="panel-collapse collapse in">
            <p>王丽</p>
            <p>李林</p>
        </div>
    </div>
    <div style="width:500px; height:500px; position:absolute; top:1px; left:500px; z-index:9">
        <iframe width="100%" height="100%" src="http://www.cnquanjing.com/tour/97d6e47bd48ed22b"></iframe>
    </div>
    <div class="content" style="width:180px; height:180px; position:absolute; top:30px; left:500px; z-index:99;opacity: 0.8;">
        <p>2017.05.08</p>
        <p>1幢1层</p>
        <p>张萍</p>
    </div>
    <script src="/script/jquery-2.1.3.min.js"></script>
    <script src="/script/bootstrap.min.js"></script>
</body>
</html>
