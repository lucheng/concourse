<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="__TMPL__Static/Css/style.css" rel="stylesheet" />
<script type="text/javascript" src="__TMPL__Static/Js/jquery.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/base.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/json.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/jquery.pngFix.js"></script>
<script type="text/javascript">
<!--
//指定当前组模块URL地址 
var URL = '__URL__';
var ROOT_PATH = '__ROOT__';
var APP	 =	 '__APP__';
var STATIC = '__TMPL__Static';
var VAR_MODULE = '<?php echo c('VAR_MODULE');?>';
var VAR_ACTION = '<?php echo c('VAR_ACTION');?>';
var CURR_MODULE = '<?php echo ($module_name); ?>';
var CURR_ACTION = '<?php echo ($action_name); ?>';

//定义JS中使用的语言变量
var CONFIRM_DELETE = '<?php echo L("CONFIRM_DELETE");?>';
var AJAX_LOADING = '<?php echo L("AJAX_LOADING");?>';
var AJAX_ERROR = '<?php echo L("AJAX_ERROR");?>';
var ALREADY_REMOVE = '<?php echo L("ALREADY_REMOVE");?>';
var SEARCH_LOADING = '<?php echo L("SEARCH_LOADING");?>';
var CLICK_EDIT_CONTENT = '<?php echo L("CLICK_EDIT_CONTENT");?>';
//-->
</script>
</head>
<body>
	<div class="fanwe-body">
		<div class="fb-title"><div><p><span><?php echo ($ur_href); ?></span></p></div></div>
		<div class="fb-body">
			<table class="body-table" cellpadding="0" cellspacing="1" border="0">
				<tr>
					<td class="body-table-td">
						<div class="body-table-div">
<script type="text/javascript" src="__TMPL__Static/Js/dataList.js"></script>
<div class="handle-btns">
	<div class="img-button "><p><input type="button" id="addAdmin" name="addAdmin" value="<?php echo L("ADD");?>" onclick="addData()" class="addAdmin"></p></div>
	<div class="img-button "><p><input type="button" id="editAdmin" name="editAdmin" value="<?php echo L("EDIT");?>" onclick="editData(this,'checkList','uid')" class="editAdmin"></p></div>
	<div class="img-button "><p><input type="button" id="removeAdmin" name="removeAdmin" value="<?php echo L("REMOVE");?>" onclick="removeData(this,'checkList')" class="removeAdmin"></p></div>
	<form action="__APP__">
		<span><?php echo L("GID");?></span>
		<select name="gid">
			<option value=""><?php echo L("SELECT_GROUP");?></option>
			<?php if(is_array($group_list)): foreach($group_list as $groupid=>$gname): ?><option value="<?php echo ($groupid); ?>" <?php if($gid == $groupid): ?>selected="selected"<?php endif; ?>><?php echo ($gname); ?></option><?php endforeach; endif; ?>
		</select>
		<span><?php echo L("USER_NAME");?></span>
		<input class="textinput" type="text" value="<?php echo ($user_name); ?>" name="user_name" size="10" />
		<small></small>
		<span><?php echo L("EMAIL");?></span>
		<input class="textinput" type="text" value="<?php echo ($email); ?>" name="email" size="10" />
		<input class="submit_btn" type="submit" value="<?php echo L("SEARCH");?>" />
		<input type="hidden" name="<?php echo c('VAR_MODULE');?>" value="<?php echo ($module_name); ?>" />
		<input type="hidden" name="<?php echo c('VAR_ACTION');?>" value="index" />
	</form>
</div>
<!--<div class="search-box">
	<form action="">
		<span><?php echo L("USER_NAME");?></span>
		<input class="textinput" type="text" value="" name="user_name" size="10" />
		<small></small>
		<span><?php echo L("EMAIL");?></span>
		<input class="textinput" type="text" value="" name="email" size="10" />
		<input class="submit_btn" type="submit" value="<?php echo L("SEARCH");?>" />
	</form>
</div>-->
<!-- Think 系统列表组件开始 -->
<table id="checkList" class="table-list list" cellpadding="0" cellspacing="0" border="0"><thead><tr><th width="30" class="first"><input type="checkbox" onclick="checkAll('checkList')"></th><th width="80" ><a href="javascript:sortBy('uid','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "uid"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="~left" ><a href="javascript:sortBy('user_name','<?php echo ($sort); ?>','index')" title="按照<?php echo L("USER_NAME");?><?php echo ($sortType); ?> "><?php echo L("USER_NAME");?><?php if(($order)  ==  "user_name"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="~left" ><a href="javascript:sortBy('email','<?php echo ($sort); ?>','index')" title="按照<?php echo L("EMAIL");?><?php echo ($sortType); ?> "><?php echo L("EMAIL");?><?php if(($order)  ==  "email"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('gid','<?php echo ($sort); ?>','index')" title="按照<?php echo L("GID");?><?php echo ($sortType); ?> "><?php echo L("GID");?><?php if(($order)  ==  "gid"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="140" ><a href="javascript:sortBy('reg_time','<?php echo ($sort); ?>','index')" title="按照<?php echo L("REG_TIME");?><?php echo ($sortType); ?> "><?php echo L("REG_TIME");?><?php if(($order)  ==  "reg_time"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="60" ><a href="javascript:sortBy('status','<?php echo ($sort); ?>','index')" title="按照<?php echo L("STATUS");?><?php echo ($sortType); ?> "><?php echo L("STATUS");?><?php if(($order)  ==  "status"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100">操作</th></tr></thead><tbody><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$admin): ++$i;$mod = ($i % 2 )?><tr class="<?php if(($mod)  ==  "0"): ?>even<?php endif; ?>"><td class="first"><input type="checkbox" name="key"	value="<?php echo ($admin["uid"]); ?>"></td><td ><?php echo ($admin["uid"]); ?></td><td align="left" ><span class="pointer" module="User" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($admin["uid"])); ?>','user_name')"><?php echo ($admin["user_name"]); ?></span></td><td align="left" ><span class="pointer" module="User" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($admin["uid"])); ?>','email')"><?php echo ($admin["email"]); ?></span></td><td ><?php echo (getGroupName($admin["gid"])); ?></td><td ><?php echo (toDate($admin["reg_time"])); ?></td><td ><span class="pointer" module="User" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($admin["uid"])); ?>','status')"><?php echo (getStatusImg($admin["status"])); ?></span></td><td><a href="javascript:;" onclick="editData(this,'<?php echo ($admin["uid"]); ?>','uid')"><?php echo L("EDIT");?></a>&nbsp;&nbsp;<a href="javascript:;" onclick="removeData(this,'<?php echo ($admin["uid"]); ?>','uid')"><?php echo L("REMOVE");?></a>&nbsp;&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?></tbody></table>
<!-- Think 系统列表组件结束 -->

<div class="pager"><?php echo ($page); ?></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="ajax-loading"></div>
</body>
<script type="text/javascript">
jQuery(function($){
	updateBodyDivHeight();
	$(window).resize(function(){
		updateBodyDivHeight();
	});
});

function updateBodyDivHeight()
{
	jQuery(".body-table-div").height(jQuery(".fanwe-body").height() - 36);
}
</script>
</html>