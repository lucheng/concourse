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
<script type="text/javascript" src="__TMPL__Static/Js/forum.js"></script>
<script type="text/javascript">
var CONFIRM_ERROR = "<?php echo L("CONFIRM_ERROR");?>";
var NAME_EMPTY_TIP = "<?php echo L("NAME_EMPTY_TIP");?>";
</script>
<div class="handle-btns">
	<div class="link-button "><p><a id="" name="" href="<?php echo U(MODULE_NAME.'/index');?>" class=""><?php echo L("RETURN_LIST");?></a></p></div>
</div>
<form method='post' id="form" name="form" action="<?php echo U(MODULE_NAME.'/insert');?>" enctype="multipart/form-data">
<table cellpadding="4" cellspacing="0" border="0" class="table-form">
	<tr>
		<th width="150"><?php echo L("FORUM_NAME");?></th>
		<td><input type="text" class="textinput" name="name" id="name" value="" style="width:400px;" /></td>
	</tr>
	<tr>
		<th><?php echo L("PARENT_CATE");?></th>
		<td>
			<select name="parent_id">
				<option value="0"><?php echo L("TOP_CATE");?></option>
				<?php if(is_array($cate_tree)): foreach($cate_tree as $key=>$cate_item): ?><option value="<?php echo ($cate_item["fid"]); ?>"><?php echo ($cate_item["title_show"]); ?></option><?php endforeach; endif; ?>
			</select>
		</td>
	</tr>
	<tr>
		<th><?php echo L("CATE_ICON");?></th>
		<td>
			<input type="file" class="fileinput" name="cate_icon" size="30" />
		</td>
	</tr>
	<tr>
		<th><?php echo L("CATE_IMG");?></th>
		<td>
			<input type="file" class="fileinput" name="cate_img" size="30" />
		</td>
	</tr>
	<tr>
		<th><?php echo L("DESC");?></th>
		<td>
			<textarea name="desc" class="textinput areainput" rows="3"></textarea>
		</td>
	</tr>
	<tr>
		<th><?php echo L("SORT");?></th>
		<td>
			<input type="text" class="textinput" name="sort" id="sort" value="<?php echo ($newsort); ?>" />
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