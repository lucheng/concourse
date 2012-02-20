<?php
/**
 * 获取登陆后的转向
 */
function getUserRefer()
{
	global $_FANWE;
	$refer = $_FANWE['request']['refer'];
	if(empty($refer))
		$refer = FU('u/index');
	return $refer;
}
?>