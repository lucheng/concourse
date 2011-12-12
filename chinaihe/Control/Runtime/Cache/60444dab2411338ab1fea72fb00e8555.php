<?php if (!defined('THINK_PATH')) exit();?><link href="../Public/images/skin.css" rel="stylesheet" type="text/css" />
<link href="../Public/images/main.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../Public/js/jquery.js" type="text/javascript"></script>
<script src="../Public/js/editor/xheditor/xheditor.js" type="text/javascript"></script>
<script type="text/javascript">
$('#editor_full').xheditor(true);
</script>
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
        <td height="31"><div class="titlebt">欢迎界面</div></td>
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
		    <td class="title2">【公司简介列表】</td>
		  </tr>
		</tbody>
		</table>
    	<table width="100%" border="0">
		  	<tbody>
		  	<tr>
			    <td><a href="/sysadm/introduce/introduce.jsp?E%80%E4%BB%8B"><img src="../Public/images/icon-add.gif" alt="" width="16" height="16">【添加】</a>&nbsp;
				<a href="SortIntroduce.jsp?ctid=65535&amp;fname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B&amp;cname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B">
				【排序】</a></td>
			    <td align="right"><!--<a href="/sysadm/introduce/initIntroducePropertyAction.do?ctid=65535&fname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B&cname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B"> 【属性设置】</a> --></td>
			  </tr>
			</tbody>
		</table>
	    <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
		  <tbody>
			  <tr>
			  	<td>内容</td>
			    <td><textarea class="xheditor" style="width:99.5%;" id="editor_full" cols="55" rows="20" name="content"></textarea></td>
			  </tr>
		    
		</tbody>
		</table>
		
		<table width="100%" border="0">
		  <tbody>
		  	<tr>
			    <td align="right"><input id="allbox" onclick="CheckedAll();" type="checkbox" value="Check All" name="allbox">
				 <label for="allbox" accesskey="d">所有</label>
				 <a href="#" onclick="DeleteOrNot();"> 删除所选</a>
				</td>
			</tr>
			</tbody>
		</table>
		
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