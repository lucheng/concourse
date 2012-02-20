<?php
//未登陆直接退出
$uid = $_FANWE['uid'];
if($uid == 0)
	exit;
$result = array();
$data = FS('Share')->saveRelay($_FANWE['request']);
$result['status'] = 1; 
outputJson($result);
?>