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
<script type="text/javascript" src="__TMPL__Static/Js/share.js"></script>
<script type="text/javascript">
var CONFIRM_ERROR = "<?php echo L("CONFIRM_ERROR");?>";
var CONFIRM_DELETE = "<?php echo L("CONFIRM_DELETE");?>";
</script>
<div class="handle-btns">
	<div class="link-button "><p><a id="" name="" href="<?php echo U(MODULE_NAME.'/index');?>" class=""><?php echo L("RETURN_LIST");?></a></p></div>
</div>
<form method='post' id="form" name="form" action="<?php echo U(MODULE_NAME.'/update');?>">
<table cellpadding="4" cellspacing="0" border="0" class="table-form">
	<tr>
		<th width="150"><?php echo L("SHARE_TITLE");?></th>
		<td><input type="text" class="textinput" name="title" id="title" value="<?php echo ($share["title"]); ?>" /></td>
	</tr>
	<tr>
		<th><?php echo L("SHARE_CONTENT");?></th>
		<td>
			<textarea class="areainput" name="content"><?php echo ($share["content"]); ?></textarea>
		</td>
	</tr>
	<tr>
		<th><?php echo L("SHARE_TYPE");?></th>
		<td>
			<?php echo (getTypeName($share["type"])); ?>
		</td>
	</tr>
	

	<tr>
		<th><?php echo L("SHARE_TAGS");?></th>
		<td>
			<input type="text" class="textinput" name="tags" value="<?php echo ($share["share_tags"]); ?>" /> <?php echo L("SP_BY_QUOTE");?>
		</td>
	</tr>	

	
	<?php if($share['share_photo']): ?><tr>
		<th><?php echo L("SHARE_PHOTO");?></th>
		<td>
			<?php if(is_array($share["share_photo"])): foreach($share["share_photo"] as $key=>$photo): ?><div class="img_list">		
				<img src="__ROOT__/<?php echo (getImgName($photo["img"],100,100)); ?>" />
				<div class="blank9"></div>
				<a href="javascript:void(0);" onclick="del_photo(<?php echo ($photo["photo_id"]); ?>,this);"><?php echo L("DELETE");?></a>
				</div><?php endforeach; endif; ?>
		</td>
	</tr><?php endif; ?>
	<?php if($share['share_goods']): ?><tr>
		<th><?php echo L("SHARE_GOODS");?></th>
		<td>
			<?php if(is_array($share["share_goods"])): foreach($share["share_goods"] as $key=>$goods): ?><div class="img_list">		
				<img src="__ROOT__/<?php echo (getImgName($goods["img"],100,100)); ?>" title="<?php echo ($goods["name"]); ?> <?php echo (priceFormat($goods["price"])); ?>" alt="<?php echo ($goods["name"]); ?> <?php echo (priceFormat($goods["price"])); ?>" />
				<div class="blank9"></div>
				<span title="<?php echo ($goods["name"]); ?> <?php echo (priceFormat($goods["price"])); ?>"><?php echo (msubstr($goods["name"],0,7)); ?></span>
				<div class="blank9"></div>
				<a href="javascript:void(0);" onclick="del_goods(<?php echo ($goods["goods_id"]); ?>,this);"><?php echo L("DELETE");?></a>
				<a href="<?php echo u("ShareGoods/edit",array('goods_id'=>$goods['goods_id']));?>"><?php echo L("EDIT");?></a>
				</div><?php endforeach; endif; ?>
		</td>
	</tr><?php endif; ?>
	<tr>
		<th><?php echo L("SHARE_CATEGORY");?></th>
		<td>
			<table class="fl">
				<tr>
					<td>
						<select multiple="multiple" class="selectmul" name="cate" style="width:260px; height:200px;">
							<?php if(is_array($category)): foreach($category as $key=>$cate): ?><option value="<?php echo ($cate["cate_id"]); ?>"><?php echo ($cate["cate_name"]); ?></option><?php endforeach; endif; ?>
						</select>
					</td>
					<td width=30>
						<input type="button" value=">>" name="add" class="formbutton" />
						<div class="blank9"></div>
						<input type="button" value="<<" name="remove" class="formbutton" />
					</td>
					<td>
						<select multiple="multiple" class="selectmul" name="share_cate" style="width:260px; height:200px;">
							<?php if(is_array($share_category)): foreach($share_category as $key=>$cate): ?><option value="<?php echo ($cate["cate_id"]); ?>"><?php echo ($cate["cate_name"]); ?></option><?php endforeach; endif; ?>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr class="act">
		<th>&nbsp;</th>
		<td>
			<input type="hidden" name="share_cates" value="<?php if(is_array($share_category)): foreach($share_category as $key=>$cate): ?><?php if($key > 0): ?>,<?php endif; ?><?php echo ($cate["cate_id"]); ?><?php endforeach; endif; ?>" />
			<input type="hidden" name="share_id" value="<?php echo ($share["share_id"]); ?>" />
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