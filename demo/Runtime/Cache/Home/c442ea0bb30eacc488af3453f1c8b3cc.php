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
    </div>  <div id="pagebody">
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

<div class="col2">
  <div class="list1">
    <div class="list1_title"><a href="/">Home</a>
      <?php if(is_array($catep)): $i = 0; $__LIST__ = $catep;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?>> <a href="<?php echo build_url($vo,'cate_url');?>" title="<?php echo build_url($vo,'cate_name');?>"><?php echo build_url($vo,'cate_name');?></a><?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div class="sort_by">
      <form method="get">
        <label for="disp-order-sorter">Sort by: </label>
        <select name="order" onchange="this.form.submit();" id="disp-order-sorter">
          <option value="id" 
          <?php if(($_REQUEST['order'])  ==  "id"): ?>selected<?php endif; ?>
          >Sort by id
          </option>
          <option value="name" 
          <?php if(($_REQUEST['order'])  ==  "name"): ?>selected<?php endif; ?>
          >Sort by name
          </option>
          <option value="price" 
          <?php if(($_REQUEST['order'])  ==  "price"): ?>selected<?php endif; ?>
          >Sort by price
          </option>
          <option value="dateline" 
          <?php if(($_REQUEST['order'])  ==  "dateline"): ?>selected<?php endif; ?>
          >Sort by update
          </option>
        </select>
        <select name="sort"  onchange="this.form.submit();" >
          <option value="0" 
          <?php if(($_REQUEST['sort'])  ==  "0"): ?>selected<?php endif; ?>
          >Descending
          </option>
          <option value="1" 
          <?php if(($_REQUEST['sort'])  ==  "1"): ?>selected<?php endif; ?>
          >Ascending
          </option>
        </select>
      </form>
    </div>
    <div class="category">
      <ul id="classlist">
        <?php if(is_array($catec)): $i = 0; $__LIST__ = $catec;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li ><a href="<?php echo build_url($vo,'cate_url');?>" title="<?php echo build_url($vo,'cate_name');?>"><?php echo build_url($vo,'cate_name');?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
      </ul>
    </div>
       <script language="javascript" type="text/javascript">
$(document).ready(function(){

$("#spage").change(function()
{
window.location.href=$("#spage").val(); 
});

});
</script>
    <div class="dis">
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>Displaying <?php echo ($startRow); ?> to <?php echo ($endRow); ?> (of <?php echo ($totalRows); ?> products)</td>
          <td align="right"><?php echo ($page); ?></td>
        </tr>
      </table>
    </div>
    <div class="gride">
      <div class="gride_title"><?php echo build_url($cateinfo,'cate_name');?></div>
      <div class="gride_content" style="overflow: inherit; background: r">
        <div class="gride_pai">
          <ul>
            <?php if(is_array($attr)): $i = 0; $__LIST__ = $attr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><li><strong><?php echo ($vo["name"]); ?> :</strong>&nbsp;&nbsp;<a href="<?php echo U('cid/'.$cateinfo['id'],array('attr_id'=>$vo['id']));?>" >All</a>
                <?php if(is_array($vo['values'])): $i = 0; $__LIST__ = $vo['values'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): ++$i;$mod = ($i % 2 )?><a href="<?php echo U('cid/'.$cateinfo['id'],array('attr_id'=>$vo['id'],'attr_value'=>base64_encode($vo2)));?>"><?php echo ($vo2); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
              </li><?php endforeach; endif; else: echo "" ;endif; ?>
          </ul>
          <ul>
            <li>Price： <a href="<?php echo U('cid/'.$cateinfo['id'],array('pr'=>0,'pr2'=>50));?>" 
              <?php if(($_REQUEST['pr2'])  ==  "50"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >0-50</a> <a href="<?php echo U('cid/'.$cateinfo['id'],array('pr'=>50,'pr2'=>100));?>" 
              <?php if(($_REQUEST['pr2'])  ==  "100"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >50-100</a> <a href="<?php echo U('cid/'.$cateinfo['id'],array('pr'=>100,'pr2'=>200));?>" 
              <?php if(($_REQUEST['pr2'])  ==  "200"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >100-200</a> <a href="<?php echo U('cid/'.$cateinfo['id'],array('pr'=>200,'pr2'=>300));?>" 
              <?php if(($_REQUEST['pr2'])  ==  "300"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >200-300</a> </li>
            <li>Type： <a href="?type=ishot" 
              <?php if(($_REQUEST['type'])  ==  "ishot"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >Bestsellers</a> <a href="?type=isnew" 
              <?php if(($_REQUEST['type'])  ==  "isnew"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >New</a> <a href="?type=isrec" 
              <?php if(($_REQUEST['type'])  ==  "isrec"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >Recommended</a> <a href="?type=isprice" 
              <?php if(($_REQUEST['type'])  ==  "isprice"): ?>class="click" style="color:#FFFFFF"<?php endif; ?>
              >Specials</a> </li>
          </ul>
        </div>
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><div class="g_pro">
            <div class="g_pro_img"><a href="<?php echo build_url($vo,'pro_url');?>" altimg="<?php echo build_url($vo,'altimg');?>" title="<?php echo build_url($vo,'pro_name');?>" ><img src="<?php echo build_url($vo,'pro_smallimage');?>" width="160" height="160" alt="<?php echo build_url($vo,'pro_name');?>" border="0" /></a></div>
            <div class="g_pro_name"><a href="<?php echo build_url($vo,'pro_url');?>"><?php echo build_url($vo,'pro_name');?></a><br />
            </div>
            <div class="g_pro_pri"> <?php echo build_url($vo,'pro_price');?> </div>
          </div><?php endforeach; endif; else: echo "" ;endif; ?>
      </div>
    </div>
    <div id="cate_remark" style="clear:left; padding-top:15px; height:auto; line-height:25px;">
      <div class="cate_title" style="font-size:15px; color:#FFFFFF; background-color:#70A216; font-weight: bold; text-align:left; padding-left:10px"><?php echo build_url($cateinfo,'cate_name');?></div>
      <div class="cate_txt" style="text-align:left"><?php echo ($cateinfo["remark"]); ?></div>
    </div>
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