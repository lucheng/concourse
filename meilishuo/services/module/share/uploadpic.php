<?php
if(!isset($_FILES['image']) || empty($_FILES['image']))
	exit;

$result = array();
$pic = $_FILES['image'];
include_once fimport('class/image');
$image = new Image();
if(intval($_FANWE['setting']['max_upload']) > 0)
	$image->max_size = intval($_FANWE['setting']['max_upload']);
$image->init($pic);

if($image->save())
{
	$result['img'] = $image->file['target'];
	$result['status'] = 1;
	$result['info'] = authcode($image->file['local_target'], 'ENCODE');
	$args = array('result'=>$result);
	$result['html'] = tplFetch("services/share/pic_item",$args);
}
else
{
	$result['status'] = 0;
}

$json = getJson($result);
echo "<textarea>$json</textarea>";
?>