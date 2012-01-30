<?php if (!defined('THINK_PATH')) exit();?><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equtv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理</title>
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
<script type="text/javascript" src="/waiku/Public/Admin/setdate/WdatePicker.js"></script><script type="text/javascript" src="/waiku/Public/Admin/js/admin.js"></script><script type="text/javascript" src="/waiku/Public/Admin/js/Ajax.js"></script><script type="text/javascript" src="/waiku/Public/Admin/js/Jquery.js"></script> 
</head>
<body>
<table width="95%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#F2F9E8" class="admintable">
<tr> 
<td colspan="5" align=left class="admintitle">幻灯列表　[<a href="__URL__/add">添加</a>][<a href="__APP__/Clear">清理附件</a>]</td></tr>
    <tr bgcolor="#f1f3f5" style="font-weight:bold;">
    <td width="5%" height="30" align="center" class="ButtonList">排序</td>
    <td width="25%" align="center" class="ButtonList">幻灯标题</td>
	<td width="30%" align="center" class="ButtonList">幻灯网址</td>
	<td width="10%" align="center" class="ButtonList">幻灯状态</td>
    <td width="30%" height="25" align="center" class="ButtonList">幻灯管理</td>    
    </tr>
	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr bgcolor="#ffffff" onMouseOver="this.style.backgroundColor='#EAFCD5';" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="25"><?php echo ($vo["rank"]); ?></td>
    <td height="25" align="center"><?php echo ($vo["title"]); ?></td>
    <td height="25" align="center"><?php echo ($vo["url"]); ?></td>
	 <td height="25" align="center"><a href="__URL__/status/id/<?php echo ($vo["id"]); ?>/status/<?php echo ($vo["status"]); ?>"><?php if(($vo["status"])  ==  "1"): ?>正常<?php else: ?><font color="red">隐藏</font><?php endif; ?></a></td>
    <td align="center"><a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>">编辑</a>|<a href="__URL__/del/id/<?php echo ($vo["id"]); ?>" onClick="JavaScript:return confirm('确定要删除?')">删除</a></td>
    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
</table>
</form>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有  
</div>

</body>
</html>