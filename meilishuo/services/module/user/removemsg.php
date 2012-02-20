<?php
$mlid = trim($_FANWE['request']['mlid']);
$mid = trim($_FANWE['request']['mid']);
if(empty($mlid) && empty($mid))
	exit;

$mlids = explode(',',$mlid);
$mids = explode(',',$mid);

if(count($mlids) > 0)
{
	foreach($mlids as $mlid)
	{
		$result['mlid'][$mlid] = FS('Message')->deleteByMlid($_FANWE['uid'],$mlid);
	}
}

if(count($mids) > 0)
{
	foreach($mids as $mid)
	{
		$result['mid'][$mid] = FS('Message')->deleteSysMsg($_FANWE['uid'],$mid);
	}
}

outputJson($result);
?>