<?php

define('THINK_PATH', './ThinkPHP');

define('ADMIN_PATH', str_replace('\\', '/',getcwd()));
define('APP_NAME', basename(ADMIN_PATH));
define('APP_PATH', '.');
define('FANWE_ROOT', str_replace('\\', '/',substr(ADMIN_PATH, 0, -(strlen(APP_NAME) + 1))).'/');

require(THINK_PATH."/ThinkPHP.php");

App::run();
?>