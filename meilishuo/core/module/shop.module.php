<?php
class ShopModule
{
	public function index()
	{			
		global $_FANWE;
		$is_best = true;
		$is_all = false;
		$_FANWE['nav_title'] = lang('common','shop');
		$count = FDB::resultFirst('SELECT COUNT(shop_id) 
			FROM '.FDB::table('shop'));
			
		$pager = buildPage('shop/index',array(),$count,$_FANWE['page'],18);
		
		$col = 3;
		$index = 0;
		$list = array();
		$today_time = getTodayTime();
		$sql = 'SELECT ud.*,u.user_name,uc.fans,uc.goods,uc.shares,
			up.reside_province,up.reside_city,up.introduce 
			FROM '.FDB::table('user_daren').' AS ud 
			INNER JOIN '.FDB::table('user').' AS u ON u.uid = ud.uid 
			INNER JOIN '.FDB::table('user_count').' AS uc ON uc.uid = u.uid 
			INNER JOIN '.FDB::table('user_profile').' AS up ON up.uid = ud.uid 
			WHERE ud.is_best = 1 ORDER BY ud.day_time DESC,ud.id DESC LIMIT '.$pager['limit'];
		$res = FDB::query($sql);
		while($data = FDB::fetch($res))
		{
			$data['today_best'] = false;
			$data['url'] = FU('u/index',array('uid'=>$data['uid']));
			if($data['day_time'] == $today_time)
				$data['today_best'] = true;
			$data['is_follow'] = FS('User')->getIsFollowUId($data['uid']);
			$province = $_FANWE['cache']['citys']['all'][$data['reside_province']]['name'];
			$city = $_FANWE['cache']['citys']['all'][$data['reside_city']]['name'];
			$data['city'] = $province.'&nbsp;'.$city;
			$list[$index % $col][] = $data;
			$index++;
		}
		
		include template('page/shop');		
		display();
	}
	
	public function all()
	{			
		global $_FANWE;
		$is_best = false;
		$is_all = true;
		$_FANWE['nav_title'] = lang('common','daren');
		$count = FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user_daren'));
			
		$pager = buildPage('daren/all',array(),$count,$_FANWE['page'],18);
		
		$col = 3;
		$index = 0;
		$list = array();
		$today_time = getTodayTime();
		$sql = 'SELECT ud.*,u.user_name,uc.fans,uc.goods,uc.shares,
			up.reside_province,up.reside_city,up.introduce 
			FROM '.FDB::table('user_daren').' AS ud 
			INNER JOIN '.FDB::table('user').' AS u ON u.uid = ud.uid 
			INNER JOIN '.FDB::table('user_count').' AS uc ON uc.uid = u.uid 
			INNER JOIN '.FDB::table('user_profile').' AS up ON up.uid = ud.uid 
			ORDER BY ud.day_time DESC,ud.id DESC LIMIT '.$pager['limit'];
		$res = FDB::query($sql);
		while($data = FDB::fetch($res))
		{
			$data['today_best'] = false;
			$data['url'] = FU('u/index',array('uid'=>$data['uid']));
			$data['is_follow'] = FS('User')->getIsFollowUId($data['uid']);
			$province = $_FANWE['cache']['citys']['all'][$data['reside_province']]['name'];
			$city = $_FANWE['cache']['citys']['all'][$data['reside_city']]['name'];
			$data['city'] = $province.'&nbsp;'.$city;
			$list[$index % $col][] = $data;
			$index++;
		}
		
		include template('page/daren');		
		display();
	}
}
?>