<? if(!defined('IN_FANWE')) exit('Access Denied'); if($_FANWE['uid'] > 0) { ?>
<div class="fr" style="margin-top:20px">
<div class="my_btn">
<a href="<?php echo FU('u/me',array()); ?>" class="mb_bd<? if($_FANWE['user']['gender'] == 1) { ?> b<? } ?>">
<img class="mb_avt" src="<?php echo avatar($_FANWE['uid'],'s',1);?>" height="24">
<span class="mb_name<? if($_FANWE['user']['gender'] == 1) { ?> bc<? } else { ?> gc<? } ?>"><?=$_FANWE['user_name']?><b>的家</b></span>
<span class="mb_rb"></span>
</a>
</div>
<div class="my_shotcuts">
<a href="<?php echo FU('u/index',array()); ?>" class="publish">发表</a>
<a href="<?php echo FU('u/fav',array("uid"=>$_FANWE['uid'])); ?>" class="myfavs">喜欢</a>
<a href="<?php echo FU('settings/personal',array()); ?>" class="setting">设置</a>
<a href="<?php echo FU('u/message',array("uid"=>$_FANWE['uid'])); ?>" class="message<? if($_FANWE['user_notice']['5'] > 0) { ?> h<? } ?>">私信<? if($_FANWE['user_notice']['5'] > 0) { ?>(<?=$_FANWE['user_notice']['5']?>)<? } ?></a>
<a href="<?php echo FU('user/logout',array()); ?>" >退出</a>
</div>
</div>
<? } else { ?>
<ul class="l">
<li class="o_l">
<span><img class="fl" src="./tpl/images/icon_sina.png"><a class="fl" href="<?=$_FANWE['site_root']?>login.php?mod=sina">微博登录</a></span>
<span><img class="fl" src="./tpl/images/icon_qq_qq.png"><a class="fl" href="<?=$_FANWE['site_root']?>login.php?mod=qq">QQ登录</a></span>
<span><img class="fl" src="./tpl/images/tao.png"><a class="fl" href="<?=$_FANWE['site_root']?>login.php?mod=taobao">淘宝登录</a></span>
</li>
<li class="f">
<a href="<?php echo FU('user/login',array()); ?>">登陆</a>
</li>
<li class="login">
<a href="<?php echo FU('user/register',array()); ?>" target="_blank">注册</a>
</li>
</ul>
<? } ?>
