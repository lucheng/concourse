<? if(!defined('IN_FANWE')) exit('Access Denied'); 
0
|| checkTplRefresh('./tpl/pink2/page/magazine/magazine_index.htm', './tpl/pink2/page/album/album_flash.htm', 1334028148, './data/tpl/compiled/page_magazine_magazine_index.tpl.php', './tpl/pink2', 'page/magazine/magazine_index')
|| checkTplRefresh('./tpl/pink2/page/magazine/magazine_index.htm', './tpl/pink2/page/album/album_base.htm', 1334028148, './data/tpl/compiled/page_magazine_magazine_index.tpl.php', './tpl/pink2', 'page/magazine/magazine_index')
|| checkTplRefresh('./tpl/pink2/page/magazine/magazine_index.htm', './tpl/pink2/inc/pages.htm', 1334028148, './data/tpl/compiled/page_magazine_magazine_index.tpl.php', './tpl/pink2', 'page/magazine/magazine_index')
;?>
<?php 
$css_list[0]['url'] = './tpl/css/album.css';
     $css_list[1]['url'] = './tpl/css/reset.css';
     $css_list[2]['url'] = './tpl/css/barousel_demo.css';
$js_list[0] = './tpl/js/album.js';
     $js_list[1] = './tpl/js/jquery.min.js';
    $js_list[2] = './tpl/js/jquery.barousel.min.js';
    $js_list[3] = './tpl/js/barousel_demo.js';
  
 
 ?>

   <script type="text/javascript">
        $(document).ready(function () {
            //BAROUSEL - ITEM NAVIGATION
            $('#imgScroll_id').barousel({
                 manualCarousel: 1
            });
        });
    </script><? include template('inc/header'); ?><div id="body" class="fm960"> 
