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
<link href="__TMPL__Static/Js/DatePicker/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="__TMPL__Static/Js/user.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/jquery.ui.core.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/DatePicker/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/DatePicker/lang/jquery.ui.datepicker-<?php echo ($default_lang); ?>.js"></script>
<div class="handle-btns">
	<div class="link-button "><p><a id="" name="" href="<?php echo U(MODULE_NAME.'/index');?>" class=""><?php echo L("RETURN_LIST");?></a></p></div>
</div>
<form method='post' id="form" name="form" action="<?php echo U(MODULE_NAME.'/insert');?>" enctype="multipart/form-data">
<table cellpadding="4" cellspacing="0" border="0" class="table-form">
	<tr>
		<th width="200"><?php echo L("UID");?></th>
		<td>
			<select name="uid" id="userSelect">
				<option value=""><?php echo getLang('SEARCH_USER','User');?></option>
			</select>&nbsp;
			<input type="text" class="textinput" size="8" id="userName" />&nbsp;
			<input class="submit_btn" type="button" value="<?php echo L("SEARCH");?>" onclick="searchUser('#userSelect','#userName');" />
		</td>
	</tr>
	<tr>
		<th><?php echo L("IMG");?></th>
		<td>
			<input type="file" class="fileinput" name="img_file" size="30" />
		</td>
	</tr>
	<tr>
		<th><?php echo L("INDEX_IMG");?></th>
		<td>
			<input type="file" class="fileinput" name="index_img_file" size="30" />
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td>
			<label><input type="checkbox" name="is_best" value="1" /><span>&nbsp;<?php echo L("IS_BEST");?></span></label>&nbsp;&nbsp;
			<label><input type="checkbox" name="is_index" value="1"/><span>&nbsp;<?php echo L("IS_INDEX");?></span></label>
		</td>
	</tr>
	<tr>
		<th><?php echo L("DAY_TIME");?></th>
		<td><input type="text" class="textinput" name="day_time" id="day_time" value="" /></td>
	</tr>
	<tr>
		<th><?php echo L("REASON");?></th>
		<td>
			<textarea name="reason" class="areainput" rows="5"></textarea>
		</td>
	</tr>
	<tr class="act">
		<th>&nbsp;</th>
		<td>
			<input type="submit" class="submit_btn" value="<?php echo L("SUBMIT");?>" />
			<input type="reset" class="reset_btn" value="<?php echo L("RESET");?>" />
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
var EMPTY_USER = "<?php echo getLang('EMPTY_USER','User');?>";
jQuery(function($){
	$("#day_time").datepicker();
});
</script>
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