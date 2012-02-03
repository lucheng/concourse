<?php if (!defined('THINK_PATH')) exit();?><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="__PUBLIC__/Admin/images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="shortcut icon" href="__PUBLIC__/Admin/images/myfav.ico" type="image/x-icon" />
</head>
 
<body>
 <script>
 function showhelp(){
	var str = '蓝色:文章数 eg:(1),[外]代表外链栏目;红色:顶级导航排序,绿色:二级导航排序,-:不参与首页栏目内容排序,√代表支持,x代表不支持,点击编辑,修改栏目相关属性';
	alert(str);
 }
 </script>
<table border="0" cellspacing="2" cellpadding="3"  align="center" class="admintable">
<tr> 
  <td colspan="8" align=left class="admintitle">栏目列表　[<a href="__URL__/add">添加</a>] [<a onclick="showhelp();">操作提示</a>]</td>
</tr>
  <tr align="center"> 
    <td width="20%" class="ButtonList">栏目名称</td>
    <td width="8%" class="ButtonList">栏目ID</td>
    <td width="12%" class="ButtonList">用户投稿</td>
    <td width="8%" class="ButtonList">导航排序</td>
    <td width="9%" class="ButtonList">导航显示</td>
	<td width="8%" class="ButtonList">首页排序</td>
    <td width="12%" class="ButtonList">首页显示</td>
    <td width="23%" class="ButtonList">操 作</td>
  </tr>
 <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><tr bgcolor="#f1f3f5" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="24" class="tdleft"><?php echo ($vo["space"]); ?><?php echo ($vo["typename"]); ?><font color="blue">
	<font color="blue"><?php if(($vo["islink"])  ==  "1"): ?>[<a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/islink-1">外</a>]<?php else: ?>(<a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/islink-0"><?php echo ($vo["total"]); ?></a>)<?php endif; ?></font>
	</td>
    <td height="24" align="center"><?php echo ($vo["typeid"]); ?></td>
    <td height="24" align="center" class="tdleft"><?php if(($vo["isuser"])  ==  "1"): ?><a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/isuser-1">√<?php else: ?><a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/isuser-0">ㄨ<?php endif; ?></a></td>
    <td height="24" align="center"><?php if(($vo["ismenu"])  ==  "1"): ?><font color="red"><?php else: ?><font color="green"><?php endif; ?><?php echo ($vo["drank"]); ?></font></td>
    <td height="24" align="center">	<?php if(($vo["ismenu"])  ==  "1"): ?><a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/ismenu-1">√<?php else: ?><a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/ismenu-0">ㄨ<?php endif; ?></a></td>
	<td height="24" align="center"><?php if(($vo["isindex"])  ==  "1"): ?><?php echo ($vo["irank"]); ?><?php else: ?>-<?php endif; ?></td>
    <td height="24" align="center"><?php if(($vo["isindex"])  ==  "1"): ?><a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/isindex-1">√<?php else: ?><a href="__URL__/status/typeid/<?php echo ($vo["typeid"]); ?>/s/isindex-0">ㄨ<?php endif; ?></a></td>
    <td width="23%" align="center"><a href="__URL__/edit/typeid/<?php echo ($vo["typeid"]); ?>">编辑</a> | <a href="__URL__/del/typeid/<?php echo ($vo["typeid"]); ?>" onClick="JavaScript:return confirm('删除的栏目必须无子栏目,且无文章！确定？')">删除</a></td>
  </tr><?php endforeach; endif; else: echo "" ;endif; ?> 
</table>
<div style="text-align:center;margin:10px;">
<hr>
<a href="http://www.waikucms.com" target="_blank">北京九州颐和文化中心网站管理系统</a> Version <font color="red"><?php echo C("version");?></font> &copy; <?php echo date("Y");;?> 版权所有  
</div>
</body>
</html>