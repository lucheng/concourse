<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="mogu_talk">
<ul><? if(is_array($shares)) { foreach($shares as $share) { ?><li>
<a href="<?=$share['user']['url']?>" target="_blank"><img class="icard avt r3" alt="<?=$share['user']['user_name']?>" height="48" src="<?php echo avatar($share['uid'],'m',1);?>"></a>
<div class="tk">
<div class="inf">
<a class="icard" target="_blank" href="<?=$share['user']['url']?>"><?=$share['user']['user_name']?></a>
<span>刚刚 说：</span>
</div>
<p class="sms"><?=$share['content']?></p>
<div class="pic"><?php $index = 0; if(is_array($share['imgs'])) { foreach($share['imgs'] as $img) { if($img['type'] == 'g') { ?>
<div class="r3 g">
<a target="_blank" href="<?=$img['url']?>"><img alt="<?=$share['name']?>" src="<?php echo getImgName($img['img'],100,100); ?>" class="fl"></a><img src="./tpl/images/goods_tag.png" class="tag">
</div>
<? } else { ?>
<div class="r3">
<a target="_blank" href="<?=$img['url']?>"><img src="<?php echo getImgName($img['img'],100,100); ?>" class="fl"></a>
</div>
<? } ?><?php $index++; if($index > 1) { ?><?php break; } } } ?>
</div>
</div>
</li>
<? } } ?>
</ul>
<div class="right_trans"></div>
</div>