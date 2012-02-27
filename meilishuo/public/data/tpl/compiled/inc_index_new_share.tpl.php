<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="fanwe_talk">
<ul><? if(is_array($shares)) { foreach($shares as $share) { ?><li>
<a href="<?=$share['url']?>" target="_blank" class="user_avatar"><img class="icard GUID" alt="<?=$share['user']['user_name']?>" uid="<?=$share['uid']?>" height="32" src="<?php echo avatar($share['uid'],'s',1);?>"></a>
<div class="inf">
<a class="icard" target="_blank" href="<?=$share['user']['url']?>"><?=$share['user']['user_name']?></a>
<span>刚刚 说：</span>
<p><?php echo fToDate($share['user']['reg_time'],'Y-m-d'); ?>&nbsp;加入</p>
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
<? } ?><?php $index++; if($index > 2) { ?><?php break; } } } ?>
</div>
</li>
<? } } ?>
</ul>
</div>