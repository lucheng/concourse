<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/mb.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title><?php echo ($config["sitetitle"]); ?>|<?php echo ($config["sitetitle2"]); ?></title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="value" -->
<script type="text/javascript">
	var value=1;
</script>
<!-- InstanceEndEditable -->
<link href="../Public/style/styleforindex.css" rel="stylesheet" type="text/css" />
<!--<script src="../Public/Scripts/change.js" type="text/javascript" defer="defer"></script>
-->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<style>
  .index_menu{
	background-image:url(../Public/images/index/bg.jpg);
}
</style>
</head>

<body>
<div id=contener>
    	<div id="top">
 	<span style="float:left;padding-left:48px;border:none;">
 	 <a href="index.html"><img src="../Public/images/index/logo.jpg" border="0" width="322" height="87" /></a></span>
   <table cellpadding="0" cellspacing="0" border="0" style="float:right">
     <tr><td height="44" valign="bottom" align="center" style="font-size:14px"><a class="version" href="#">中&nbsp;文</a> |<a  class="version" href="#"> English</a></td></tr>            
     <tr><td height="43" valign="middle"><img src="../Public/images/index/sub.png" /></td></tr>
   </table>   
</div>
        <div class="clear"></div>
	<div id="context">
		<div id="cont">
    <ul id="myul">
        <li><a  class="index_menu" href="__APP__/Index/index" target="_self">首&nbsp;页</a></li>
        <li><a class="expert_menu" href="__APP__/Pages/index/page/expert" target="_self">专家寄语</a></li>
        <li><a class="introduction_menu" href="__APP__/Pages/index/page/introduction" target="_self">中心介绍</a></li>
        <?php if(is_array($menu)): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><a href="<?php if(($vo["islink"])  ==  "0"): ?><?php echo (url(lists,$vo["typeid"])); ?><?php else: ?><?php echo ($vo["url"]); ?><?php endif; ?>"  target="_self"><?php echo ($vo["typename"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        <li><a  class="connectus_menu" href="__APP__/Pages/index/page/connectus" target="_self">联系我们</a></li>
        <li><a href="__APP__/Guestbook" target="_self">在线留言</a></li>
    </ul> 
</div>
 			<div id="bgimage">
 			 <img src="../Public/images/index/bging.jpg" width="1038" height="150" />
 			</div> 
  
         <div id="swf"> 
          <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="531" height="216">
            <param name="movie" value="../Public/swf/gg.swf" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="swfversion" value="6.0.65.0" />
            <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
            <param name="expressinstall" value="../Public/Scripts/expressInstall.swf" />
            <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="../Public/swf/gg.swf" width="531" height="216">
              <!--<![endif]-->
              <param name="quality" value="high" />
              <param name="wmode" value="transparent" />
              <param name="swfversion" value="6.0.65.0" />
              <param name="expressinstall" value="Scripts/expressInstall.swf" />
              <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
              <div>
                <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" /></a></p>
              </div>
              <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
        </object>
        </div>
        </div>
<!-- InstanceBeginEditable name="menu" -->
        <div id="menu">
<div class="big">
<div class="sm">

 <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><div class="Index<?php if(($vo["i"])  ==  "1"): ?>Left<?php else: ?>Rght<?php endif; ?>">
		<div class="IndexContentTitle">
		<div class="IndexContentTitleLeft"><a href='<?php echo (url(lists,$vo["typeid"])); ?>' class="bold font14"><?php echo ($vo["typename"]); ?></a></div>
		<div class="IndexContentTitleRight"><a href='<?php echo (url(lists,$vo["typeid"])); ?>'>更多 &raquo;</a></div>
		</div>
		<div class="IndexContentList">
		<ul>
		<?php if(is_array($vo['article'])): $i = 0; $__LIST__ = $vo['article'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): ++$i;$mod = ($i % 2 )?><li><a href="<?php echo (url(articles,$sub["aid"])); ?>"><?php echo ($sub["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?> 
		</ul>
		</div>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>

              <div class="englishfont">Academic Research</div>
              <div class="chinese">学术研究</div>
            </div>
            <div class="rese resee" >
	            <ul>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究f</a></li>
				</ul>
            </div>
        </div>
          <div class="big">
            <div class="sm">
              <div class="englishfont">News Events</div>
              <div class="chinese">要闻记事</div>
            </div>
             <div class="rese resee" >
	            <ul>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">dddd</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">eeee</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">fffffffffff</a></li>
				</ul>
            </div>
          </div>
          <div class="big">
            <div class="sm">
              <div class="englishfont">Elit Class</div>
              <div class="chinese">成功案例</div>
            </div>
            <div class="resue resee" >
	            <ul>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究f</a></li>
				</ul>
            </div>
            <div style="float:right;padding-right:38px;"><a href="#"><img src="../Public/images/index/5.jpg" width="66" height="27" border="0" /></a></div>
            <div class="clear"></div>
            <div class="sm">
              <div class="englishfont">Forward Views</div>
              <div class="chinese">前沿观点</div>
            </div>
             <div class="resu resee" >
	            <ul>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究f</a></li>
					<li><a href="<?php echo (url(articles,$sub["aid"])); ?>">学术研究f</a></li>
				</ul>
            </div>
          </div>
        </div>
        
        
        <div class="clear"></div>
        <div>
<table width="100%" height="40" cellpadding="0" cellspacing="0" border="0">
                <tr>
                	<td width="343" align="right"><a href="#"><img src="../Public/images/index/5.jpg" /></a></td>
                    <td width="326" align="right"><a href="#"><img src="../Public/images/index/5.jpg" /></a></td>
                    <td width="333" align="right"><a href="#"><img src="../Public/images/index/5.jpg" /></a></td>
                    <td></td>
                </tr>
            </table>
        </div>
<div class="left_photos">
            	<div class="sm">
                    <div class="englishfont">News photograph</div>
                    <div class="chinese">活动新闻照片</div>
                </div>
                <div class="sm" style="margin-top:15px">
                	<div class="thumimg">
                        <div class="image">
                          	<a href="#"><img src="../Public/images/index/1.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                    <div class="thumimg">
                        <div class="image">
                       		 <a href="#"><img src="../Public/images/index/1.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                    <div class="thumimg">
                        <div class="image">
                         	<a href="#"><img src="../Public/images/index/2.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                    <div class="thumimg">
                        <div class="image">
                        	<a href="#"><img src="../Public/images/index/1.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                    <div class="thumimg">
                        <div class="image">
                        	<a href="#"><img src="../Public/images/index/2.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                    <div class="thumimg">
                        <div class="image">
                        	<a href="#"><img src="../Public/images/index/1.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                    <div class="thumimg">
                        <div class="image">
                        	<a href="#"><img src="../Public/images/index/2.png" /></a>
                        </div>
                      <div class="hdTitle">活动标题</div>
                    </div>
                 
                </div>
      </div>
        <!-- InstanceEndEditable -->
<div class="clear"></div>
        <div id="footer">
<br />
<p align="right" style="color:#FFF;margin-right:60px">京ICP备06051668号</p>
</div>
</div>
<script type="text/javascript">
swfobject.registerObject("FlashID");
</script>
</body>
<!-- InstanceEnd --></html>