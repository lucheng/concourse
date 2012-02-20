<?php 
define('MODULE_NAME','Settings');

$actions = array('personal','savepersonal','avatar','saveavatar','password','savepassword','bind','setsyn');
$action = 'personal';

if(isset($_REQUEST['action']))
{
	$action = strtolower($_REQUEST['action']);
	if(!in_array($action,$actions))
		$action = 'personal';
}

define('ACTION_NAME',$action);

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->initialize();

if($_FANWE['uid'] == 0)
	fHeader("location: ".FU('user/login'));

require fimport('module/settings');

switch(ACTION_NAME)
{
	case 'personal':
		SettingsModule::personal();
	break;
	case 'savepersonal':
		SettingsModule::savePersonal();
	break;
	case 'avatar':
		SettingsModule::avatar();
	break;
	case 'saveavatar':
		SettingsModule::saveAvatar();
	break;	
	case 'password':
		SettingsModule::password();
	break;
	case 'savepassword':
		SettingsModule::savePassword();
	break;
	case 'bind':
		SettingsModule::bind();
	break;
	case 'setsyn':
		SettingsModule::setsyn();
	break;
}
?>