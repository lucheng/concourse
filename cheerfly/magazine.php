<?php 
define('MODULE_NAME','Magazine');

$actions = array('index','forum','best','detail','post');
$action = 'index';

if(isset($_REQUEST['action']))
{
	$action = strtolower($_REQUEST['action']);
	if(!in_array($action,$actions))
		$action = 'index';
}

define('ACTION_NAME',$action);

require dirname(__FILE__).'/core/fanwe.php';
$fanwe = &FanweService::instance();
$fanwe->cache_list[] = 'forums';
$fanwe->initialize();

require fimport('module/magazine');

switch(ACTION_NAME)
{
	case 'index':
		MagazineModule::index();
		break;
	case 'category':
		MagazineModule::forum();
		break;
	case 'best':
		MagazineModule::best();
		break;
	case 'detail':
		MagazineModule::detail();
		break;
	case 'post':
		MagazineModule::post();
		break;
	default:
		MagazineModule::index();
		break;
}
?>