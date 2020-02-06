<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>开始使用layui</title>
  <link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
 <!--lay-filter="form_user"  可以理解为 id="form_user"  -->
<form class="layui-form" lay-filter="form_user">
  <div class="layui-form-item">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">                         
      <input  name="roleCode" required  lay-verify="required|" placeholder="请输入角色编号" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input  name="roleName" required  lay-verify="required|checkstuname" placeholder="请输入学角色名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">角色级别</label>
    <div class="layui-input-block">
      <input type="radio" name="roleKind" value="1" title="1级">
      <input type="radio" name="roleKind" value="2" title="2级" checked>
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <input  name="roleInfo" required  lay-verify="required" placeholder="请输入学角色简介" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 
<script type="text/javascript" src="assert/layui/layui.js"></script>
<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form','laydate'], function(){
  var layer = layui.layer;
  var form = layui.form;
  var  $ = layui.$;
  var laydate = layui.laydate;
  
  laydate.render({
	  elem:'#stuBirthday'
		  });
  
  //表单的自定义校验
  form.verify({
	 checkstuname:function(value,item){
		 var msg;
		 $.ajax({
			type:'get',
			async:false,
			url:'role/checkname',
			data:{"roleName":value},
			success:function(result){
				if(result==0){
					msg="此名称已有人使用";
				}
			}
		 });
		 return msg;
	 }
	  
  });
  
  

  //绑定提交按钮
  form.on('submit(formDemo)',function(data){
	//ajax提交
	var formData = $(data.form).serialize();
	
	  $.ajax({
		    type:'post',			
			url:'role',
			data:formData,
			success:function(result){
				if(result){
			layer.msg("提交成功了");
				}
				
			}
	  });
	
	return false;
  });
  
  
  
});
</script> 
</body>
</html>
      