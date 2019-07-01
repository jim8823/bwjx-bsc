
$(document).ready(function () {
	//show_upload();
});

function show_upload() {
	$.ajax({
		url: "do_action.php?action=SHOW_UPLOAD",
		type: "get",
	    cache:false, 
        success: function(msg){  //请求成功后的回调函数
            $("#filelist").html(msg);
        },
        error : function(msg) {  
             $( '#msg1').html("错误: " + msg);  
         }  
	}) //ajax}
}

function del_all_log() {
	$("#msg1").html('');
	$.ajax({
		url: "do_action.php?action=DEL_ALL_LOG",
				type: "get",
				cache:false, 
				//async: true,  //true：异步，false：同步
	            success: function(msg){  //请求成功后的回调函数
	            	show_upload();
	                //$("#filelist").html('<br/>');
	                //$("#memResult").append(msg);
	            },
	            error : function(msg) {  
	                 $( '#msg1').html("错误: " + msg);  
 	            }  
	}) //ajax
}

function clear_table_all() {
	$("#msg1").html('');
	$.get( "do_action.php?action=CLEAR_TABLE_ALL", function(msg){ 
	            	$( '#msg1').html(msg);
	});
}

function clear_table_all11() {
	$("#msg1").html('');
	$.ajax({
		url: "do_action.php?action=CLEAR_TABLE_ALL",
				type: "get",
				cache:false, 
				//async: true,  //true：异步，false：同步
	            success: function(msg){  //请求成功后的回调函数
	            	//show_upload();
	                //$("#filelist").html('<br/>');
	                //$("#memResult").append(msg)
	            	$( '#msg1').html(msg);
	            },
	            error : function(msg) {  
	                 $( '#msg1').html("错误: " + msg);  
 	            }  
	}) //ajax
}

function read_log() {
	//del_all_log();
	$("#msg1").html('开始上传log文件并读取...');
	$.ajax({
				url: "do_action.php?action=READ_LOG",
				type: "get",
			    cache: false, 
	            success: function(msg){  //请求成功后的回调函数
	                //$("#memResult").append(msg);
	                $("#msg1").html(msg);
	            },
	            error : function(msg) {  
	                 $( '#msg1').html("错误: 读取文件失败。" + msg);  
 	            }  
	}) //ajax
}

function clear_txt() {
	$("#memResult").html('');
}


