<?php
/* 模块的基本信息 */
if (isset($read_modules) && $read_modules == true)
{
    $module['class_name']    = 'taobao';
    /* 名称 */
    $module['name']    = "淘宝";
    $module['url'] = "http://www.taobao.com"; //官方网址
    /**
     *  域名：用于通过域名查询该模型 ,为了防止主机头为空的域名like查询 会匹配所有相关的二级域名，所有域名设置需以http://开头
	 *	多个域名解析同一个地址时，可用逗号分隔，但每个模型不能有重复的domain项
	 *  查询主要用like方式检索相应的模型, 如：domain设置为 http://item.taobao.com与http://taobao.com。
	 *  采集来路为http://taobao.com/item.php?id=xxxxx时将也会检索到该模型
	 *
     **/
    $module['domain'] = 'http://item.taobao.com,http://detail.tmall.com,http://item.tmall.com';
    return $module;
}

include_once FANWE_ROOT.'core/class/sharegoods/taobao/TopClient.php';
include_once FANWE_ROOT.'core/class/sharegoods/taobao/request/ItemGetRequest.php';
include_once FANWE_ROOT.'core/class/sharegoods/taobao/request/ShopGetRequest.php';
include_once FANWE_ROOT.'core/class/sharegoods/taobao/request/TaobaokeItemsDetailGetRequest.php';
class taobao_sharegoods implements interface_sharegoods
{
	public function fetch($url)
	{
        global $_FANWE;
		$id = $this->getID($url);

		if($id == 0)
			return false;
			
		$key = 'taobao_'.$id;

		$client = new TopClient;
		$client->appkey = $_FANWE['setting']['tao_app_key'];
		$client->secretKey = $_FANWE['setting']['tao_app_secret'];

		$req = new ItemGetRequest;
		$req->setFields("detail_url,title,nick,pic_url,price");
		$req->setNumIid($id);
		$resp = $client->execute($req);

		if(!isset($resp->item))
			return false;

		$result = array();
		$goods = (array)$resp->item;

		if(empty($goods['detail_url']) || empty($goods['pic_url']))
			return false;

		$image = copyFile($goods['pic_url'],"temp",md5(microtime(true)).random('6').".jpg",false);
		if($image === false)
			return false;
		
		$result['item']['key'] = $key;
		$result['item']['name'] = $goods['title'];
		$result['item']['price'] = $goods['price'];
		$result['item']['img'] = $image['url'];
		$result['item']['pic_url'] = $goods['pic_url'].'_100x100.jpg';
		$result['item']['url'] = $goods['detail_url'];

        $tao_ke_pid = $_FANWE['setting']['tao_ke_key'];
        $shop_click_url = '';
        
        if(!empty($tao_ke_pid))
        {
            $req = new TaobaokeItemsDetailGetRequest;
            $req->setFields("click_url,shop_click_url");
            $req->setNumIids($id);
//            $req->setPid($tao_ke_pid);
            $req->setNick($tao_ke_pid);
            $resp = $client->execute($req);

            if(isset($resp->taobaoke_item_details))
			{
                $taoke = (array)$resp->taobaoke_item_details->taobaoke_item_detail;
                if(!empty($taoke['click_url']))
                    $result['item']['taoke_url'] = $taoke['click_url'];

                if(!empty($taoke['shop_click_url']))
                    $shop_click_url = $taoke['shop_click_url'];
            }
        }

		if(!empty($goods['nick']))
		{
			$req = new ShopGetRequest;
			$req->setFields("sid,nick,pic_path");
			$req->setNick($goods['nick']);
			$resp = $client->execute($req);

			if(isset($resp->shop))
			{
				$shop = (array)$resp->shop;
				$result['shop']['name'] = $shop['nick'];

				if(!empty($shop['pic_path']))
				{
					$image = copyFile('http://logo.taobao.com/shop-logo'.$shop['pic_path'],"temp",md5(microtime(true)).random('6').".jpg",false);
					if($image !== false)
						$result['shop']['logo'] = $image['url'];
				}
				$result['shop']['shop_id'] = $shop['sid'];
				$result['shop']['url'] = 'http://shop'.$shop['sid'].'.taobao.com';
                if(!empty($shop_click_url))
                    $result['shop']['taoke_url'] = $shop_click_url;
			}
		}

		return $result;
	}
	
	public function getID($url)
	{
		$id = 0;
		$parse = parse_url($url);
		if(isset($parse['query']))
		{
            parse_str($parse['query'],$params);
			if(isset($params['id']))
				$id = $params['id'];
        }
		return $id;
	}
	
	public function getKey($url)
	{
		$id = $this->getID($url);
		return 'taobao_'.$id;
	}
}
?>