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
	<div class="img-button "><p><input type="button" id="addData" name="addData" value="<?php echo L("ADD");?>" onclick="addData()" class="addData"></p></div>
	<div class="img-button "><p><input type="button" id="editData" name="editData" value="<?php echo L("EDIT");?>" onclick="editData(this,'checkList','cate_id')" class="editData"></p></div>
	<div class="img-button "><p><input type="button" id="removeData" name="removeData" value="<?php echo L("REMOVE");?>" onclick="removeData(this,'checkList')" class="removeData"></p></div>
	<?php if($parent_id > 0): ?><div class="link-button "><p><a id="" name="" href="<?php echo U(MODULE_NAME.'/index',array('parent_id'=>$pp_id));?>" class=""><?php echo L("RETURN_PREV");?></a></p></div><?php endif; ?>
</div>
<!-- Think 系统列表组件开始 -->
<table id="checkList" class="table-list list" cellpadding="0" cellspacing="0" border="0"><thead><tr><th width="30" class="first"><input type="checkbox" onclick="checkAll('checkList')"></th><th width="50" ><a href="javascript:sortBy('cate_id','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "cate_id"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="~left" ><a href="javascript:sortBy('cate_name','<?php echo ($sort); ?>','index')" title="按照<?php echo L("CATE_NAME");?><?php echo ($sortType); ?> "><?php echo L("CATE_NAME");?><?php if(($order)  ==  "cate_name"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="~left" ><a href="javascript:sortBy('short_name','<?php echo ($sort); ?>','index')" title="按照<?php echo L("SHORT_NAME");?><?php echo ($sortType); ?> "><?php echo L("SHORT_NAME");?><?php if(($order)  ==  "short_name"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('cate_code','<?php echo ($sort); ?>','index')" title="按照<?php echo L("CATE_CODE");?><?php echo ($sortType); ?> "><?php echo L("CATE_CODE");?><?php if(($order)  ==  "cate_code"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="80" ><a href="javascript:sortBy('sort','<?php echo ($sort); ?>','index')" title="按照<?php echo L("SORT");?><?php echo ($sortType); ?> "><?php echo L("SORT");?><?php if(($order)  ==  "sort"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="60" ><a href="javascript:sortBy('is_index','<?php echo ($sort); ?>','index')" title="按照<?php echo L("IS_INDEX");?><?php echo ($sortType); ?> "><?php echo L("IS_INDEX");?><?php if(($order)  ==  "is_index"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="50" ><a href="javascript:sortBy('status','<?php echo ($sort); ?>','index')" title="按照<?php echo L("STATUS");?><?php echo ($sortType); ?> "><?php echo L("STATUS");?><?php if(($order)  ==  "status"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="240">操作</th></tr></thead><tbody><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): ++$i;$mod = ($i % 2 )?><tr class="<?php if(($mod)  ==  "0"): ?>even<?php endif; ?>"><td class="first"><input type="checkbox" name="key"	value="<?php echo ($cate["cate_id"]); ?>"></td><td ><?php echo ($cate["cate_id"]); ?></td><td align="left" ><span class="pointer" module="GoodsCategory" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($cate["cate_id"])); ?>','cate_name')"><?php echo ($cate["cate_name"]); ?></span></td><td align="left" ><span class="pointer" module="GoodsCategory" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($cate["cate_id"])); ?>','short_name')"><?php echo ($cate["short_name"]); ?></span></td><td ><span class="pointer" module="GoodsCategory" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($cate["cate_id"])); ?>','cate_code')"><?php echo ($cate["cate_code"]); ?></span></td><td ><span class="pointer" module="GoodsCategory" href="javascript:;" onclick="numberEdit(this,'<?php echo (addslashes($cate["cate_id"])); ?>','sort')"><?php echo ($cate["sort"]); ?></span></td><td ><span class="pointer" module="GoodsCategory" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($cate["cate_id"])); ?>','is_index')"><?php echo (getStatusImg($cate["is_index"])); ?></span></td><td ><span class="pointer" module="GoodsCategory" href="javascript:;" onclick="toggleStatus(this,'<?php echo (addslashes($cate["cate_id"])); ?>','status')"><?php echo (getStatusImg($cate["status"])); ?></span></td><td align="right"> <?php echo (getChildLink($cate["child"],$cate['cate_id'])); ?>&nbsp;&nbsp; <?php echo (getTagsLink($cate["cate_id"])); ?>&nbsp;&nbsp;<a href="javascript:;" onclick="editData(this,'<?php echo ($cate["cate_id"]); ?>','cate_id')"><?php echo L("EDIT");?></a>&nbsp;&nbsp;<a href="javascript:;" onclick="removeData(this,'<?php echo ($cate["cate_id"]); ?>','cate_id')"><?php echo L("REMOVE");?></a>&nbsp;&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?></tbody></table>
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