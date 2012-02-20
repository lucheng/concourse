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
	<div class="img-button "><p><input type="button" id="editData" name="editData" value="<?php echo L("EDIT");?>" onclick="editData(this,'checkList','tid')" class="editData"></p></div>
	<div class="img-button "><p><input type="button" id="removeData" name="removeData" value="<?php echo L("REMOVE");?>" onclick="removeData(this,'checkList')" class="removeData"></p></div>
</div>
<div class="search-box">
</div>
<!-- Think 系统列表组件开始 -->
<table id="checkList" class="table-list list" cellpadding="0" cellspacing="0" border="0"><thead><tr><th width="30" class="first"><input type="checkbox" onclick="checkAll('checkList')"></th><th width="50" ><a href="javascript:sortBy('tid','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "tid"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="~left" ><a href="javascript:sortBy('title','<?php echo ($sort); ?>','index')" title="按照<?php echo L("TITLE");?><?php echo ($sortType); ?> "><?php echo L("TITLE");?><?php if(($order)  ==  "title"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('aid','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ASK_ID");?><?php echo ($sortType); ?> "><?php echo L("ASK_ID");?><?php if(($order)  ==  "aid"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('uid','<?php echo ($sort); ?>','index')" title="按照<?php echo L("USER_NAME");?><?php echo ($sortType); ?> "><?php echo L("USER_NAME");?><?php if(($order)  ==  "uid"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="150" ><a href="javascript:sortBy('share_id','<?php echo ($sort); ?>','index')" title="按照<?php echo L("CHECK_RELATE_SHARE");?><?php echo ($sortType); ?> "><?php echo L("CHECK_RELATE_SHARE");?><?php if(($order)  ==  "share_id"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="50" ><a href="javascript:sortBy('is_solve','<?php echo ($sort); ?>','index')" title="按照<?php echo L("IS_SOLVE");?><?php echo ($sortType); ?> "><?php echo L("IS_SOLVE");?><?php if(($order)  ==  "is_solve"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="50" ><a href="javascript:sortBy('is_top','<?php echo ($sort); ?>','index')" title="按照<?php echo L("IS_TOP");?><?php echo ($sortType); ?> "><?php echo L("IS_TOP");?><?php if(($order)  ==  "is_top"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="50" ><a href="javascript:sortBy('is_best','<?php echo ($sort); ?>','index')" title="按照<?php echo L("IS_BEST");?><?php echo ($sortType); ?> "><?php echo L("IS_BEST");?><?php if(($order)  ==  "is_best"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="50" ><a href="javascript:sortBy('sort','<?php echo ($sort); ?>','index')" title="按照<?php echo L("SORT");?><?php echo ($sortType); ?> "><?php echo L("SORT");?><?php if(($order)  ==  "sort"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="50" ><a href="javascript:sortBy('status','<?php echo ($sort); ?>','index')" title="按照<?php echo L("STATUS");?><?php echo ($sortType); ?> "><?php echo L("STATUS");?><?php if(($order)  ==  "status"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('post_count','<?php echo ($sort); ?>','index')" title="按照<?php echo L("POST_COUNT");?><?php echo ($sortType); ?> "><?php echo L("POST_COUNT");?><?php if(($order)  ==  "post_count"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="150" ><a href="javascript:sortBy('create_time','<?php echo ($sort); ?>','index')" title="按照<?php echo L("POST_TIME");?><?php echo ($sortType); ?> "><?php echo L("POST_TIME");?><?php if(($order)  ==  "create_time"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="80">操作</th></tr></thead><tbody><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$thread): ++$i;$mod = ($i % 2 )?><tr class="<?php if(($mod)  ==  "0"): ?>even<?php endif; ?>"><td class="first"><input type="checkbox" name="key"	value="<?php echo ($thread["tid"]); ?>"></td><td ><?php echo ($thread["tid"]); ?></td><td align="left" ><?php echo ($thread["title"]); ?></td><td ><?php echo (getAskName($thread["aid"])); ?></td><td ><?php echo (getUserName($thread["uid"])); ?></td><td ><?php echo (getRelateShare($thread["share_id"])); ?></td><td ><span class="pointer" module="AskThread" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($thread["tid"])); ?>','is_solve')"><?php echo (getStatusImg($thread["is_solve"])); ?></span></td><td ><span class="pointer" module="AskThread" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($thread["tid"])); ?>','is_top')"><?php echo (getStatusImg($thread["is_top"])); ?></span></td><td ><span class="pointer" module="AskThread" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($thread["tid"])); ?>','is_best')"><?php echo (getStatusImg($thread["is_best"])); ?></span></td><td ><span class="pointer" module="AskThread" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($thread["tid"])); ?>','sort')"><?php echo ($thread["sort"]); ?></span></td><td ><span class="pointer" module="AskThread" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($thread["tid"])); ?>','status')"><?php echo (getStatusImg($thread["status"])); ?></span></td><td ><?php echo (getPostCount($thread["post_count"],$thread['tid'])); ?></td><td ><?php echo (toDate($thread["create_time"])); ?></td><td><a href="javascript:;" onclick="editData(this,'<?php echo ($thread["tid"]); ?>','tid')"><?php echo L("EDIT");?></a>&nbsp;&nbsp;<a href="javascript:;" onclick="removeData(this,'<?php echo ($thread["tid"]); ?>','tid')"><?php echo L("REMOVE");?></a>&nbsp;&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?></tbody></table>
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