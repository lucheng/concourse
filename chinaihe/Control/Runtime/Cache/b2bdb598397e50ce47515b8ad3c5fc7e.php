<?php if (!defined('THINK_PATH')) exit();?><link href="../Public/images/skin.css" rel="stylesheet" type="text/css" />
<link href="../Public/images/main.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="../Public/images/mail_leftbg.gif">
    <img src="../Public/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../Public/images/content-bg.gif">
    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt"><?php echo ($title); ?></div></td>
      </tr>
    </table>
    </td>
    <td width="16" valign="top" background="../Public/images/mail_rightbg.gif"><img src="../Public/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="../Public/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    	
    	<table width="100%" border="0">
  <tbody><tr>
    <td width="46%" class="title2">【SMTP设置】</td>
    <td width="54%"><font color="red"></font></td>
  </tr>
</tbody></table>
	    <form name="defaultMailActionForm" method="post" action="/sysadm/member/saveDefaultMailAction.do" onsubmit="return checkForm();">
  <table width="100%" border="0" cellpadding="2" cellspacing="0">
	<tbody><tr>
      <td width="23%" align="right" class="table-list-title" 　class="table-list-title">邮件主机名</td>
      <td width="77%" class="table-list-style"><input type="text" name="host" size="30" value="">&nbsp;</td>
    </tr>
    <tr>
      <td width="23%" align="right" class="table-list-title" 　class="table-list-title">发送方邮件地址</td>
      <td width="77%" class="table-list-style"><input type="text" name="from" size="30" value="">&nbsp;</td>
    </tr>
  
    <tr>
      <td align="right" class="table-list-title">邮件密码</td>
      <td class="table-list-style"><input type="password" name="pwd" size="30" value="">
	 &nbsp;</td>
    </tr>
	    <tr>
      <td align="right" class="table-list-title">验证邮件密码</td>
      <td class="table-list-style"><input type="password" name="pwd1" size="30" value="">
	 &nbsp;</td>
    </tr>
	<tr>
      <td align="right" class="table-list-title">是否启用</td>
      <td class="table-list-style">
	  <input type="radio" name="isuse" value="0" checked="checked">否
	  <input type="radio" name="isuse" value="1">
	  是（如果不启用此设置，系统会自动默认一个系统帐号来发送邮件）
	 &nbsp;</td>
    </tr>
	<input type="hidden" name="userid" value="">
    <tr>
      <td colspan="2" align="center" class="table-list-title">
	  <input type="submit" value="保  存">
&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset" value="重  置">
	  </td>
    </tr>
  </tbody></table>
  <span class="STYLE1"><br>
注：此设置并非所有的网站都会用到，只有有发送邮件功能的网站才会用到。网站发送邮件时会使用此设置，如果没有此设置或不启用此设置时，系统会调用默认的SMTP来发送邮件。</span>  </form>
	    </td>
	    <td background="../Public/images/mail_rightbg.gif">&nbsp;</td>
	  </tr>
	  <tr>
	    <td valign="bottom" background="../Public/images/mail_leftbg.gif"><img src="../Public/images/buttom_left2.gif" width="17" height="17" /></td>
	    <td background="../Public/images/buttom_bgs.gif"><img src="../Public/images/buttom_bgs.gif" width="17" height="17"></td>
	    <td valign="bottom" background="../Public/images/mail_rightbg.gif"><img src="../Public/images/buttom_right2.gif" width="16" height="17" /></td>
	  </tr>
	</table>
</body>