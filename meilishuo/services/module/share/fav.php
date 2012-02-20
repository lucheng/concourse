<?php
$share_id = intval($_FANWE['request']['id']);
if($share_id == 0)
	exit;

//未登陆直接退出
$uid = $_FANWE['uid'];
if($uid == 0)
	exit;
	
$share = FS('Share')->getShareById($share_id);
//没有分享直接退出
if(empty($share))
	exit;

$result = array();
$uids = FS('Share')->getShareCollectUserCache($share_id);

if(array_search($uid,$uids) !== false)
{
	$result['status'] = 2;
	outputJson($result);
}

if($share['uid'] == $uid)
{
	$result['status'] = 3; 
	outputJson($result);
}

FS('Share')->saveFav($share);

$share_dynamic = FS('Share')->getShareDynamic($share_id);
$result['count'] = $share_dynamic['collect_count'];

$result['status'] = 4;
$img_size = intval($_FANWE['request']['size']);
if($img_size == 0)
	$img_size = 32;

$args = array(
	'collects'=>FS('Share')->getShareCollectUser($share_id,$_FANWE['uid']),
	'img_size'=>$img_size,
);

$result['collects'] = tplFetch("inc/share/collect_list",$args);
outputJson($result);
?>