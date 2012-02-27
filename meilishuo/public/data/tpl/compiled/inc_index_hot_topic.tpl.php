<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="fr box hot_topic">
<div class="box_head">
<strong>uu_hot_topic</strong>
<a href="<?php echo FU('club/index',array()); ?>" class="fr">更多>></a>
</div>
<div class="img_box">
<? if(!empty($img_topic)) { ?>
<a href="<?=$img_topic['url']?>" target="_blank" class="topic_img"><img alt="<?=$img_topic['title']?>" height="70" src="<?php echo getImgName($img_topic['imgs'][0]['img'],90,70); ?>" class="lazyload"></a>
<div class="inf">
<a href="<?=$img_topic['url']?>" target="_blank" class="topic_title"><?php echo cutStr($img_topic['title'],40,'...');?></a>
<p class="sms"><?=$img_topic['content']?></p>
<p class="time_post"><?=$img_topic['time']?>&nbsp;&nbsp;<span><?=$img_topic['post_count']?></span>回应</p>
</div>
<? } ?>
</div>
<div class="list_box">
<ul><? if(is_array($hot_topics)) { foreach($hot_topics as $topic) { ?><li>
<a href="<?=$topic['url']?>" target="_blank" title="<?=$topic['title']?>" class="timg"><img alt="<?=$topic['title']?>" height="77" src="<?php echo getImgName($topic['imgs'][0]['img'],80,80); ?>" class="lazyload"></a>
<a href="<?=$topic['user']['url']?>" class="tuser GUID" uid="<?=$topic['uid']?>"><?=$topic['user']['user_name']?></a>
</li>
<? } } ?>
</ul>
</div>
</div>