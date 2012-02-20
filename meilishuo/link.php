<?php
define('MODULE_NAME','Link');
define('ACTION_NAME','index');
print_r($_REQUEST);
exit;
require './core/service/fanwe.service.php';
$fanwe = &FanweService::instance();
$fanwe->initialize();

require fimport('module/link');
LinkModule::index();
?>