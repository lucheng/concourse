<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<?php 
$cate_index = 0;
$cate_display = array(
'1'=>array(2,15),
'2'=>array(6),
'3'=>array(4),
'4'=>array(7),
);
 if(is_array($cate_list)) { foreach($cate_list as $cid => $cate) { ?><?php 
$cate_index++;
$big_index = array();
$share_index = 0;
$share_count = 18;
$tag_index = 0;
$user_index = 0;
$cate_big_displays = array();

if($cate_index == 1)
$share_count = 27;

if(isset($cate_display[$cate_index]))
$big_index = $cate_display[$cate_index];
else
$big_index[] = rand(1,8);

$cate_item = $_FANWE['cache']['goods_category']['all'][$cid];
 ?>
<div class="piece1 mb20">
<div class="piece1_hd"></div>
<div class="piece1_bd" style="padding:15px 25px 15px">
<div class="share_title">
<?php echo sprintf('关于<em>%s</em>的分享',$cate_item['short_name']); ?>
<span class="st_key">
<a target="_blank" href="<?php echo FU('book/cate',array("cate"=>$cate_item['cate_code'],"sort"=>"hot7")); ?>">热门</a>
<a target="_blank" href="<?php echo FU('book/cate',array("cate"=>$cate_item['cate_code'],"sort"=>"new")); ?>">最新</a>
<span>|</span><? if(is_array($cate['tags'])) { foreach($cate['tags'] as $tag => $encode) { ?><a target="_blank" href="<?php echo FU('book/cate',array("cate"=>$cate_item['cate_code'],"sort"=>"hot7","tag"=>$encode)); ?>"><?=$tag?></a>
<? if($tag_index > 11) { ?><?php break; } ?><?php $tag_index++; } } ?>
</span>
</div>
<? if($cate_index == 1) { ?>
<div class="share_tetris" style="height:302px;overflow:hidden">
<? } else { ?>
<div class="share_tetris" style="height:201px;overflow:hidden">
<? } if(is_array($cate['shares'])) { foreach($cate['shares'] as $sid => $share_item) { ?><?php 
$share = $share_item['share'];
$size = 101;
$width = 100;
$share_index++;
$class = 't1';
if($share_index > $share_count)
break;

$mod_index = $share_index % 9;
$top = floor($share_index / 9);

if(isset($cate_big_displays[$mod_index]))
{
unset($cate_big_displays[$mod_index]);
unset($big_index[array_search($share_index,$big_index)]);
$share_index+=2;
$mod_index = $share_index % 9;
$top = floor($share_index / 9);
}

if(in_array($share_index,$big_index))
{
$width = 200;
$share_index++;
$cate_big_displays[$mod_index] = 1;
$class = 't2';
}

if($mod_index == 0)
{
$mod_index = 9;
$top--;
}

$top = $top * $size;
$left = ($mod_index - 1) * $size;
 ?>
<div class="cate_tag_item <?=$class?>" style="top:<?=$top?>px;left:<?=$left?>px;">
<img src="<?php echo getImgName($share['imgs'][0]['img'],"$width","$width"); ?>">
<div class="sk" style="display:none; ">
<div class="fc"><span><?=$share['collect_count']?></span><i></i></div>
<a href="<?php echo FU('book/index',array("cate"=>$cate_item['cate_code'],"tag"=>$share_item['tag_encode'])); ?>" target="_blank" class="kw"><?=$share_item['tag_name']?></a>
<a href="<?php echo FU('u/index',array("uid"=>$share['uid'])); ?>" target="_blank" class="au">@<?=$share['user_name']?></a>
</div>
</div>
<? } } ?>
</div>
<div class="share_who">
她们在分享<?=$cate_item['short_name']?>：<? if(is_array($cate['user'])) { foreach($cate['user'] as $user) { if($user_index > 20) { ?><?php break; } ?><?php $user_index++; ?><a target="_blank" href="<?php echo FU('u/index',array("uid"=>$user['uid'])); ?>"><img class="r3 icard" height="24" src="<?php echo avatar($user['uid'],'s',1);?>" alt="<?=$user['user_name']?>" /></a>
<? } } ?>
</div>
</div>
</div>
<? } } ?>