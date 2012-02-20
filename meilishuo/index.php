<?php
define('MODULE_NAME','Index');
define('ACTION_NAME','index');

require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->cache_list[] = 'forums';
$fanwe->initialize();

require fimport('module/index');
IndexModule::index();
?>