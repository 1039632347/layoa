layui.use([ 'table', 'layer', 'form' ], function() {
	var $ = layui.$;
	var form = layui.form;
	var table = layui.table;
	var layer = layui.layer;

	// 第一个实例
	table.render({
		elem : '#demo'// 要绑定的元素
		,
		height : 500 // 高度设置
		,
		url : 'role' // 数据接口
		,
		where : $('#form_search').serialize()
		,
		page : true // 开启分页
		,
		cols : [ [ // 表头
		{
			field : 'rowId',
			title : 'ID',
			width : 80,
			sort : true,
			fixed : 'left'
		}, {
			field : 'roleCode',
			title : '角色编号',
			width : 180
		}, {
			field : 'roleName',
			title : '角色名称',
			width : 120
		}, {
			field : 'roleKind',
			title : '角色类型',
			width : 120,
			templet : '#roleKindTpl'
		}, {
			field : 'roleInfo',
			title : '角色简介',
			width : 177
		}, {
			field : '',
			title : '操作',
			width : 180,
			templet : '#roleBtnTpl'
		} ] ]
	});

	// 监听行工具事件
	table.on('tool(test)', function(obj) { // 注：tool 是工具条事件名，test 是 table
											// 原始容器的属性 lay-filter="对应的值"
		var data = obj.data // 获得当前行数据
		var layEvent = obj.event; // 获得 lay-event 对应的值
		var rowId = data.rowId;

		console.log(rowId);
		if (layEvent === 'del') {
			layer.confirm('真的删除行么', function(index) {

				$.ajax({
					type : 'delete',
					url : 'role/' + rowId,
					success : function(result) {
						if (result) {
							window.parent.location.reload();
							layer.close(index);
							// 向服务端发送删除指令
						}
					}
				});

			});
		} else if (layEvent === 'edit') {
			opemLayerRole(rowId);
		}
	});

	$('#btn_add').off('click').on('click', function() {
		opemLayerRole();
	});

	function opemLayerRole(rowId) {
		var titleVal = rowId == null ? '新增' : '修改';
		$.ajax({
			type : 'get',
			url : 'role/goadd',
			success : function(htmlData) {
				layer.open({
					type : 1,
					title : titleVal,
					area : '800px',
					content : htmlData,
					success : function() {
						if (rowId) {
							$.ajax({
								type : 'get',
								url : 'role/' + rowId,							
								success : function(role) {
								  form.val("form_role", role);
								 $("#roleName").data("old",role.roleName);
								  form.render(null, 'form_role');
 
										}
									});
								
							

						} else {
							form.render(null, 'form_role');
						}

					}
				});
			}
		});

	}

	form.on('submit(role_search)',function(data){
		table.reload('demo',{
			page:{
				curr:1
			}
		,where:$('#form_search').serialize()
		},'data');
		
		
		return false;
		
	});
	
	
	
});