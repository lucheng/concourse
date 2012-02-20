<?php
define('MODULE_NAME','u');

$actions = array('index','me','book','fav','bao','photo','topic','talk','comments','all','maybe','ask','follow','fans','feed','attention','message','sendmsg','msgview');

if(isset($_REQUEST['action']))
{
	$action = strtolower($_REQUEST['action']);
	if(!in_array($action,$actions))
		$action = 'index';
}

define('ACTION_NAME',$action);

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->initialize();

$home_uid = intval($_FANWE['request']['uid']);
if($home_uid == 0)
	$home_uid = $_FANWE['uid'];

if($home_uid == 0)
	fHeader("location: ".FU('user/login'));

$action = ACTION_NAME;
$m_action = array('comments');
if(in_array($action,$m_action) && $home_uid != $_FANWE['uid'])
	fHeader("location: ".FU('u/talk',array('uid'=>$home_uid)));

if($action == 'index')
{
	if($home_uid == $_FANWE['uid'])
		fHeader("location: ".FU('u/me'));
	else
		fHeader("location: ".FU('u/talk',array('uid'=>$home_uid)));
}
elseif(in_array($action,array('message','sendmsg','msgview')))
{
	if($home_uid != $_FANWE['uid'])
		fHeader("location: ".FU('u/message',array('uid'=>$_FANWE['uid'])));
}

$_FANWE['home_uid'] = $home_uid;
$_FANWE['home_user_names'] = FS('User')->getUserShowName($home_uid);

$home_user = FS('User')->getUserById($home_uid);
if(empty($home_user))
	fHeader("location: ".FU('index/index'));

$_FANWE['nav_title'] = $home_user['user_name'].lang('common','space');
require fimport('module/u');

switch($action)
{
	case 'me':
		UModule::me();
	break;

	case 'book':
		UModule::book();
	break;

	case 'talk':
		UModule::talk();
	break;

	case 'comments':
		UModule::comments();
	break;

	case 'all':
		UModule::all();
	break;

	case 'fav':
		UModule::fav();
	break;

	case 'bao':
		UModule::bao();
	break;

	case 'photo':
		UModule::photo();
	break;

	case 'topic':
		UModule::topic();
	break;

	case 'maybe':
		UModule::maybe();
	break;

	case 'ask':
		UModule::ask();
	break;

	case 'attention':
		UModule::attention();
	break;

	case 'feed':
		UModule::feed();
	break;

	case 'fans':
		UModule::fans();
	break;

	case 'follow':
		UModule::follow();
	break;
	
	case 'message':
		UModule::message();
	break;
	
	case 'sendmsg':
		UModule::sendmsg();
	break;
	
	case 'msgview':
		UModule::msgview();
	break;
}
?>