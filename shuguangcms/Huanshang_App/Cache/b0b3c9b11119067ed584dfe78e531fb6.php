<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><?php if(isset($titler)): ?><?php echo ($titler); ?><?php else: ?><?php echo (is_array($vo)?$vo["subject"]:$vo->subject); ?><?php endif; ?><?php echo (is_array($vo)?$vo["subject"]:$vo->subject); ?> <?php echo ($sitename); ?> - <?php echo ($seotitle); ?></title>
<meta content=<?php echo ($seokeywords); ?> name=keywords/>
<meta content=<?php echo ($seodescription); ?> name=description/>
<link rel="stylesheet" href="/Huanshang_App/Tpl/default/Public/css/reset.css"/>
<link rel="stylesheet" href="/Huanshang_App/Tpl/default/Public/css/nav.css"/>
<link rel="stylesheet" href="/Huanshang_App/Tpl/default/Public/css/common.css"/>
<script src="/Huanshang_App/Tpl/default/Public/js/jquery-1.3.1.js" type="text/javascript"></script>
<script src='/Huanshang_App/Tpl/default/Public/js/ad.js'></script>
<script src='/Huanshang_App/Tpl/default/Public/js/jquery.corner.js'></script>		
<script>
$(function(){
		//圆角
		$(".corner_10").corner();
		$(".products").corner("5px");
		$(".products_inner").corner("4px");
})	
</script>
<script type=text/javascript>$(function(){
	   $("#navigation ul li:has(ul)").hover(function(){
			$(this).children("ul").stop(true,true).slideDown(400);
       },function(){
		    $(this).children("ul").stop(true,true).slideUp("fast");
		});
})</script>

<script>
$(function(){
		//圆角
		$(".corner_10").corner();
		$(".products").corner("5px");
		$(".products_inner").corner("4px");
});
</script>
<style>
 /*联系我们*/
#info ul{
	width:720px;
	 padding:15px 0px 15px 15px;
	
}
#info ul li{
	 width:720px;
	 line-height:31px;
}
#info ul li strong{
 font-weight:bold;
 width:80px;
}
</style>
</head>
<body>
<!-- header start -->
<!-- 
<title><?php if(isset($titler)): ?><?php echo ($titler); ?><?php else: ?><?php echo (is_array($vo)?$vo["subject"]:$vo->subject); ?><?php endif; ?><?php echo (is_array($vo)?$vo["subject"]:$vo->subject); ?> <?php echo ($sitename); ?> - <?php echo ($seotitle); ?></title>
<meta content=<?php echo ($seokeywords); ?> name=keywords/>
<meta content=<?php echo ($seodescription); ?> name=description/>
 -->
<!-- header begin -->
<div class="header_top">
	 <div class="header_top_tel">
		<img src="/Huanshang_App/Tpl/default/Public/images/tel.png" />
	</div> 
	<div class="search_frm">
		 <form id="searchForm" method="post" action="/index.php/Search">
			 <div class="search_txt">
			  <input type="text" name="keyword"/>
			 </div>
			 <div class="search_btn" >
			   <input style="background:transparent;padding-left:30px;padding-top:3px; color:#fff;font-weight:bold;cursor:pointer" type="submit" name="submit" />
			 </div>
		 <?php if(C("TOKEN_ON")):?><input type="hidden" name="<?php echo C("TOKEN_NAME");?>" value="<?php echo Session::get(C("TOKEN_NAME")); ?>"/><?php endif;?></form>
	</div>
</div>
<div class="clear"></div>
<div class="header_nav">
  <div class="menu">
		<ul>
			<li class="first"><a href="/index.php">首页</a></li>
			<li><span class="line"></span><a href="/index.php/Pages/index/module/1/id/1.html">公司介绍</a></li>
			<li><span class="line"></span><a href="/index.php/Pages/index/module/2/id/5.html">品牌介绍</a></li>
			<li><span class="line"></span><a href="/index.php/Product">产品展示</a></li>
			<li><span class="line"></span><a href="/index.php/Product/index/module/1.html">新品推荐</a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Product/index/module/2.html">促销专区</a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Article">新闻中心 </a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Pages/index/module/3/id/11.html">订购流程</a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Pages/index/module/4/id/12.html">代理加盟</a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Contact">联系我们</a></li>
		</ul>
	</div>
	<div class="logo"></div>
</div>
<!-- header end -->

