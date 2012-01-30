<?php if (!defined('THINK_PATH')) exit();?><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理</title>
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
<script type="text/javascript" src="/waiku/Public/Admin/js/admin.js"></script> 
</head>
<body>
<table width="95%" border="0" cellspacing="2" cellpadding="3"  align=center class="admintable" style="margin-bottom:5px;">
    <tr>
      <td height="25" bgcolor="f7f7f7">快速查找：
        <SELECT onChange="javascript:window.open(this.options[this.selectedIndex].value,'main')"  size="1" name="s">
        <OPTION value="" selected>-=请选择=-</OPTION>
        <OPTION value="__URL__/index">所有链接</OPTION>
        <OPTION value="__URL__/index/status/1">已审的链接</OPTION>
        <OPTION value="__URL__/index/status/0">未审的链接</OPTION>
        <OPTION value="__URL__/index/logo/1">Logo链接</OPTION>
        <OPTION value="__URL__/index/out/0">已经过期的链接</OPTION>
        <OPTION value="__URL__/index/out/1">明天过期的链接</OPTION>
        <OPTION value="__URL__/index/out/2">后天过期的链接</OPTION>
      </SELECT>      </td>
      <td align="center" bgcolor="f7f7f7">
        <form name="form1" method="get" action="__URL__/index/">
        <input name="keyword" type="text" id="keyword" value="">
        <input type="submit" name="Submit2" value="搜索">
      {__NOTOKEN__}
    </form></td>
      <td align="right" bgcolor="f7f7f7">跳转到：
        <select name="ClassID" id="ClassID" onChange="javascript:window.open(this.options[this.selectedIndex].value,'main')">
    <option value="">请选择分类</option><?php echo ($op); ?></select></td>
    </tr>
</table>
<form name="myform" method="POST" action="__URL__/delall">
<table width="95%" border="0"  align=center cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
<tr> 
  <td colspan="8" align=left class="admintitle">链接列表　[<a href="__URL__/add">添加</a>]　[<a href="__URL__/type">链接分类</a>]</td>
</tr>
<tr bgcolor="#f1f3f5" style="font-weight:bold;">
	<td width="3%" height="30" align="center" class="ButtonList">&nbsp;</td>
    <td width="37%" height="30" align="center" class="ButtonList">链接名称</td>
    <td width="5%" align="center" class="ButtonList">费用</td>
    <td width="12%" height="25" align="center" bgcolor="#f1f3f5" class="ButtonList">加入时间</td>
    <td width="12%" height="25" align="center" bgcolor="#f1f3f5" class="ButtonList">到期时间</td>
    <td width="5%" height="25" align="center" bgcolor="#f1f3f5" class="ButtonList">排序</td>
    <td width="14%" align="center" bgcolor="#f1f3f5" class="ButtonList">联系QQ</td>
    <td width="12%" height="25" align="center" bgcolor="#f1f3f5" class="ButtonList">管理</td>    
  </tr>
 <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr bgcolor="#f1f3f5" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="25" align="CENTER"><input type="checkbox" value="<?php echo ($vo["id"]); ?>" name="id[]" onClick="unselectall(this.form)" style="border:0;">
	<input name="linkid[]" type="hidden" id="LinkID" value="<?php echo ($vo["id"]); ?>"></td>
    <td height="25"><?php echo ($i); ?>.[<a href="__URL__/index/typeid/<?php echo ($vo["typeid"]); ?>"><?php echo (lt($vo["typeid"])); ?></a>]
      <input name="title[]" type="text" id="Title" value="<?php echo ($vo["title"]); ?>" size="15">
      <input name="url[]" type="text" id="LinkUrl" value="<?php echo ($vo["url"]); ?>" size="20"><?php if(($vo["islogo"])  ==  "1"): ?><font color=red>[图]</font><?php endif; ?>
      </td>
    <td height="25" align="center"><input name="money[]" type="text" id="Moneys" value="<?php echo ($vo["money"]); ?>" size="4" maxlength="4"></td>
    <td height="25" align="center"><input name="starttime[]" type="text" id="AddTimes" value="<?php echo ($vo["starttime"]); ?>" size="9"></td>
    <td height="25" align="center"><input name="overtime[]" type="text" id="LastTime" value="<?php echo ($vo["overtime"]); ?>" size="9"></td>
    <td height="25" align="center"><input name="rank[]" type="text" id="Num" value="<?php echo ($vo["rank"]); ?>" size="4" maxlength="4"></td>
    <td height="25" align="center"><input name="qq[]" type="text" id="qq" value="<?php echo ($vo["qq"]); ?>" size="10"></td>
    <td align="center"><a href="__URL__/status/id/<?php echo ($vo["id"]); ?>/status/<?php echo ($vo["status"]); ?>"><?php if(($vo["status"])  ==  "1"): ?>显示<?php else: ?>隐藏<?php endif; ?></a>|<a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>">编辑</a></td>    
  </tr><?php endforeach; endif; else: echo "" ;endif; ?>
 
	<tr bgcolor="#f1f3f5" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="25" align="center" bgcolor="#f1f3f5"><input name="Action" type="hidden"  value="Del">
      <input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox" style="border:0"></td>
    <td height="25" colspan="7" bgcolor="#f1f3f5"><font color=red>移动到：</font>
      <select id="typeid" name="typeid">
        <option value="">请选择分类</option><?php echo ($op2); ?>
    </select>
<input name="Del" type="submit" class="bnt" id="Del" value="移动">
<input name="Del" type="submit" class="bnt" id="Del"  onClick="JavaScript:return confirm('删除吗？')" value="删除">
<input name="Del" type="submit" class="bnt" id="Del" value="批量显示">
<input name="Del" type="submit" class="bnt" id="Del" value="批量隐藏">
<input name="Del" type="submit" class="bnt" id="Del" value="编辑">
　本月(<?php echo date("m");;?>月)收入： <b><?php echo ($moneys); ?></b> 元</td>
    </tr>
  <tr><td bgcolor="f7f7f7" colspan="8" align="left"><div id="page">
	<ul style="text-align:left;">
<?php echo ($page); ?>
    </ul>
</div>
</td></tr>
</table>
</form>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有  
</div>
</body>
</html>