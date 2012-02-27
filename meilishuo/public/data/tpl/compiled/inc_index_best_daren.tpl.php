<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="best_daren">
<div class="dbaren_head">
<strong>uu_best_daren</strong>
<a href="<?php echo FU('daren',array()); ?>" class="fr">更多>></a>
</div>
<div class="list">
<ul><? if(is_array($daren_list)) { foreach($daren_list as $daren) { ?><li>
<a target="_blank" href="<?=$daren['user']['url']?>" class="uimg"><img height="256" src="<?=$daren['img']?>" class="lazyload" /></a>
<div class="uuser">
<a target="_blank" href="<?=$daren['user']['url']?>" class="uname GUID" uid="<?=$daren['uid']?>"><?=$daren['user']['user_name']?></a>
<? if($daren['uid'] != $_FANWE['uid']) { if($daren['is_follow']) { ?>
<img src="./tpl/images/best_follow_ok.gif" class="ufollow">
<? } else { ?>
<a onclick="$.User_Follow(<?=$daren['uid']?>,this,UpdateUserFollow);" href="javascript:;" class="ufollow"><img src="./tpl/images/best_follow.gif"></a>
<? } } ?>
</div>
<div class="inf">
<?=$daren['user']['introduce']?>
</div>
</li>
<? } } ?>
</ul>
</div>
</div>