<?php 
define('MODULE_NAME','Daren');
$actions = array('index','all');
$action = 'index';

if(isset($_REQUEST['action']))
{
	$action = strtolower($_REQUEST['action']);
	if(!in_array($action,$actions))
		$action = 'index';
}

define('ACTION_NAME',$action);

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->cache_list[] = 'citys';
$fanwe->initialize();

require fimport('module/daren');
switch(ACTION_NAME)
{
	case 'index':
		DarenModule::index();
		break;
	case 'all':
		DarenModule::all();
		break;
}
?>