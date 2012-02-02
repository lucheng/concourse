<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php echo Meta($pagetitle,$pagekeywords,$pagedesc,$list);?>

<Link href="../Public/images/style.css" type="text/css" rel="stylesheet" />
<Link href="../Public/images/common.css" type="text/css" rel="stylesheet" />
<Link href="../Public/images/floatmenu.css" type="text/css" rel="stylesheet" />
<Link href="../Public/images/boxy/boxy.css" type="text/css" rel="stylesheet" />
 

<script type="text/javascript" src="../Public/Js/jquery.js"></script> 
<script type="text/javascript" src="../Public/Js/bigimg.js"></script> 
<script type="text/javascript" src="../Public/images/floatmenu.js"></script> 
<script type="text/javascript" src="../Public/Js/jquery.ae.image.resize.js"></script> 
<script type="text/javascript" src="../Public/Js/validator.js"></script>
<script type="text/javascript" src="../Public/Js/jcarousellite.js"></script>
<script type="text/javascript" src="../Public/images/boxy/boxy.js"></script>
<script language="JavaScript" type="text/javascript">

$(function() {
	$( "a[altimg] img" ).not('.m_pro_img img').aeImageResize({ width: 109, height: 109 });

	$(".carousel").jCarouselLite({
		btnNext: ".next",
		btnPrev: ".prev",
		visible: 5,
		auto:2000
	});
});
</script>
</head>





<body>

  <div id="page">
    <div id="header">
      <div class="logo"><a href="/"><img src="__ROOT__/<?php echo GetSettValue('sitelogo');?>" alt="" border="0" /></a></div>
      <div class="top">
        <div class="shopping">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100">&nbsp;</td>
    <td width="100" align="left">
      <a href="<?php echo U('Cart/disp');?>">Shopping Cart</a><br />Now in your cart<br /><a href="<?php echo U('Cart/disp');?>" style="color:#CC9900"><?php echo itemCount();?> items</a>

    </td>
  </tr>
</table>
        </div>
        <div class="free">
          <a href="<?php echo U('Cart/disp');?>"><img src="../Public/images/shipping.jpg" alt="" border="0" /></a>
        </div>
        <div class="cart">
        <div class="cart2">
         
            <a href="/">Home</a>
            <?php if(($mid)  >  "0"): ?><a href="<?php echo U('Member-Index/index');?>">My Account</a> 
            <a href="<?php echo U('Member-Index/LogOut');?>">LogOut</a>
            <?php else: ?>
            
			<a href="<?php echo U('Member-Public/Join');?>">Register</a>
            <a href="<?php echo U('Member-Public/Login');?>">Log In</a><?php endif; ?>
            <a href="<?php echo U('Cart/disp');?>">Shopping Cart</a>
            
            
          </div>
        <form name="Currencies" id="form1" action="<?php echo U('Index/Currencies');?>" method="post">
          <div class="cart1"> 
          
            <table width="180" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
   
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding-top:15px;">Currencies: &nbsp;</td>
    <td style="padding-left:5px;"> <select name="Currencies" onchange="document.Currencies.submit();">
	         <option value="">Please select...</option>
	         <?php if(is_array($currencies)): $i = 0; $__LIST__ = $currencies;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><option value="<?php echo ($vo["symbol"]); ?>" <?php if(($_SESSION ['currency']['symbol'])  ==  $vo['symbol']): ?>selected<?php endif; ?>><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
	         </select></td>
  </tr>
</table>
    </td>
    <td style="padding-left:5px;"><a href="#"><img src="../Public/images/icon.gif" alt="" border="0" /></a></td>
  </tr>