<!-- header end -->
<div id="mainbody">
<div class="left_side">
 <div class="left_side_category">
   <div class="left_side_top">
   <h1>关于我们</h1>
    <div class="category">
     <ul>
     	<?php if(is_array($pages)): ?><?php $i = 0;?><?php $__LIST__ = $pages?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li class="left_side_line"><a href="/index.php/Pages/<?php echo ($i); ?>.html" target=_self><?php echo (is_array($vo)?$vo["subject"]:$vo->subject); ?></a></li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
     </ul>
    </div>
   </div>
    <div class="left_side_bottom"></div>
    </div>
	<div class="left_contact">
    <div class="left_contact_box_top">
    <span> 联系方式</span>
    </div>
    <div class="left_contact_box">
       <ul>
        <span>
        QQ:
        </span>
        <?php if(is_array($qqs)): ?><?php $i = 0;?><?php $__LIST__ = $qqs?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$qq): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li>
         <a href='tencent://message/?uin=<?php echo (is_array($qq)?$qq["url"]:$qq->url); ?>' target='_blank'><img src="http://wpa.qq.com/pa?p=1:<?php echo (is_array($qq)?$qq["url"]:$qq->url); ?>:4"/></a>
         <a href='tencent://message/?uin=<?php echo (is_array($qq)?$qq["url"]:$qq->url); ?>' target='_blank'><?php echo (is_array($qq)?$qq["title"]:$qq->title); ?></a>
         </li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
       </ul>
        <ul>
        <span>
                  旺旺:
        </span>
        
         <?php if(is_array($wws)): ?><?php $i = 0;?><?php $__LIST__ = $wws?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li>
         <a href="http://amos.im.alisoft.com/msg.aw?v=2&amp;site=cntaobao&amp;s=1&amp;charset=utf-8&amp;uid=<?php echo (is_array($vo)?$vo["url"]:$vo->url); ?>" target="_blank">
         	<img src="http://amos.im.alisoft.com/online.aw?v=2&amp;site=cntaobao&amp;s=1&amp;charset=utf-8&amp;uid=<?php echo (is_array($vo)?$vo["url"]:$vo->url); ?>" alt="点击这里给我发消息">
         </a>
         <a href="http://amos.im.alisoft.com/msg.aw?v=2&amp;site=cntaobao&amp;s=1&amp;charset=utf-8&amp;uid=<?php echo (is_array($vo)?$vo["url"]:$vo->url); ?>" target="_blank">
         	<?php echo (is_array($vo)?$vo["title"]:$vo->title); ?>
         </a>
         </li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
         <!--<img src="/Huanshang_App/Tpl/default/Public/css/images/wangwang_offline.png">
         </img>
          <img src="/Huanshang_App/Tpl/default/Public/css/images/wangwang_online.png">
         </img>
         -->
         
       </ul>
     </div>
   </div>
 </div>
 
 <div class="right-side">
  <div class="root_info">
         <span>联系我们</span>
  </div>
  <div class="root_info_line"></div>
    <div id="featured">
   		<div id="info" class="corner_10">
   		  <ul>
   		  <li>
   		         <strong>公司名称：</strong><span><?php echo ($company); ?></span>
   		   </li>
   		   <li>
   		         <strong> 联系人：</strong><span><?php echo ($linkman); ?></span>
   		   </li>
   		    <li>
   		         <strong>  手机：</strong><span><?php echo ($telephone); ?></span>
   		   </li>
   		    <li>
   		         <strong> 传真：</strong><span><?php echo ($fax); ?></span>
   		   </li>
   		    <li>
   		         <strong> 邮箱：</strong><span><?php echo ($email); ?></span>
   		   </li>
   		    <li>
   		         <strong>地址：</strong><span><?php echo ($address); ?></span>
   		   </li>
   		  </ul>
   		 <!-- <p><?php echo (is_array($page)?$page["content"]:$page->content); ?></p> -->
   		</div>
	</div>
 </div>
</div>

<!-- footer start -->
<!-- footer begin -->
<div id="footer">
	<div class="footer_nav">
	  <div class="footer_left">
	   <div class="footer_logo">
			<img src="/Huanshang_App/Tpl/default/Public/css/images/company.png"/>
	   </div>
	   <div class="footer_left_contact">
	    <ul>
	     <?php if(is_array($links)): ?><?php $i = 0;?><?php $__LIST__ = $links?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li><a href="<?php echo (is_array($vo)?$vo["url"]:$vo->url); ?>" target="_blank"><?php echo (is_array($vo)?$vo["title"]:$vo->title); ?> </a></li><span>|</span><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
	     </ul>
	   </div>
	  </div>
	  <div class="footer_right">
	 	 <ul>
        	<li class="short">电话：<?php echo ($telephone); ?></li>
            <li  class="long">传真：<?php echo ($fax); ?></li>
            <li  class="long"> 邮箱：<?php echo ($email); ?></li>
            <li  class="short">联系人：<?php echo ($linkman); ?></li>
            <li class="add">地址：<?php echo ($address); ?></li>
        </ul> 
	    
	  </div>
    	
        <p>Copyright @ 2011 buptcms.com All Right Reserved </p>
    </div>
