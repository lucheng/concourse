<?php if (!defined('THINK_PATH')) exit();?><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="__PUBLIC__/Admin/images/Admin_css.css" type="text/css" rel="stylesheet">
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
<title>标签管理</title>
</head>
<body>

<table width="95%" border="0"  align=center cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
<tr> 
  <td colspan="4" align=left class="admintitle">标签列表　[<a href="__URL__/add">添加</a>]</td></tr>
    <tr bgcolor="#f1f3f5" style="font-weight:bold;">
    <td height="30" align="center" class="ButtonList">标签名称</td>
    <td width="23%" height="25" align="center" class="ButtonList">发布时间</td>
    <td height="25" align="center" class="ButtonList">标签ID</td>
    <td height="25" align="center" class="ButtonList">管理</td>    </tr>
 <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr bgcolor="#f1f3f5" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="25"><a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></a></td>
    <td height="25" align="center"><?php echo ($vo["addtime"]); ?></td>
    <td width="7%" height="25" align="center"><?php echo ($vo["id"]); ?></td>
    <td width="24%" align="center"><a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>">编辑</a>|<a href="__URL__/del/id/<?php echo ($vo["id"]); ?>" onClick="JavaScript:return confirm('确定要删除？')">删除</a></td>    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
<tr><td bgcolor="f7f7f7" colspan="4" align="left">调用：在需要调用的地方插入: { :label(ID号) } 即可。
</td></tr></table>

<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有  
</div>
</body>
</html>