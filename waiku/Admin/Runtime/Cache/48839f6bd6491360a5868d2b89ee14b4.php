<?php if (!defined('THINK_PATH')) exit();?><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
<style> 
.classlist {float:left;margin:0;padding:0;}
.classlist ul {float:left;margin:0;padding:0;}
.classlist li {margin:0;padding:0;padding:3px 0;border-bottom:1px solid #ffffff;}
.classlist li span {float:right;margin-top:-3px;}
.classlist .bigclass {font-weight:bold;clear:both;list-style:none;margin:5px 0;}
.classlist .yaoclass {font-weight:normal;list-style:none;padding-left:10px;}
</style>
<title>网站管理员管理</title>
</head>
<body>
	
<table border="0" align="center" cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
  <tr>
    <td colspan="7" class="admintitle">管理员列表 [<a href="__URL__/add">添加</a>]</td>
  </tr>
  <tr>
    <td width="5%" height="25" align="center" bgcolor="#FFFFFF" class="ButtonList">ID</td>
    <td width="21%" align="center" bgcolor="#FFFFFF" class="ButtonList">管理员名称</td>
    <td width="12%" align="center" bgcolor="#FFFFFF" class="ButtonList">类型</td>
    <td width="18%" align="center" bgcolor="#FFFFFF" class="ButtonList">最后登陆时间</td>
    <td width="16%" align="center" bgcolor="#FFFFFF" class="ButtonList">最后登陆IP</td>
    <td width="28%" align="center" bgcolor="#FFFFFF" class="ButtonList">管理选项</td>
  </tr>
 <?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
    <td height="25" align="center" bgcolor="f7f7f7"><?php echo ($vo["id"]); ?></td>
    <td align="center" bgcolor="f7f7f7"><?php echo ($vo["username"]); ?></td>
    <td align="center" bgcolor="f7f7f7"><?php if(($vo["id"])  ==  "1"): ?><font style="color:#ff0000">超级管理员</font><?php else: ?>普通管理员<?php endif; ?></td>
    <td align="center" bgcolor="f7f7f7"><?php echo (date("Y-m-d H:i:s",$vo["lastlogintime"])); ?></td>
    <td align="center" bgcolor="f7f7f7"><?php echo ($vo["lastloginip"]); ?></td>
	<td bgcolor="f7f7f7" style="padding-left:25px;"><a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>">修改</a><?php if(($vo["id"])  !=  "1"): ?>|<a href="__URL__/del/id/<?php echo ($vo["id"]); ?>" onClick="JavaScript:return confirm('确定要删除？')">删除</a>|<?php endif; ?><a href="__URL__/status/id/<?php echo ($vo["id"]); ?>/status/<?php echo ($vo["status"]); ?>"><?php if(($vo["status"])  ==  "1"): ?>启用<?php else: ?><font color="red">禁用</font><?php endif; ?></a></td>
  </tr><?php endforeach; endif; ?>
</table>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有 
</div>
</body>
</html>