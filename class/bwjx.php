<?php

require_once 'bwjx_db.php';
require_once 'bwjx_parse.php';
require_once 'ljj_common.php';

class bwjx{
	private $db;
	private $arrTable;  //table list
	private $arrFlag;
	private $arrVars;  //fields with mark 'V'
	private $logFile;
	
	function bwjx($args){
		$defaults = array(
			'dbms' 			=> 'mysql',
			'db_host' 		=> 'localhost',
			'db_name'		=> 'bwjx-bsc_aoip',
			'db_user' 		=> 'root',
			'db_pw' 			=> 'root'
		);
		$args = $this->wp_parse_args($args, $defaults);
		$dsn = $args['dbms'] . ':host='. $args['db_host'] . ';dbname=' . $args['db_name'];
		
		try {
			$this->db = new PDO ( $dsn, $args['db_user'], $args['db_pw'] );
			$this->Db2arrTable();
		} catch ( Exception $e ) {
			echo 'fail:' . $e->getMessage ();
			exit ();
		}
	}
	
	public function __destruct(){
		$this->db = null;
	}

	public function do_parse($fileName){
		try {
			if (!file_exists($fileName)){
				echo '文件不存在--' . $fileName;
				exit;
			}
			 
			$this->logFile = fopen($fileName, 'r') or die("<br\>Read file [" . $fileName . "] error");
			//print_r($arrTable);
		
			$this->TruncateTables();
			while (!feof($this->logFile)){
				$buf = fgets($this->logFile);
				$buf = str_replace(PHP_EOL, '', $buf);  //fgets will add EOL at the end of the str, so need replace it
				//echo $buf . '<br/>';
				$this->ScanInTable($buf);
			}
			fclose($this->logFile);
		} catch (Exception $e) {
			echo "<br\>Read file [" . $fileName . "] error:" . $e->getMessage();
		}
	}
	
	use bwjx_parse;
	use bwjx_db;
	use ljj_common;
	
}