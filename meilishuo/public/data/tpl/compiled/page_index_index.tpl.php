<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<?php 
$css_list[0]['url'] = './tpl/css/welcome.css';
$js_list[0] = './tpl/js/welcome.js';
 include template('inc/header'); ?><div id="body" class="fm960">
<div class="piece1 mb20">
<div class="piece1_hd"></div>
<div class="piece1_bd" style="overflow:auto;height:310px"><!--dynamic getIndexTodayDaren--><div class="mogu_news">
<span class="sharing"><b>这一刻，</b>她们在分享：</span><!--dynamic getNewShare--><!--dynamic getHotTopic--></div>
</div>
<div class="piece1_ft"></div>
</div><!--dynamic getDayCateShare--><div class="piece1 mb20">
<div class="piece1_hd"></div><!--dynamic getIndexTopic--><div class="piece1_ft"></div>
</div>
<div class="piece1">
<div class="piece1_hd"></div>
<div class="piece1_bd plr10 sh_girl">
<div class="piece_title"><b>达人秀</b>关注她们，和达人一起逛街！<a target="_blank" href="<?php echo FU('daren/index',array()); ?>" class="more_in">点击进入</a></div>
<div class="s_g" id="daren_list"><!--dynamic getDarenLists--></div>
<div>
<a class="s_g_all" onclick="addUserFollows()" href="javascript:;"></a>
<a href="javascript:;" class="s_g_next">换一组</a>
</div>
</div>
<div class="piece1_ft"></div>
</div>
</div><? include template('inc/footer'); ?>