<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!--lay-filter="form_user"  可以理解为 id="form_user"  -->
<form class="layui-form" lay-filter="form_user">
  <div class="layui-form-item">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">                         
      <input  name="roleCode" value="${role.roleCode}" required  lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input  name="roleName" value="${role.roleName}" required  lay-verify="required|checkstuname" placeholder="请输入学角色名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">角色级别</label>
    <div class="layui-input-block">
      <select name="roleKind" lay-verify="required">
  <option value="">请选择一个角色类型</option>
  <option value="1" ${roleEdit.roleKind==1?'selected':''}>超级角色</option>
  <option value="2" ${roleEdit.roleKind==2?'selected':''}>普通角色</option>
 
</select>
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <input  name="roleInfo" value="${role.roleInfo}" required  lay-verify="required" placeholder="请输入学角色简介" autocomplete="off" class="layui-input">
    </div>
  </div>
    <input type="hidden" name="rowId" id="rowId" value="${role.rowId}" />
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 

<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form',], function(){
  var layer = layui.layer;
  var form = layui.form;
  var  $ = layui.$;
  var rowId=$("#rowId").val();
  
  
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
	if(rowId){
		$.ajax({
			type :'put',
			url:'role',
			data:formData,		
			success:function(result){
	    		if(result){
	    		layer.msg('提交成功！！');
	    		$(data.form)[0].reset();
	    		
	    		}
	    	}
		});	
	}else {
		   $.ajax({
		        type :'post',
		    	url: 'role',
		    	data: formData,
		    	success:function(result){
		    		if(result){
		    		layer.msg('提交成功！！');
		    		$(data.form)[0].reset();
		    		
		    		}
		    	}
		    
		    });
		
	}
	
	  layer.close(layer.index);
	    
	    table.reload("demo");
	
	return false;
  });
  
  
  
});
</script> 

      