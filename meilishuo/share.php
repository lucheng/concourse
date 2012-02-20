<?php 

define('MODULE_NAME','Share');
define('ACTION_NAME','index');

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->initialize();


$action = addslashes(trim($_REQUEST['action']));
if(empty($action))$action='index';
require fimport('module/share');
if(class_exists("ShareModule"))
{
	$module = new ShareModule();
	if(method_exists($module,$action))
	{
		call_user_method($action,$module);
	}
	else
	{
		die("error access");
	}
}
else
{
	die("error access");
}
?>