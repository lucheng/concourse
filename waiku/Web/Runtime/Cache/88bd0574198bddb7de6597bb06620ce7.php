<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><?php echo ($type["typename"]); ?>-<?php echo ($config["sitetitle"]); ?></title>
<meta name="Keywords" content="<?php echo ($type["keywords"]); ?>" />
<meta name="Description" content="<?php echo ($type["description"]); ?>"/>
<link rel="shortcut icon" href="__PUBLIC__/Web/images/favicon.ico" type="image/x-icon" />
<link href="__PUBLIC__/Web/images/default.css" rel="stylesheet" type="text/css"/>
<script src="__PUBLIC__/Web/js/common.js" type="text/javascript"></script>
<script src="__PUBLIC__/Web/js/marquee.js" type="text/javascript"></script>
</head>
<body>
<div id="minibg">
    <div id="mini">
	<div id="dlt"><?php echo Label(3);?></div>
    <div id="mini2"><script language="javascript" src="__PUBLIC__/Web/js/date.js"></script></div>
	</div>
</div>

	<div id="head">
		<div id="logo">
			<img src="__PUBLIC__/Uploads/logo/<?php echo ($config["sitelogo"]); ?>">
		</div>
	</div>
	<div id="menu_out">
		<div id="menu_in">
			<div id="menu">
				<ul id="nav">
					<li><a class="nav_on" id="mynav0" onmouseover="javascript:qh(0);" href="__APP__"><span>首 页</span></a></li>
					<?php if(is_array($menu)): $i = 0; $__LIST__ = array_slice($menu,0,9,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li class="menu_line"></li>
						<li><a href="<?php if(($vo["islink"])  ==  "0"): ?><?php echo (url(lists,$vo["typeid"])); ?><?php else: ?><?php echo ($vo["url"]); ?><?php endif; ?>"  target="<?php if(($vo["target"])  ==  "1"): ?>_self<?php else: ?>_blank<?php endif; ?>" onmouseover="javascript:qh(<?php echo ($i); ?>);" id="mynav<?php echo ($i); ?>" class="nav_off"><span><?php echo ($vo["typename"]); ?></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
				
				<div id="menu_con">
					<div id="qh_con0" style="DISPLAY: block">
						<ul>
						<!--
						<?php echo Label(2);;?>
						-->
						</ul>
					</div>
					<?php if(is_array($menuson)): $k = 0; $__LIST__ = array_slice($menuson,0,9,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$k;$mod = ($k % 2 )?><div id="qh_con<?php echo ($k); ?>" style="DISPLAY: none">
							<ul>
							<?php if(is_array($vo)): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): ++$i;$mod = ($i % 2 )?><li><a href="<?php echo (url(lists,$sub["typeid"])); ?>"><span><?php echo ($sub["typename"]); ?></span></A></LI><LI class="menu_line2"></LI><?php endforeach; endif; else: echo "" ;endif; ?> 
							</ul>
						</div><?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
			
			</div>
		</div>
	</div> 
<div id="positionbg">
    <div id="position"><?php echo ($nav); ?>&nbsp;&gt;&nbsp;列表</div>
	<div id="sousuo"><form name="search" method="POST" action="<?php echo U('s/search');;?>"><input type="text" name="k" id="kw" maxlength="60"><input type="submit" value="搜索" class="btn">{__TOKEN__}</form></div>
</div>

<div id="wrapper">

    <div id="content">
	     <div id="news">
			<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 5 )?><div class="list">
			 <div class="lb4">(<?php echo (substr($vo["addtime"],0,10)); ?>)</div>
			 <div class="lb1"></div>
			 <div class="lb2">[<a href="<?php echo (url(lists,$vo["typeid"])); ?>"><?php echo ($vo["typename"]); ?></a>]</div>
			 <div class="lb3"><a href="<?php echo (url(articles,$vo["aid"])); ?>"><?php echo ($vo["title"]); ?></a></div>
			 </div>
			 <?php if(($mod)  ==  "0"): ?><br/><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?> 
			 <div id="page"><ul style="text-align:left;"><?php echo ($page); ?></ul></div>
	</div></div>

	<div id="side">
		
         
	     <div class="ClassNav">
		      <div class="ClassTitle">分类导航</div>
		      <div class="ClassList">
			  <ul>
			  <?php if(is_array($dh)): $i = 0; $__LIST__ = $dh;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><a href="<?php echo (url(lists,$vo["typeid"])); ?>"><?php echo ($vo["typename"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
			  </ul></div>
		 </div>
         

	     <div class="RightRecommend">
		      <div class="RRTitle">精选推荐</div>
		     <div class="RRList"><ul> <?php echo ShowArt(0,5,0,2);;?></ul></div></div>
	
	     <div class="RightHotc">
		      <div class="RHTitle">浏览排行</div>
		      <div class="RHList"><ul><?php echo ShowArt(0,10,0,0);;?></ul></div>
         </div>
	</div>

</div><div id="copyrightbg">
<div id="copyright">
<p><?php echo ($config["sitetitle"]); ?> (<a href="__APP__"><?php echo ($config["siteurl"]); ?></a>) &copy; <?php echo date("Y");;?> 版权所有 All Rights Reserved.</p>
<p><?php echo ($config["sitelx"]); ?> <a href="http://www.miibeian.gov.cn" target="_blank"><?php echo ($config["sitetcp"]); ?></a></p>
</div>
</div>
<script language="javascript" src="__PUBLIC__/Web/js/Std_StranJF.Js"></script>

</body>
</html>