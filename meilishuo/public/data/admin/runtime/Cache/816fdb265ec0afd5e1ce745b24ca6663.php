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
<script type="text/javascript" src="__TMPL__Static/Js/user.js"></script>
<div class="tabs-title">
	<div class="link-button "><p><a id="" name="" href="<?php echo U(MODULE_NAME.'/index');?>" class=""><?php echo L("RETURN_LIST");?></a></p></div>
	<div class="tt-item active" rel="1"><p><a href="javascript:;"><?php echo L("TAB_1");?></a></p></div>
	<div class="tt-item" rel="2"><p><a href="javascript:;"><?php echo L("TAB_2");?></a></p></div>
	<div class="tt-item" rel="3"><p><a href="javascript:;"><?php echo L("TAB_3");?></a></p></div>
	<!--<div class="tt-item" rel="4"><p><a href="javascript:;"><?php echo L("TAB_4");?></a></p></div>-->
</div>
<form method='post' id="form" name="form" action="<?php echo U(MODULE_NAME.'/update');?>">
<div class="tabs-body">
	<table cellpadding="4" cellspacing="0" border="0" class="table-form tabs-item tabs-active" rel="1">
		<tr>
			<th width="200"><?php echo L("USER_NAME");?></th>
			<td><input type="text" class="textinput requireinput" name="user_name" id="user_name" value="<?php echo ($vo["user_name"]); ?>" /></td>
		</tr>
		<tr>
			<th><?php echo L("EMAIL");?></th>
			<td><input type="text" class="textinput requireinput" name="email" id="email"  value="<?php echo ($vo["email"]); ?>" /></td>
		</tr>
		<tr>
			<th><?php echo L("PASSWORD");?></th>
			<td>
				<input type="password" class="textinput" name="password" id="password" />
				&nbsp;<span><?php echo L("PASSWORD_TIPS");?></span>
			</td>
		</tr>
		<tr>
			<th><?php echo L("GID");?></th>
			<td>
				<select name="gid" id="user_group">
					<?php if(is_array($group_list)): foreach($group_list as $gid=>$gname): ?><option value="<?php echo ($gid); ?>" <?php if($gid == $vo['gid']): ?>selected="selected"<?php endif; ?>><?php echo ($gname); ?></option><?php endforeach; endif; ?>
				</select>
			</td>
		</tr>
		<tr>
			<th><?php echo L("AVATAR");?></th>
			<td>
				<label><input type="checkbox" name="delete_avatar" value="1" /> <span><?php echo L("DELETE_AVATAR");?></span></label>
			</td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td>
				<img src="<?php echo getUserAvatar($vo['uid']);?>" style="border:solid 1px #ccc;" />
			</td>
		</tr>
		<tr>
			<th><?php echo L("REG_TIME");?></th>
			<td><input type="text" class="textinput" name="reg_time" value="<?php echo toDate($vo['reg_time']);?>" /></td>
		</tr>
		<tr>
			<th><?php echo L("REG_IP");?></th>
			<td><input type="text" class="textinput" name="us[reg_ip]" value="<?php echo ($vo["reg_ip"]); ?>" /></td>
		</tr>
	</table>
	<table cellpadding="4" cellspacing="0" border="0" class="table-form tabs-item" rel="2">
		<tr>
			<th width="200"><?php echo L("GENDER");?></th>
			<td>
				<label><input type="radio" name="up[gender]" value="0" <?php if(0 == $vo['gender']): ?>checked="checked"<?php endif; ?> /> <span><?php echo L("GENDER_0");?></span></label>&nbsp;
				<label><input type="radio" name="up[gender]" value="1" <?php if(1 == $vo['gender']): ?>checked="checked"<?php endif; ?> /> <span><?php echo L("GENDER_1");?></span></label>
			</td>
		</tr>
		<tr>
			<th><?php echo L("WEIBO");?></th>
			<td><input type="text" class="textinput" name="up[weibo]" value="<?php echo ($vo["weibo"]); ?>" /></td>
		</tr>
		<tr>
			<th><?php echo L("RESIDE");?></th>
			<td>
				<select name="up[reside_province]" id="province" onchange="getCitys('#province','#city');">
					<?php if(is_array($province_list)): foreach($province_list as $province_id=>$province_name): ?><option value="<?php echo ($province_id); ?>" <?php if($province_id == $vo['reside_province']): ?>selected="selected"<?php endif; ?>><?php echo ($province_name); ?></option><?php endforeach; endif; ?>
				</select>&nbsp;
				<select name="up[reside_city]" id="city">
					<?php if(is_array($city_list)): foreach($city_list as $city_id=>$city_name): ?><option value="<?php echo ($city_id); ?>" <?php if($city_id == $vo['reside_city']): ?>selected="selected"<?php endif; ?>><?php echo ($city_name); ?></option><?php endforeach; endif; ?>
				</select>
			</td>
		</tr>
		<tr>
			<th><?php echo L("INTRODUCE");?></th>
			<td>
				<textarea name="up[introduce]" class="areainput" rows="5"><?php echo ($vo["introduce"]); ?></textarea>
			</td>
		</tr>
	</table>
	<table cellpadding="4" cellspacing="0" border="0" class="table-form tabs-item" rel="3">
		<tr>
			<th width="200"><?php echo L("LAST_TIME");?></th>
			<td><p><span><?php echo toDate($vo['last_time']);?></span></p></td>
		</tr>
		<tr>
			<th><?php echo L("LAST_IP");?></th>
			<td><p><span><?php echo ($vo["last_ip"]); ?></span></p></td>
		</tr>
		<tr>
			<th><?php echo L("SHARES");?></th>
			<td><p>(<a href="#"><?php echo ($vo["shares"]); ?></a>)</p></td>
		</tr>
		<tr>
			<th><?php echo L("PHOTOS");?></th>
			<td><p>(<a href="#"><?php echo ($vo["photos"]); ?></a>)</p></td>
		</tr>
		<tr>
			<th><?php echo L("GOODS");?></th>
			<td><p>(<a href="#"><?php echo ($vo["goods"]); ?></a>)</p></td>
		</tr>
		<tr>
			<th><?php echo L("FORUMS");?></th>
			<td><p>(<a href="#"><?php echo ($vo["forums"]); ?></a>)</p></td>
		</tr>
		<tr>
			<th><?php echo L("FORUM_POSTS");?></th>
			<td><p>(<a href="#"><?php echo ($vo["forum_posts"]); ?></a>)</p></td>
		</tr>
		<tr>
			<th><?php echo L("ASK");?></th>
			<td><p>(<a href="#"><?php echo ($vo["ask"]); ?></a>)</p></td>
		</tr>
		<tr>
			<th><?php echo L("ASK_POSTS");?></th>
			<td><p>(<a href="#"><?php echo ($vo["ask_posts"]); ?></a>)</p></td>
		</tr>
	</table>
	<!--<table cellpadding="4" cellspacing="0" border="0" class="table-form tabs-item" rel="4">
		<tbody id="user_authoritys">
			<?php if(is_array($authoritys)): foreach($authoritys as $mkey=>$module): ?><tr class="access-item">
				<th class="first tr" width="200">
					<?php echo ($module["name"]); ?>
				</th>
				<td>
					<p>
						<?php if(is_array($module["actions"])): foreach($module["actions"] as $key=>$action): ?><label><input class="action-item" type="checkbox" name="access_node[<?php echo ($mkey); ?>][]" value="<?php echo ($action); ?>" <?php if($ua_list[$mkey][$action]): ?>checked="checked"<?php endif; ?>/><span>&nbsp;<?php echo L('ACTION_'.$action);?></span></label>&nbsp;&nbsp;<?php endforeach; endif; ?>&nbsp;
					</p>
				</td>
			</tr><?php endforeach; endif; ?>
		</tbody>
	</table>-->
</div>
<table cellpadding="4" cellspacing="0" border="0" class="table-form" style="border-top:none;">
	<tr class="act">
		<th width="200">&nbsp;</th>
		<td>
			<input type="hidden" name="uid" value="<?php echo ($vo["uid"]); ?>" />
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