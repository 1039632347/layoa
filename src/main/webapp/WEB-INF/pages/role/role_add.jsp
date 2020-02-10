<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



 <!--lay-filter="form_user"  可以理解为 id="form_user"  -->
<form class="layui-form" lay-filter="form_role">
  <div class="layui-form-item">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">                         
      <input  name="roleCode"  required  lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input  name="roleName" id="roleName" required  lay-verify="required|checkstuname" placeholder="请输入学角色名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">角色级别</label>
    <div class="layui-input-block">
      <select name="roleKind" lay-verify="required">
  <option value="">请选择一个角色类型</option>
  <option value="1" >超级角色</option>
  <option value="2" >普通角色</option>
 
</select>
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <input  name="roleInfo"  required  lay-verify="required" placeholder="请输入学角色简介" autocomplete="off" class="layui-input">
    </div>
  </div>
    <input class="layui-hide" name="rowId" />
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 

<script type="text/javascript"  src="assert/pages/js/role_add.js"></script> 

      