<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="labelEditForm" class="itemForm" method="post">
        <input type="hidden" name="id"/>
        <input type="hidden" name="labelStatus"/>
        <table cellpadding="5">
            <tr>
                <td>内容</td>
                <td><input class="easyui-textbox" name="content"
                           data-options="multiline:true,validType:'length[0,150]'"
                           style="height:60px;width: 280px;"></input></td>
            </tr>
        </table>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
    </div>
</div>
<script type="text/javascript">
    function submitForm() {
        if (!$('#labelEditForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }
        $.post("/label/update", $("#labelEditForm").serialize(), function (data) {
            if (data.status == 200) {
                $.messager.alert('提示', '修改分类成功!', 'info', function () {
                    $("#labelEditWindow").window('close');
                    $("#labelList").datagrid("reload");
                });
            }
        });
    }
</script>
