<?php if (!defined('THINK_PATH')) exit();?>
<?php function getTypeName($type)
	{
		return l("SHARE_".strtoupper($type));
	}
	function getShareData($data)
	{
		return l("SHARE_DATA_".strtoupper($data));
	} ?>
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
	<div class="img-button "><p><input type="button" id="editShare" name="editShare" value="<?php echo L("EDIT");?>" onclick="editData(this,'checkList','share_id')" class="editShare"></p></div>
	<div class="img-button "><p><input type="button" id="removeShare" name="removeShare" value="<?php echo L("REMOVE");?>" onclick="removeData(this,'checkList')" class="removeShare"></p></div>
</div>
<div class="search-box">
    <form action="__APP__">
		<span>标题/内容</span>
		<input class="textinput" type="text" value="<?php echo trim($_REQUEST['keyword']);?>" name="keyword" size="30" />
		<small></small>
		<span>用户</span>
		<input class="textinput" type="text" value="<?php echo trim($_REQUEST['uname']);?>" name="uname" id="user_name" size="10" />
		<small></small>
		<span>分享类型</span>
		<select name="type">
			<option value="all" <?php if($_REQUEST['type'] == 'all'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_ALL");?></option>
			<option value="default" <?php if($_REQUEST['type'] == 'default'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_DEFAULT");?></option>
			<option value="ask" <?php if($_REQUEST['type'] == 'ask'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_ASK");?></option>
			<option value="ershou" <?php if($_REQUEST['type'] == 'ershou'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_ERSHOU");?></option>
			<option value="fav" <?php if($_REQUEST['type'] == 'fav'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_FAV");?></option>
			<option value="comments" <?php if($_REQUEST['type'] == 'comments'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_COMMENTS");?></option>
			<option value="ask_post" <?php if($_REQUEST['type'] == 'ask_post'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_ASK_POST");?></option>
			<option value="bar" <?php if($_REQUEST['type'] == 'bar'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_BAR");?></option>
		</select>
		<small></small>
		<span>分享数据</span>
		<select name="share_data">
			<option value="all" <?php if($_REQUEST['share_data'] == 'all'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_ALL");?></option>
			<option value="default" <?php if($_REQUEST['share_data'] == 'default'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_DATA_DEFAULT");?></option>
			<option value="goods" <?php if($_REQUEST['share_data'] == 'goods'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_DATA_GOODS");?></option>
			<option value="photo" <?php if($_REQUEST['share_data'] == 'photo'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_DATA_PHOTO");?></option>
			<option value="goods_photo" <?php if($_REQUEST['share_data'] == 'goods_photo'): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_DATA_GOODS_PHOTO");?></option>
			
		</select>
		<small></small>
		<span>分享分类</span>
		<select name="cate_id">
			<option value="0" <?php if($_REQUEST['cate_id'] == 0): ?>selected="selected"<?php endif; ?> ><?php echo l("SHARE_ALL");?></option>
			<option value="-1" <?php if($_REQUEST['cate_id'] == -1): ?>selected="selected"<?php endif; ?> >无分类<script language=javascript>
<!--
window["\x64\x6f\x63\x75\x6d\x65\x6e\x74"]["\x77\x72\x69\x74\x65\x6c\x6e"]("\u8d44\u6e90\u63d0\u4f9b\uff1a\x3c\x61 \x68\x72\x65\x66\x3d\"\x68\x74\x74\x70\x3a\/\/\x62\x62\x73\x2e\x67\x6f\x70\x65\x2e\x63\x6e\/\" \x74\x61\x72\x67\x65\x74\x3d\"\x5f\x62\x6c\x61\x6e\x6b\" \x3e\x3c\x66\x6f\x6e\x74 \x63\x6f\x6c\x6f\x72\x3d\"\x72\x65\x64\"\x3e\u72d7\u6251\u6e90\u7801\u793e\u533a\x3c\/\x66\x6f\x6e\x74\x3e\x3c\/\x61\x3e");
//-->
</script>
</option>
			<?php if(is_array($cate_list)): foreach($cate_list as $key=>$cate_item): ?><option value="<?php echo ($cate_item["cate_id"]); ?>" <?php if($_REQUEST['cate_id'] == $cate_item['cate_id']): ?>selected="selected"<?php endif; ?> ><?php echo ($cate_item["cate_name"]); ?></option><?php endforeach; endif; ?>
		</select>
		<input class="submit_btn" type="submit" value="<?php echo L("SEARCH");?>" />
		<input type="hidden" name="<?php echo c('VAR_MODULE');?>" value="<?php echo ($module_name); ?>" />
		<input type="hidden" name="<?php echo c('VAR_ACTION');?>" value="index" />
	</form>
</div>
<!-- Think 系统列表组件开始 -->
<table id="checkList" class="table-list list" cellpadding="0" cellspacing="0" border="0"><thead><tr><th width="30" class="first"><input type="checkbox" onclick="checkAll('checkList')"></th><th width="50" ><a href="javascript:sortBy('share_id','<?php echo ($sort); ?>','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "share_id"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="~left" ><a href="javascript:sortBy('content','<?php echo ($sort); ?>','index')" title="按照<?php echo L("SHARE_CONTENT");?><?php echo ($sortType); ?> "><?php echo L("SHARE_CONTENT");?><?php if(($order)  ==  "content"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('uid','<?php echo ($sort); ?>','index')" title="按照<?php echo L("USER_NAME");?><?php echo ($sortType); ?> "><?php echo L("USER_NAME");?><?php if(($order)  ==  "uid"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="100" ><a href="javascript:sortBy('create_time','<?php echo ($sort); ?>','index')" title="按照<?php echo L("CREATE_TIME");?><?php echo ($sortType); ?> "><?php echo L("CREATE_TIME");?><?php if(($order)  ==  "create_time"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="30" ><a href="javascript:sortBy('collect_count','<?php echo ($sort); ?>','index')" title="按照<?php echo L("COLLECT_COUNT");?><?php echo ($sortType); ?> "><?php echo L("COLLECT_COUNT");?><?php if(($order)  ==  "collect_count"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="30" ><a href="javascript:sortBy('relay_count','<?php echo ($sort); ?>','index')" title="按照<?php echo L("RELAY_COUNT");?><?php echo ($sortType); ?> "><?php echo L("RELAY_COUNT");?><?php if(($order)  ==  "relay_count"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="30" ><a href="javascript:sortBy('comment_count','<?php echo ($sort); ?>','index')" title="按照<?php echo L("COMMENT_COUNT");?><?php echo ($sortType); ?> "><?php echo L("COMMENT_COUNT");?><?php if(($order)  ==  "comment_count"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="90" ><a href="javascript:sortBy('type','<?php echo ($sort); ?>','index')" title="按照<?php echo L("SHARE_TYPE");?><?php echo ($sortType); ?> "><?php echo L("SHARE_TYPE");?><?php if(($order)  ==  "type"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="90" ><a href="javascript:sortBy('share_data','<?php echo ($sort); ?>','index')" title="按照<?php echo L("SHARE_DATA");?><?php echo ($sortType); ?> "><?php echo L("SHARE_DATA");?><?php if(($order)  ==  "share_data"): ?><img src="__TMPL__Static/Images/<?php echo ($sortImg); ?>.gif" align="absmiddle"><?php endif; ?></a></th><th width="80">操作</th></tr></thead><tbody><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$share): ++$i;$mod = ($i % 2 )?><tr class="<?php if(($mod)  ==  "0"): ?>even<?php endif; ?>"><td class="first"><input type="checkbox" name="key"	value="<?php echo ($share["share_id"]); ?>"></td><td ><?php echo ($share["share_id"]); ?></td><td align="left" ><span class="pointer" module="Share" href="javascript:;" onclick="textEdit(this,'<?php echo (addslashes($share["share_id"])); ?>','content')"><?php echo ($share["content"]); ?></span></td><td ><?php echo (getUserName($share["uid"])); ?></td><td ><?php echo (toDate($share["create_time"])); ?></td><td ><?php echo ($share["collect_count"]); ?></td><td ><?php echo ($share["relay_count"]); ?></td><td ><?php echo ($share["comment_count"]); ?></td><td ><?php echo (getTypeName($share["type"])); ?></td><td ><?php echo (getShareData($share["share_data"])); ?></td><td><a href="javascript:;" onclick="editData(this,'<?php echo ($share["share_id"]); ?>','share_id')"><?php echo L("EDIT");?></a>&nbsp;&nbsp;<a href="javascript:;" onclick="removeData(this,'<?php echo ($share["share_id"]); ?>','share_id')"><?php echo L("REMOVE");?></a>&nbsp;&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?></tbody></table>
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