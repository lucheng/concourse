<?php if (!defined('THINK_PATH')) exit();?><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理</title>
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
<script type="text/javascript" src="/waiku/Public/Admin/js/admin.js"></script> 
 
<body>
 
<form name="myform" method="POST" action="__URL__/delall">
<table border="0"  align="center" cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
<tr> 
  <td colspan="8" align=left class="admintitle">所有投票　[<a href="__URL__/add">添加</a>]</td>
</tr>
  <tr align="center"> 
    <td colspan="2" class="ButtonList">投票标题</td>
    <td width="9%" class="ButtonList">ID号</td>
    <td width="21%" class="ButtonList">投票时间</td>
    <td width="11%" class="ButtonList">状态</td>
    <td width="5%" class="ButtonList">排序</td>
    <td width="17%" class="ButtonList">操 作</td>
  </tr>
  <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr bgcolor="#f1f3f5" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td width="5%" height="25" align="center"><input type="checkbox" value="<?php echo ($vo["id"]); ?>" name="id[]" onClick="unselectall(this.form)" style="border:0;"></td>
    <td width="30%" class="tdleft"><?php echo ($vo["title"]); ?></td>
    <td height="25" align="center"><?php echo ($vo["id"]); ?></td>
    <td height="25" align="center"><?php echo ($vo["starttime"]); ?>至<?php echo ($vo["overtime"]); ?></td>
    <td height="25" align="center"><a href="__URL__/status/id/<?php echo ($vo["id"]); ?>/status/<?php echo ($vo["status"]); ?>"><?php if(($vo["status"])  ==  "1"): ?>显示<?php else: ?>隐藏<?php endif; ?></a></td>
    <td height="25" align="center"><?php echo ($vo["rank"]); ?></td>
    <td align="center"><a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>">编辑</a> <a href="__URL__/show/id/<?php echo ($vo["id"]); ?>">查看结果</a></td>
    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
<tr>
  <td align=center bgcolor="#F2F9E8"><input name="Action" type="hidden"  value="Del"><input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox" style="border:0"></td>
  <td align=center class=b1_1><input name="Del" type="submit" class="bnt" id="Del" value="隐藏">
    <input name="Del" type="submit" class="bnt" id="Del" value="显示">
    <input name="Del" type="submit" class="bnt" id="Del" value="删除"></td>
  <td colspan="6" align=center class=b1_1>调用代码：{ :vote(ID号) }</td>
  </tr>
<tr>
  <td colspan=8 align=center class=b1_1><div id="page">
	<ul style="text-align:left;">
<?php echo ($page); ?>
    </ul>
</div></td>
</tr>
</table>
</form>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有 
</div>
</body>
</html>