<?php
class ShareModule
{
	public function index()
	{		
		global $_FANWE;
		if(intval($GLOBALS['fanwe']->var['uid'])==0)
		{
			$json['status'] = false;
			$json['need_login'] = true;
			$json['msg'] = lang("share","login_first");
			outputJson($json);exit;
		}
		
		require fimport('service/sharegoods');
		$url = urldecode($_REQUEST['url']);
		$share_module = new SharegoodsService($url);
		$result = $share_module->fetch();
		if($result)
		{
			$json['status'] = true;
			$json['info'] = base64_encode(serialize($result));
			$json['type'] = 1; //商品
			$json['img'] = $result['item']['img'];
			$json['key'] = $result['key'];
			//$cache_file = getTplCache('shareutil/fetch_goods_result');
			include template('inc/shareutil/fetch_goods_result');
			$json['html'] = display('',$is_session = true,$is_return = true);	
			
			require fimport("function/share");
			$json['tags'] = load_tags($result['item']['name']);	
			$json['tags_input'] = load_tags_input($result['item']['name']);		
						
		}
		else
		{
			$json['status'] = false;
			$json['msg'] = lang("share","fetch_error_change_goods");
		}
		outputJson($json);
	}
	
	
	/**
	 * $data = array( //分享的基本数据
	 *  'share'=>array(
	 * 	  'uid'=> xxx, //分享的会员ID
	 * 	  'parent_id'	=>	xxx //转发的分享ID
	 * 	  'content'	=>	xxx //分享的内容
	 * 	),
	 * 
	 *  'share_photo'=>array( //图库  #可选#
	 *    array(  //多张图
	 *    'img' => xxx //原图地址
	 *    )
	 *  ),
	 *  'share_goods'=>array( //分享的商品 #可选#
	 *    array(
	 *    'img' => xxx  //商品图
	 *    'name' => xxx //品名
	 *    'url'  => xxx //商品地址
	 *    'price' => xxx  //价格
	 *    'shop_name' => xxx //商户名称
	 *    'shop_logo' => xxx //商户的logo
	 *    'shop_url' => xxx //商户地址
	 *    ) //多个商品
	 *  ),
	 *  'share_tag' => array(xxx,xxx,xxx),  //该分享的标签
	 * );
	 */
	public function saveshare()
	{	
		global $_FANWE;
		if(intval($_FANWE['uid'])==0)
		{
			$data['status'] = false;
			$data['msg'] = lang("share","login_first");
			outputJson($data);
		}
		
		$result = FS('Share')->submit($_FANWE['request']);
		if($result['status'])
		{
			require_once fimport("function/share");
			$result['html'] = getMeList();
			$result['form_html'] = tplFetch("inc/share_utils");
			outputJson($result);
		}
		else
		{
			$result['msg'] = "保存失败";
			outputJson($result);
		}

	}
	
	public function savecomment()
	{
		if(intval($GLOBALS['fanwe']->var['uid'])==0)
		{
			$data['status'] = false;
			$data['msg'] = lang("share","login_first");
			outputJson($data);
		}
		require_once fimport("service/share");
		$comment_id = ShareService::savecomment($_POST);
		if($comment_id)
		{
			$result['status'] = true;			
			$share_item['comments'] = FDB::fetchAll("select sc.comment_id,sc.content,sc.create_time,u.user_name,u.uid from ".FDB::table("share_comment")." as sc left join ".FDB::table("user")." as u on sc.uid = u.uid where sc.share_id = ".intval($_POST['share_id'])." order by sc.create_time desc limit 5");
			foreach($share_item['comments'] as $kk=>$vv)
			{
				$share_item['comments'][$kk]['content'] = ShareService::express($vv['content']);
			}	
			$args = array("share_item"=>&$share_item);
			$result['html'] = tplFetch("inc/share_comment_list",$args);
		}
		else
		{
			$result['status'] = false;
			$result['msg'] = "保存失败";
		}
		outputJson($result);
		
	}
	
