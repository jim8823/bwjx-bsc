<?php
include_once 'functions.php'; 

$act = $_REQUEST['action'];
//$act = $_GET['action'];  //也行, 或$_POST亦可
switch ($act) {
	case 'SHOW_UPLOAD':
		show_upload();
		break;
	case 'CLEAR_TABLE_ALL':
		clear_table_all();
		break;		
	case 'READ_LOG':
		read_log();
		break;	
	default:	
}

?>