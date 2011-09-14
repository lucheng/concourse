<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页原型</title>
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
</head>
<body>
<!-- header start -->
<!-- header begin -->
<div class="header_top">
	 <div class="header_top_tel">
		<img src="/Huanshang_App/Tpl/default/Public/images/tel.png" />
	</div> 
	<div class="search_frm">
		 <div class="search_txt">
		  <input type="text" name="search"/>
		 </div>
		 <div class="search_btn">
		   <img src="/Huanshang_App/Tpl/default/Public/images/search_btn.jpg"/>
		 </div>
	</div>
</div>
<div class="clear"></div>
<div class="header_nav">
  <div class="menu">
		<ul>
			<li class="first"><a href="/index.php">首页</a></li>
			<li><span class="line"></span><a href="/index.php/Pages/1.html">公司介绍</a></li>
			<li><span class="line"></span><a href="#">品牌介绍</a></li>
			<li><span class="line"></span><a href="/index.php/Product">产品展示</a></li>
			<li><span class="line"></span><a href="#">新品推荐</a></li>
			<li class="last"><span class="line"></span><a href="#">促销专区</a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Article">新闻中心 </a></li>
			<li class="last"><span class="line"></span><a href="#">订购流程</a></li>
			<li class="last"><span class="line"></span><a href="#">代理加盟</a></li>
			<li class="last"><span class="line"></span><a href="/index.php/Contact">联系我们</a></li>
		</ul>
	</div>
	<div class="logo"></div>
</div>
<!-- header end -->

<!-- header end -->
<div id="mainbody">
 <div class="left_side">
   <div class="left_side_top">
   <h1>产品分类</h1>
    <div class="category">
     <ul>
     	<?php if(is_array($Category)): ?><?php $i = 0;?><?php $__LIST__ = $Category?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li class="left_side_line"><a href="/index.php/Product/index/id/<?php echo (is_array($vo)?$vo["id"]:$vo->id); ?>"><?php echo (is_array($vo)?$vo["title"]:$vo->title); ?></a></li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
     </ul>
    </div>
   </div>
    <div class="left_side_bottom"></div>
 </div>
 <div class="right-side">
   <div id="newsSlider">
	             <div class="changePic">
					<div class="ad" >
						<ul class="slider" >
							 <?php if(is_array($Scroll)): ?><?php $i = 0;?><?php $__LIST__ = $Scroll?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li><img src="../../Attachments/logo/<?php echo (is_array($vo)?$vo["attachment"]:$vo->attachment); ?>"/></li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
						 </ul>
						  <ul class="num" >
							<?php if(is_array($Scroll)): ?><?php $i = 0;?><?php $__LIST__ = $Scroll?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><li><?php echo ($i); ?></li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
						  </ul>
					</div>
				</div>
    </div>
    <div id="featured">
   		<div id="info" class="corner_10">
   		 <h4>公司介绍</h4>
   		 <p><?php echo (is_array($intro)?$intro["content"]:$intro->content); ?></p>
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
	  </div>
	  <div class="footer_right">
	 	 <ul>
        	<li><a href="http://www.maipop.com" target="_blank">&#x5173;&#x4E8E;maipop</a></li>
            <li><a href="http://www.maipop.com" target="_blank">&#x8054;&#x7CFB;&#x6211;&#x4EEC;</a></li>
            <li><a href="http://www.maipop.com/service.html" target="_blank">&#x670D;&#x52A1;</a></li>
            <li><a href="http://www.maipop.com/solution.htm" target="_blank">&#x70ED;&#x95E8;&#x62DB;&#x8058;</a></li>
            <li><a href="http://www.weipop.com" target="_blank">&#x53CB;&#x60C5;&#x94FE;&#x63A5;</a></li>
        </ul> 
	    
	  </div>
    	
        <p style="text-align:center;">Copyright @ 2011 maipop.com All Right Reserved </p>
    </div>
</div>
<!-- footer end -->
	<!-- 
		<div id="footer">
			<div class="footer_nav">
			  <div class="footer_left">
			   <div class="footer_logo">
				<img src="/Huanshang_App/Tpl/default/Public/css/images/company.png"/>
			   </div>
				
			  </div>
			  <div class="footer_right">
				 <ul>
					<li><a href="http://www.gxfans.com" target="_blank">公司名称：<?php echo ($company); ?></a></li>
					<li><a href="http://www.gxfans.com" target="_blank">联系电话：<?php echo ($telephone); ?></a></li>
				</ul> 
				
			  </div>
				
				<p style="text-align:center;">Copyright © 2011 gxfans.com All Right Reserved </p>
			</div>
		</div>
	</body>
</html>
 -->
<!-- 
<TABLE cellSpacing=0 cellPadding=0 width=860 align=center bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=3 height=3></TD>
    <TD vAlign=top width=860 bgColor=#0e0e0e></TD>
    <TD vAlign=top width=3></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=860 align=center bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=504 height=10></TD>
    <TD vAlign=top align=right width=350></TD></TR>
  <TR>
    <TD vAlign=top align=left width=504 height=76>公司名称:<?php echo ($company); ?> 联系电话：<FONT color=#443734><?php echo ($telephone); ?></FONT> 联 系 人:<?php echo ($linkman); ?><BR>
      <BR>
电子邮件:<?php echo ($email); ?> 
      公司地址:<?php echo ($address); ?> </TD>
<TD vAlign=top 
width=350><p>Powered by <strong><a href="http://www.gxfans.com" target="_blank">桓尚家具</a></strong> <em>1.0.0</em></p>
 </TD>
  </TR></TBODY></TABLE></BODY></HTML>
   -->
<!-- footer end --> 

<!-- footer end -->

</body>
</html>