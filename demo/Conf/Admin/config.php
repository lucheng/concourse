<?php
$config	=	require './config.php';
$config2 =	require './Conf/config.php';
//冲突项重定义
$array=array(
'LANG_SWITCH_ON'=>true,
'LANG_AUTO_DETECT'=>false,//老外自动切换语言
'DEFAULT_LANG'=>'zh-cn',
'TMPL_ACTION_ERROR'=>'Public:success', // 默认错误跳转对应的模板文件
'TMPL_ACTION_SUCCESS'=>'Public:success', // 默认成功跳转对应的模板文件
'TAGLIB_PRE_LOAD' => 'html'
);
return array_merge($config,$config2,$array);
?>