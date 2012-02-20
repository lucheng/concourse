<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="show_girl" style="background: url(<?=$today_daren['index_img']?>) no-repeat;">
<? if($_FANWE['uid'] > 0) { ?>
<div class="wel_u">
      <a href="<?php echo FU('u/index',array()); ?>" target="_blank"><img class="avt fl" src="<?php echo avatar($_FANWE['uid'],'m',1);?>" height="48" /></a>
      <a href="<?php echo FU('u/index',array()); ?>" target="_blank" class="n<? if($_FANWE['user']['gender'] == 1) { ?> bc<? } else { ?> gc<? } ?>"><?=$_FANWE['user_name']?></a>
  <p>欢迎来<?=$_FANWE['setting']['site_name']?>！</p>
    </div>
<? } else { ?>
<a href="<?php echo FU('user/register',array()); ?>" target="_blank" class="go_reg"></a>
<a href="<?=$_FANWE['site_root']?>login.php?mod=qq" target="_blank"><img src="./tpl/images/icon_qq_qq.png"  class="l_qq"></a>
<a href="<?=$_FANWE['site_root']?>login.php?mod=sina" target="_blank" ><img src="./tpl/images/icon_sina.png"  class="l_sina"></a>
<? } ?>
<a href="<?=$today_daren['user']['url']?>" target="_blank" class="sg_name r5">
今日达人<br>
<span>@<?=$today_daren['user']['user_name']?></span>
</a>
<div class="wel_l"></div>
</div>