</table>
					
          </div>	</form>
          
        </div>
      </div>
      <div class="nav">
        <ul>
        <?php if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><?php if(($vo['type'])  ==  "top"): ?><li><a href="<?php echo ($vo["url"]); ?>" <?php if(($vo['isnew'])  ==  "1"): ?>target="_blank"<?php endif; ?>><?php echo ($vo["name"]); ?></a><span class="marker"></span></li><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?> 
        </ul>
      </div>
      <div class="search">
         <form action="<?php echo U('Search/index');?>" method="post" onsubmit="return Validator.Validate(this,2);">
          <table  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="290" align="left"><input type="text" name="key" class="input1"  dataType="Require" msg="keywords is required!" /></td>
    <td width="60" align="left"><input type="image" src="../Public/images/search.gif" alt="Search" title=" Search " class="input2"  /></td>
    <td  align="left" style="padding-left:5px;">Hot Search:
    <?php if(is_array($HotClass)): $i = 0; $__LIST__ = $HotClass;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><?php if(($i)  >  "1"): ?>,<?php endif; ?>
    <a href="<?php echo U('Search/index',array('key'=>$vo['name']));?>"><?php echo ($vo["name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
    </td>
  </tr>
    
</table></form>
      </div>
    </div>
 <div id="pagebody">
      <div class="col1">
        <div class="menu">
          <div class="menu_title">Categories</div>
          <div class="menu_content">
           <ul id="listMenu" >
  <?php if(is_array($catetree)): $i = 0; $__LIST__ = $catetree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><?php if(($vo['subcount'])  >  "0"): ?><li> <a href="<?php echo build_url($vo,'cate_url');?>"><?php echo build_url($vo,'cate_name');?> </a>
        <ul>
          <?php if(is_array($vo['sub'])): $i = 0; $__LIST__ = $vo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subvo): ++$i;$mod = ($i % 2 )?><?php if(($subvo['subcount'])  ==  "0"): ?><li> <a href="<?php echo build_url($subvo,'cate_url');?>"><?php echo build_url($subvo,'cate_name');?></a> </li><?php endif; ?>
            <?php if(($subvo['subcount'])  >  "0"): ?><li> <a href="<?php echo build_url($subvo,'cate_url');?>"><?php echo build_url($subvo,'cate_name');?> </a>
                <ul>
                  <?php if(is_array($subvo['sub'])): $i = 0; $__LIST__ = $subvo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subvo2): ++$i;$mod = ($i % 2 )?><li><a href="<?php echo build_url($subvo2,'cate_url');?>"><?php echo build_url($subvo2,'cate_name');?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
              </li><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
      </li><?php endif; ?>
    <?php if(($vo['subcount'])  ==  "0"): ?><li> <a href="<?php echo build_url($vo,'cate_url');?>"><?php echo build_url($vo,'cate_name');?></a> </li><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>


<script type="text/javascript">
//<![CDATA[

var listMenu = new FSMenu('listMenu', true, 'display', 'block', 'none');

listMenu.showDelay = 0;
listMenu.switchDelay = 0;
listMenu.hideDelay = 0;
//listMenu.cssLitClass = 'highlighted';
//listMenu.showOnClick = 0;
//listMenu.hideOnClick = true;
listMenu.animInSpeed = 0.2;
listMenu.animOutSpeed = 0.2;

//listMenu.animations[listMenu.animations.length] = FSMenu.animFade;
//listMenu.animations[listMenu.animations.length] = FSMenu.animSwipeDown;
//listMenu.animations[listMenu.animations.length] = FSMenu.animClipDown;


var arrow = null;
if (document.createElement && document.documentElement)
{
 arrow = document.createElement('span');
 arrow.appendChild(document.createTextNode('>'));
 // Feel free to replace the above two lines with these for a small arrow image...
 //arrow = document.createElement('img');
 //arrow.src = 'arrow.gif';
 //arrow.style.borderWidth = '0';
 arrow.className = 'subind'; 
}
addReadyEvent(new Function('listMenu.activateMenu("listMenu", arrow)'));


