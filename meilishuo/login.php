<?php 
define('MODULE_NAME','login');

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->initialize();

if(isset($_REQUEST['rel']))
{
	$class_name = addslashes(trim($_REQUEST['rel']));
	require FANWE_ROOT."login/".$class_name.".php";
	if(class_exists($class_name))
	{
		$module = new $class_name;
		$module->callback();
	}
}

if(isset($_REQUEST['bindrel']))
{
	$class_name = addslashes(trim($_REQUEST['bindrel']));
	require FANWE_ROOT."login/".$class_name.".php";
	if(class_exists($class_name))
	{
		$module = new $class_name;
		$module->bindcallback();
	}
}

if(isset($_REQUEST['mod']))
{
	$class_name = addslashes(trim($_REQUEST['mod']));
	require FANWE_ROOT."login/".$class_name.".php";
	if(class_exists($class_name))
	{
		$module = new $class_name;
		$module->jump();
	}
}


if(isset($_REQUEST['bind']))
{
	$class_name = addslashes(trim($_REQUEST['bind']));
	require FANWE_ROOT."login/".$class_name.".php";
	if(class_exists($class_name))
	{
		$module = new $class_name;
		$module->bindjump();
	}
}

if(isset($_REQUEST['unbind']))
{
	$class_name = addslashes(trim($_REQUEST['unbind']));
	require FANWE_ROOT."login/".$class_name.".php";
	if(class_exists($class_name))
	{
		$module = new $class_name;
		$module->unbind();
	}
}

//同步微博
if(isset($_REQUEST['loop']))
{
	$uid = intval($_REQUEST['uid']);
	echo syn_weibo($uid);
}

function syn_weibo($uid)
{
	$GLOBALS['_FANWE']['uid'] = $uid;
	$schedule = FDB::fetchFirst("select * from ".FDB::table("pub_schedule")." where pub_time = 0 and uid = ".$uid);	
	if($schedule&&file_exists(FANWE_ROOT."login/".$schedule['type'].".php"))
	{
		$data = unserialize(base64_decode($schedule['data']));
		require_once FANWE_ROOT."login/".$schedule['type'].".php";
		$class =$schedule['type']; 
		$mod = new $class;
		$res = $mod->sendMessage($data);
		FDB::query("update ".FDB::table("pub_schedule")." set pub_time = ".TIME_UTC." where uid = ".$uid." and type = '".$class."'");
		if($res)
		{						
			$rs = intval(FDB::resultFirst("select count(*) from ".FDB::table("pub_schedule")." where pub_time = 0 and uid = ".$uid));
			if($rs)
			return true;  //更新下一条
			else
			return false;  //全部更新完毕
		}
		else
		{			
			return true; //更新失败继续更新本条
		}
	}
	else
	{
		
		if($schedule)
		{
			$class =$schedule['type']; 
			FDB::query("update ".FDB::table("pub_schedule")." set pub_time = ".TIME_UTC." where uid = ".$uid." and type = '".$class."'");
			return true;  //无接口文件
		}
		else
		return false;
	}
}

?>