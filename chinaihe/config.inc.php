<?php
//核心配置文件
if (!defined('THINK_PATH')) exit();
return array( 
	'TMPL_CACHE_ON'=>false,      // 默认开启模板缓存
	'TMPL_CACHE_ON'   => false,  // 默认开启模板编译缓存 false 的话每次都重新编译模板
	'ACTION_CACHE_ON'  => false,  // 默认关闭Action 缓存
	'HTML_CACHE_ON'   => false,

	'SITENAME' => '你问我答',
	'KEYWORDS' => '你问我答,1w5d.com,网络问答社区,网络商业社区',
	'DESCRIPTION' => '一个真实的网络问答社区，帮助你寻找答案，分享知识。',
    'EMAIL' => 'm23linzhe@gmail.com',
    'CONTACT' => 'www.1w5d.com',
    'COMPANY' => 'www.1w5d.com',
    'PHONE' => '',
    'FAX' => '',
    'ADDRESS' => '',
    'OFFLINEMESSAGE' => '本站正在维护中，暂不能访问。<br /> 请稍后再访问本站。',
    'SITEURL' => 'http://www.1w5d.com',
    'DEMOURL' => 'http://www.1w5d.com',
    'BBSOURL' => 'http://www.1w5d.com',
    'URL_MODEL' => 1, // 如果你的环境不支持PATHINFO 请设置为3
    
    'TMPL_PARSE_STRING' => array(
    	'__PUBLIC__' => __ROOT__.'/Public', // 更改默认的__PUBLIC__ 替换规则
    ),
    
	'APP_DEBUG'=>true,	//调试模式开关
    //'TOKEN_ON'=>true,  // 是否开启令牌验证
    //'TOKEN_NAME'=>'__hash__',    // 令牌验证的表单隐藏字段名称
    //'TOKEN_TYPE'=>'md5',  //令牌哈希验证规则 默认为MD5
    'VAR_PAGE' => 'pageNum',
    'USER_AUTH_ON' => true,
    'USER_AUTH_TYPE' => 1, // 默认认证类型 1 登录认证 2 实时认证
    'USER_AUTH_KEY' => 'authId', // 用户认证SESSION标记
    '_ACCESS_LIST' => 'accesslist', // 用户访问SESSION标记
    'ADMIN_AUTH_KEY' => 'administrator',
    'USER_AUTH_MODEL' => 'User', // 默认验证数据表模型
    'AUTH_PWD_ENCODER' => 'md5', // 用户认证密码加密方式
    'USER_AUTH_GATEWAY' => '/Public/login', // 默认认证网关
    'NOT_AUTH_MODULE' => 'Public', // 默认无需认证模块
    'REQUIRE_AUTH_MODULE' => '', // 默认需要认证模块
    'NOT_AUTH_ACTION' => '', // 默认无需认证操作
    'REQUIRE_AUTH_ACTION' => '', // 默认需要认证操作
    'GUEST_AUTH_ON' => true, // 是否开启游客授权访问
    'GUEST_AUTH_ID' => 2, // 游客的用户ID
    'DB_LIKE_FIELDS' => 'title|remark',
    'RBAC_ROLE_TABLE'   => 't_role',
    'RBAC_USER_TABLE'   => 't_role_user',
    'RBAC_ACCESS_TABLE' => 't_access',
    'RBAC_NODE_TABLE'   => 't_node',
    
    
	'SHOW_RUN_TIME'=>true,   // 运行时间显示
	'SHOW_ADV_TIME'=>true,   // 显示详细的运行时间
	'SHOW_DB_TIMES'=>true,   // 显示数据库查询和写入次数
	'SHOW_CACHE_TIMES'=>true,  // 显示缓存操作次数
	'SHOW_USE_MEM'=>true,   // 显示内存开销

);
?>