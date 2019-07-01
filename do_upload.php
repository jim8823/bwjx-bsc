<?php
include_once 'class/file_helper.php';
//var_dump( $_FILES['file1'] );

if (count ( $_FILES ) == 0)	{
	die ();
}

$fileid = "file1";
// $size_limit = 4194304;
// if ($_FILES [$fileid] ["size"] > $size_limit) {  //文件上传尺寸的限制。
// 	echo '上传文件应小于' . intval($size_limit / 1000000) . 'mb, 该文件尺寸: ' . $_FILES [$fileid] ["size"] / 1024 . 'kb';
// 	die();
// }  //前端js已控制
$filename = $_FILES [$fileid] ["name"];
$pathname = 	"upload/" . $filename;
$arrExt = array('jpg', 'jpeg', 'png', 'bmp', 'gif');
$theExt = file_helper::getExt($filename);
if (!in_array($theExt, $arrExt)) {  //用户只能上传图片 文件，
	echo $filename . "...文件类型错误: 只能上传图片文件(jpg/png/gif) </br>";
	die();
}

if ($_FILES [$fileid] ["error"] > 0) {
	echo "错误: " . $_FILES [$fileid] ["error"] . "<br />";
} else {
	// echo "Upload: " . $_FILES [$fileid] ["name"] . "<br />";
	// echo "Type: " . $_FILES [$fileid] ["type"] . "<br />";
	// echo "Size: " . ($_FILES [$fileid] ["size"] / 1024) . " Kb<br />";
	// echo "Temp file: " . $_FILES [$fileid] ["tmp_name"] . "<br />";
	
	// 临时的复制文件会在脚本结束时消失。要保存被上传的文件，我们需要把它拷贝到另外的位置
	if (file_exists ( $pathname )) {
		echo $filename . " 同名已经存在. <br />";
	} else {
		move_uploaded_file ( $_FILES [$fileid] ["tmp_name"], $pathname );
		echo "上传成功! 保存位置: " . $pathname . "</br>";
	}
}

?>