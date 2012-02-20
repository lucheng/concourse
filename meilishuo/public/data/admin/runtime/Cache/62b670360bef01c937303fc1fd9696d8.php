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
<style type="text/css">
#sqlResult .error{color:#f00;}
#sqlResult table{width:100%; background:#333;}
#sqlResult table td{background:#fff;}
</style>
<form>
<fieldset id="querybox" style="margin:10px;">
	<legend><?php echo sprintf(L('SQL_TIPS1'),$db_name);?></legend>
	<div style="margin:10px;">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td valign="top">
					<textarea id="execSql" style="width:100%; font-size:13px; height:212px; line-height:18px;"></textarea>
				</td>
				<td width="10">&nbsp;
					
				</td>
				<td width="260" valign="top">
					<select name="table_name" id="tableName" multiple="multiple" style="width:100%; font-size:13px; height:212px; line-height:18px;">
						<?php if(is_array($tables)): foreach($tables as $key=>$table): ?><option value="<?php echo ($table); ?>"><?php echo ($table); ?></option><?php endforeach; endif; ?>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="padding:10px 0 0 0;">
					<input type="button" class="submit_btn" id="runQuery" value="<?php echo L("SUBMIT");?>" />
					<input type="reset" class="reset_btn" value="<?php echo L("RESET");?>" />
				</td>
			</tr>
		</table>
	</div>
</fieldset>
</form>
<fieldset id="queryBox" style="margin:10px;">
	<legend><?php echo L("SQL_TIPS2");?> <strong class="blue" id="resultNum"></strong></legend>
	<div id="sqlResult" style="margin:10px;">
		
	</div>
</fieldset>
<script type="text/javascript">
jQuery(function($){
	$("#runQuery").click(function(){
		var sql = $.trim($("#execSql").val());
		if(sql == '')
			return;
		
		$("#runQuery").attr({"disabled":true});
		$.ajax({
			url: APP + '?' + VAR_MODULE + '=Sql&' + VAR_ACTION + '=execute',
			type:"POST",
			cache: false,
			data:{"sql":sql},
			dataType:"json",
			success: function(result){
				$("#resultNum").html(result.info);
				$("#sqlResult").html(result.html);
				$("#runQuery").attr({"disabled":false});
			},
			error:function(){
				$("#runQuery").attr({"disabled":false});	
			}
		});
	});
	
	$("#tableName").dblclick(function(){
		var sql = $("#execSql").val();
		$("#execSql").val(sql + ' ' + this.value);
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