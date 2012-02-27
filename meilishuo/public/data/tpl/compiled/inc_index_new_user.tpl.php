<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="new_user">
<div class="nu_head">
<strong>新入会员</strong>
</div>
<div class="list">
<ul><? if(is_array($users)) { foreach($users as $user) { ?><li>
<a href="<?php echo FU('u/index',array("uid"=>$user['uid'])); ?>" target="_blank" title="<?=$user['user_name']?>"><img class="icard GUID" alt="<?=$user['user_name']?>" uid="<?=$user['uid']?>" height="32" src="<?php echo avatar($user['uid'],'s',1);?>"></a>
</li>
<? } } ?>
</ul>
</div>
</div>