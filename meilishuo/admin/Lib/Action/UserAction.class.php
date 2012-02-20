<?php
// +----------------------------------------------------------------------
// | 方维购物分享网站系统 (Build on ThinkPHP)
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: awfigq <awfigq@qq.com>
// +----------------------------------------------------------------------
/**
 +------------------------------------------------------------------------------
 * 会员
 +------------------------------------------------------------------------------
 */
class UserAction extends CommonAction
{
	public function index()
	{
		$where = '';
		$parameter = array();
		$gid = intval($_REQUEST['gid']);
		$user_name = trim($_REQUEST['user_name']);
		$email = trim($_REQUEST['email']);
		
		if($gid > 0)
		{
			$this->assign("gid",$gid);
			$where.=" AND gid = $gid";
			$parameter['gid'] = $gid;
		}
		
		if(!empty($user_name))
		{
			$this->assign("user_name",$user_name);
			$parameter['user_name'] = $user_name;
			$where .= " AND user_name = '$user_name'";
		}
		
		if(!empty($email))
		{
			$this->assign("email",$email);
			$parameter['email'] = $email;
			$where .= " AND email = '$email'";
		}
		
		$model = D('User');
		
		if(!empty($where))
			$where = 'WHERE 1' . $where;
		
		$sql = 'SELECT COUNT(uid) AS tcount FROM '.C("DB_PREFIX").'user '.$where;
		
		$count = $model->query($sql);
		$count = $count[0]['tcount'];
		
		$sql = 'SELECT * FROM '.C("DB_PREFIX").'user '.$where;
		$this->_sqlList($model,$sql,$count,$parameter);
		
		$group_list = D("UserGroup")->getField('gid,name');
		$this->assign("group_list",$group_list);
		$this->display();
	}
	
	public function add()
	{
		$group_list = D("UserGroup")->getField('gid,name');
		$this->assign("group_list",$group_list);
		
		L(include LANG_PATH . FANWE_LANG_SET . '/UserAuthority.php');
		$authoritys = L('AUTHORITYS');
		
		$this->assign("authoritys",$authoritys);
		
		$province_list = D("Region")->where('parent_id = 0')->getField('id,name');
		$province_id = $vo['reside_province'] > 0 ? $vo['reside_province'] : 1;
		$city_list = D("Region")->where('parent_id = '.$province_id)->getField('id,name');
		$this->assign("province_list",$province_list);
		$this->assign("city_list",$city_list);
		
		$this->display();
	}
	
	public function insert()
	{
		$name=$this->getActionName();
		$model = D ($name);
		if (false === $data = $model->create ()) {
			$this->error ( $model->getError () );
		}
		
		$data['user_name_match'] = segmentToUnicodeA($data['user_name']);
		
		//保存当前数据对象
		$uid=$model->add($data);
		if ($list!==false)
		{
			$user_status = array(
				'uid' => $uid,
				'reg_ip' => getClientIp(),
			);
			D('UserStatus')->add($user_status);
			
			$data = $_REQUEST['up'];
			$data['uid'] = $uid;
			
			D('UserProfile')->add($data);
			
			$access_list = $_REQUEST['access_node'];
			foreach($access_list as $module => $actions)
			{
				foreach($actions as $action)
				{
					$item = array();
					$item['uid'] = $uid;
					$item['module'] = $module;
					$item['action'] = $action;
					D('UserAuthority')->add($item);
				}
			}
			
			$this->saveLog(1,$uid);
			$this->assign ( 'jumpUrl', Cookie::get ( '_currentUrl_' ) );
			$this->success (L('ADD_SUCCESS'));
		}
		else
		{
			//失败提示
			$this->saveLog(0,$uid);
			$this->error (L('ADD_ERROR'));
		}
	}
	
