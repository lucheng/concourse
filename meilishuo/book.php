<?php 
define('MODULE_NAME','Book');

$actions = array('cate','shopping','search');

if(isset($_REQUEST['action']))
{
	$action = strtolower($_REQUEST['action']);
	if(!in_array($action,$actions))
		$action = 'shopping';
}

define('ACTION_NAME',$action);

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->initialize();

require fimport('module/book');

switch(ACTION_NAME)
{
	case 'cate':
		BookModule::cate();
		break;
	case 'shopping':
		BookModule::shopping();
		break;
	case 'search':
		BookModule::search();
		break;
}
?>