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
          <div class="list1_title">Edit Password</div>
          <div class="list2_content">
            <div class="edit">
                  <form method="POST" action="<?php echo U('Member-Index/doChangePWD');?>" name="doChangePWD"  onsubmit="return Validator.Validate(this,2);">
                
<input type="hidden" name="id" size="30" value="<?php echo ($memberInfo["id"]); ?>">
                  <fieldset>
                    <legend>Member Information</legend>
                    <div align="right">* Required information</div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" height="30"><label class="inputLabel" for="firstname">* Old Password:</label></td>
    <td height="30"><input type="text" name="password" size = "35" style="width:235px;" min="3"  dataType="Require" msg="Old Password is required!"  /><span class="alert"> *</span></td>
  </tr>
  <tr>
    <td width="20%" height="30"><label class="inputLabel" for="firstname">* New Password:</label></td>
    <td height="30"><input type="password" name="new_password" size = "35" style="width:235px;" min="3"  dataType="Require" msg="New Password is required!" /><span class="alert"> *</span></td>
  </tr>
  <tr>
    <td width="20%" height="30"><label class="inputLabel" for="firstname">* Confirm Password:</label></td>
    <td height="30"><input type="password" name="re_password" size = "35" style="width:235px;" min="3"  dataType="Repeat" to="new_password" msg="Confirm Password is wrong!" /><span class="alert"> *</span></td>
  </tr>
</table>
                    <div class="buttonRow"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="/"><img src="../Public/images/button_back.gif" alt="" border="0" /></a></td>
    <td align="right"><input type="image" src="../Public/images/button_submit.gif" alt="Submit the Information" title=" Submit the Information " /></td>
  </tr>
</table>
</div>
                  </fieldset>
                  </form>
            </div>
          </div>
        </div>
      </div>
    </div>