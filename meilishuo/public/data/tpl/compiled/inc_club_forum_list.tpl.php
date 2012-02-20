<? if(!defined('IN_FANWE')) exit('Access Denied'); if(is_array($forum_list)) { foreach($forum_list as $forum_item) { ?><div class="piece1 mt20">
<div class="piece1_hd"></div>
<div class="piece1_bd" style="padding:10px 10px 20px;"><?php $class = 'fl'; if(is_array($forum_item)) { foreach($forum_item as $forum) { ?><div class="<?=$class?>" style="width:460px">
<h1 class="topic_grid_title">
<span><?=$forum['char']?>. </span>
<a target="_blank" href="<?php echo FU('club/forum',array("fid"=>$forum['fid'])); ?>"><?=$forum['name']?></a>
<a class="p_n" href="<?php echo FU('club/newtopic',array("fid"=>$forum['fid'])); ?>">发表主题</a>
</h1>
<ul class="topic_list w460"><? if(is_array($forum['topics'])) { foreach($forum['topics'] as $topic) { ?><li class="tl_f">
<div class="tl_c">
<a target="_blank" href="<?=$topic['url']?>"><img height="32" src="<?php echo getImgName($topic['imgs'][0]['img'],100,100); ?>" class="pic"></a>
<div class="show_big_img"><? if(is_array($topic['imgs'])) { foreach($topic['imgs'] as $img) { ?><img timgsrc="<?php echo getImgName($img['img'],100,100); ?>" class="show">
<? } } ?>
</div>
<p class="ct">
<a target="_blank" href="<?=$topic['url']?>" class="tit"><?php echo cutStr($topic['title'],42,'...');?></a>
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
<a class="all" target="_blank"  href="<?=$topic['url']?>">查看全文</a>
</li>
<? } } ?>
</ul>
<div class="topic_more clearfix clearfix">
<a class="fl pl10" target="_blank" ><?php echo sprintf('共有%s个主题',$forum['thread_count']); ?>. . .</a>
<a class="s_a fr" href="<?php echo FU('club/forum',array("fid"=>$forum['fid'])); ?>"></a>
</div>
</div><?php $class = 'fr'; } } ?>
</div>
<div class="piece1_ft"></div>
</div>
<? } } ?>