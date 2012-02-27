<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="club-title">
<b>主题Club</b>
</div>
<div class="piece1_bd">
<div class="bar_list">
<ul><?php $forum_index = 0; if(is_array($_FANWE['cache']['forums']['root'])) { foreach($_FANWE['cache']['forums']['root'] as $fid) { ?><?php $forum = $_FANWE['cache']['forums']['all'][$fid]; ?><li>
<a href="<?php echo FU('club/forum',array("fid"=>$fid)); ?>" target="_blank">
<img class="fl" src="<?=$forum['logo']?>">
</a>
<a target="_blank" href="<?php echo FU('club/forum',array("fid"=>$fid)); ?>"><?=$forum['name']?></a>
<br>Total:<?=$forum['thread_count']?>
</li>
<? if($forum_index > 8) { ?><?php break; } ?><?php $forum_index++; } } ?>
</ul>
</div>
<div class="bar_jg"></div>
<div class="fl bar_box_l">
<div class="top_topic">
<div class="piece_title_s">今日头条</div><? if(is_array($top_list)) { foreach($top_list as $topic) { ?><div class="ht_f">
<a href="<?=$topic['url']?>"  target="_blank" class="ht_pic r10"><img class="fl lazyload" src="<?php echo getImgName($topic['imgs'][0]['img'],90,70); ?>"></a>
<p class="ht_info">
<a class="ht_title" href="<?=$topic['url']?>" target="_blank"><?php echo cutStr($topic['title'],42,'...');?></a>
<a class="icard ht_name GUID" href="<?=$topic['user']['url']?>" uid="<?=$topic['uid']?>"><?=$topic['user']['user_name']?></a>
<span class="ht_content"><?php echo cutStr($topic['content'],100,'...');?></span>
</p>
</div>
<? } } ?>
</div>
</div>
<div class="fr bar_box_r">
<div class="piece_title_s">最新主题</div>
<ul class="topic_list_new"><? if(is_array($new_list)) { foreach($new_list as $topic) { ?><li class="tl_f">
<div class="tl_c">
<a target="_blank" href="<?=$topic['url']?>"><img height="32" src="<?php echo getImgName($topic['imgs'][0]['img'],100,100); ?>" class="pic lazyload"></a>
<p class="ct">
<a target="_blank" href="<?=$topic['url']?>" class="tit"><?php echo cutStr($topic['title'],42,'...');?></a><br>
<a class="n gc" href="<?=$topic['user']['url']?>"><?=$topic['user']['user_name']?></a>
<? if(!empty($topic['last'])) { ?>
<span class="p_time">
最后回复 : <a href="<?=$topic['last']['user']?>" target="_blank" class="n"><?=$topic['last']['user_name']?></a>
<?=$topic['last_time']?>
</span>
<? } ?>
</p>
</div>
<div class="count"><?=$topic['post_count']?></div>
<a target="_blank" class="all" href="<?=$topic['url']?>">查看全文</a>
</li>
<? } } ?>
</ul>
</div>
<div class="blank9"></div>
</div>