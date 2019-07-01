<?php
   class file_helper{
   	/*
   	 * php获取文件名
   	 */
   	
   	static public function extract_filename($url)
   	 {
   		 preg_match('/\/([^\/]+\.[a-z]+)[^\/]*$/',$url,$match);
   		 return $match[1];
   	 }
   	 
   	 static public function getExt($url)
   	  {
   	 	 $path=parse_url($url);
   	 	 $str=explode('.', $path['path']);
   	 	 return $str[1];
   	  }
   	
   }
?>