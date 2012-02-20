<?php
// +----------------------------------------------------------------------
// | 方维购物分享网站系统 (Build on ThinkPHP)
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://fanwe.com All rights reserved.
// +----------------------------------------------------------------------

/**
 * user.service.php
 *
 * 会员服务类
 *
 * @package service
 * @author awfigq <awfigq@qq.com>
 */
class UserService
{
	/**
	 * 写入会员session
	 * @param array $user 会员信息
	 * @param int $life 过期时间
	 * @return bool
	 */
	public function setSession($user,$life = 0)
	{
		fSetCookie('auth', authcode("$user[password]\t$user[uid]", 'ENCODE'), $life);
	}

	/**
	 * 清除会员session
	 * @return bool
	 */
	public function clearSession()
	{
		fSetCookie('auth','');
	}

	/**
	 * 获取会员是否已经存在
	 * @param string $email
	 * @return bool
	 */
	public function getUserExists($uid)
	{
		if(intval(FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user')." WHERE uid = '$uid'")) > 0)
			return true;
		else
			return false;
	}

	/**
	 * 获取email是否已经存在
	 * @param string $email
	 * @return bool
	 */
	public function getEmailExists($email)
	{
		if(intval(FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user')." WHERE email = '$email'")) > 0)
			return true;
		else
			return false;
	}

	/**
	 * 获取会员名称是否已经存在
	 * @param string $user_name 会员名称
	 * @return bool
	 */
	public function getUserNameExists($user_name)
	{
		if(intval(FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user')." WHERE user_name = '$user_name'")) > 0)
			return true;
		else
			return false;
	}

	/**
	 * 根据会员编号获取会员缓存信息
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserCache($uid)
	{
		$key = 'user/'.getDirsById($uid).'/info';
		$user = getCache($key);
		if($user === NULL)
		{
			$user = FDB::fetchFirst("SELECT u.*, up.* FROM ".FDB::table('user')." u
				LEFT JOIN ".FDB::table('user_profile')." up USING(uid)
				WHERE u.uid='$uid'");
			setCache($key,$user);
		}
		$user['url'] = FU('u/index',array('uid'=>$uid));
		return $user;
	}

	/**
	 * 根据会员名称获取会员列表
	 * @param array $user_names 名称数组
	 * @return array
	 */
	public function getUsersByName($user_names)
	{
		if(is_array($user_names))
		{
			return FDB::fetchAll('SELECT uid,user_name
				FROM '.FDB::table('user').'
				WHERE user_name '.FDB::createIN($user_names));
		}
		else
		{
			return FDB::fetchFirst('SELECT uid,user_name
				FROM '.FDB::table('user')."
				WHERE user_name = '$user_names'");
		}
	}

	/**
	 * 删除会员缓存信息
	 * @param int $uid 会员编号
	 * @return void
	 */
	public function deleteUserCache($uid)
	{
		$key = 'user/'.getDirsById($uid).'/info';
		deleteCache($key);
	}

	/**
	 * 根据会员编号获取会员信息
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserById($uid)
	{
		static $users = array();
		if(empty($users[$uid]))
		{
			$users[$uid] = FDB::fetchFirst("SELECT u.*, uc.*, us.*, up.* FROM ".FDB::table('user')." u
				LEFT JOIN ".FDB::table('user_count')." uc USING(uid)
				LEFT JOIN ".FDB::table('user_status')." us USING(uid)
				LEFT JOIN ".FDB::table('user_profile')." up USING(uid)
				WHERE u.uid='$uid'");
		}
		return $users[$uid];
	}

	/**
	 * 根据会员名称搜索会员
	 * @param string $key 搜索关键字
	 * @return array
	 */
	public function getUserByName($key,$limit)
	{
		$list = array();
		$key = segmentToUnicode($key,'+');
		if(empty($key))
			return $list;

		$res = FDB::query('SELECT u.uid,u.user_name,u.is_daren,
			MATCH (u.user_name_match) AGAINST (\''.$key.'\') AS similar
			FROM '.FDB::table('user').' AS u
			WHERE MATCH (u.user_name_match) AGAINST (\''.$key.'\' IN BOOLEAN MODE)
			ORDER BY u.is_daren DESC,similar DESC LIMIT '.$limit);
		while($data = FDB::fetch($res))
		{
			$list[] = $data;
		}
		return $list;
	}

	/**
	 * 获取包括会员名称关键字的会员数量
	 * @param string $key 搜索关键字
	 * @return array
	 */
	public function getUserCountByName($key)
	{
		$key = segmentToUnicode($key,'+');
		if(empty($key))
			return 0;

		return FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user').'
			WHERE MATCH (user_name_match) AGAINST (\''.$key.'\' IN BOOLEAN MODE)');
	}

	/**
	 * 获取登陆会员关注的会员编号集合
	 * @return array(1,2,...)
	 */
	public function getUserFollowsCache($uid)
	{
		global $_FANWE;

		$key = 'user/'.getDirsById($uid).'/follows';
		$data = getCache($key);
		if($data === NULL)
		{
			$data = array();
			$res = FDB::query('SELECT uid
				FROM '.FDB::table('user_follow').'
				WHERE f_uid = '.$uid);
			while($user = FDB::fetch($res))
			{
				$data[$user['uid']] = 1;
			}
			setCache($key,$data);
		}

		return $data;
	}

	/**
	 * 更新登陆会员关注的会员编号缓存
	 */
	public function updateUserFollowsCache($f_uid,$uid,$type='add')
	{
		global $_FANWE;
		$uids = UserService::getUserFollowsCache($f_uid);
		switch($type)
		{
			case 'add':
				$uids[$uid] = 1;
			break;

			case 'delete':
				unset($uids[$uid]);
			break;
		}
		setCache('user/'.getDirsById($f_uid).'/follows',$uids);
	}

	/**
	 * 获取登陆会员是否已关注此会员编号
	 * @param int $uid 会员编号
	 * @return bool
	 */
	public function getIsFollowUId($uid)
	{
		global $_FANWE;
		static $follows = array();
		if($_FANWE['uid'] == 0)
			return false;

		if(!isset($follows[$uid]))
		{
			$uids = UserService::getUserFollowsCache($_FANWE['uid']);
			if(isset($uids[$uid]))
				$follows[$uid] = true;
			else
				$follows[$uid] = false;
		}
		return $follows[$uid];
	}

	/**
	 * 获取登陆会员是否已关注此会员编号
	 * @param int $uid 会员编号
	 * @return bool
	 */
	public function getIsFollowUId2($fuid,$uid)
	{
		static $follows = array();
		if(!isset($follows[$uid]))
		{
			$uids = UserService::getUserFollowsCache($fuid);
			if(isset($uids[$uid]))
				$follows[$uid] = true;
			else
				$follows[$uid] = false;
		}
		return $follows[$uid];
	}

	/**
	 * 关注会员
	 如果已经关注此会员，则删除关注，返回false
	 如果没有关注此会员，则添加关注，返回true
	 * @param int $uid 会员编号
	 * @return bool
	 */
	public function followUser($uid)
	{
		global $_FANWE;
		if($_FANWE['uid'] == 0 || $_FANWE['uid'] == $uid)
			return false;

		if(UserService::getIsFollowUId($uid))
		{
			FDB::query('DELETE FROM '.FDB::table('user_follow').' WHERE f_uid = '.$_FANWE['uid'].' AND uid = '.$uid);
			FDB::query('UPDATE '.FDB::table('user_count').' SET follows = follows - 1 WHERE uid = '.$_FANWE['uid']);
			FDB::query('UPDATE '.FDB::table('user_count').' SET fans = fans - 1 WHERE uid = '.$uid);
			UserService::updateUserFollowsCache($_FANWE['uid'],$uid,'delete');
			return false;
		}
		else
		{
			FDB::query('INSERT INTO '.FDB::table('user_follow').'(f_uid,uid,create_time) VALUES ('.$_FANWE['uid'].','.$uid.','.TIME_UTC.')');
			FDB::query('UPDATE '.FDB::table('user_count').' SET follows = follows + 1 WHERE uid = '.$_FANWE['uid']);
			FDB::query('UPDATE '.FDB::table('user_count').' SET fans = fans + 1 WHERE uid = '.$uid);
			UserService::updateUserFollowsCache($_FANWE['uid'],$uid,'add');
			return true;
		}
	}

	/**
	 * 删除会员的粉丝
	 * @param int $uid 会员编号
	 * @return bool
	 */
	public function removeFans($uid)
	{
		global $_FANWE;
		if(FDB::query('DELETE FROM '.FDB::table('user_follow').' WHERE f_uid = '.$uid.' AND uid = '.$_FANWE['uid']))
		{
			FDB::query('UPDATE '.FDB::table('user_count').' SET follows = follows - 1 WHERE uid = '.$uid);
			FDB::query('UPDATE '.FDB::table('user_count').' SET fans = fans - 1 WHERE uid = '.$_FANWE['uid']);
			deleteCache('user/'.getDirsById($uid).'/follows');
			return true;
		}
		else
			return false;
	}

	/**
	 * 获取会员关注的会员
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserFollows($uid,$num = 9)
	{
		$uids = UserService::getUserFollowsCache($uid);
		$uids = array_rand($uids,$num);

		$list = array();
		if(count($uids) > 0)
		{
			$res = FDB::query('SELECT uid,user_name
				FROM '.FDB::table('user').'
				WHERE uid IN ('.implode(',',$uids).')');
			while($user = FDB::fetch($res))
			{
				$list[$user['uid']] = $user;
			}
			return $list;
		}
		else
			return array();
	}

	/**
	 * 获取会员的粉丝
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserFans($uid,$num = 9)
	{
		static $users = array();
		if(!isset($users[$uid][$num]))
		{
			$users[$uid][$num] = FDB::fetchAll('SELECT u.uid,u.user_name
				FROM '.FDB::table('user_follow').' AS uf
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = uf.f_uid
				WHERE uf.uid = '.$uid.' LIMIT 0,'.$num);
		}

		return $users[$uid][$num];
	}

	/**
	 * 获取谁最喜欢会员
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getBestFavUsers($uid,$num = 9)
	{
		static $users = array();
		if(!isset($users[$uid][$num]))
		{
			$users[$uid][$num] = FDB::fetchAll('SELECT u.uid,u.user_name,COUNT(uc.c_uid) ucount
				FROM '.FDB::table('user_collect').' AS uc
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = uc.c_uid
				WHERE uc.uid = '.$uid.' GROUP BY uc.c_uid ORDER BY ucount DESC LIMIT 0,'.$num);
		}

		return $users[$uid][$num];
	}

	/**
	 * 获取会员最喜欢谁
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserBestFavs($uid,$num = 9)
	{
		static $users = array();
		if(!isset($users[$uid][$num]))
		{
			$users[$uid][$num] = FDB::fetchAll('SELECT u.uid,u.user_name,COUNT(uc.uid) ucount
				FROM '.FDB::table('user_collect').' AS uc
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = uc.uid
				WHERE uc.c_uid = '.$uid.' GROUP BY uc.uid ORDER BY ucount DESC LIMIT 0,'.$num);
		}

		return $users[$uid][$num];
	}

	/**
	 * 获取会员的标签
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserTags($uid)
	{
		$user_tags = getCache('user/'.$uid.'/usertags');
		if($user_tags === NULL)
		{
			$user_tags = array();
			$res = FDB::query('SELECT tag_name FROM '.FDB::table('user_me_tags').' WHERE uid = '.$uid);
			while($data = FDB::fetch($res))
			{
				$user_tags[] = $data['tag_name'];
			}

			setCache('user/'.$uid.'/usertags',$user_tags);
		}

		return $user_tags;
	}

	/**
	 * 更新会员的标签
	 * @param int $uid 会员编号
	 * @param array $tags 会员标签
	 * @return array
	 */
	public function updateUserTags($uid,$tags)
	{
		FDB::query('DELETE FROM '.FDB::table('user_me_tags').' WHERE uid = '.$uid);

		$sql = '';
		$jg = '';
		foreach($tags as $tag)
		{
			$sql .= $jg.'('.$uid.',\''.$tag.'\',\''.segmentToUnicode($tag).'\')';
		}

		if($sql != '')
		{
			FDB::query('INSERT INTO '.FDB::table('user_me_tags').' VALUES '.$sql);
		}

		setCache('user/'.$uid.'/usertags',$tags);
	}

	/**
	 * 获取会员感兴趣的会员
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getInterestUser($uid,$num=9)
	{
		$users = array();
		$uids = array();
		$res = FDB::query('SELECT u.uid,u.user_name,RAND() AS sort
			FROM (SELECT id,uid FROM '.FDB::table('user_daren').' WHERE uid <> '.$uid.' ORDER BY id DESC LIMIT 0,3000) AS ud
			STRAIGHT_JOIN '.FDB::table('user').' AS u ON u.uid = ud.uid
			STRAIGHT_JOIN '.FDB::table('user_profile').' AS uf ON uf.uid = ud.uid
			ORDER BY sort ASC LIMIT 0,'.$num);
		while($data = FDB::fetch($res))
		{
			$uids[] = $data['uid'];
			$users[] = $data;
		}

		if(count($uids) < $num)
		{
			$where = '';
			$num = $num - count($uids);
			$uids[] = $uid;
			$where = 'WHERE uid NOT IN ('.implode(',',$uids).')';

			$res = FDB::query('SELECT u.uid,u.user_name,RAND() AS sort
				FROM (SELECT uid,user_name FROM '.FDB::table('user').' '.$where.' ORDER BY uid DESC LIMIT 0,3000) AS u
				STRAIGHT_JOIN '.FDB::table('user_profile').' AS uf ON uf.uid = u.uid
				ORDER BY sort ASC LIMIT 0,'.$num);
			while($data = FDB::fetch($res))
			{
				$users[] = $data;
			}
		}

		return $users;
	}

	public function saveAvatar($uid,$img)
	{
		$types = array(
			'small' =>'32',
			'middle'=>'64',
			'big'   =>'128',
		);

		$uid = sprintf("%09d", $uid);
		$dir1 = substr($uid, 0, 3);
		$dir2 = substr($uid, 3, 2);
		$dir3 = substr($uid, 5, 2);
		$file_path = PUBLIC_ROOT.'./upload/avatar/'.$dir1.'/'.$dir2.'/'.$dir3;
		makeDir($file_path);
		$file_path .= '/'.substr($uid, -2).'_';
		include_once fimport('class/image');
		$image = new Image();

		foreach($types as $size => $wh)
		{
			$image->thumb($img,$wh,$wh,1,true,$file_path.$size.'.jpg');
		}

		@unlink($img);
	}

	/**
	 * 获取会员前台权限
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getAuthoritys($uid)
	{
		$list = array();
		$res = FDB::query('SELECT module,action
			FROM '.FDB::table('user_authority').'
			WHERE uid = '.$uid);
		while($data = FDB::fetch($res))
		{
			$list[$data['module']][$data['action']] = 1;
		}
		return $list;
	}

	/**
	 * 获取会员显示名称
	 * @param int $uid 会员编号
	 * @return array
	 */
	public function getUserShowName($uid)
	{
		global $_FANWE;
		$names = array();
		$user = UserService::getUserCache($uid);
		$names['name'] = $user['user_name'];
		if($uid == $_FANWE['uid'])
			$names['short'] = lang('user','me');
		else
		{
			if($user['gender'] == 0)
				$names['short'] = lang('user','ta_0');
			else
				$names['short'] = lang('user','ta_1');
		}
		return $names;
	}

	public function getShareIds($uid)
	{
		$key = 'user/'.getDirsById($uid).'/shares';
		$share_ids = getCache($key);
		if($share_ids === NULL)
		{
			$share_ids = array();
			$res = FDB::query('SELECT share_id FROM '.FDB::table('share').'
				WHERE uid = '.$uid.' AND share_data IN (\'goods\',\'photo\',\'goods_photo\')
				ORDER BY share_id ASC');

			while($data = FDB::fetch($res))
			{
				$share_ids[] = $data['share_id'];
			}
			setCache($key,$share_ids);
		}

		return $share_ids;
	}

	public function setShareIds($uid,$share_id)
	{
		$share_ids = UserService::getShareIds($uid);
		array_push($share_ids,$share_id);
		setCache('user/'.getDirsById($uid).'/shares',$share_ids);
	}

	public function deleteShareIds($uid)
	{
		deleteCache('user/'.getDirsById($uid).'/shares');
	}

    /**
	 * 获取最新加入会员
	 * @return array
	 */
	public function getNewUsers($num)
	{
		$sql = 'SELECT uid,user_name
			FROM '.FDB::table('user').'
			ORDER BY uid DESC LIMIT 0,'.$num;
		return FDB::fetchAll($sql);
	}
	
	/**
	 * 获取会员最新提示信息
	 * @return array
	 */
	public function getUserTips($uid)
	{
		global $_FANWE;
		$res = FDB::query('SELECT * 
			FROM '.FDB::table('user_notice').' 
			WHERE uid = '.$uid);
		while($data = FDB::fetch($res))
		{
			$_FANWE['user_notice'][$data['type']] = $data['num'];
		}
	}
}
?>