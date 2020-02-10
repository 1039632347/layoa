<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色管理</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
    <button type="button" class="layui-btn"   id="btn_add">新增</button>
    
    <form class="layui-form" id="form_search">
    <div class="layui-input-inline">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input type="text" name="roleName"    placeholder="请输入角色名称"  class="layui-input">
    </div>
  </div>
  
  <div class="layui-input-inline">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">
      <input type="text" name="roleCode"    placeholder="请输入角色编号"  class="layui-input">
    </div>
  </div>
  
     <div class="layui-input-inline">
    <label class="layui-form-label">角色级别</label>
    <div class="layui-input-block">
  <select name="roleKind" lay-verify="">
  <option value="">请选择一个角色类型</option>
  <option value="1">超级角色</option>
  <option value="2">普通角色</option>
 
</select>
</div> 
</div> 
 
 <div class="layui-input-inline">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="role_search">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
    </form>
    
    
    
    
<table id="demo" lay-filter="test"></table>
<script type="text/html" id="roleKindTpl">
{{# if(d.roleKind ==1){}}
	<span class="layui-badge layui-bg-orange">GM</span>
{{# } else{ }}
	<span class="layui-badge layui-bg-cyan">普通玩家 </span>
{{# }}}
</script>
<script type="text/html" id="roleBtnTpl">
<button type="button" class="layui-btn layui-btn-xs" lay-event="edit">修改 </button>
{{#  if(d.roleKind ==1){ }}
  <button type="button" class="layui-btn layui-btn-danger layui-btn-disabled layui-btn-xs">删除</a>
 {{#  } else { }}
 <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 {{#  } }}
</script>


</body>
<script type="text/javascript" src="assert/layui/layui.js"></script>
<script type="text/javascript" src="assert/pages/js/role_index.js"></script>
</html>