</div>

<!-- footer end -->
<script language="JavaScript">
//符合web标准且可关闭的多幅对联广告
 
lastScrollY = 0;
function heartBeat(){
 var diffY;
 if (document.documentElement && document.documentElement.scrollTop)
  diffY = document.documentElement.scrollTop;
 else if (document.body)
  diffY = document.body.scrollTop
 percent=.1*(diffY-lastScrollY);
 if(percent>0){
  percent=Math.ceil(percent);
 }
 else{
  percent=Math.floor(percent);
 }
 
 if (document.getElementById("rightDiv")) document.getElementById("rightDiv").style.top = parseInt(document.getElementById("rightDiv").style.top)+percent+"px";
 lastScrollY=lastScrollY+percent;
}
//下面这段删除后，对联将不跟随屏幕而移动。
window.setInterval("heartBeat()",1);
//关闭按钮
function close_left(){
    document.getElementById('left1').style.visibility='hidden';
}
function close_right(){
    document.getElementById('right1').style.visibility='hidden';
}
//设置样式
document.writeln("<style type=\"text\/css\">");
document.writeln("#leftDiv,#rightDiv{position:absolute;z-index:1000;width:115px;margin-bottom:2px;overflow:hidden;top:215px;right:2px;}");
document.writeln("#right_top_Div{width:115px;height:42px;right:1px;background:url(/Huanshang_App/Tpl/default/Public/css/images/right_float_bg_top.gif) top left no-repeat}");
document.writeln("#right_bottom_Div{width:115px;height:40px;right:1px;background:url(/Huanshang_App/Tpl/default/Public/css/images/right_float_bg_bottom.gif) bottom left no-repeat}");
document.writeln("#right1{width:115px;overflow:hidden;top:215px;right:2px;background:url(/Huanshang_App/Tpl/default/Public/css/images/right_float_bg_center1.gif) no-repeat}");
document.writeln(".qq_content{width:90px;height:20px;overflow:hidden;margin:5px 0px 5px 10px;background:url(/Huanshang_App/Tpl/default/Public/css/images/qqimg.jpg) no-repeat}");
document.writeln(".qq_content a {font-size:15px;color:#000;text-decoration:none;height:20px;overflow:hidden;margin-left:25px;padding-top:5px;}");
document.writeln("<\/style>");
//------左侧开始
//document.writeln("<div style=\"display:none\" id=\"leftDiv\" style=\"top:100px;left:5px\">");
//document.writeln("<div id=\"left1\">");
//document.writeln("<a href=\"javascript:close_left();\">点击我关闭<\/a>");
//document.writeln("<\/div>");
//document.writeln("<\/div>");
//------左侧结束，右侧开始
//计算时间，凌晨1点到8点不显示
var dd = new Date();
var hour = dd.getHours();
 
if(hour>=8||hour<1){
document.writeln("<div id=\"rightDiv\" style=\"top:215px;right:2px\">");
document.writeln("<div id=\"right_top_Div\">");
document.writeln("<\/div>");
document.writeln("<div id=\"right1\">");
<?php if(is_array($qqs)): ?><?php $i = 0;?><?php $__LIST__ = $qqs?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$qq): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?>//document.writeln("<div class=\"qq_content\">");
document.writeln("<div style=\"width:90px;height:20px;overflow:hidden;margin:5px 0px 5px 10px;background:url(http://wpa.qq.com/pa?p=1:<?php echo (is_array($qq)?$qq["url"]:$qq->url); ?>:4) no-repeat\">");
document.writeln("<a style=\"font-size:15px;color:#000;text-decoration:none;height:20px;overflow:hidden;margin-left:25px;padding-top:5px;\" href='tencent://message/?uin=<?php echo (is_array($qq)?$qq["url"]:$qq->url); ?>' target='_blank'><?php echo (is_array($qq)?$qq["title"]:$qq->title); ?></a>");
document.writeln("</div>");<?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
document.writeln("<\/div>");
document.writeln("<div id=\"right_bottom_Div\">");
document.writeln("<\/div>");
document.writeln("<\/div>");
}
 
</script>

</body>
</html>