	public function edit()
	{
		$uid = intval($_REQUEST['uid']);
		
		$vo = M()->query('SELECT u.*, uc.*, us.*, up.* 
				FROM '.C("DB_PREFIX").'user u
				LEFT JOIN '.C("DB_PREFIX").'user_count uc USING(uid) 
				LEFT JOIN '.C("DB_PREFIX").'user_status us USING(uid) 
				LEFT JOIN '.C("DB_PREFIX").'user_profile up USING(uid) 
				WHERE u.uid= '.$uid);	
		if(count($vo) > 0)
			$vo = $vo[0];
		
		$this->assign ('vo', $vo );
		
		L(include LANG_PATH . FANWE_LANG_SET . '/UserAuthority.php');
		$authoritys = L('AUTHORITYS');
		$ua_list = array();
		$u_authoritys = D('UserAuthority')->where('uid = '.$uid)->findAll();
		
		foreach($u_authoritys as $ua)
		{
			$ua_list[$ua['module']][$ua['action']] = 1;
		}
		
		$this->assign("authoritys",$authoritys);
		$this->assign("ua_list",$ua_list);
		
		$group_list = D("UserGroup")->getField('gid,name');
		$this->assign("group_list",$group_list);
		
		$province_list = D("Region")->where('parent_id = 0')->getField('id,name');
		$province_id = $vo['reside_province'] > 0 ? $vo['reside_province'] : 1;
		$city_list = D("Region")->where('parent_id = '.$province_id)->getField('id,name');
		$this->assign("province_list",$province_list);
		$this->assign("city_list",$city_list);
		$this->display();
	}
	
	public function update()
	{
		$uid = intval($_REQUEST['uid']);
		$name=$this->getActionName();
		$model = D ( $name );

		if (false === $data = $model->create ()) {
			$this->error ( $model->getError () );
		}
		
		if($_REQUEST['password'] == '')
			unset($data['password']);
		
		// 更新数据
		$list=$model->save($data);
		if (false !== $list)
		{
			if($_REQUEST['delete_avatar'] == 1)
				D('User')->deleteUserAvatar($uid);
			
			D('UserStatus')->where('uid = '.$uid)->save($_REQUEST['us']);
			D('UserProfile')->where('uid = '.$uid)->save($_REQUEST['up']);
			D('UserAuthority')->where('uid = '.$uid)->delete();
			$access_list = $_REQUEST['access_node'];
			foreach($access_list as $module => $actions)
			{
				foreach($actions as $action)
				{
					$item = array();
					$item['uid'] = $uid;
					$item['module'] = $module;
					$item['action'] = $action;
					D('UserAuthority')->add($item);
				}
			}
			
			$this->saveLog(1,$uid);
			$this->assign('jumpUrl', Cookie::get ( '_currentUrl_' ) );
			$this->success (L('EDIT_SUCCESS'));
		}
		else
		{
			//错误提示
			$this->saveLog(0,$uid);
			$this->error (L('EDIT_ERROR'));
		}
	}
	
	public function remove()
	{
		//删除指定记录
		$result = array('isErr'=>0,'content'=>'');
		$id = $_REQUEST['id'];
		if(!empty($id))
		{
			if(D('User')->deleteUser($id))
			{
				$this->saveLog(1,$id);
			}
			else
			{
				$this->saveLog(0,$id);
				$result['isErr'] = 1;
				$result['content'] = L('REMOVE_ERROR');
			}
		}
		else
		{
			$result['isErr'] = 1;
			$result['content'] = L('ACCESS_DENIED');
		}
		
		die(json_encode($result));
	}
	
	public function getUserList()
	{
		$key = trim($_REQUEST['key']);
		
		$where = '';
		if(!empty($key))
			$where = " WHERE user_name = '$key'";
		
		$sql = 'SELECT uid,user_name 
			FROM '.C("DB_PREFIX").'user 
			'.$where.' ORDER BY uid DESC limit 0,30';
		
		$userList = M()->query($sql);
		echo json_encode($userList);
	}
}

function getGroupName($gid)
{
	return D("UserGroup")->where('gid = '.$gid)->getField('name');
}

function getUserAvatar($uid)
{
	$avatar_path = D('User')->getUserAvatarPath($uid);
	$avatar_url = $avatar_path['url'].'_middle.jpg';
	$avatar_path = $avatar_path['path'].'_middle.jpg';
	if(!file_exists($avatar_path))
		$avatar_url = __ROOT__.'/public/upload/avatar/noavatar_middle.jpg';
	return $avatar_url;
}
?>