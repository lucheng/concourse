<?php
if(!file_exists(dirname(__FILE__).'/Web/Conf/basic.php'))
{
    header('Location:Install/index.php');
    exit();
}
define('THINK_PATH','./ThinkPHP/');
define('APP_NAME','Web');
define('APP_PATH','./Web');
require(THINK_PATH."/ThinkPHP.php");
define ('RUNTIME_ALLINONE', true); 
APP::run();