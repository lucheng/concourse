<?php
$cache_file = getTplCache('services/user/login');
if(!@include($cache_file))
{
	if(file_exists(FANWE_ROOT."login/api_config.php"))
	{
		$api_config = include FANWE_ROOT."login/api_config.php";
		foreach($api_config as $ac_key => $api)
		{
			if(file_exists(FANWE_ROOT."login/".$ac_key.".php"))
			{
				require FANWE_ROOT."login/".$ac_key.".php";
				if(class_exists($ac_key))
				{
					$module = new $ac_key;
					$api_config[$ac_key]['url'] = $module->get_url();
				}
			}
		}
	}
	include template('services/user/login');
}
display($cache_file);
?>