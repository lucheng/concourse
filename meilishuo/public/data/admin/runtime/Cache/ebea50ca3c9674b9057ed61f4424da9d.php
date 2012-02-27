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
<script type="text/javascript" src="__TMPL__Static/Js/dataList.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/jquery.ui.core.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/DatePicker/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="__TMPL__Static/Js/DatePicker/lang/jquery.ui.datepicker-<?php echo ($default_lang); ?>.js"></script>
<div class="handle-btns">
	<div class="img-button "><p><input type="button" id="addAdmin" name="addAdmin" value="<?php echo L("ADD");?>" onclick="addData()" class="addAdmin"></p></div>
	<div class="img-button "><p><input type="button" id="editAdmin" name="editAdmin" value="<?php echo L("EDIT");?>" onclick="editData(this,'checkList')" class="editAdmin"></p></div>
	<div class="img-button "><p><input type="button" id="removeAdmin" name="removeAdmin" value="<?php echo L("REMOVE");?>" onclick="removeData(this,'checkList')" class="removeAdmin"></p></div>
	<form action="__APP__" id="formCity">
		<span><?php echo L("LOG_TIME");?></span>
		<input class="textinput" type="text" name="begin_time" value="<?php echo ($begin_time); ?>" id="begin_time" size="6" />
		<span>─</span>
		<input class="textinput" type="text" name="end_time" value="<?php echo ($end_time); ?>" id="end_time" size="6" />
		<input class="submit_btn" type="submit" value="<?php echo L("SEARCH");?>" />
		<div class="img-button "><p><input type="button" id="emptyBtn" name="emptyBtn" value="<?php echo L("EMPTY_LOG");?>" onclick="" class="emptyBtn"></p></div>
		<input type="hidden" name="<?php echo c('VAR_MODULE');?>" value="<?php echo ($module_name); ?>" />
		<input type="hidden" name="<?php echo c('VAR_ACTION');?>" id="action_box" value="index" />
	</form>
</div>
<div class="search-box">
</div>
<!-- Think 系统列表组件开始 -->
<table id="checkList" class="table-list list" cellpadding="0" cellspacing="0" border="0"><thead><tr><th width="30" class="first"><input type="checkbox" onclick="checkAll('checkList')"></th><th width="80" ><a href="javascript:sortBy('id','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "id"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th ><a href="javascript:sortBy('log_module','<?php echo ($sort); ?>','index')" title="按照<?php echo L("LOG_MODULE");?><?php echo ($sortType); ?> "><?php echo L("LOG_MODULE");?><?php if(($order)  ==  "log_module"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th ><a href="javascript:sortBy('log_action','<?php echo ($sort); ?>','index')" title="按照<?php echo L("LOG_ACTION");?><?php echo ($sortType); ?> "><?php echo L("LOG_ACTION");?><?php if(($order)  ==  "log_action"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th ><a href="javascript:sortBy('data_id','<?php echo ($sort); ?>','index')" title="按照<?php echo L("DATA_ID");?><?php echo ($sortType); ?> "><?php echo L("DATA_ID");?><?php if(($order)  ==  "data_id"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th ><a href="javascript:sortBy('admin_id','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ADMIN_ID");?><?php echo ($sortType); ?> "><?php echo L("ADMIN_ID");?><?php if(($order)  ==  "admin_id"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th ><a href="javascript:sortBy('ip','<?php echo ($sort); ?>','index')" title="按照<?php echo L("IP");?><?php echo ($sortType); ?> "><?php echo L("IP");?><?php if(($order)  ==  "ip"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th ><a href="javascript:sortBy('log_result','<?php echo ($sort); ?>','index')" title="按照<?php echo L("LOG_RESULT");?><?php echo ($sortType); ?> "><?php echo L("LOG_RESULT");?><?php if(($order)  ==  "log_result"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="140" ><a href="javascript:sortBy('log_time','<?php echo ($sort); ?>','index')" title="按照<?php echo L("LOG_TIME");?><?php echo ($sortType); ?> "><?php echo L("LOG_TIME");?><?php if(($order)  ==  "log_time"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100">操作</th></tr></thead><tbody><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$log): ++$i;$mod = ($i % 2 )?><tr class="<?php if(($mod)  ==  "0"): ?>even<?php endif; ?>"><td class="first"><input type="checkbox" name="key"	value="<?php echo ($log["id"]); ?>"></td><td ><?php echo ($log["id"]); ?></td><td ><?php echo ($log["log_module"]); ?></td><td ><?php echo ($log["log_action"]); ?></td><td ><?php echo ($log["data_id"]); ?></td><td ><?php echo (getAdminName($log["admin_id"])); ?></td><td ><?php echo ($log["ip"]); ?></td><td ><?php echo (getResult($log["log_result"])); ?></td><td ><?php echo (toDate($log["log_time"])); ?></td><td><a href="javascript:;" onclick="editData(this,'<?php echo ($log["id"]); ?>','id')"><?php echo L("EDIT");?></a>&nbsp;&nbsp;<a href="javascript:;" onclick="removeData(this,'<?php echo ($log["id"]); ?>','id')"><?php echo L("REMOVE");?></a>&nbsp;&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?></tbody></table>
<!-- Think 系统列表组件结束 -->

<div class="pager"><?php echo ($page); ?></div>
<script type="text/javascript">
jQuery(function($){
	$("#begin_time").datepicker();
	$("#end_time").datepicker();
	
	$("#emptyBtn").click(function(){
		$("#action_box").val('clear');
		$("#formCity").submit();
	});
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