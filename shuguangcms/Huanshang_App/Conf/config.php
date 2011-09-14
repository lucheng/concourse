<?php
if (!defined('THINK_PATH')) exit();
$config	=	require 'config.inc.php';
$database	=	require 'database.inc.php';
$array	= array(
	
);
return array_merge($config,$array,$database);
?>