<?php
$config= require './Public/Config/config.ini.php';
$web_config=array(
	'URL_MODEL'=>1,//rewrite模式改为2
	'URL_ROUTER_ON'=>true,
	'URL_HTML_SUFFIX'=>'.html',
	'TMPL_CACHE_TIME' => -1,//部署模式 模板永久缓存
	'URL_CASE_INSENSITIVE' =>true,//URL不区分大小写
	'TMPL_PARSE_STRING'=> array( 
    '__WEB__'=>__ROOT__.'/index.php',
	'__ARTICLE__'=>__ROOT__.'/index.php/articles',
	'__TYPE__'=>__ROOT__.'/index.php/lists',
	'__VOTE__'=>__ROOT__.'/index.php/votes',
), 
);
return array_merge($config,$web_config);
?>