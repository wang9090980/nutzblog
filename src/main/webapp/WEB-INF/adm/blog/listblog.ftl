<#include "../common/header.ftl">
<body class="no-skin">
<#include "../common/navbar.ftl">

<div class="main-container ace-save-state" id="main-container">
<#include "../common/sidebar.ftl">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="/adm/index">Home</a>
                    </li>
                    <li>
                        <a href="#">博客管理</a>
                    </li>
                    <li class="active">博客列表</li>
                </ul>
            </div>
            <div class="page-content">
                <!-- /.ace-settings-container -->
            <#--<div class="page-header">-->
            <#--<h1>-->
            <#--博客列表-->
            <#--<small>-->
            <#--<i class="ace-icon fa fa-angle-double-right"></i>-->
            <#--</small>-->
            <#--</h1>-->
            <#--</div>-->
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-md-12">
                        <form class="form-inline">
                            <div class="form-group">
                                <input type="text" class="form-control input-sm" id="txt_q" placeholder="标题">
                            </div>
                            <button id="btn_q" type="button" class="btn btn-info btn-xs">
                                搜索
                            </button>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <table class="table  table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>标题</th>
                                <th>时间</th>
                                <th>状态</th>
                                <th>管理</th>
                            </tr>
                            </thead>
                            <tbody id="list_tbody">
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-12">
                                <ul id="pager" class="pagination">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.page-content -->
        </div>
    </div>
<#include "../common/footer.ftl">
</div>

<#include  "../common/endjs.ftl">

<script id="template_list" type="text/html">
    {{each datas as value i}}
    <tr>
        <td>{{value._id}}</td>
        <td>{{value._title}}</td>
        <td>{{value.ut}}</td>
        <td>{{if value._isdraft ==0 }} 已发布 {{else}} 草稿{{/if}}</td>
        <td>
            <a href="javascript:del({{value._id}});">删除</a>
            <a target="_self" href="/adm/wblog/?_id={{value._id}}">编辑</a>
            <a target="_blank" href="/page/{{value._id}}/{{value._titleen}}.html">预览</a>
            <a target="_blank" href="/html/single/{{value._id}}">[生成html]</a>
        </td>
    </tr>
    {{/each}}
</script>


<script>
    function del(id) {
        if (confirm("确定删除吗?")) {
            $.get("/adm/single_mgr/del/?id=" + id + "", function (rs) {
                if (rs == "ok") {
                    window.location.reload();
                } else {
                    alert(rs);
                }
            });
        }
    }

    $(function () {
        page(1);
        $("#btn_q").bind("click", function () {
            page(1);
        });
    });

    function page(pageno) {
        var txt_q = $("#txt_q").val();
        $.post("/adm/single_mgr/doshowlist/?pageno=" + pageno + "&t=" + new Date().getTime() + "", {"txt_q": txt_q}, function (data) {
            console.log(data);
            var html = template('template_list', data);
            $("#list_tbody").html(html);
            $("#pager").html(data["pages"]);
        })
    }


</script>
</body>
</html>