<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<div class="piece1_bd plr10">
<div class="piece_title"><b>主题Club</b><a href="<?php echo FU('club/index',array()); ?>" target="_blank" class="more_in">点击进入</a></div>
<div class="fl" style="width:460px">
<ul class="bar_list"><?php $forum_index = 0; if(is_array($_FANWE['cache']['forums']['root'])) { foreach($_FANWE['cache']['forums']['root'] as $fid) { ?><?php $forum = $_FANWE['cache']['forums']['all'][$fid]; ?><li>
<a href="<?php echo FU('club/forum',array("fid"=>$fid)); ?>" target="_blank">
<img class="fl" src="<?=$forum['logo']?>">
</a>
<a target="_blank" href="<?php echo FU('club/forum',array("fid"=>$fid)); ?>"><?=$forum['name']?></a>
<br>Total:<?=$forum['thread_count']?>
</li>
<? if($forum_index > 8) { ?><?php break; } ?><?php $forum_index++; } } ?>
</ul>
<div class="hot_topic">
<div class="piece_title_s">今日头条</div><? if(is_array($top_list)) { foreach($top_list as $topic) { ?><div class="ht_f">
<a href="<?=$topic['url']?>"  target="_blank"><img class="fl ht_pic" src="<?php echo getImgName($topic['imgs'][0]['img'],90,70); ?>"></a>
<p class="ht_info">
<a class="ht_title" href="<?=$topic['url']?>" target="_blank"><?php echo cutStr($topic['title'],42,'...');?></a>
<a class="icard ht_name" href="<?=$topic['user']['url']?>" ><?=$topic['user']['user_name']?></a>
<span class="ht_content"><?php echo cutStr($topic['content'],110,'...');?></span>
</p>
</div>
<? } } ?>
</div>
</div>
<div class="fr" style="width:460px">
<div class="piece_title_s">最新主题</div>
<ul class="topic_list_new w460"><? if(is_array($new_list)) { foreach($new_list as $topic) { ?><li class="tl_f">
<div class="tl_c">
<a target="_blank" href="<?=$topic['url']?>"><img height="32" src="<?php echo getImgName($topic['imgs'][0]['img'],100,100); ?>" class="pic"></a>
<div class="show_big_img"><? if(is_array($topic['imgs'])) { foreach($topic['imgs'] as $img) { ?><img timgsrc="<?php echo getImgName($img['img'],100,100); ?>" class="show">
<? } } ?>
</div>
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
</div>