<? if(!empty($flash_album)) { ?><div class="piece1 mt30 albumhead">
<div class="piece1_hd"></div>
<div class="piece1_bd">
<div class="album_share">
<div class="album_s_p r5" id="albumIndexFlash">
<ul class="pic_s"><?php $list_index = 0; if(is_array($flash_album)) { foreach($flash_album as $album) { ?><li rel="<?=$list_index?>">
<? if($list_index == 0) { ?>
<img class="c" src="./tpl/images/album_left_icon.png" />
<div style="display:none"></div>
<? } else { ?>
<div></div>
<? } ?>
<img src="<?php echo getImgName($album['img']['img'],150,71,1); ?>"/>
</li><?php $list_index++; } } ?>
</ul>
<div class="pic_b">
<ul class="pic_big"><?php $list_index = 0; if(is_array($flash_album)) { foreach($flash_album as $album) { if($list_index == 0) { ?>
<li rel="<?=$list_index?>" shareID="<?=$album['share_id']?>">
<? } else { ?>
<li rel="<?=$list_index?>" shareID="<?=$album['share_id']?>" style="display:none;">
<? } ?>
<div class="pic_b_bg">
<div class="bg_left"><?php echo setTplUserFormat($album['uid'],1,0,'m',48,'','icard avt r3',''); ?><div class="bg_left_p"><?php echo setTplUserFormat($album['uid'],0,0,'',0,'icard','',''); ?><div class="followdiv"><!--getfollow <?=$album['uid']?> inc/getfollow/album--></div>
</div>
<p>
<a href="<?=$album['url']?>" target="_blank"><?php echo cutStr($album['title'],36,'...');?></a></a> <br />
<a style="font-size:12px;"><?php echo cutStr($album['content'],56,'...');?></a>
</p>
</div>
</div>
<a href="<?=$album['url']?>" target="_blank"><img src="<?php echo getImgName($album['img']['img'],527,215,1); ?>" /></a>
</li><?php $list_index++; } } ?>
</ul>
</div>
</div>
<div class="album_new"> <span class="album_new_bg"><a target="_blank" href="<?php echo FU('album/create',array()); ?>">创建专辑</a></span> <span class="album_yaya"> </span> </div>
</div>
</div>
<!-- /piece1_bd -->
<div class="piece1_ft"></div>
</div>
<script type="text/javascript">
jQuery(function($){
<? if(getIsManage('album')) { ?>
$('#albumIndexFlash .pic_big li').hover(function(){
var shareID = this.getAttribute('shareID');
if(shareID)
$.GetManageMenu('album',shareID,this);
},function(){});
<? } ?>

if($("#albumIndexFlash .pic_s li").length > 1)
{
$("#albumIndexFlash .pic_s li").click(function(){
FANWE.ALBUM_FLASH_HOVER = true;
FANWE.ALBUM_FLASH_INDEX = this.getAttribute('rel');
if(FANWE.ALBUM_FLASH_INDEX > 0)
FANWE.ALBUM_FLASH_INDEX--;
else
FANWE.ALBUM_FLASH_INDEX = FANWE.ALBUM_FLASH_COUNT;
indexFlashScroll();
});

$("#albumIndexFlash").hover(function(){
FANWE.ALBUM_FLASH_HOVER = true;
clearTimeout(FANWE.ALBUM_FLASH_TIMEOUT);
},function(){
FANWE.ALBUM_FLASH_HOVER = false;
FANWE.ALBUM_FLASH_TIMEOUT = setTimeout(indexFlashScroll,FANWE.ALBUM_FLASH_TIME);
});

indexFlashInit();
}
});

function indexFlashInit()
{
FANWE.ALBUM_FLASH_TIME = 3000;
FANWE.ALBUM_FLASH_COUNT = $("#albumIndexFlash .pic_s li").length - 1;
FANWE.ALBUM_FLASH_INDEX = 0;
FANWE.ALBUM_FLASH_HOVER = false;
FANWE.ALBUM_FLASH_TIMEOUT = setTimeout(indexFlashScroll,FANWE.ALBUM_FLASH_TIME);
}

function indexFlashScroll()
{
FANWE.ALBUM_FLASH_INDEX++;
if(FANWE.ALBUM_FLASH_INDEX > FANWE.ALBUM_FLASH_COUNT)
FANWE.ALBUM_FLASH_INDEX = 0;

$("#albumIndexFlash .pic_s li div").show();
var active = $("#albumIndexFlash .pic_s li").eq(FANWE.ALBUM_FLASH_INDEX);
$('div',active).hide();
$("#albumIndexFlash .pic_big li").hide();
$("#albumIndexFlash .pic_big li").eq(FANWE.ALBUM_FLASH_INDEX).show();
 
if(!FANWE.ALBUM_FLASH_HOVER)
FANWE.ALBUM_FLASH_TIMEOUT = setTimeout(indexFlashScroll,FANWE.ALBUM_FLASH_TIME);
}
</script><? } if(!empty($best_album)) { ?><div class="now_hot">
<div class="now_left">
<div class="now_hd"></div>
<div class="now_bd">
<h1>今日推荐</h1>
<ul id="nowBestAlbum"><? if(is_array($best_album)) { foreach($best_album as $album) { ?><li shareID="<?=$album['share_id']?>">
<a class="now_pic" target="_blank" href="<?=$album['url']?>"><img original="<?php echo getImgName($album['img']['img'],200,999,0); ?>" width="200" src="./tpl/images/lazyload.gif" class="lazyload"/></a>
<div class="now_like">
<span><em><?=$album['collect_count']?></em>喜欢</span>
<span><em><?=$album['best_count']?></em>推荐</span>
<span><em><?=$album['share_count']?></em>分享</span>
</div>
<div class="blank15"></div>
<div class="now_user"><?php echo setTplUserFormat($album['uid'],1,0,'m',48,'','icard fl r3',''); ?><div class="now_u_r">
<span><?php echo cutStr($album['title'],18,'...');?></span><?php echo setTplUserFormat($album['uid'],0,0,'',0,'n icard','',''); ?><div class="followdiv"><!--getfollow <?=$album['uid']?> inc/getfollow/album--></div>
</div>
</div>
</li>
<? } } ?>
</ul>
</div>
<div class="now_ft"></div>
</div>
<div class="now_right">
<div class="hd"></div>
<div class="bd" id="albumIndexHotNew">
<div class="book_daren_nav">
<span>热门作者</span>
<a class="album_tab c" rel="0" href="javascript:;" title="热门作者">HOT</a>
<a class="album_tab" rel="1" href="javascript:;" title="最新作者">NEW</a>
</div>
<ul class="album_daren_list"><? if(is_array($hot_users)) { foreach($hot_users as $user) { ?><li>
<a target="_blank" href="<?php echo FU('u/album',array("uid"=>$user['uid'])); ?>">
<img alt="<?=$user['user']['user_name']?>" src="<?php echo avatar($user['uid'],'b',$user['server_code'],1);?>" uid="<?=$user['uid']?>" width="100" height="100" class="fl avatar icard GUID">
</a>
<div class="daren_info">
<a target="_balnk" class="uname icard GUID" href="<?php echo FU('u/album',array("uid"=>$user['uid'])); ?>" uid="<?=$user['uid']?>"><?=$user['user']['user_name']?></a>
<div class="followdiv"><!--getfollow <?=$user['uid']?> inc/getfollow/album--></div>
<p class="share_info">
<a style="color:#999;" target="_blank" href="<?php echo FU('u/album',array("uid"=>$user['uid'])); ?>">分享了<span class="colp"><?=$user['user']['albums']?></span>个杂志社</a><br>
收获了<span class="colp"><?=$user['user']['collects']?></span>个喜欢<br>
</p>
</div>
</li>
<? } } ?>
</ul>
<ul class="album_daren_list" style="display:none;"><? if(is_array($new_users)) { foreach($new_users as $user) { ?><li>
<a target="_blank" href="<?php echo FU('u/album',array("uid"=>$user['uid'])); ?>">
<img alt="<?=$user['user']['user_name']?>" src="<?php echo avatar($user['uid'],'b',$user['server_code'],1);?>" uid="<?=$user['uid']?>" width="100" height="100" class="fl avatar icard GUID">
</a>
<div class="daren_info">
<a target="_balnk" class="uname icard GUID" href="<?php echo FU('u/album',array("uid"=>$user['uid'])); ?>" uid="<?=$user['uid']?>"><?=$user['user']['user_name']?></a>
<div class="followdiv"><!--getfollow <?=$user['uid']?> inc/getfollow/album--></div>
<p class="share_info">
<a style="color:#999;" target="_blank" href="<?php echo FU('u/album',array("uid"=>$user['uid'])); ?>">分享了<span class="colp"><?=$user['user']['albums']?></span>个杂志社</a><br>
收获了<span class="colp"><?=$user['user']['collects']?></span>个喜欢<br>
</p>
</div>
</li>
<? } } ?>
</ul>
</div>
<div class="ft"></div>
</div>
</div>
<script type="text/javascript">
jQuery(function($){
<? if(getIsManage('album')) { ?>
$('#nowBestAlbum li').hover(function(){
var shareID = this.getAttribute('shareID');
if(shareID)
$.GetManageMenu('album',shareID,this);
},function(){});
<? } ?>

$("#albumIndexHotNew .album_tab").click(function(){
var rel = this.getAttribute('rel');
$("#albumIndexHotNew .book_daren_nav span").html(this.title);
$("#albumIndexHotNew .album_tab").removeClass('c');
$(this).addClass('c');
$("#albumIndexHotNew .album_daren_list").hide();
$("#albumIndexHotNew .album_daren_list").eq(rel).show();
});
});
</script><? } ?>
<div class="album_subnav"><? if(is_array($_FANWE['cache']['albums']['category'])) { foreach($_FANWE['cache']['albums']['category'] as $category) { ?><a href="<?=$category['url']?>" title="<?=$category['name']?>"><img src="<?=$category['img']?>" /></a>
<? } } ?>
</div>
<div class="imagewall_sort">
<div class="fl" style="margin-left:0" >
<a>排序：</a>
<a href="<?php echo FU('album',array("sort"=>"new")); ?>"<? if($sort == 'new') { ?> class="c"<? } ?>>最新</a>
<a href="<?php echo FU('album',array("sort"=>"hot")); ?>"<? if($sort == 'hot') { ?> class="c"<? } ?>>最热</a>
</div>
</div>
<div class="blank12"></div>
<div id="album_container" class="albumwall album_td">
<div id="imgScroll_id" class="barousel">
    <div class="barousel_image">
        <!-- image 1 -->
        <img src="./tpl/images/addcc_03.gif" alt="" class="default" />
        <!-- image 2 -->
        <img src="./tpl/images/addall.png" alt="" />
        <!-- image xx -->
        <img src="./tpl/images/addcc_ok0.gif" alt="" />
    </div>
    <div class="barousel_content">
        <!-- content 1 -->
        <div class="default">
            1
        </div>
        <!-- content 2 -->
        <div>
            2
        </div>
        <!-- content xx -->
        <div>
           3
        </div>
    </div>
    <div class="barousel_nav">