	//转发分享
	public function relay()
	{
		if(intval($GLOBALS['fanwe']->var['uid'])==0)
		{
			global $_FANWE;
			$cache_args = array(
				'user_minilogin_'.intval($_REQUEST['isajax']),
			);
			$cache_file = getTplCache('page/user_minilogin');
			if(!@include($cache_file))
				include template('page/user_minilogin');
			
			display($cache_args);
			exit;
		}
		require_once fimport("function/share");
		require_once fimport("service/share");
		$share_id = intval($_REQUEST['id']);
		$sql = "select s.share_id,s.content,s.create_time,s.uid,u.user_name from ".FDB::table("share")." as s left join ".
				FDB::table("user")." as u on u.uid = s.uid where s.share_id = ".$share_id;
		$share_data = FDB::fetchFirst($sql);
		$share_data['content'] = ShareService::express($share_data['content']);
		include template("inc/share_relay_utils");
		display();
	}

	//转发分享
	public function comment()
	{
		if(intval($GLOBALS['fanwe']->var['uid'])==0)
		{
			global $_FANWE;
			$cache_args = array(
				'user_minilogin_'.intval($_REQUEST['isajax']),
			);
			$cache_file = getTplCache('page/user_minilogin');
			if(!@include($cache_file))
				include template('page/user_minilogin');
			
			display($cache_args);
			exit;
		}
		require_once fimport("function/share");
		require_once fimport("service/share");
		$share_id = intval($_REQUEST['id']);
		$sql = "select s.share_id,s.content,s.create_time,s.uid,u.user_name from ".FDB::table("share")." as s left join ".
				FDB::table("user")." as u on u.uid = s.uid where s.share_id = ".$share_id;
		$share_data = FDB::fetchFirst($sql);
		$share_data['content'] = ShareService::express($share_data['content']);
		include template("inc/share_comment_utils");
		display();
	}	
	
	public function remove_fav()
	{
		if(intval($GLOBALS['fanwe']->var['uid'])==0)
		{
			$result['status'] = 0; //未登录
			outputJson($result);
		}
		else
		{
			$uid = intval($_REQUEST['uid']);
			$share_id = intval($_REQUEST['share_id']);
			FDB::query("delete from ".FDB::table("user_collect")." where uid = ".$uid." and rec_id = ".$share_id." and type = 0 and flag = 0");
			FDB::query("update ".FDB::table("share")." set collect_count = collect_count - 1 where share_id = ".$share_id);
			$result['status'] = 1; 
			$result['uid'] = $uid;
			$result['share_id'] = $share_id;
			outputJson($result);
		}
	}
	
	//喜欢分享
	public function add_fav()
	{
		if(intval($GLOBALS['fanwe']->var['uid'])==0)
		{
			$result['status'] = 1; //未登录
			outputJson($result);
		}
		$uid = intval($GLOBALS['fanwe']->var['uid']);
		$share_id = intval($_REQUEST['id']);
		if(intval(FDB::resultFirst("select count(*) from ".FDB::table("user_collect")." where uid = ".$uid." and rec_id = ".$share_id." and type = 0 and flag = 0")) > 0)
		{
			//已经加为喜欢
			$result['status'] = 2; 
			$result['uid'] = $uid;
			$result['share_id'] = $share_id;
			outputJson($result);
		}
		else
		{
			$share_data = FDB::fetchFirst("select s.uid,s.share_id,s.content,s.base_id,u.user_name from ".FDB::table("share")." as s left join ".FDB::table("user")." as u on u.uid = s.uid where s.share_id = ".$share_id);
		
			if($share_data['uid'] == $uid)
			{
				//自己的
				$result['status'] = 3; 
				outputJson($result);
			}
			else
			{
				require_once fimport("service/share");
				ShareService::saveFav($share_data);
				$result['status'] = 4; 
				
				$share_item['collects'] = FDB::fetchAll("select u.uid,u.user_name,uc.rec_id as share_id from ".FDB::table("user_collect")." as uc left join ".
									FDB::table("user")." as u on u.uid = uc.uid where type = 0 and rec_id = ".$share_data['share_id']." limit 10");
									
				$args = array("share_item"=>&$share_item);
				$result['collects'] = tplFetch("inc/share_collect_list",$args);
				outputJson($result);
			}
		}
	}
}
?>