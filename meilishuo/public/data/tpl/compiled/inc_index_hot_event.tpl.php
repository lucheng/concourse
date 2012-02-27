<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="fl box hot_event">
<div class="box_head">
<strong>uu_hot_event</strong>
<a href="<?php echo FU('club/index',array()); ?>" class="fr">更多>></a>
</div>
<div class="img_box">
<? if(!empty($img_event)) { ?>
<a href="<?=$img_event['url']?>" target="_blank" class="topic_img"><img alt="<?=$img_event['title']?>" height="70" class="lazyload" src="<?php echo getImgName($img_event['imgs'][0]['img'],90,70); ?>"></a>
<div class="inf">
<a href="<?=$img_event['url']?>" target="_blank" class="topic_title"><?php echo cutStr($img_event['title'],40,'...');?></a>
<p class="sms"><?=$img_event['content']?></p>
<p class="time_post"><?=$img_event['time']?>&nbsp;&nbsp;<span><?=$img_event['post_count']?></span>回应</p>
</div>
<? } ?>
</div>
<div class="list_box">
<ul><?php $ne_index = 1; if(is_array($new_topics)) { foreach($new_topics as $topic) { ?><li class="li_<?=$ne_index?>">
<a href="<?=$topic['url']?>" target="_blank" title="<?=$topic['title']?>"><?php echo cutStr($topic['title'],40,'...');?></a>
<span><?=$topic['time']?></span>
</li><?php $ne_index++; } } ?>
</ul>
</div>
</div>