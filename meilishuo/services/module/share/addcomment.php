<?php
$share_id = intval($_FANWE['request']['share_id']);
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

$comment_id = FS('Share')->saveComment($_FANWE['request']);
$comment = FS('Share')->getShareComment($comment_id);
$is_remove_comment = FS('Share')->getIsRemoveComment($share);

include template("inc/share/comment_item");
display();
?>