<?php
define('NO_CACHE_RUNTIME', true);
$config	=require './config.inc.php';
$database=require './database.inc.php';
return array_merge($config, $database);
?>