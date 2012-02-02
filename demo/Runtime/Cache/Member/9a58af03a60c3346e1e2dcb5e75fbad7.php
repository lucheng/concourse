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
<script type="text/javascript" src="../Public/Js/Region.js"></script>

<div class="col2">
        <div class="list1">
          <div class="list1_title">Shipping Address</div>
          <div class="list2_content">
            <div class="address">
             <form method="POST" action="<?php echo U('Member-Index/doShippingAddress');?>" name="doShippingAddress"  onsubmit="return Validator.Validate(this,2);">
              <fieldset>
                    <legend style="background-color:#999999">Member Information</legend>
                    <div class="information">NOTE: You can change your member information here .</div>
                    
                    
<input type="hidden" name="id" size="30" value="<?php echo ($memberInfo["id"]); ?>">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                     <tr>

            <th colspan="2" style="padding-left:0px;font-weight:bold" align="left">1.Your Personal Details</th>
          </tr>
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="firstname" >First Name:</label></td>
    <td width="80%"><!--<input type="text" name="address" size = "35" value="<?php echo ($memberInfo["firstname"]); ?>"  class="required"  dataType="Require" msg="firstname is required!" /><span class="alert"> *</span>-->
    <?php echo ($memberInfo["firstname"]); ?></td>
  </tr>
  <tr>

    <td width="20%" align="left" height="30"><label class="inputLabel" for="lastname">Last Name:</label></td>
    <td width="80%"><!--<input type="text" name="address" size = "35" value="<?php echo ($memberInfo["lastname"]); ?>"  class="required"  dataType="Require" msg="lastname is required!" /><span class="alert"> *</span>-->
    <?php echo ($memberInfo["lastname"]); ?>
    </td>
  </tr>
    <tr>
            <th colspan="2" height="30" style="padding-left:0px;font-weight:bold" align="left">2.Your Address</th>
          </tr>
  <tr>

    <td width="20%" align="left" height="30"><label class="inputLabel" for="Address">Address:</label></td>
    <td width="80%"><input type="text" name="address" size = "35" id="Address" value="<?php echo ($memberShippingAddress["address"]); ?>"    class="required"  dataType="Require" msg="Address is required!"  /><span class="alert"> *</span></td>
  </tr>
  
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="selCountries">Country:</label></td>
    <td width="80%">
     <select name="country" id="selCountries" onchange="loadRegion('selCountries',1,'selProvinces','<?php echo U('Home-Ajax/getRegion');?>');" class="required" style="font-size:11px;font-family:Verdana, Arial, Helvetica, sans-serif;"  dataType="Require" msg="Country is required!" >
    
  <option value="">Please Select</option> 
  <?php if(is_array($Countries)): $i = 0; $__LIST__ = $Countries;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><option value="<?php echo ($vo["id"]); ?>" <?php if(($memberShippingAddress['country'])  ==  $vo['id']): ?>selected<?php endif; ?>><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
  </select>

  <span class="alert"> *</span></td>
  </tr>
  
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="selProvinces">State/Province:</label></td>
    <td width="80%"><input type="text" name="state" size = "35" value="<?php echo ($memberShippingAddress["state"]); ?>"  class="required" />
   <!-- <select name="state" id="selProvinces"  class="required"  dataType="Require" msg="State is required!" >
            <option value="0">Please Select</option>
             <?php if(is_array($state)): $i = 0; $__LIST__ = $state;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><option value="<?php echo ($vo["id"]); ?>" <?php if(($memberShippingAddress['state'])  ==  $vo['id']): ?>selected<?php endif; ?>><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
    </select>-->
	<span class="alert"> *</span>
    
    </td>
  </tr>
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="city">City or APO/FPO:</label></td>
    <td width="80%"><input type="text" name="city" id="city" size = "35" value="<?php echo ($memberShippingAddress["city"]); ?>"  class="required"  dataType="Require" msg="City is required!" /><span class="alert"> *</span></td>

  </tr>
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="zip">Zip/Postal Code:</label></td>

    <td width="80%"><input type="text" name="zip" id="zip" size = "35" value="<?php echo ($memberShippingAddress["zip"]); ?>"  class="required"  dataType="Require" msg="Zip/Postal Code is required!" /><span class="alert"> *</span></td>
  </tr>
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="telphone">Telephone:</label></td>
    <td width="80%"><input type="text" name="telphone"  id="telphone"  class="required" size = "35" value="<?php echo ($memberShippingAddress["telphone"]); ?>"  dataType="Require" msg="Telephone is required!" /><span class="alert"> *</span></td>
  </tr>

 <!-- <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="fax">Fax Number:</label></td>
    <td width="80%"><input type="text" name="fax" id="fax"  class="required" size = "35" value="<?php echo ($memberShippingAddress["fax"]); ?>"  dataType="Require" msg="Fax Number is required!" /><span class="alert"> *</span></td>
  </tr>-->
  <!--<tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="isNewsletter">Subscribe Newsletter:</label></td>
    <td width="80%">Subscribe:
    <input type="radio" class="required" size = "35" name="isNewsletter" value="1" <?php if(($memberShippingAddress['isNewsletter'])  ==  "1"): ?>checked<?php endif; ?> />
    Unsubscribe:
    <input type="radio" class="required" size = "35" name="isNewsletter" value="0" <?php if(($memberShippingAddress['isNewsletter'])  ==  "0"): ?>checked<?php endif; ?> dataType="Group" msg="Newsletter is required!" /><span class="alert"> *</span>
    <?php if(isset($Newsletter)): ?><input type="hidden" name="Newsletter_id" value="<?php echo ($Newsletter["id"]); ?>" /><?php endif; ?>
    </td>

  </tr>-->
  <tr>
    <td width="20%" align="left" height="30"><label class="inputLabel" for="email">E-mail Address:</label></td>
    <td width="80%"><input type="text" name="email"  class="required email" id="email" size = "35" value="<?php echo ($memberInfo["email"]); ?>"  dataType="Email" msg="Email format is not correct!" /><span class="alert"> *</span></td>
  </tr>
</table>
                    <div class="buttonRow" style="float:right;"><input type="image" src="../Public/images/button_submit.gif" alt="Submit the Information" title=" Submit the Information " /></div> 
                  </fieldset>
                  </form>
            </div>
          </div>
        </div>
      </div>
    </div>