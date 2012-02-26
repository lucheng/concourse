<?php
$tid = intval($_FANWE['request']['tid']);
if($tid == 0)
	exit;

$topic = FS('Ask')->getTopicById($tid);
if(empty($topic))
	exit;

$_FANWE['request']['uid'] = $_FANWE['uid'];
$_FANWE['request']['rec_id'] = $tid;
$_FANWE['request']['parent_id'] = $topic['share_id'];
$_FANWE['request']['type'] = 'ask_post';
$_FANWE['request']['title'] = addslashes($topic['title']);

$share = FS('Share')->submit($_FANWE['request']);
$result = array();
if($share['status'])
{
	$content = htmlspecialchars(trim($_FANWE['request']['content']));
	FS('Ask')->saveTopicPost($tid,$content,$share['share_id']);
	$result['status'] = 1;
	$list = array();
	$list[] = array('share_id'=>$share['share_id']);
	$list = FS('Share')->getShareDetailList($list,true,true,true,true,true);
	$args = array(
		'share_item'=>current($list),
		'current_share_id'=>$topic['share_id']
	);
	$result['html'] = tplFetch('services/share/share_item',$args);
}
else
	$result['status'] = 0;


outputJson($result);
?>