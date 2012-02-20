<?php
/**
 * 店铺服务类
 * @author awfigq
 *
 */
class ShopService{
	
	/**
	 * 获取会员分享的店铺信息
	 * @param int $uid 会员编号
	 * @param int $num
	 * @return array
	 */
	public function getUserShareShops($uid,$num = 10)
	{
		$list = array();
		$shop_count = FDB::resultFirst('SELECT COUNT(goods_id) FROM '.FDB::table('share_goods').' WHERE shop_id > 0 AND uid = '.$uid);
		if($shop_count > 0)
		{
			$sql = 'SELECT sg.shop_id,COUNT(sg.shop_id) AS shop_count,s.shop_name,s.shop_url,s.shop_logo,s.taoke_url  
					FROM '.FDB::table('share_goods').' AS sg 
					INNER JOIN '.FDB::table('shop').' AS s ON s.shop_id = sg.shop_id 
					WHERE sg.uid = '.$uid.' 
					GROUP BY sg.shop_id ORDER BY shop_count DESC LIMIT 0,'.$num;
			$res = FDB::query($sql);
			while($shop = FDB::fetch($res))
			{
				if(empty($shop['taoke_url']))
					$shop['to_url'] = FU('tgo',array('url'=>$shop['shop_url']));
				else
					$shop['to_url'] = FU('tgo',array('url'=>$shop['taoke_url']));
				
				$shop['percent'] = round($shop['shop_count'] / $shop_count * 100,1).'%';
				$list[] = $shop;
			}
		}
		return array('total'=>$shop_count,'list'=>$list);
	}
	
	/**
	 * 获取会员分享的店铺百分比信息HTML
	 * @param int $uid 会员编号
	 * @param int $num 显示数量
	 * @return string
	 */
	public function getUserShareShopHtml($uid,$num = 10)
	{
		$user = FS('User')->getUserById($uid);
		$user_lang = $_FANWE['uid'] == $uid ? lang('user','me') : lang('user','ta_'.$user['gender']);
		$shops = ShopService::getUserShareShops($uid,$num);
		
		$args = array(
			'shops'=>&$shops,
			'user'=>&$user,
			'user_lang'=>&$user_lang,
		);
		
		return tplFetch("inc/shop/user_shop_percent",$args);
	}
}
?>