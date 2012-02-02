<?php if (!defined('THINK_PATH')) exit();?>  <div id="pagebody">
      <div class="col1">
        <div class="menu">
          <div class="menu_title">My Account Information</div>
          <div class="menu_content">
            <ul>
              <li><a href="<?php echo U('Member-Index/index');?>">My Orders</a></li>
              <li><a href="<?php echo U('Member-Index/ShippingAddress');?>">Shipping Address</a></li>
              <li><a href="<?php echo U('Member-Index/profav');?>">Wish List</a></li>
              <li><a href="<?php echo U('Member-Index/ChangePWD');?>">Change Password</a></li>
              <li><a href="<?php echo U('Member-Index/LogOut');?>">Log out</a></li>
            </ul>
          </div>
        </div>
      </div>
 <div class="col2">
        <div class="list1">
          <div class="list1_title">All( <font color="#FF0000"><?php echo (($count)?($count):"0"); ?></font>)order</div>
          <div class="list2_content">
          <div style="text-align:left">
          <h5>Hi, <?php echo ($memberInfo["lastname"]); ?>&nbsp;<?php echo ($memberInfo["firstname"]); ?>. WELCOME BACK TO <?php echo GetSettValue('sitename');?></h5>
<h4 class="h4">Everything you need to track your orders, update your address book, edit your account information add more is right here.</h4>
 </div> 
            <div class="all">
              <fieldset>
                    <legend>Orders Information</legend>

                    <div class="information">NOTE: You can examine your order form here.</div>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>Order No.</strong></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>Order time</strong></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>Total</strong></td>
	<td bgcolor="#F5f5f5" height="30" align="center" style="word-break:break-all"><strong>Order remarks</strong></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>Status</strong></td>

    <td bgcolor="#F5f5f5" height="30" align="center"><strong>All order</strong></td>
  </tr>
  <?php if(is_array($orderslist)): $i = 0; $__LIST__ = $orderslist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr>
    <td bgcolor="#F5f5f5" height="30" align="center"><a href="<?php echo U('Member-Public/disporders',array("id"=>$vo['id']));?>" target="_blank"><?php echo ($vo["sn"]); ?></a></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><?php echo toDate($vo['dateline'],'Y-m-d H:i:s');?></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><font color="#FF0000"><?php echo ($vo["currencies_code"]); ?><?php echo ($vo["orders_total"]); ?></font></td>
	<td bgcolor="#F5f5f5" height="30" align="center"  style="word-break:break-all"><font color="#FF0000"><?php echo ($vo["remark"]); ?></font></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong><?php echo get_orders_status($vo['id']);?>
     <?php if(($vo['orders_status'])  ==  "3"): ?><?php if(!empty($vo['shipping_method'])): ?>(<?php echo ($vo['shipping_method']); ?>)<?php endif; ?><?php endif; ?></strong></td>

    <td bgcolor="#F5f5f5" height="30" align="center"><strong>  <?php if(($vo['orders_status'])  ==  "1"): ?><a href="<?php echo U('Home-Cart/payment',array("id"=>$vo['id']));?>" target="_blank" style="color:#006699; text-decoration:underline">Pay It</a><?php endif; ?>
          <?php if(($vo['orders_status'])  ==  "3"): ?><a href="<?php echo U('Index/ConfirmOrders',array("id"=>$vo['id']));?>" style="color:#006699; text-decoration:underline">Confirm receipt</a><?php endif; ?></strong></td>
  </tr><?php endforeach; endif; else: echo "" ;endif; ?>
  
     <tr>
    <td align="center" colspan="7" height="30" bgcolor="#F5f5f5"><?php echo ($show); ?></td>
  </tr>
</table>
                  </fieldset>
            </div>
          </div>
        </div>
      </div>
    </div>