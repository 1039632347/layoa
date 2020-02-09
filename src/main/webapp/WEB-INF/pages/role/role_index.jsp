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
    <button type="button" class="layui-btn" id="btn_add">新增</button>
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
<script>
	layui.use(['table','layer', 'form'],function(){
		var $ = layui.$;
		var form = layui.form ;
		var table = layui.table;
		var layer = layui.layer;
		  
		  //第一个实例
		  table.render({
		    elem: '#demo'//要绑定的元素
		    ,height:500 //高度设置
		    ,url: 'role' //数据接口
		    ,page: true //开启分页
		    ,cols: [[ //表头
		      {field: 'rowId', title: 'ID', width:80, sort: true, fixed: 'left'}
		      ,{field: 'roleCode', title: '角色编号', width:180}
		      ,{field: 'roleName', title: '角色名称', width:120}
		      ,{field: 'roleKind', title: '角色类型', width:120, templet:'#roleKindTpl'} 
		      ,{field: 'roleInfo', title: '角色简介', width: 177}
		      ,{field: '', title: '操作', width: 180,templet:'#roleBtnTpl'}
		    ]]
		  });
		
		  //监听行工具事件
		  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    var layEvent = obj.event; //获得 lay-event 对应的值
		    var rowId=data.rowId;
		    
		    console.log(rowId);
		   if(layEvent === 'del'){
			   layer.confirm('真的删除行么', function(index){
			        
			        $.ajax({
			        	type:'delete',
						url:'role/'+rowId,
						success:function(result){
							if(result){
								window.parent.location.reload();
								 layer.close(index);
							        //向服务端发送删除指令
							}
						}
					});
			        
			      });
		    } else if(layEvent === 'edit'){
		      //layer.msg('修改操作');
			  $.ajax({
					
					 url:'role/'+rowId,
					 
					 success:function(htmlData){
						 layer.open({
							  type: 1, 
							  title: '修改',
							  area: '800px',
							  content: htmlData, 
							 
							  success: function(){
								  form.render(null,'form_add');
								  }
							});
					 }
				 });
		    }
		  });
	
		   
		   
		   $('#btn_add').off('click').on('click',function(){
				  $.ajax({
					     type :'get',
						 url:'role/goadd',
						 
						 success:function(htmlData){
							 layer.open({
								  type: 1, 
								  title: '新增',
								  area: '800px',
								  content: htmlData, 
								 
								  success: function(){
									  form.render(null,'form_add_edit');
									  }
								});
						 }
					 });
					
				});
		   
	
	});
</script>
</html>