//]]>
</script>
          </div>
        </div>
        <div class="menu1">
          <div class="menu1_title">Bestsellers</div>
          <div class="menu1_content">
          <?php if(is_array($HotProducts)): $i = 0; $__LIST__ = $HotProducts;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><div class="m_pro"> 
              <div class="m_pro_img"><a href="<?php echo build_url($vo,'pro_url');?>" altimg="<?php echo build_url($vo,'altimg');?>" title="<?php echo build_url($vo,'pro_name');?>" ><img src="<?php echo build_url($vo,'pro_smallimage');?>" alt="<?php echo build_url($vo,'pro_name');?>" border="0" width="45" height="45" /></a></div>
              <div class="m_pro_name">
                <a href="<?php echo build_url($vo,'pro_url');?>"><?php echo build_url($vo,'pro_name');?></a>
              </div>
              <div class="m_pro_pri">
                <?php echo build_url($vo,'pro_price');?>
              </div>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
            
            
          </div>
        </div>
      </div>

<link rel="stylesheet" rev="stylesheet" href="../Public/css/fancybox/jquery.fancybox-1.3.4.css" />
<link rel="stylesheet" rev="stylesheet" href="../Public/Js/disp.css" />
<script language="JavaScript" type="text/javascript" src="../Public/css/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript">
var isAjaxLogin = Boolean(parseInt("<?php echo GetSettValue('isAjaxLogin');?>"));
var CartUrl='<?php echo U('Cart/disp');?>';
</script>
<script language="JavaScript" type="text/javascript" src="../Public/Js/jqdisp.js"></script>
  

 <div class="col2">
        <div class="list1">
          <div class="list1_title"><a href="/">Home</a> <?php if(is_array($catep)): $i = 0; $__LIST__ = $catep;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?>&nbsp;>&nbsp;
			  <?php if(($vo['id'])  ==  $cateinfo['id']): ?><?php echo ($vo["name"]); ?>
			  <?php else: ?>
			  <a href="<?php echo build_url($vo,'cate_url');?>" title="<?php echo build_url($vo,'cate_name');?>"><?php echo build_url($vo,'cate_name');?></a><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?> > <?php echo build_url($list,'pro_name');?> </div>
          <div class="list2_content">
          <div  style="line-height:35px;"><div style="line-height:35px;">Product <?php echo ($postion); ?>/<?php echo ($cate_count); ?></div><a href="<?php echo ($prev); ?>"><img src="../Public/images/button_prev.gif" alt="" border="0" /></a> <a href="<?php echo build_url($cate,'cate_url');?>"><img src="../Public/images/button_return_to_product_list.gif" alt="" border="0" /></a> <a href="<?php echo ($next); ?>"><img src="../Public/images/button_next.gif" alt="" border="0" /></a></div>
           <form name="cart_quantity" action="<?php echo U('Cart/add');?>" method="post">
			<input type="hidden" name="id" value="<?php echo ($list["id"]); ?>">
            <div class="goods">
             <div class="left_goods">
              <div class="jqzoom" id="spec-n1" style="z-index:1;width:358px"><img src="<?php echo build_url($list,'pro_bigimage');?>" width="358" height="300" jqimg="<?php echo build_url($list,'pro_bigimage');?>"/> <br />
                 <a rel="gallerys" href="<?php echo build_url($list,'pro_bigimage');?>" title="<?php echo build_url($list,'pro_name');?>">larger image</a>
               </div>
                  <div id="spec-n5">
		<div class="control" id="spec-left">
			<img src="../Public/css/left.gif">
		</div>
		<div id="spec-list">
			<div><ul>
			
 		<?php if(($list['detailcount'])  >  "0"): ?><?php if(is_array($list['tempdetailpics'])): $i = 0; $__LIST__ = $list['tempdetailpics'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><a rel="gallerys" href="<?php echo ($vo); ?>" title="<?php echo build_url($list,'pro_name');?>"><img src="<?php echo ($vo); ?>" ></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
				<?php else: ?>
				<?php if(is_array($gallerys)): $i = 0; $__LIST__ = $gallerys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><a rel="gallerys" href="<?php echo build_url($vo,'g_bigimage');?>" title="<?php echo build_url($list,'pro_name');?>"><img src="<?php echo build_url($vo,'g_bigimage');?>" ></a></li><?php endforeach; endif; else: echo "" ;endif; ?><?php endif; ?>		   
		 
			</ul></div>
		</div>
		<div class="control" id="spec-right">
			<img src="../Public/css/right.gif">
		</div>
              </div>
              </div>
             <div class="right_goods">
                
                <div class="goods_name"><strong><?php echo build_url($list,'pro_name');?></strong></div>
                <div class="goods_stock"><strong style=" color:#000000;">Product ID:</strong> &nbsp;&nbsp;<?php echo ($list["serial"]); ?></div>
                <div class="goods_pri"><strong>Price:</strong>  <font color="#FF6600" style="font-size:18px;">
     <span id="product_price"><?php echo getprice($list['price'],$list['pricespe'],false);?> </span></font><span id="attr_price"></span></div>
                <div class="goods_stock"><strong style=" color:#000000;">Availability:</strong> &nbsp;&nbsp;<?php if(($list['isdown'])  ==  "0"): ?>In Stock  <?php else: ?>Out Of Stock<?php endif; ?></div>
			    <div class="goods_size">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="attrlist"  >
      <?php if(is_array($attrlist)): $i = 0; $__LIST__ = $attrlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><?php if(($vo['input_type'])  ==  "1"): ?><tr>
 
    <td align="center" height="25"  valign="top">
		
			<strong><?php echo ($vo['name']); ?>:</strong>
		
    </td>
    <td>
    <ul>
    <?php if(is_array($vo['attrs'])): $i = 0; $__LIST__ = $vo['attrs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subvo): ++$i;$mod = ($i % 2 )?><li><input class="<?php echo ($subvo['attr_value']); ?>" attrname="<?php echo ($vo['name']); ?>" type="radio" name="attr[<?php echo ($vo['name']); ?>]" id="<?php echo ($subvo['id']); ?>" value="<?php echo ($subvo['attr_value']); ?>__<?php echo ($subvo['attr_price']); ?>" style="display:none" msg="<?php if(!empty($subvo['attr_price'])): ?>(<?php if(($subvo['attr_price'])  >  ""): ?>+<?php endif; ?><?php echo getprice_str($subvo['attr_price']);?>)<?php endif; ?>"/>
     <a href="javascript:void(0)">
		 <?php if(!empty($subvo['img_url'])): ?><img src="__ROOT__/<?php echo ($subvo['img_url']); ?>" border="0" class="attr_img"  width="31" height="31"/>
		 <?php else: ?> 
		 	<?php echo ($subvo['attr_value']); ?><?php endif; ?>
	 </a>
  </li><?php endforeach; endif; else: echo "" ;endif; ?>
  </ul>
  <div id="<?php echo ($vo['name']); ?>" style="display:none"></div>
 </td>
 
 </tr><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?> 
 
 <tr><td id="attr_selected" align="left" colspan="2"></td></tr>
 
</table></td>
  </tr> 
 
  <tr>
  <td><strong style="color:#000">Add to cart :</strong> <input name="count" value="1" type="text" style="width:60px;" /></td>
  </tr>
    <tr>
	 <td>
    <div id="btn_width">
		<div style="float:left; display:inline;"><a href="###"  onclick="return jQuery.addtocart();" ><img src="../Public/images/button_buy.jpg" alt="" border="0" /></a></div>
		<div style="float:right;"><a href="###"  onclick="jQuery.savecart();" id="savecart" ><img src="../Public/images/button_in_cart.jpg" alt="" border="0"/></a></div>
    </div>
    
	 <div id="cart_info">
    <div id="cart_alert" style="display:none"></div>
				<div id="cart_ok"  style="display:none">
					<img src="../Public/images/add_ok.jpg" border="0" usemap="#Map">
					<span class="cart_ok_content">Shopping Cart <a><?php echo itemCount();?></a> items Total <?php echo getprice_str(cart_total());?></span>
					<span><a href="###"  onclick="location.href='<?php echo U('Cart/disp');?>';" ><img src="../Public/images/button_check.jpg" alt="" border="0" /></a>
						<a href="###" onclick="jQuery.hide_cart_ok_content();"><img src="../Public/images/button_shopping.jpg" alt="" border="0" /></a>
					</span>
					
					<map name="Map" id="Map">
					  <area shape="rect" coords="198,-1,214,13" href="###" onclick="jQuery.hide_cart_ok_content();" />
					</map>
				</div>
    </div>
    </td>
  </tr>
</table>
                </div>
              </div>
            </div>
            </form>
          </div>
            <div class="list2_content">
            <div class="detail">
            <!-- AddThis Button BEGIN -->
			
				<div class="addthis_toolbox addthis_default_style ">
				<a class="addthis_button_preferred_1"></a>
				<a class="addthis_button_preferred_2"></a>
				<a class="addthis_button_preferred_3"></a>
				<a class="addthis_button_preferred_4"></a>
				<a class="addthis_button_compact"></a>
				<a class="addthis_counter addthis_bubble_style"></a>
				</div>
				<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4ddf0d0759c90dff"></script>
			
			<!-- AddThis Button END -->
              <div class="detail_title">Details: </div>
              <div class="detail_content">
<?php echo ($list["remark"]); ?>
              </div>
            </div>
            <div class="button">
<a href="<?php echo U('Member-Index/Addprofav',array('id'=>$list['id']));?>"><img src="../Public/images/wishlist.gif" alt="" border="0" /></a> 
<a href="<?php echo U('Pro/write_a_review',array('id'=>$list['id']));?>"><img src="../Public/images/button_write_review.gif" alt="" border="0" /></a> 
<a href="<?php echo U('Pro/tell_a_friend',array('id'=>$list['id']));?>"><img src="../Public/images/button_TellAFriend.gif" alt="" border="0" /></a>
            
            </div>
            <div class="review">
              <a href="__APP__/reviews-id-<?php echo ($list["id"]); ?>"><strong style="color:#666666">Current Reviews: <?php echo (($review_num)?($review_num):"0"); ?></strong></a><br />This product was added to our catalog on <?php echo date("D M j G:i:s T Y",$list['dateline']);?>.
            </div>
            </div>
			
			
			<div class="sameclass">people who buy the product ever bought</div>
			<div class="list2_content">
			
			  <?php if(is_array($sameclass)): $i = 0; $__LIST__ = $sameclass;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><div class="g_pro">
              <div class="g_pro_img"><a href="<?php echo build_url($vo,'pro_url');?>" altimg="<?php echo build_url($vo,'altimg');?>" title="<?php echo build_url($vo,'pro_name');?>" ><img src="<?php echo build_url($vo,'pro_smallimage');?>" width="160" height="160" alt="<?php echo build_url($vo,'pro_name');?>" border="0" /></a></div>
              <div class="g_pro_name"><a href="<?php echo build_url($vo,'pro_url');?>"><?php echo build_url($vo,'pro_name');?></a><br /></div>
              <div class="g_pro_pri">
               <?php echo build_url($vo,'pro_price');?>
              </div>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			
			
   </div>
        </div>
      </div>


  <div id="footer">
      <div class="footer">
        <div class="bottom_nav"><a href="/">Home</a><a href="<?php echo U('Pro/new');?>">New roducts</a><a href="<?php echo U('Pro/price');?>">Specials</a><a href="<?php echo U('Pro/index');?>">All products</a><a href="__APP__/Reviews">Reviews</a><a href="__APP__/Contact-Us/">Contact Us</a><a href="__APP__/FAQs/">FAQs</a><a href="__APP__/News/">News</a><a href="/blog">Blog</a></div>
        <div class="copyright">
          <?php echo ($Footer); ?><?php echo ($footcode); ?>
        </div>            
      </div>
    </div>
  </div>
</body>
</html>