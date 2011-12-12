<?php if (!defined('THINK_PATH')) exit();?><link href="../Public/images/skin.css" rel="stylesheet" type="text/css" />
<link href="../Public/images/main.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="../Public/images/mail_leftbg.gif">
    <img src="../Public/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../Public/images/content-bg.gif">
    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt"><?php echo ($title); ?></div></td>
      </tr>
    </table>
    </td>
    <td width="16" valign="top" background="../Public/images/mail_rightbg.gif"><img src="../Public/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="../Public/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    	
    	<table width="100%" border="0">
		  	<tbody>
		  	<tr>
			    <td><a href="/sysadm/introduce/introduce.jsp?E%80%E4%BB%8B"><img src="../Public/images/icon-add.gif" alt="" width="16" height="16">【添加】</a>&nbsp;
				<a href="SortIntroduce.jsp?ctid=65535&amp;fname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B&amp;cname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B">
				【排序】</a></td>
			    <td align="right"><!--<a href="/sysadm/introduce/initIntroducePropertyAction.do?ctid=65535&fname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B&cname=%E5%85%AC%E5%8F%B8%E7%AE%80%E4%BB%8B"> 【属性设置】</a> --></td>
			  </tr>
			</tbody>
		</table>
	    
	    <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
	      <tbody>
		      <tr>
		        <td width="8%" class="table-list-title">编号</td>
		        <td width="30%" class="table-list-title">类别名称</td>
		        <td width="12%" class="table-list-title">浏览</td>
		        <td width="13%" class="table-list-title">是否锁定</td>
		        <td colspan="4" class="table-list-title">操作</td>
		      </tr>
		      
		      
		      <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$parent): ++$i;$mod = ($i % 2 )?><tr class="table-list-link" onmouseover="this.className='table-list-hover'" onmouseout="this.className='table-list-link'">
			        <td align="center" class="table-list-style"><?php echo ($parent["id"]); ?></td>
			        <td height="25" class="table-list-style"><?php echo ($parent["title"]); ?></td>
			        <td align="center" class="table-list-style"><a href="__APP__/Category/article/cid/<?php echo ($parent["id"]); ?>" title="浏览该类别下的产品">浏览</a></td>
			        <td align="center" class="table-list-style">未锁定</td>
			        <td width="8%" align="center" class="table-list-style"><a href="initProductsTypeAction.do?typeid=203043&amp;ctid=65535">编辑</a></td>
			        <td width="9%" align="center" class="table-list-style"><a href="Products.jsp?typeid=203043&amp;ctid=65535" title="该类别下添加产品">添加产品</a></td>
			        <td width="10%" align="center" class="table-list-style">
			          <a onclick="return DeleteOrNot();" href="/sysadm/products/delProductsTypeAction.do?typeid=203043">删除</a>	  </td>
					   <td width="20%" align="center" class="table-list-style"><a href="javascript:clickTitle(65535,203043,'o')">批量上传</a></td>
			      </tr>
		      	  <?php if(is_array($parent['children'])): $i = 0; $__LIST__ = $parent['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$child): ++$i;$mod = ($i % 2 )?><tr class="table-list-link" onmouseover="this.className='table-list-hover'" onmouseout="this.className='table-list-link'">
				        <td align="center" class="table-list-style"><?php echo ($child["id"]); ?></td>
				        <td height="25" class="table-list-style">
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|----【<?php echo ($child["title"]); ?>】</td>
				        <td align="center" class="table-list-style"><a href="ManageProducts.jsp?typeid=203059&amp;ctid=65535" title="浏览该类别下的产品">浏览</a></td>
				        <td align="center" class="table-list-style">未锁定</td>
				        <td width="8%" align="center" class="table-list-style"><a href="initProductsTypeAction.do?typeid=203059&amp;ctid=65535">编辑</a></td>
				        <td width="9%" align="center" class="table-list-style"><a href="Products.jsp?typeid=203059&amp;ctid=65535" title="该类别下添加产品">添加产品</a></td>
				        <td width="10%" align="center" class="table-list-style">
				          <a onclick="return DeleteOrNot();" href="/sysadm/products/delProductsTypeAction.do?typeid=203059">删除</a>	  </td>
						   <td width="20%" align="center" class="table-list-style"><a href="javascript:clickTitle(65535,203059,'o')">批量上传</a></td>
			      	</tr><?php endforeach; endif; else: echo "" ;endif; ?><?php endforeach; endif; else: echo "" ;endif; ?>
		    </tbody>
		    </table>
			
			<table width="100%" border="0">
			  <tbody>
			  	<tr>
				    <td align="right">
					 <label for="allbox" accesskey="d"><?php echo ($page); ?></label>
					</td>
				</tr>
				</tbody>
			</table>
			
	    </td>
	    <td background="../Public/images/mail_rightbg.gif">&nbsp;</td>
	  </tr>
	  <tr>
	    <td valign="bottom" background="../Public/images/mail_leftbg.gif"><img src="../Public/images/buttom_left2.gif" width="17" height="17" /></td>
	    <td background="../Public/images/buttom_bgs.gif"><img src="../Public/images/buttom_bgs.gif" width="17" height="17"></td>
	    <td valign="bottom" background="../Public/images/mail_rightbg.gif"><img src="../Public/images/buttom_right2.gif" width="16" height="17" /></td>
	  </tr>
	</table>
</body>