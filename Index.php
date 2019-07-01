<!doctype html>
<html>
<head>
	<meta name="viewport" content="width=device-width , initial-scale=1.0 , user-scalable=0 , minimum-scale=1.0 , maximum-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>AoIP Tools</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.7.0/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.7.0/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js">
	<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
</head>
<body>
  <div>
     <div>
     </div>
     <div class='toolsbar'>
        <input  id="btLog" type="button" value="读取log" onclick="read_log()"/> 
        <input  id="btDelTable" type="button" value="删除表格内容" onclick="clear_table()"/> 
        <input  id="btDelTableAll" type="button" value="清空所有表格" onclick="clear_table_all()"/> 
        <input  id="btMakeMacro" type="button" value="生成指令" onclick="MakeMacro()"/> 
     </div>
   </div>
   <div id='msg1'>
   </div>
   <script src="js/upload.js"></script> 
   <script src="js/functions.js"></script> 
</body>

