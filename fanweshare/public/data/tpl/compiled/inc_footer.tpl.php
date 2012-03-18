<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
	</div>
<div id="foot_wrap">
<div class="blank20 mt10"></div>
<div class="blank20 mt10"></div>
<? if(MODULE_NAME == 'Index') { ?>
<div class="foot-links clearfix">
<span class="fl">
友情链接：<?php $link_index = 1; if(is_array($_FANWE['cache']['links']['all'])) { foreach($_FANWE['cache']['links']['all'] as $link) { if($link_index > 12) { ?><?php break; } ?>
<a href="<?=$link['url']?>" target="_blank"><?=$link['name']?></a>&nbsp;&nbsp;<?php $link_index++; } } ?>
</span>
<a href="<?php echo FU('link',array()); ?>" target="_blank" class="fr">更多...</a>
</ul>
</div>
<? } ?>
<div class="copyright"><?=$_FANWE['setting']['footer_html']?></div>
</div>
<div id="back2top"><a href="#"><span class="arrow">▲</span>回顶部</a></div>
<div id="USER_INFO_TIP" style="display:none;">
<div class="tip_info">
<img class="avatar" alt="" src="./tpl/images/loading_60.gif">
<div>
<p><a href="#">&nbsp;</a></p>
<p>获取用户信息...</p>
<p>&nbsp;</p>
</div>
</div>
<div class="tip_toolbar">&nbsp;</div>
<div class="tip_arrow"></div>
</div>
</body>
<?php 
    $default_js = array();
$default_js[] = './public/js/lang.js';
$default_js[] = './public/js/setting.js';
$default_js[] = './public/js/jquery.bgiframe.js';
$default_js[] = './public/js/jquery.weebox.js';
$default_js[] = './public/js/ajaxfileupload.js';
$default_js[] = './public/js/jquery.dragsort.js';
 ?>
<script src="<?php echo scriptParse($default_js); ?>" type="text/javascript" defer="true"></script><? if(is_array($js_list)) { foreach($js_list as $js) { ?><script src="<?php echo scriptParse($js); ?>" type="text/javascript"></script>
<? } } ?><!--dynamic getScript--><script type="text/javascript">
jQuery(function($){
$(".lazyload").lazyload({"placeholder":"./tpl/images/lazyload.gif"});
});
</script>
</html>