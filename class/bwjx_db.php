<?php

trait bwjx_db{
	//get $arrTable from db
	private function Db2arrTable() {
		try {
			$sql = "select fldName from flagdata where tablename='VARS' and extInfo like '%V%'";
			foreach($this->db->query($sql) as $row){  //fill arrTable with records who take 'V'
				$this->arrVars[$row['fldName']]	= '';
			}
			//print_r($this->arrVars) ;
			echo '<br/>';
	
			$sql = "select * from flagdata where extInfo like '%M%'";
			foreach($this->db->query($sql) as $row){
				$this->FillArrFlag($this->arrTable, $row);  //fill arrTable with records who take 'M'
			}
			//var_dump($this->arrTable) ;
			//echo '<br/><br/>';
		} catch (Exception $e) {
			echo 'fail:' . $e->getMessage();
			exit;
		}
	}
	
	//get $this->arrFlag from db
	private function Db2arrFlag($tableName) {
		try {
			$sql = "select * from flagdata where tableName=:tableName " . "order by id, again desc";  //keep the record with again=0 being the last one
			$statment = $this->db->prepare($sql);
			$statment->bindParam('tableName', $tableName);
			$statment->execute();
			$arrData = $statment->fetchAll();  //get dataset
	
			//get $this->arrFlag from db
			$this->arrFlag = array();  //clear first
			foreach($arrData as $row){
				$this->FillArrFlag($this->arrFlag, $row);
			}
			//var_dump($this->arrFlag)  . '<br/>';
		} catch (Exception $e) {
			echo 'fail:' . $e->getMessage();
			exit;
		}
	}
	
	private function FillArrFlag(&$arr, $row){
		$arr[] = array(
				'id'					=> $row['id'] . '',
				'flagFrom'		=> $row['flagFrom'] . '',
				'flagLen'			=> $row['flagLen'] . '',
				'flag'				=> $row['flag'],
				'again'				=> $row['again'],
				'nextFld'			=> $row['nextFld'],
				'dataFrom'		=> $row['dataFrom'],
				'dataLen'			=> $row['dataLen'],
				'fldName'		=> $row['fldName'],
				'tableName'	=> $row['tableName'],
				'extInfo'			=> $row['extInfo'],
				'hasRead'		=> false,
				'dataCvtBy'		=> $row['dataCvtBy'],
				'dataValue'		=> '',
		);
	}
	
	private function getSql($tableName){
		//echo $tableName;
		//get sql command
		$statement = $this->db->prepare('select sqlCmd from sqlCmd where taxonamy="insert" and tableName=:tableName');
		$statement->bindParam('tableName', $tableName);
		$statement->execute();
		$row = $statement->fetchAll();
		//print_r($row);
		//echo 'sqlCmd = ' . $sqlCmd;
		return $row[0]['sqlCmd'];
	}
	
	private function Push2Db($sqlCmd){
		//echo $tableName;
		//get sql command
	
		try {
			$statement = null;
			$statement = $this->db->prepare ($sqlCmd);
			//echo $sqlCmd . '<br/>';
			foreach ( $this->arrFlag as $m ) {
				if ($m['fldName'] !== ''){
					$cvt = $m['dataCvtBy'];
					if (!empty($cvt)) {
						$m['dataValue'] = $this->handle_cvt($m['dataValue'], $cvt);
					}
					//echo $m['fldName'] . ',' . $m['dataValue'] . "<==========<br/>";
					$statement->bindParam ( $m['fldName'], $m['dataValue'] );
				}
			}
			if ($statement->execute ()){
				$row = $statement->fetchAll ();
				//echo 'saved<br/><br/>';
			}else{
				echo 'Error:' . $statement->errorInfo()[2];
			}
			//print_r ( $row );
			//echo $sqlCmd . '<br/>';
		} catch ( Exception $e ) {
			echo $e->getMessage();
		}
	}
	
	private function handle_cvt($data, $cvt) {
		$arrCvt = explode( ',', $cvt );  //covert dataCvtBy to array
		$ret = '';
		switch ($arrCvt[0]){
			case 'explode()':
					$arr = explode($arrCvt[1], $data);
					$index = intval($arrCvt[2]);
					if (count($arr) > $index)
						$ret = $arr[$index];
			default:						
		}
		return $ret;
	}
	
	private function SaveToDb($tableName){
		if ($tableName != 'VARS'){
			$sqlCmd = $this->getSql($tableName);
			if ($sqlCmd !== '')
				$this->Push2Db($sqlCmd);
			else
				echo 'Missing SQL cmd....';
		}
	}
	
	public function TruncateTables(){
		foreach($this->arrTable as $tbl){
			$statement = $this->db->prepare('truncate table ' . $tbl['tableName']);
			$statement->execute();
		}
	}
}
