<!DOCTYPE html>
<html lang="en">
<#include "../public/taglib.ftl"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   <#-- <link rel="icon" href="../../favicon.ico">-->

    <title>角色列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}/static/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${basePath}/static/css/assets/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${basePath}/static/css/dashboard/dashboard.css" rel="stylesheet">
    <!--bootstrap-datetimepicker style -->
    <link href="${basePath}/static/css/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="${basePath}/static/css/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${basePath}/static/css/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">


</head>
<body>
<#include "../public/head.ftl" />
<div class="container-fluid">
    <div class="row">
        <#include "../public/common.ftl" />
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">查询</h1>
            <form role="form" class="form-inline" id="dateForm" method="post">
                <div class="form-group">
                    <label for="role">角色名:</label>
                    <input type="text" name="role" class="form-control"
                           id="role" placeholder="角色查询" value="${from.role!}">
                </div>
                <p></p>
                <button type="button" class="btn btn-default" onclick="onSubmit()" id="submitButton">查询</button>
            </form>
            <h2 class="sub-header">数据列表</h2>
            <div class="table-responsive">
                <input type="button" class="btn btn-primary" value="新增" onclick="edit()"/>
                <p></p>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>角色编号</th>
                        <th>角色名</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="dataBody">
                        <#list roles as p>
                            <tr>
                                <td>${p.id!}</td>
                                <td>${p.role!}</td>
                                <td>${p.remark!}</td>
                                <td>
                                    <#if p.id != 1>
                                        <input type="button" value="修改" class="btn btn-primary" onclick="edit(${p.id!})"/>
                                        <input type="button" value="删除" class="btn btn-primary" onclick="confrimDelete(${p.id!})"/>
                                    <#else>
                                        <input type="button" value="修改" class="btn btn-primary" onclick="edit(${p.id!})"/>
                                    </#if>
                                </td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${basePath}/static/js/query/jquery-1.11.0.min.js"></script>
<script src="${basePath}/static/js/jquery-confirm/jquery-confirm.min.js" ></script>
<#--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>-->
<script src="${basePath}/static/js/bootstrap/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<#--<script src="../../assets/js/vendor/holder.min.js"></script>-->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="${basePath}/static/js/assets/ie10-viewport-bug-workaround.js"></script>

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="${basePath}/static/js/assets/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="${basePath}/static/js/assets/ie-emulation-modes-warning.js"></script>
<!-- -->
<script src="${basePath}/static/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/static/js/public/page.js" ></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<!--<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
<![endif]-->
<script type="text/javascript" >
    $(function(){


    });
    function onSubmit(){
        $("#dateForm").submit();
    }

    function confrimDelete(id){
        $.confirm({
            title: '删除',
            content: '确定要删除这个角色，删除后对应的用户将无此角色权限！确定吗？',
            buttons:{
                confirm: {
                    text:'确定',
                    btnClass:'btn-primary',
                    action:function(){
                        $.ajax({
                            url:basePath + '/SystemController/deleteRole',
                            type:"post",
                            dataType:'json',
                            data:{
                                'id':id
                            },
                            success:function(data){
                                if(data.success){
                                    $.alert("成功删除！");
                                    $("#submitButton").click();
                                }
                            }
                        });
                    }
                },
                cancel: {
                    text: '取消',
                    btnClass: 'btn-primary',
                    action: function () {

                    }
                }
            }
        });
    }


    function edit(id){
        if(id == null || typeof(id)=='undefined')
            window.location.href = basePath + "/SystemController/editRole";
        else
            window.location.href = basePath + "/SystemController/editRole?id="+id;
    }
</script>
</body>
</html>
