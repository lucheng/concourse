<?php if (!defined('THINK_PATH')) exit();?><!-- 后台-框架:导航栏 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css"> 
<!--
body,td,th,div,a,h3,textarea,input{
	font-family: "宋体", "Times New Roman", "Courier New";
	font-size: 12px;
	color: #333333;
}
html{
	overflow-x:hidden;
	overflow-y:hidden;
}
.menuHtml{
	overflow-y:auto;
}
body {
	background-color: #FFFFFF;
	margin: 0px;
}
img{
	border: none;
}
form{
	margin: 0px;
	padding: 0px;
}
input{
	color: #000000;
	height: 22px;
	vertical-align: middle;
}
textarea{
	width: 80%;
	font-weight: normal;
	color: #000000;
}
a{
	text-decoration: underline;
	color: #666666;
}
a:hover{
	text-decoration: none;
}
.menuDiv,.menuDiv1{
	background-color: #FFFFFF;
}
.menuDiv1{
	postion:relative;bottom:0px;top:50;
}
.menuDiv h3,.menuDiv1 h3{
	font:bold 14px "Microsoft Yahei",sans-serif;color:#4B8303;
	padding-top: 5px;
	padding-right: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	background:url(__PUBLIC__/Admin/images/tab_05.gif);
	margin: 0px;cursor:pointer;
}
.menuDiv1 h3 {color:#ff0000;}
.menuDiv ul,.menuDiv1 ul{
	margin: 0px;
	padding: 0px;
	list-style-type: none;
}
.menuDiv ul li,.menuDiv1 ul li{
	color: #666666;
	background:url(__PUBLIC__/Admin/images/arrow_082.gif) 14px 6px no-repeat;background-color:#EEFCDD;
	padding: 5px 5px 5px 30px;
	font-size: 12px;
	height: 16px;border-bottom:1px solid #fff;
}
.menuDiv ul li a,.menuDiv1 ul li a{
	color: #666666;
	text-decoration: none;
}
.menuDiv ul li a:hover,.menuDiv1 ul li a:hover{	
	color: #ff0000;text-decoration: underline;
}
.red{
	color:#FF0000;
}
-->
</style>
<script type="text/javascript" src="/waiku/Public/Admin/js/menuswitch.js"></script> 
</head>

<body>
<table width="177" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="28"><img src="__PUBLIC__/Admin/images/main_21.gif" border="0" usemap="#Map" /></td>
      </tr>
      <tr>
        <td style="background:url(__PUBLIC__/Admin/images/main_23.gif) left top repeat-x;height:80px"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="45"><div align="center"><a href="__APP__/Config/index" target="main"><img src="__PUBLIC__/Admin/images/main_26.gif" name="Image1" width="40" height="40" border="0" /></a></div></td>
            <td><div align="center"><a href="Admin_User.asp" target="main"><img src="__PUBLIC__/Admin/images/main_28.gif" name="Image2" width="40" height="40" border="0" id="Image2" /></a></div></td>
            <td><div align="center"><a href="http://www.waikucms.com" target="_blank"><img src="__PUBLIC__/Admin/images/main_31.gif" name="Image3" width="40" height="40" border="0" id="Image3" /></a></div></td>
          </tr>
          <tr>
            <td height="25"><div align="center" class="STYLE2"><a href="__APP__/Config/index" target="main">网站配置</a></div></td>
            <td><div align="center" class="STYLE2"><a href="__APP__/Admin/index" target="main">管理员</a></div></td>
            <td><div align="center" class="STYLE2"><a href="__APP__/Guestbook/index" target="main">留言管理</a></div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td style="border-top:1px solid #B0D561;">
	<div class="menuDiv"> 
	  <h3>基本管理</h3> 	  
	  <ul> 	    
		<li><a href="__APP__/Config/index" target="main">网站配置</a> | <a href="__APP__/Admin/index" target="main">管 理 员</a></li>
		<li><a href="__APP__/Flash/index" target="main">幻灯管理</a> | <a href="__APP__/Clear" target="main">附件清理</a></li>
		<li><a href="__APP__/Label/index" target="main">标签管理</a> | <a href="__APP__/Ad/index" target="main">广告管理</a></li>
		
	  </ul>
	</div>

	<div class="menuDiv"> 
	  <h3>文章管理</h3> 
	  <ul> 	    
		<li><a href="__APP__/Type/index" target="main">栏目管理</a> | <a href="__APP__/Type/add" target="main">添加</a></li>
		<li><a href="__APP__/Article/index" target="main">文章管理</a> | <a href="__APP__/Article/add" target="main">添加</a></li>
		
	  </ul>
	</div>
    <div class="menuDiv"> 
	  <h3>辅助功能</h3> 
	  <ul>
	  	<li><a href="__APP__/Pages/index" target="main">单页管理</a> | <a href="__APP__/Pages/add" target="main">添加</a></li>
		<li><a href="__APP__/Guestbook/index" target="main">留言管理</a> | <a href="__APP__/Pl/index" target="main">评论管理</a></li>
        <li><a href="__APP__/Link/index" target="main">链接管理</a> | <a href="__APP__/Link/type" target="main">链接栏目</a></li>
        <li><a href="__APP__/Vote/index" target="main">投票管理</a> | <a href="__APP__/Vote/add" target="main">投票添加</a></li>
        <li><a href="__APP__/Key/index" target="main">关键字管理</a> | <a href="__APP__/Key/add" target="main">添加</a></li>    
	  </ul>
	</div>
    <div class="menuDiv1"> 
	  <h3>版权信息</h3> 
	  <ul> 	    
		<li>九州颐和文化版权所有</li>
		<li>官方网站:<a href="http://chinaihe.org" target="_blank">chinaihe.org</a></li>
		<li>作者:林哲 QQ:398024808</li>
	  </ul>
	</div>
          </td>
      </tr>
    </table></td>
  </tr>
</table>


<map name="Map" id="Map">
<area shape="rect" coords="26,5,91,22" href="__URL__/main" target="main" alt="后台首页" />
<area shape="rect" coords="94,5,157,24" href="__APP__/Public/loginout" target="_top" alt="安全退出" />
</map><script language="javascript">
	var mSwitch = new MenuSwitch("menuDiv");
	mSwitch.setDefault(1);
	mSwitch.setPrevious(false);
	mSwitch.init();
</script></body>
</html>