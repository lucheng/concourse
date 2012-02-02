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
          <div class="list1_title">Favorites</div>
          <div class="list2_content">
            <div class="favorites">
                                <fieldset>
                    <legend>The Favorites</legend>
                    <div class="information">NOTE: Input the order number, can query to orders.</div>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>Products ID</strong></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>IMAGE</strong></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>PRICE</strong></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><strong>Operation</strong></td>
  </tr>
  <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr>
  
    <td bgcolor="#F5f5f5" height="30" align="center"><a href="<?php echo build_url($vo,'pro_url');?>" target="_blank"><?php echo ($vo['id']); ?></a></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><a href="<?php echo build_url($vo,'pro_url');?>" target="_blank"><img src="<?php echo build_url($vo,'pro_smallimage');?>" width="100" height="100" border="0" /></a></td>

    <td bgcolor="#F5f5f5" height="30" align="center"><font color="#FF0000"><?php echo getprice($vo["price"],$vo["pricespe"],false);?></font></td>
    <td bgcolor="#F5f5f5" height="30" align="center"><a href="<?php echo build_url($vo,'pro_url');?>">Add to Cart</a><br/><a href="<?php echo U('Member-Index/Delprofav',array('id'=>$vo['id']));?>">Delete</a></td>
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