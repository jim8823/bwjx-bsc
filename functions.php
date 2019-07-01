<?php
include_once 'class/file_helper.php';
   
 function show_upload() {
   		$pic_path = dirname(__FILE__) . "/upload/";
   		$filelist = scandir($pic_path);
		//var_dump($filelist); 
   		foreach ($filelist as $file){  
   			if ($file != '.' && $file != '..') :
				echo '<label> <input type="checkbox" name="cbFiles" id="cbFiles_0">'; 
   			    echo $file; 
				echo "</label> <br>";
		   	endif;
   		}
 }
   
 function del_upload() {
 	$pic_path = dirname(__FILE__) . "/upload/";
 	$filelist = scandir($pic_path);
 	foreach ($filelist as $file){
 		if ($file != '.' && $file != '..') :
 		@unlink('upload/' . $file);
 		endif;
 	}
 }
 
 function clear_table_all() {
 	require_once 'class/bwjx.php';
 	$bwjx = new bwjx('db_name=bwjx-bsc_aoip&db_user=root&db_pw=root');
	$bwjx->TruncateTables();
 	echo '<br/>' . 'data cleared.' . '<br/>';
 	//release
 	$bwjx = null;
  }
 
 function read_log() {
 	require_once 'class/bwjx.php';
 	$bwjx = new bwjx('db_name=bwjx-bsc_aoip&db_user=root&db_pw=root');
	$bwjx->TruncateTables();
 	
	$fpath = dirname ( __FILE__ ) . "/upload/";
	$filelist = scandir ( $fpath );
	// var_dump($filelist);
	foreach ( $filelist as $file ) {
		if ($file != '.' && $file != '..') :
			$fpath = "upload/" . $file;
		echo $fpath;
		  	$bwjx ->do_parse($fpath);
 	 	endif;
	}
	echo '<br/>' . 'done.' . '<br/>';
 	//release
 	$bwjx = null;
 } 
?>