<%--
  Created by IntelliJ IDEA.
  User: jzb
  Date: 2017/5/10
  Time: 10:01
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
    <div style="width:80%; height:60%; position:absolute; top:1px; left:1px; z-index:9">
        <iframe width="100%" height="100%" src="http://720yun.com/t/6fdjO7tmrk3"></iframe>
    </div>
    <div class="content" style="width:180px; height:180px; position:absolute; top:30px; left:1px; z-index:99;opacity: 0.8;">
        <p>当前项目:测试项目</p>
        <p>拍摄时间:2017.05.08</p>
        <p>拍摄楼层:1幢1层</p>
        <p>采集员:张萍</p>
        <p>所属单位:施工单位</p>
        <p><button class="btn btn-primary" type="button" onclick="$('#compareDiv').modal('show');">对比</button></p>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" id="compareDiv">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">图片对比</h4>
                </div>
                <div class="modal-body">
                    <form class="form-inline">
                        <div class="checkbox">
                            <label>
                                <input type="radio" value="采集员1" name="userRadio"> 采集员1
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="radio" value="采集员2" name="userRadio"> 采集员2
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="radio" value="采集员3" name="userRadio"> 采集员3
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="compare();">对比</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <script src="/script/jquery-2.1.3.min.js"></script>
    <script src="/script/bootstrap.min.js"></script>
    <script>
        function compare()
        {
            var _val = $('input:radio:checked').val();
            if(_val == undefined || _val.length == 0)
            {
                alert("请选择需要对比的拍摄人员");
                return;
            }
            location.href = '/vr/compare.do?userName=' + _val;
        }
    </script>
</body>
</html>
