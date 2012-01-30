<?php if (!defined('THINK_PATH')) exit();?><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
</head>
<body>
<table border="0" cellspacing="2" cellpadding="3"  align="center" class="admintable">
<tr> 
  <td colspan="7" align=left class="admintitle">分类列表　[<a href="__URL__/add_t">分类添加</a>]　[<a href="__URL__/add">链接添加</a>]</td>
</tr>
  <tr align="center"> 
    <td width="36%" class="ButtonList">分类名称</td>
    <td width="10%" class="ButtonList">ID</td>
    <td width="18%" class="ButtonList">排序</td>
    <td width="36%" class="ButtonList">操 作</td>
  </tr>
 <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr bgcolor="#f1f3f5" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="25" class="tdleft"><?php echo ($vo["typename"]); ?></td>
    <td height="25" align="center" class="tdleft"><?php echo ($vo["id"]); ?></td>
    <td height="25" align="center"><?php echo ($vo["rank"]); ?></td>
    <td width="36%" align="center"><a href="__URL__/edit_t/id/<?php echo ($vo["id"]); ?>">编辑</a> | <a href="__URL__/del_t/id/<?php echo ($vo["id"]); ?>" onClick="JavaScript:return confirm('删除分类同时会删除该分类下的所有链接！确定？')">删除</a></td>
  </tr><?php endforeach; endif; else: echo "" ;endif; ?>
</table>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有  
</div>
</body>
</html>