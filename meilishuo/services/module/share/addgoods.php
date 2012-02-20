<?php
$cache_file = getTplCache('services/share/addgoods');
if(!@include($cache_file))
{
	$business = getCache('business');
	if($business === NULL)
	{
		$business = array();
		$res = FDB::query('SELECT name,class,icon,logo,url 
			FROM '.FDB::table('sharegoods_module').' 
			WHERE status = 1 AND is_install = 1 ORDER BY sort ASC,id ASC');
		while($data = FDB::fetch($res))
		{
			$business[] = $data;
		}
		setCache('business',$business);
	}
	
	include template('services/share/addgoods');
}			
display($cache_file);
?>