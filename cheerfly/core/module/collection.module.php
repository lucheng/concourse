<?php
class CollectionModule
{
	public function index()
	{
		global $_FANWE;
		
		if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE"))
		{
				$browser = "Internet Explorer";
				$tmpl = "page/collection/collection_internet";
		}
		else if(strpos($_SERVER["HTTP_USER_AGENT"],"Firefox")) 
		{
				$browser = "Firefox"; 
				$tmpl = "page/collection/collection_firefox";
		} 	
		else if(strpos($_SERVER["HTTP_USER_AGENT"],"Chrome"))
		{
				$browser = "Google Chrome";
				$tmpl = "page/collection/collection_chrome";
		}      
		else if(strpos($_SERVER["HTTP_USER_AGENT"],"Safari"))
		{
				$browser = "Safari";  
				$tmpl = "page/collection/collection_safari";
		}     
		else if(strpos($_SERVER["HTTP_USER_AGENT"],"Opera"))  
		{
				$browser = "Opera";
				$tmpl = "page/collection/collection_opera";
		}	      
		else
		{
				$browser =  "Other";
				$tmpl = "page/collection/collection_other";
		}
		
		$cache_args = array(
				$browser,
		);
		$cache_file = getTplCache($tmpl,$browser);
		
		if(!@include($cache_file))
		{
			include template($tmpl);
		}
		
		display($cache_args);
	}	
	
	
	public function photo()
	{
		global $_FANWE;
		if($_FANWE['uid'] == 0)
		{
			$redir_url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			fSetCookie('redir_url', $redir_url, time() + 3600);
			require_once fimport('dynamic/user');
			include template('page/user/user_login');
		}
		else
		{
			FanweService::instance()->cache->loadCache('albums');
			$imgs = $_FANWE['request']['imgUrl'];
			$url = $_FANWE['request']['pageUrl'];
			$img_list = explode(",",$imgs);
//			$count_img = count($img_list);
			if(empty($url))
				exit;
			
			$result = array();
			require fimport('service/sharegoods');
			$url = urldecode($url);
			
			$share_module = new SharegoodsService($url);
			
			$goods_list = $_FANWE['request']['goods'];
			if(!is_array($goods_list))
				$goods_list = array();
			
			//检测是否已经采集此商品
			if($share_module->getExists($goods_list))
			{
				$result['status'] = -1;
				outputJson($result);
			}
			
			//一个分享最多能发布多少商品
			if(count($goods_list) >= $_FANWE['setting']['share_goods_count'])
			{
				$result['status'] = -2;
			}
			
			$goods = $share_module->fetch();
			if($goods)
			{
				if($goods['status'] == -1)
				{
					$result['status'] = -3;
					$result['url'] = FU('note/g',array('sid'=>$goods['share_id'],'id'=>$goods['goods_id']));
				}
				else
				{
					$result['status'] = 1;
					$result['info'] = authcode(serialize($goods), 'ENCODE');
					$result['type'] = 'g'; //商品
					$result['img'] = $goods['item']['pic_url'];
					$result['key'] = $goods['item']['key'];
					$result['tag'] = FS('Words')->segment($goods['item']['name'],$_FANWE['setting']['share_tag_count']);
					$result['tags'] = implode(' ',FS('Words')->segment($goods['item']['name'],$_FANWE['setting']['share_tag_count']));
					$args = array('imgs'=>$img_list, 'goods'=>$goods);
					$result['item'] = tplFetch("services/share/img_item",$args);
//					$result['item'] = tplFetch("services/share/goods_item",$args);
//					$result['html'] = tplFetch("services/share/goods_result",$args);
					$result['image_server'] = $goods['image_server'];
					foreach ($result['tag'] as $value){
						$result['html'] = $result['html'].'<li>'.$value.'</li>';
					}
				}
			}
			else
			{
				$result['status'] = 0;
			}
			
			include template("page/collection/collection_photo");
		}
		display();
	}
	
	public function success()
	{
		global $_FANWE;
		$cache_file = getTplCache('page/collection/collection_success',$_FANWE['uid']);
		if(!@include($cache_file))
		{
			$go_url = FU('u/index',array("uid"=>$_FANWE['uid']));
			include template('page/collection/collection_success');
		}
		display($cache_file);
	}
	
}
?>