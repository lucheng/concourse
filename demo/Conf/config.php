<?php
$config	=	require './config.php';
$array=array(
'TMPL_SWITCH_ON'			=>	true,	// 启用多模版支持
'TMPL_DETECT_THEME'     => true,      // 自动侦测模板主题

'TMPL_ACTION_ERROR'=>'Public:success_en', // 默认错误跳转对应的模板文件
'TMPL_ACTION_SUCCESS'=>'Public:success_en', // 默认成功跳转对应的模板文件
'APP_DEBUG'=>false,
'THINK_PLUGIN_ON' =>true,
//'APP_DOMAIN_DEPLOY' => true,
//语言
'LANG_SWITCH_ON'=>true,
'LANG_AUTO_DETECT'=>true,//老外自动切换语言
//'DEFAULT_LANG'   =>	'zh-cn',	 // 默认语言
'DEFAULT_LANG'   =>	'en-us',	 // 默认语言
//允许上传的文件类型
'FILE_UPLOAD_ALLOWEXTS'=>'jpg,jpeg,bmp,png,gif,tif,zip,rar,doc,xls,7z,rtf,csv',
//站点信息
'SYSTEM_NAME'=>'EasyCart',
'SYSTEM_VAR'=>'2.0',
'URL_MODEL'=>2,
//'配置项'=>'配置值'
/*HTML*/
'URL_HTML_SUFFIX'=>'.html', //URL
'DEFAULT_TEMPLATE'=>'default',
'URL_PATHINFO_DEPR'=>'-',
//组模
'APP_GROUP_LIST'=>'Admin,Home,Member,Rpc',
'DEFAULT_GROUP'=>'Home',
'TMPL_FILE_DEPR'=>"-",
'USER_AUTH_ON'=>true,
'USER_AUTH_TYPE'			=>2,		// 默认认证类型 1 登录认证 2 实时认证
'USER_AUTH_KEY'			=>'authId',	// 用户认证SESSION标记
'ADMIN_AUTH_KEY'			=>'administrator',
'USER_AUTH_MODEL'		=>'User',	// 默认验证数据表模型
'AUTH_PWD_ENCODER'		=>'md5',	// 用户认证密码加密方式
'USER_AUTH_GATEWAY'	=>'/AdminPublic-adminlogin',	// 默认认证网关
'NOT_AUTH_MODULE'		=>'AdminPublic',		// 默认无需认证模块
'REQUIRE_AUTH_MODULE'=>'',		// 默认需要认证模块
'NOT_AUTH_ACTION'		=>'',		// 默认无需认证操作
'REQUIRE_AUTH_ACTION'=>'',		// 默认需要认证操作
'GUEST_AUTH_ON'          => false,    // 是否开启游客授权访问
'GUEST_AUTH_ID'           =>    0,     // 游客的用户ID
'DB_LIKE_FIELDS'=>'title|remark',
'RBAC_ROLE_TABLE'=>'role',
'RBAC_USER_TABLE'	=>	'role_user',
'RBAC_ACCESS_TABLE' =>	'access',
'RBAC_NODE_TABLE'	=> 'node',
'TOKEN_ON'=>false

);
return array_merge($config,$array);
?>