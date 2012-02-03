<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo ($article["title"]); ?><?php if(isset($nowpage)): ?>(<?php echo ($nowpage); ?>)<?php endif; ?>-<?php echo ($config["sitetitle"]); ?></title>
<meta name="Keywords" content="<?php echo ($config["sitekeywords"]); ?>" />
<meta name="Description" content="<?php echo ($config["sitedescription"]); ?>"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="__PUBLIC__/Web/images/favicon.ico" type="image/x-icon" />
<link href="__PUBLIC__/Web/images/default.css" rel="stylesheet" type="text/css"/>
<script src="__PUBLIC__/Web/js/common.js" type="text/javascript"></script>
<script src="__PUBLIC__/Web/js/marquee.js" type="text/javascript"></script>
</head>
<body onLoad="showre(<?php echo ($article["aid"]); ?>,1)">
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
    <div id="position"><?php echo ($nav); ?>&nbsp;&gt;&nbsp;正文</div>
	<div id="sousuo"><form name="search" method="post" action="<?php echo U('s/search');;?>"><input type="text" name="k" id="kw" maxlength="60"><input type="submit" value="搜索" class="btn">{__TOKEN__}</form></div>
</div>
</div>
<div id="wrapper">

	<div id="side">
	     <div class="RightRecommend">
		      <div class="RRTitle">精选推荐</div>
		     <div class="RRList"><ul> <?php echo ShowArt(0,10,0,2);;?></ul></div></div>
	
	     <div class="RightHotc">
		      <div class="RHTitle">浏览排行</div>
		      <div class="RHList"><ul><?php echo ShowArt(0,10,0,0);;?></ul></div>
         </div>
	</div>

	<div id="content">

         <div id="contextbg">
              <h1><?php echo ($article["title"]); ?><?php if(isset($nowpage)): ?>(<?php echo ($nowpage); ?>)<?php endif; ?></h1>
              <div id="newsinfo"><?php if(($config["isauthor"])  ==  "1"): ?>作者:<span class="blue"><?php echo ($article["author"]); ?></span><?php endif; ?> 时间:<span class="blue"><?php echo ($article["addtime"]); ?></span><?php if(($config["ishits"])  ==  "1"): ?>&nbsp;&nbsp;浏览:<span class="blue"><?php echo ($article["hits"]); ?></span><?php endif; ?><?php if(($config["iscopyfrom"])  ==  "1"): ?>&nbsp;&nbsp;来源:<span class="blue"><?php echo ($article["copyfrom"]); ?></span><?php endif; ?></div>
              <div id="adcontext1"></div>
			  <?php if(($config["iszy"])  ==  "1"): ?><div class="zhaiyao"><b>  核心提示:  </b><?php echo ($article["note"]); ?>...</div><?php endif; ?>
              <div id="context"><?php echo ($article["content"]); ?></div>
			  <div id="clear"></div>
			  <div id="page"><ul><?php echo ($page); ?></ul></div>
			  <?php if(($article["voteid"])  !=  "0"): ?><div class="artvote">
				<ul>
			<form action="__APP__/vote/update/id/<?php echo ($voteid); ?>" method="post">
		<li><h5><?php echo ($votetitle); ?></h5></li>
		<?php if(is_array($votedata)): $i = 0; $__LIST__ = $votedata;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><input type="<?php if(($votetype)  ==  "0"): ?>radio<?php else: ?>checkbox<?php endif; ?>"  name="<?php echo ($vo["title"]); ?>" value="<?php echo ($vo["num"]); ?>"><?php echo ($vo["title"]); ?></li><?php endforeach; endif; else: echo "" ;endif; ?>
		<li><input type="submit" value="投票" class="artsubmit">  <input type="button" onclick="window.open('<?php echo (url(votes,$voteid)); ?>')" value="查看" class="artsubmit"></li>
		</form>
			</ul>
			</div><?php endif; ?>
              <div id="adcontext2"></div>
			  <?php if(($config["mood"])  ==  "1"): ?><div style="margin:0 auto;width:530px;">
		 <script language="javascript">
		 var infoid = "<?php echo ($article["aid"]); ?>";
		 var root = "<?php echo ($url); ?>";
		 </script>
<script language = "JavaScript" src ="__PUBLIC__/Web/js/mood.js"></script>
		 </div><?php endif; ?>
              <div class="Toolsbg"><a href="javascript:history.back(-1)">返回</a><a href="#top">跳至顶部</a></div>

			  <?php if(($config["isshare"])  ==  "1"): ?><script src="__PUBLIC__/Web/js/wz.js"></script><?php endif; ?>
		 </div>

         <?php if(($config["updown"])  ==  "1"): ?><div id="next"><?php echo ($updown); ?></div><?php endif; ?>

		 <?php if(($config["xgwz"])  ==  "1"): ?><div id="NewsRelated">
			  <div id="NewsRelatedt">相关内容：</div><ul>
			  <?php if(is_array($keylist)): $i = 0; $__LIST__ = $keylist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><h3><a href="<?php echo (url(articles,$vo["aid"])); ?>"><?php echo ($vo["title"]); ?></a></h3></li><?php endforeach; endif; else: echo "" ;endif; ?>
			  </ul>
		 </div><?php endif; ?>
	<?php if(($config["isping"])  ==  "1"): ?><div id="pinglun">
			  <div id="pinglunt">以下是网友对 <span class="blue"><?php echo ($article["title"]); ?></span> 的评论：</div>
			  <div id="list"></div>
			  <div id="MultiPage"></div><!--评论分页 -->
              <div id="pinglunother">
               <div id="pinglunym"></div><!--评论信息 -->
              </div>
              <div id="pinglunfb">
			  <div id="pinglunfbt">发表评论</div>
			  <input type="hidden" name="aid" id="aid" value="<?php echo ($article["aid"]); ?>">
			  <textarea rows="20" name="content" cols="50" class="pltextarea" id="plContent"></textarea>
			  <div class="qdfb">大名:<input name="author" class="button" type="text" value="" id="Author"  maxlength="8" size="8"/>
			  <input type="button" value="确认发表" name="submit"  id="sendGuest" class="button submit" onClick="AddNew()"></div>
			  </div>
         </div>
		 <script type="text/javascript" src="__PUBLIC__/Web/js/ajaxpl.js"></script>
    </div><?php endif; ?>
</div><div id="footer">
<br />
<p align="right" style="color:#FFF;margin-right:60px">京ICP备06051668号</p>
</div>
</body>
</html>