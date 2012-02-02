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