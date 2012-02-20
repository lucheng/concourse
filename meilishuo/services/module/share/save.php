<?php
$_FANWE['request']['uid'] = $_FANWE['uid'];
$share = FS('Share')->submit($_FANWE['request']);
$result = array();
if($share['status'])
{
	$result['status'] = 1;
	$list = array();
	$list[] = array('share_id'=>$share['share_id']);
	$list = FS('Share')->getShareDetailList($list,true,true,true,true,true);
	$args = array(
		'share_item'=>current($list),
	);
	$result['html'] = tplFetch('services/share/u_share_item',$args);
}
else
	$result['status'] = 0;

outputJson($result);
?>