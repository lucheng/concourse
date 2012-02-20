<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<ul class="s_gul">
<li id="girls_li_1" class="s_gull">
<ul class="s_g_l"><? if(is_array($daren_list)) { foreach($daren_list as $daren) { ?><li uid="<?=$daren['uid']?>" class="s_g_l_l">
<div class="s_g_img">
<a target="_blank" href="<?php echo FU('u/index',array("uid"=>$daren['uid'])); ?>"><img height="64" src="<?php echo avatar($daren['uid'],'b',1);?>" alt="<?=$daren['user_name']?>" title="<?=$daren['user_name']?>" class="icard"></a>
</div>
<div class="s_g_info">
<p><a target="_blank" href="<?php echo FU('u/index',array("uid"=>$daren['uid'])); ?>" class="s_g_name icard"><?php echo cutStr($daren['user_name'],10,'...');?></a></p>
<span class="s_g_style"><?php echo cutStr($daren['reason'],14,'...');?>&nbsp;</span>
<? if($daren['is_follow']) { ?>
<img class="fo_ok" src="./tpl/images/add_fo_ok.png">
<? } else { ?>
<a onclick="$.User_Follow(<?=$daren['uid']?>,this,UpdateUserFollow);" href="javascript:;" class="index_daren_handler add_fo"><img src="./tpl/images/addfollower.png"></a>
<? } ?>
</div>
</li>
<? } } ?>
</ul>
</li>
</ul>