<ul>
<li><img width=10px height=10px src="1.jpg"  /> </li>
<li><img width=10px height=10px  src="2.jpg"  /></li>
<li><img width=10px height=10px  src="3.jpg"  /></li>
</ul>
    </div>
     </div>
</div>
<div class="blank12"></div>
<? if($pager['page_count'] > 1) { ?>
<div class="pagination"> <? if($pager['page_count'] > 1) { ?>
<div class="pages">
<? if($pager['page'] > 1) { ?>
<a href="<?=$pager['page_prev']?>" class="page_prev" page="<?=$pager['prev_page']?>">&lt;上一页</a>
<? } if(is_array($pager['page_nums'])) { foreach($pager['page_nums'] as $page_num) { if($pager['page'] == $page_num['name']) { ?>
<a class="c"><?=$page_num['name']?></a>
<? } elseif($page_num['name'] == '...') { ?>
<i>...</i>
<? } else { ?>
<a href="<?=$page_num['url']?>" page="<?=$page_num['name']?>"><?=$page_num['name']?></a>
<? } } } if($pager['page'] < $pager['page_count']) { ?>
<a href="<?=$pager['page_next']?>" class="page_next" page="<?=$pager['next_page']?>">下一页&gt;</a>
<? } ?>
</div>
<? } ?> 
</div>
<? } ?>
</div>
<script type="text/javascript">
FANWE.NO_COUNTER = true;
var colHeight = 0;
var colIndex = 0;
var rowHtml = '<div class="album_list_t empty_row"><div class="hd"></div><div class="bd"></div><div class="ws_ft"></div></div>';
jQuery(function(){

<? if(getIsManage('album')) { ?>
$('.album_list_t').hover(function(){
var shareID = this.getAttribute('shareID');
if(shareID)
$.GetManageMenu('album',shareID,this);
},function(){});
<? } ?>
if($.browser.msie&&($.browser.version == "6.0")&&!$.support.style)
{
return ;
}
else{
$(".share_col").each(function(i){
$(this).append(rowHtml);
});
$(window).scroll(function(){
$(".share_col").each(function(i){
$('.empty_row .bd',this).height(0);
if($(this).height() > colHeight)
{
colIndex = i;
colHeight = $(this).height();
}
});

$(".share_col").each(function(i){
if(i != colIndex)
{
$('.empty_row .bd',this).height(colHeight - $(this).height());
}
});
});
}
});
</script><? include template('inc/footer'); ?>