<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="mogu_pub">
<p class="fl">
<span>最新社区活动</span><?php $br = ''; if(is_array($new_events)) { foreach($new_events as $topic) { ?><?=$br?><a href="<?=$topic['url']?>" target="_blank"><?php echo cutStr($topic['title'],30,'...');?></a><?php $br = '<br>'; } } ?>
</p>
<p class="fr">
<span>热门社区主题</span><?php $br = ''; if(is_array($hot_topics)) { foreach($hot_topics as $topic) { ?><?=$br?><a class="b" href="<?=$topic['url']?>" target="_blank"><?php echo cutStr($topic['title'],30,'...');?></a><?php $br = '<br>'; } } ?>
</p>
</div>