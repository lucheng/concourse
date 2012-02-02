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
<script type="text/javascript" src="../Public/Js/Region.js"></script>
<script type="text/javascript" src="../Public/Js/cartdisp.js"></script>
<script type="text/javascript"> 
var ajaxshippingaddress="<?php echo U('Ajax/shippingaddress');?>";
function drop(){
	$("#cartform").attr("action","<?php echo U('Cart/clear_cart');?>");
	$("#cartform").submit();
}
function save(){
	jQuery("#cartform").attr("action","<?php echo U('Cart/save');?>");
	jQuery("#cartform").submit();
}
function send(islogin){
	var isAjaxLogin = Boolean(parseInt("<?php echo GetSettValue('isAjaxLogin');?>"));
	var shippingaddress;
	var mid=Boolean(parseInt("<?php echo ($mid); ?>"));
	<?php if(!empty($member_ShippingAddress)): ?>shippingaddress = true;<?php endif; ?>
	
	jQuery("#cartform").attr("action","<?php echo U('Cart/save',array('step'=>'checkout'));?>");
	if(check()){
		if(islogin){
			jQuery("#cartform").submit();
		}else if(mid && !shippingaddress){
			Boxy.shippingaddress("<?php echo U('Ajax/shippingaddress');?>");
		}else if(isAjaxLogin){
			if(Boxy.login("<?php echo U('Ajax/login');?>","<?php echo ($mid); ?>")){
				jQuery("#cartform").submit();
			}
		}else{
			jQuery("#cartform").submit();
		}
	}
}

function check(){
	try{
		jQuery("#cartform select").each(function(){
			if(jQuery(this).val()==''){
				throw "please select item's size";
			}
		});
	}
	catch(e){
		alert(e);
		return false;
	}
	return true;
}
</script>

<div class="col2"> 
        <div class="list1">
          <div class="list1_title1">
            <table width="940" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><a href="/">Home</a> > Your Shopping Cart Contents</td>
    <td align="right" style="padding-right:10px;"><a href="__APP__/help/">[help (?)]</a></td>
  </tr>
</table>

          </div>
          <div style="background-color:#ffffff"><img src="../Public/images/order1.gif" alt="" border="0" /></div>
          <?php if(empty($list)): ?><div class="shop">
            Your Shopping Cart is empty.
          </div>
          <div class="cart_button">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"> <a href="/"><img src="../Public/images/button_continue_shopping.gif" alt="" border="0" /></a> </td>
    <td align="right"></td>
  </tr>
</table>
            </div>
          <?php else: ?>
          
          <div class="list2_content" style="width:920px;">
            <div class="cart_title">
            <?php echo ($fee_readme); ?>
            </div>
            <div class="cart_content">
             <form name="form1" id="cartform" method="post" >
              <table  border="0" width="100%" cellspacing="0" cellpadding="0" class="cart_table">
     <tr>
        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Quantity</th>
        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Refresh</th>
        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Item Name</th>
        
        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Model</th>
		
        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Unit</th>

        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Total</th>
        <th style="background-color:#fcfcfc;height:25px;line-height:25px;">Delete</th>
     </tr>

	  
      <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr>
       <td>
       <input type="hidden" name="pid[]" value="<?php echo ($vo["pid"]); ?>">
		<input type="hidden" name="id[]" value="<?php echo ($vo["id"]); ?>">
		<input type="text" size="4" value="<?php echo ($vo["count"]); ?>" name="count[]" ></td>
       <td>
	<a href="###"  onClick="save();"><img border="0"  src="../Public/images/button_update_cart.gif" /></a>
</td>
       <td align="center">
         
<a href="<?php echo build_url($vo,'pid');?>"> <img src="<?php echo build_url($vo,'pro_smallimage');?>" border="0" alt="" title="" width="109" height="109" /></a><br /><a href="<?php echo build_url($vo,'pid');?>"><?php echo build_url($vo,'pro_name');?></a>
       </td>
       <td align="center">
         <?php if(is_array($vo['model'])): $i = 0; $__LIST__ = $vo['model'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subvo): ++$i;$mod = ($i % 2 )?><?php echo ($subvo['name']); ?>:<?php echo ($subvo['value']); ?><br/><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php if(!empty($vo['serial'])): ?>Serail:<?php echo ($vo["serial"]); ?><?php endif; ?>

       </td>
       <td align="center"><font color="#CC9900"><strong><?php echo getprice($vo['price'],$vo['pricespe'],false);?></strong></font></td>
       <td align="center"><font color="#339900"><strong><?php echo getprice($vo['price_total'],$vo['pricespe_total'],false);?></strong></font></td>

       <td>
<a href="<?php echo U('Cart/delete',array('id'=>$vo['id']));?>"><img src="../Public/images/small_delete.gif"  border="0"/></a></td>
     </tr><?php endforeach; endif; else: echo "" ;endif; ?>
      </table>
            </div>
            
            <div class="cartSubTotal">
<strong> Items Total:</strong> <span style="color:#CC9900;font-size:18px;font-weight:bold"><?php echo ($itemTotal); ?></span><br/>
 <?php if(($totalWeight)  >  "0"): ?><strong>Total Weight:</strong> <span style="color:#CC9900;font-size:18px;font-weight:bold"><?php echo ($totalWeight); ?> KG</span><br/><?php endif; ?>
  <?php if(!empty($discount['text'])): ?><strong>Sub Total:</strong> <span style="color:#CC9900;font-size:18px;font-weight:bold"><?php echo ($cartTotal); ?></span><br/>
 <strong>Discount:</strong> <span style="color:#CC9900;font-size:18px;font-weight:bold"><?php echo ($discount["text"]); ?></span><br/><?php endif; ?>
 <strong>Total Amount:</strong> <span style="color:#CC9900;font-size:18px;font-weight:bold"><?php echo ($totalAmount); ?></span>
            
            </div> 
            <div class="cart_button">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><a href="###"  onClick="drop();"><img src="../Public/images/clear.gif" alt="" border="0" /></a> <a href="/"><img src="../Public/images/button_continue_shopping.gif" alt="" border="0" /></a> </td>
    <td align="right"><a href="###"  onClick="save();"><img src="../Public/images/button_update_cart.gif" alt="" border="0" /></a> 
	<a href="###" onClick="send();" ><img src="../Public/images/button_checkout.gif" alt="" border="0" /></a></td>
  </tr>
</table>
</form>
            </div>
          </div><?php endif; ?>
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