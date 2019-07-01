<?php
trait bwjx_parse{
	
private function ScanInTable($buf){
	foreach($this->arrTable as $t){
		//echo   substr($buf, $iFrom, $iLen);
		//var_dump($t['tableName']);
		$tableName = $t['tableName'];
		if ($this->IsMatch($buf, $t)){   //found $buf=mark str
			echo 'Table match ->' . $t['tableName']  . '<br/>';
			if ((count($this->arrFlag) == 0) || ($this->arrFlag[0]['tableName'] !== $tableName))  //$this->arrFlag is empty OR not the same table(need reload) 
				$this->Db2arrFlag($tableName);  //define $this->arrFlag
			else 
				$this->ClearReadMark();  //clear 'hasRead' flag
			$this->ScanInFlag($buf);
			//SaveToDb($tableName);
			break;
		}
	}
}

private function ScanInFlag($buf){
	$bEnd = false;
	$iArrCount = count($this->arrFlag);  
	$iHitCount = $iArrCount;  //avoid dead loop
	//var_dump($this->arrFlag);
	$nextFld = 0;
	do{  //each line
		$bReRead = false;
		//echo $buf  . '<br/>';
		for($i = 0; $i <$iArrCount; $i++){
			//if ($this->arrFlag[$i]['hasRead']) {
			//	continue;  //跳过  ////屏蔽是因为ZQRI BCSU-问题
			//}
			if (($this->arrFlag[$i]['id'] == $nextFld) || ($this->IsMatch($buf, $this->arrFlag[$i]))) {  //if =$nextFld, no need to testMatch, or can't be tested 
				//$iHitCount--;
				$iFrom = $this->arrFlag[$i]['dataFrom'];
				//if ($iFrom == 0){
				//	$this->arrFlag[$i]['hasRead'] = true;
				//	continue;
				//}
				$iLen = $this->arrFlag[$i]['dataLen'];
				if ($this->arrFlag[$i]['flagFrom'] < 0) { //containing mode.. using offset--flagLen
					$iFrom = $this->arrFlag[$i]['dataFrom'] + $this->arrFlag[$i]['flagLen'] + 1;  
				}
				$strTmp = trim(substr($buf, $iFrom-1, $iLen));
				$this->arrFlag[$i]['dataValue'] = $strTmp;
				
				if (strstr($this->arrFlag[$i]['extInfo'], 'V'))  {//var in vars
					$fldname = $this->arrFlag[$i]['fldName'];
					if ($this->arrFlag[$i]['tableName'] ===  'VARS') {
						$this->arrVars[$fldname] = $strTmp;
					} else {
						$this->arrFlag[$i]['dataValue'] = $this->arrVars[$fldname];
					}
				}		
				$this->arrFlag[$i]['hasRead'] = true;  
				
				$nextFld = $this->arrFlag[$i]['nextFld'];   //非0, means 直接读取下一行
				$bReRead = ($this->arrFlag[$i]['again']);  //this buf need parse again
				if ($bReRead) continue;	
				$strTmp = $this->arrFlag[$i]['extInfo'];
				if (strstr($strTmp, 'S')){	
					$tmp= $this->arrFlag[$i]['tableName'];
					$this->SaveToDb($tmp);
					$this->ClearReadMark();
					$iHitCount = $iArrCount;  //reset counter
				}
				if (strstr($strTmp, 'E')){	
					$bEnd = true;
				}
				if ($iHitCount == 0) {
					echo 'end!!........$iHitCount=0' . '<br/>' ;
					$bEnd = true;  //all met
				}
				break;  //for
			}  //if
		}  //for
		if (!$bReRead){
			$buf = fgets($this->logFile);  //read next line
		}
	}  while  (!$bEnd && (!feof($this->logFile)));
}

private function ClearReadMark(){
	for($i = 0; $i <count($this->arrFlag); $i++){
		$this->arrFlag[$i]['hasRead'] = false;  //clear 'hasRead' flag
	}
}

private function IsMatch($buf, &$m){
	$bMatch = false;
	$iFrom = $m['flagFrom'];
	$iLen = $m['flagLen'];
	
	//echo $m['flagFrom']  . '<br/>';
	switch ($m['flagFrom']){
		case 0:  //0 means '=='
			$bMatch = ($m['flag'] === $buf);  
			//if ($bMatch)
				//echo '[' . $m['flag']  . ']' .  '<br/>' . '[' . $buf . ']'. '<br/>';
			break;
		case -1:  //-1 means contain
			if (!empty($m['flag']) && strpos($buf, $m['flag'], 0)){
			    //echo '-1---hit';
				$m['flagLen'] = strpos($buf, $m['flag'], 0);  //keep location of searching result temporarily
			    //echo $m['flagLen'] . '[' . $buf . ']' .'[' .$xx . ']<br/>';
				$bMatch = $m['flagLen'];
			} else
				$bMatch = false;
			break;
		default:
			$bMatch = ($m['flag'] === substr($buf, $iFrom-1, $iLen));  //$iFrom-1: substr come from 0, not 1
	}
	return $bMatch;
}

}

