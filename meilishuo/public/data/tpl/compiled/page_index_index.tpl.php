<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<?php 
$css_list[0]['url'] = './tpl/css/welcome.css';
$js_list[0] = './tpl/js/welcome.js';
 include template('inc/header'); ?><div id="body" class="fm960">
<div class="piece1 mb20">
<div class="piece1_left"></div>
<div class="piece1_hd"></div>
<div class="piece1_bd" style="overflow:auto;height:1020px"><!--dynamic getIndexTodayDaren--><div class="fanwe_news"><!--dynamic getNewShare-->                <!--dynamic getUUNewUsers--></div>
<div class="fanwe_pub"><!--dynamic getUUHotEvent--><!--dynamic getUUHotTopic--></div><!--dynamic getUUBestDarens--></div>
<div class="piece1_ft"></div>
<div class="news_mask"></div>
</div><!--dynamic getDayCateShare--><div class="piece1 "><!--dynamic getUUIndexTopic--><div class="piece1_ft"></div>
</div>
</div><? include template('inc/footer'); ?>