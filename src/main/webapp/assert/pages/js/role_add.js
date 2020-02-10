layui.use(['layer', 'form','table'], function(){
  var layer = layui.layer;
  var form = layui.form;
  var  $ = layui.$;
  var table = layui.table;
  
  
  //表单的自定义校验
  form.verify({	
	 checkstuname:function(value,item){
		 var msg;
		 var oldVal =$(item).data("old");
		 if(oldVal!=null && oldVal == value){
			 return msg;
		 }else{
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
	 }
	  
  });
  
  

  //绑定提交按钮
  form.on('submit(formDemo)',function(data){
	//ajax提交
	var formData = $(data.form).serialize();
	var rowId = data.field.rowId;
	var type = "post";
	if(rowId){
		type = "put";	
	}
		   $.ajax({
		        type : type,
		    	url : 'role',
		    	data : formData,
		    	success:function(result){
		    		if(result){
		    		
		    		layer.closeAll();
		    		table.reload("demo");
		    		}
		    	}
		    
		    });	
	return false;
  });
  
  
  
});