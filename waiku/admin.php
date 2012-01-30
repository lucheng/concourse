<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 后台入口文件

    @Filename admin.php $

    @Author pengyong $

    @Date 2011-11-18 13:48:44 $
*************************************************************/
if(!file_exists(dirname(__FILE__).'/Web/Conf/basic.php'))
{
    header('Location:Install/index.php');
    exit();
}
define('THINK_PATH', './ThinkPHP');
define('APP_NAME', 'Admin');
define('APP_PATH', './Admin'); 
define('NO_CACHE_RUNTIME', true);
// for development
//define('STRIP_RUNTIME_SPACE',false);
require(THINK_PATH."/ThinkPHP.php");
App::run();
?>