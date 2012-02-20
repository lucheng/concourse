<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
	</div>
<div id="foot_wrap">
<div id="foot" class="fm960 mt10">
<div class="fl"><? if(is_array($_FANWE['cache']['navs']['all']['2']['childs'])) { foreach($_FANWE['cache']['navs']['all']['2']['childs'] as $navcate_id) { ?><?php 
$nav_cate = $_FANWE['cache']['navs']['all'][$navcate_id];
 ?>
<div class="links fl"><?php $first_nav_cate = ''; ?><b><?=$nav_cate['name']?></b>
<ul><? if(is_array($nav_cate['navs'])) { foreach($nav_cate['navs'] as $nav_id) { ?><?php $nav = $_FANWE['cache']['navs']['navs'][$nav_id]; ?><li><a href="<?=$nav['url']?>"<? if($nav['target'] == 1) { ?> target="_blank"<? } ?>><?=$nav['name']?></a></li>
<? } } ?>
</ul>
</div>
<? } } ?>
</div>
<div class="fr foot_right">     
 <div class="logos fl">
<a href="<?php echo FU('index',array()); ?>"><img class="logo fl" src="<?=$_FANWE['site_root']?><?=$_FANWE['setting']['foot_logo']?>" /></a>
</div>

</div>
</div>
<div class="foot-links">
友情链接：<?php $link_index = 1; if(is_array($_FANWE['cache']['links']['all'])) { foreach($_FANWE['cache']['links']['all'] as $link) { if($link_index > 12) { ?><?php break; } ?>
<a href="<?=$link['url']?>" target="_blank"><?=$link['name']?></a>&nbsp;&nbsp;<?php $link_index++; } } ?>
<a href="<?php echo FU('link',array()); ?>" target="_blank" class="fr">更多...</a>
</ul>
</div>
<div class="copyright"><?=$_FANWE['setting']['footer_html']?></div>
</div>
<div id="back2top"><a href="#"><span class="arrow">▲</span>回顶部</a></div>
</body>
<?php 
$default_js[] = './public/js/lang.js';
$default_js[] = './public/js/setting.js';
$default_js[] = './public/js/jquery.easing.js';
$default_js[] = './public/js/jquery.bgiframe.js';
$default_js[] = './public/js/jquery.lazyload.js';
$default_js[] = './public/js/jquery.weebox.js';
$default_js[] = './public/js/ajaxfileupload.js';
$default_js[] = './public/js/jquery.dragsort.js';
 ?>
<script src="<?php echo scriptParse($default_js); ?>" type="text/javascript"></script><? if(is_array($js_list)) { foreach($js_list as $js) { ?><script src="<?php echo scriptParse($js); ?>" type="text/javascript"></script>
<? } } ?><!--dynamic getScript--><script type="text/javascript">
jQuery(function($){
$(".lazyload").lazyload({"placeholder":"./tpl/images/lazyload.gif"});
});
</script>
</html>