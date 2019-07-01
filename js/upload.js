var selectedFileList = [];//已选文件列表
var paramTaskId = "";//请求参数
var succsessCount = 0;//上传成功文件个数
var errorCount = 0;//上传失败文件个数
$(function () {
	$("#btAdd").bind("click", function (e) {
		selectedFileList = [];
		$("#uploadpicker").click();
	});
	
	$("#uploadpicker").bind("change", function () {//绑定文件选择事件
		var files = $("#uploadpicker").prop("files");
		$.each(files, function (index, item) {
			var choiseFile = $("#checkfileList>li");
			if (choiseFile.length > 0) {  //文件去重
				var count = 0;
				$.each(choiseFile, function (index1, item1) {
					if (item.name == item1.innerText) {
						count++;
					}
				});
				if (count == 0) {
					if (checkFileLength(item.size)) {
//						$("#checkfileList").append("<li class=\"fileinfo\">" + item.name + 
//								"<a style=\"display: none; color: red; margin-left: 10px;\" href=\"javascript:void(0)\" onclick=\"RemoveFile(this)\">删除</a>" + 
//								"</li>");
						selectedFileList.push(item);
						//AddMoushover();
					}
				}
			} else {  //原文件列表为空
				if (checkFileLength(item.size)) {
//					$("#checkfileList").append("<li class=\"fileinfo\">" + item.name + 
//							"<a style=\"display: none; color: red; margin-left: 10px;\" href=\"javascript:void(0)\" onclick=\"RemoveFile(this)\">删除</a>" + 
//							"</li>");
					selectedFileList.push(item);
					//AddMoushover();
				}
			}
		});
		uploadFile();
		show_upload();  //in functions.js
	});  //bind function()
	//AddMoushover();
});  //function ()

//判断文件是否超过限制大小
function checkFileLength(fileLen) {
	if (fileLen > 4194304) {
		$.messager.alert("提示", "上传文件大小不能超过4M","error");
		return false;
	}
	return true;
}

//上传文件
function uploadFile() {
	if (selectedFileList.length<=0) return;
//		$.messager.progress({
//			title: "提示",
//			msg: "文件上传中..."
//		});
	$("#msg1").html('');
	$.each(selectedFileList, function (index, item) {
			//debugger;
			var dataform = new FormData();  //FormData对象是html5的一个对象，目前的一些主流的浏览器都已经兼容。
			dataform.append("file1", item);
			$.ajax({
				url: "do_upload.php",
				type: "POST",
				data: dataform,
	            //dataType:"json", //声明成功使用json数据类型回调
				async:  false,  //同步, 等待.
	            //如果传递的是FormData数据类型，那么下来的三个参数是必须的，否则会报错
	             cache: false,  //默认是true，但是一般不做缓存
	             processData: false,  //用于对data参数进行序列化处理，这里必须false；如果是true，就会将FormData转换为String类型
	             contentType: false,  //一些文件上传http协议的关系，自行百度，如果上传的有文件，那么只能设置为false	             
	             success: function(msg){  //请求成功后的回调函数
	                $("#msg1").append(msg);
	             },
	             error : function(msg) {  
	                 $( '#msg1').append("错误: 文件上传失败。" + msg);  
 	             }  
			}) //ajax
		});

}

//移除已选择的文件
function RemoveFile(obj) {
	$.messager.confirm("提示", "确认删除当前文件?", function(e) {
		if (e) {
			var index = $("#checkfileList>li").index($(obj).parent());
			selectedFileList.splice(index, 1);
			$(obj).parent().remove();
		}
	});
}
//添加鼠标经过事件，鼠标划过时显示“删除”
function AddMoushover() {
	$(".fileinfo").hover(
			function () {
				$(this).find("a").last().css("display", "");
			}, 
			function () {
				$(this).find("a").last().css("display", "none");
	});
}