<?php
trait ljj_common{

	//Tools
	/**
	 * Merge user defined arguments into defaults array.
	 *
	 * This function is used throughout WordPress to allow for both string or array
	 * to be merged into another array.
	
	 *第一个参数可以是 字符串、数组或对象（obj）
	 * @param string|array $args Value to merge with $defaults
	 *第二个参数为默认的预设值数组，必须是数组
	 * @param array $defaults Array that serves as the defaults.
	 *返回值将是一个数组
	 * @return array Merged user defined values with defaults.
	 */
	function wp_parse_args( $args, $defaults = '' ) {
		if ( is_object( $args ) )
			//将接收的对象（obj）转换为数组
			$r = get_object_vars( $args );
		elseif ( is_array( $args ) )
		//如果是数组则不转换
		$r =& $args;
		else
			//将接收的字符串转换为数组
			parse_str( $args, $r );
		if ( is_array( $defaults ) )
			return array_merge( $defaults, $r );
		return $r;
	}
}