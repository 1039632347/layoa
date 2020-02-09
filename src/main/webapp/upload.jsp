<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	学生头像：<button type="button" class="layui-btn" id="test1">
	<i class="layui-icon">&#xe67c;</i>上传图片
	</button>
 	<input type="hidden" name="stuImg" id="stuImg"/>
	<input type="hidden" name="rowId" value="35"/>


</body>
<script type="text/javascript" src="assert/layui/layui.js"></script>
<script>
	layui.use(['upload'],function(){
		var upload = layui.upload;
		var $= layui.$;
		
		upload.render({
			elem:'#test1',
			url:'upload',
			field:'uploadFile',//设定文件域的字段名
			data:{"id":function(){
				return $('#rowId').val();
			}},
			done:function(res){
				console.log(res.data);
				$('#sutImg').val(res.data);
			},
			error:function(){
				
			}
			
		});
		
	});
	

</script>
</html>