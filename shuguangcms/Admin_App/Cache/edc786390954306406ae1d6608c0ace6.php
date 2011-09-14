<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>菜单</title>
<link href="/Admin_App/Tpl/default/Public/images/menu.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base target="mcMainFrame" />
</head>
<script language="javascript">
<!--
function $(objectId) 
{
	 return document.getElementById(objectId);
}

function showHide(objname)
{
    var obj = $(objname);
    if(obj.style.display == "none")
    {
        obj.style.display = "block";
    }
    else
    {
        obj.style.display = "none";
    }
    
    return false;
}

function refreshMainFrame(url)
{
    parent.mcMainFrame.document.location = url;
}
-->
</script>
<base target="mcMainFrame">
<body>
<div class="menu">

<?php switch($action): ?><?php case "Systemconfig":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">系统配置</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Settings'>基本设置</a></li>
                <li><a href='/admin.php/Settings/index#attachments'>附件设置</a></li>

                <li><a href='/admin.php/Settings/index#seo'>SEO设置</a></li>
				 <li><a href='/admin.php/Settings/index#kernel'>内核设置</a></li>
                
            </ul>
        </dd>
    </dl>
   <?php if(($security['allowdatabase'])  ==  "1"): ?><dl>
        <dt><a href="" onclick="return showHide('items1');" target="_self">数据库管理</a></dt>
        <dd id="items1" style="display:block;">
            <ul>
				<li><a href='/admin.php/Database'>数据表优化</a></li>
				<!--li><a href='/admin.php/Database'>执行SQL</a></li-->
            </ul>
        </dd>
    </dl><?php endif; ?>
     </dl>
  <dl>
        <dt><a href="" onclick="return showHide('items2');" target="_self">缓存管理</a></dt>
        <dd id="items2" style="display:block;">
            <ul>
				<li><a href='/admin.php/Cache'>缓存管理</a></li>
				
            </ul>
        </dd>
    </dl>
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>
<?php case "Article":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">新闻模块</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Article'>新闻管理</a></li>
                <!-- li><a href='/admin.php/Special'>频道管理</a></li-->
				<li><a href='/admin.php/Article/comment'>评论管理</a></li>
            </ul>
        </dd>
    </dl>
    <!--dl>
        <dt><a href="" onclick="return showHide('items1');" target="_self">系统配置</a></dt>
        <dd id="items1" style="display:block;">
            <ul>
				<li><a href='/admin.php/Category'>系统配置</a></li>
			  <li><a href='/admin.php/Category/add'>系统配置</a></li>
          </ul>
        </dd>
    </dl-->	
   <?php if(($security['allowcategory'])  ==  "1"): ?><dl>
    <dt><a href="" onclick="return showHide('items2');" target="_self">类别管理</a></dt>
        <dd id="items2" style="display:block;">
            <ul>
				<li><a href='/admin.php/Article/category'>类别管理</a></li>
				<li><a href='/admin.php/Article/categoryadd'>添加分类</a></li>
            </ul>
        </dd>
    </dl><?php endif; ?>
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>
<?php case "Product":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">产品模块</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Product'>产品管理</a></li>
				<li><a href='/admin.php/Order'>订单管理</a></li>
            </ul>
        </dd>
    </dl>
	
 <?php if(($security['allowcategory'])  ==  "1"): ?><dl>
 <dt><a href="" onclick="return showHide('items2');" target="_self">类别管理</a></dt>
        <dd id="items2" style="display:block;">
            <ul>
				<li><a href='/admin.php/Product/category'>类别管理</a></li>
				<li><a href='/admin.php/Product/categoryadd'>添加分类</a></li>
            </ul>
        </dd>
    </dl><?php endif; ?> 
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>

<?php case "Job":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">招聘模块</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Job'>招聘管理</a></li>
				<li><a href='/admin.php/Job/add'>发布招聘</a></li>
				<li><a href='/admin.php/Job/resume'>应聘管理</a></li>
            </ul>
        </dd>
    </dl>
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>
<?php case "Announce":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">公告模块</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Announce'>公告管理</a></li>
				<li><a href='/admin.php/Announce/add'>发布公告</a></li>
            </ul>
        </dd>
    </dl>
    
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>
<?php case "Member":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">用户模块</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Member'>用户管理</a></li>
				<li><a href='/admin.php/Member/add'>添加用户</a></li>
            </ul>
        </dd>
    </dl>

<dl>
        <dt><a href="" onclick="return showHide('items1');" target="_self">权限模块</a></dt>
        <dd id="items1" style="display:block;">
            <ul>
				<li><a href='/admin.php/Usergroup'>用户组管理</a></li>
				<li><a href='/admin.php/Usergroup/add'>添加用户组</a></li>
            </ul>
        </dd>
    </dl>	

    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>

<?php case "Feedback":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">留言模块</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href='/admin.php/Feedback'>留言管理</a></li>
				<li><a href='/admin.php/Feedback/add'>添加留言</a></li>
            </ul>
        </dd>
    </dl>
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>
<?php case "Other":  ?><dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">其它管理</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<?php if(($security['allowpages'])  ==  "1"): ?><li><a href='/admin.php/Pages'>单页管理</a></li><?php endif; ?>
				<?php if(($security['allowlink'])  ==  "1"): ?><li><a href='/admin.php/Link'>链接管理</a></li><?php endif; ?>
				<?php if(($security['allowscroll'])  ==  "1"): ?><li><a href='/admin.php/Scroll'>图片管理</a></li><?php endif; ?>
            </ul>
        </dd>
    </dl>
    <script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php break;?>

<?php default: ?>

    <dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">快捷方式</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<?php if(($security['allowsystem'])  ==  "1"): ?><li><a href='/admin.php/Settings'>系统配置</a></li><?php endif; ?>
				<?php if(($security['allowarticle'])  ==  "1"): ?><li><a href='/admin.php/Article'>新闻管理</a></li><?php endif; ?>
				<?php if(($security['allowproduct'])  ==  "1"): ?><li><a href='/admin.php/Product'>产品管理</a></li><?php endif; ?>
				<?php if(($security['alloworder'])  ==  "1"): ?><li><a href='/admin.php/Order'>订单管理</a></li><?php endif; ?>
				<?php if(($security['allowjob'])  ==  "1"): ?><li><a href='/admin.php/Job'>招聘管理</a></li><?php endif; ?>
				<?php if(($security['allowannounce'])  ==  "1"): ?><li><a href='/admin.php/Announce'>公告管理</a></li><?php endif; ?>
				<?php if(($security['allowmember'])  ==  "1"): ?><li><a href='/admin.php/Member'>用户管理</a></li><?php endif; ?>
                <?php if(($security['allowgroup'])  ==  "1"): ?><li><a href='/admin.php/Usergroup'>用户组管理</a></li><?php endif; ?>
				<?php if(($security['allowfeedback'])  ==  "1"): ?><li><a href='/admin.php/Feedback'>留言管理</a></li><?php endif; ?>
                <?php if(($security['allowpages'])  ==  "1"): ?><li><a href='/admin.php/Pages'>单页管理</a></li><?php endif; ?>
                <?php if(($security['allowlink'])  ==  "1"): ?><li><a href='/admin.php/Link'>链接管理</a></li><?php endif; ?>
            </ul>
        </dd>
    </dl>
<script type="text/javascript">refreshMainFrame('<?php echo ($url); ?>');</script><?php endswitch;?>



</div>
</body>
</html>