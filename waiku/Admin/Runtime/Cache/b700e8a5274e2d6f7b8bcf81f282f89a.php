<?php if (!defined('THINK_PATH')) exit();?><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equtv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理</title>
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
<script type="text/javascript" src="/waiku/Public/Admin/setdate/WdatePicker.js"></script><script type="text/javascript" src="/waiku/Public/Admin/js/admin.js"></script><script type="text/javascript" src="/waiku/Public/Admin/js/Ajax.js"></script><script type="text/javascript" src="/waiku/Public/Admin/js/Jquery.js"></script> 
</head>
<body>
<table width="95%" border="0" cellspacing="2" cellpadding="3"  align=center class="admintable" style="margin-bottom:5px;">
    <tr>
      <td height="25" bgcolor="f7f7f7">快速查找：
        <SELECT onChange="javascript:window.open(this.options[this.selectedIndex].value,'main')"  size="1" name="s">
        <OPTION value="" selected>-=请选择=-</OPTION>
        <OPTION value="__URL__/index/">所有评论</OPTION>
        <OPTION value="__URL__/index/status/1">已审的评论</OPTION>
        <OPTION value="__URL__/index/status/0">未审的评论</OPTION>
      </SELECT> </td>
      <td bgcolor="f7f7f7">
	  <form name="form1" method="get" action="__URL__/index/">
        <input name="keyword" type="text" id="keyword" value="" class="s26">
        <input name="Submit2" type="submit" class="bnt" value="搜索">
        </td>
     {__NOTOKEN__}
    </form>
    </tr>
</table>
 
<form name="myform" method="POST" action="__URL__/delall">
<table width="95%" border="0"  align=center cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
<tr> 
  <td colspan="6" align=left class="admintitle">评论列表</td>
</tr>
    <tr bgcolor="#f1f3f5" style="font-weight:bold;">
    <td width="5%" height="30" align="center" class="ButtonList">&nbsp;</td>
    <td width="47%" align="center" class="ButtonList">评论内容</td>
    <td width="17%" align="center" class="ButtonList">发布人</td>
    <td width="16%" height="25" align="center" class="ButtonList">发布时间</td>
    <td width="15%" height="25" align="center" class="ButtonList">管理</td>    
    </tr>
	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr>
    <td height="25" align="center" bgcolor="f7f7f7"><input type="checkbox" value="<?php echo ($vo["id"]); ?>" name="id[]" onClick="unselectall(this.form)" style="border:0;"></td>
    <td height="25" bgcolor="f7f7f7"><a href="__ROOT__/index.php/Article/index/aid/<?php echo ($vo["aid"]); ?>" target="_blank"><?php echo (msubstr($vo["content"],0,30,'utf-8')); ?>...</a></td>
    <td height="25" align="center" bgcolor="f7f7f7"><?php echo ($vo["ip"]); ?></td>
    <td height="25" align="center" bgcolor="f7f7f7"><span class="td"><?php echo ($vo["ptime"]); ?></span></td>
    <td align="center" bgcolor="f7f7f7"><a href="__URL__/status/id/<?php echo ($vo["id"]); ?>/status/<?php echo ($vo["status"]); ?>"><?php if(($vo["status"])  ==  "1"): ?>已审<?php else: ?><font color='red'>未审</font><?php endif; ?></a>|<a href="__URL__/edit/id/<?php echo ($vo["id"]); ?>">回复</a>|<a href="__URL__/del/id/<?php echo ($vo["id"]); ?>" onClick="JavaScript:return confirm('确定要删除?')">删除</a></td>
    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
<tr><td align="center" bgcolor="f7f7f7"><input name="Action" type="hidden"  value="Del"><input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox" style="border:0"></td>
  <td colspan="5" bgcolor="f7f7f7"><input name="Del" type="submit" class="bnt" id="Del" value="删除">
    <input name="Del" type="submit" class="bnt" id="Del" value="批量未审">
    <input name="Del" type="submit" class="bnt" id="Del" value="批量审核"></td>
  </tr><tr><td bgcolor="f7f7f7" colspan="6">
<div id="page">
	<ul style="text-align:left;">
<?php echo ($page); ?>
    </ul>
</div>
</td></tr></table>
</form>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有 
</div>
</body>
</html>