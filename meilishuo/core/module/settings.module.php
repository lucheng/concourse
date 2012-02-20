<?php
class SettingsModule
{
	public function personal()
	{
		global $_FANWE;

		include template('page/settings/settings_personal');
		display();
	}

	public function savePersonal()
	{
		global $_FANWE;

		$user = array(
			'gender'           => intval($_FANWE['request']['gender']),
			'reside_province'  => intval($_FANWE['request']['province']),
			'reside_city'      => intval($_FANWE['request']['city']),
			'weibo'            => trim($_FANWE['request']['weibo']),
			'introduce'        => trim($_FANWE['request']['introduce']),
		);

		if(trim($_FANWE['request']['user_name']) != $_FANWE['user']['user_name'])
		{
			$data = array(
				'user_name' => trim($_FANWE['request']['user_name'])
			);

			if($_FANWE['user']['edit_name_count'] == 0)
			{
				$vservice = FS('Validate');
				$validate = array(
					array('user_name','required',lang('user','register_user_name_require')),
					array('user_name','range_length',lang('user','register_user_name_len'),6,20),
					array('user_name','/^[\x{4e00}-\x{9fa5}a-zA-Z][\x{4e00}-\x{9fa5}a-zA-Z0-9_]+$/u',lang('user','register_user_name_error')),
				);

				if($vservice->validation($validate,$data))
				{
					FDB::update('user',$data,'uid = '.$_FANWE['uid']);
					FDB::query('UPDATE '.FDB::table('user_status').' SET edit_name_count = edit_name_count + 1 WHERE uid = '.$_FANWE['uid']);
				}
			}
		}

		FDB::update('user_profile',$user,'uid = '.$_FANWE['uid']);

		fHeader("location: ".FU('settings/personal'));
	}

	public function avatar()
	{
		global $_FANWE;
		include template('page/settings/settings_avatar');
		display();
	}

	public function saveAvatar()
	{
		global $_FANWE;

		$avatar_url = trim($_FANWE['request']['user_avartar']);

		if(!empty($avatar_url) && file_exists(FANWE_ROOT.$avatar_url))
		{
			FS('User')->saveAvatar($_FANWE['uid'],FANWE_ROOT.$avatar_url);
		}

		fHeader("location: ".FU('settings/avatar'));
	}

	public function password()
	{
		global $_FANWE;
        $sync_password = $_FANWE['cookie']['sync_password'];
        if(!empty($sync_password))
        {
            $sync_password = authcode($sync_password, 'DECODE');
            $msg = "感谢你注册".$_FANWE['setting']['site_name']."，你现在的随机密码是 ".$sync_password."，请修改为你常用的密码！";
        }
        include template('page/settings/settings_password');
		display();
	}

	public function savePassword()
	{
		global $_FANWE;
		$data = array(
			'oldpassword'       => $_FANWE['request']['oldpassword'],
			'newpassword'       => $_FANWE['request']['newpassword'],
			'confirm_password'  => $_FANWE['request']['newpasswordagain'],
		);

		$vservice = FS('Validate');
		$validate = array(
			array('oldpassword','required','请输入现在的密码'),
			array('newpassword','range_length','请输入正确的新密码',6,32),
			array('confirm_password','equal','确认密码不一致',$data['newpassword']),
		);

		if(!$vservice->validation($validate,$data))
		{
			$msg = $vservice->getError();
		}
		else
		{
			if(md5($data['oldpassword']) != $_FANWE['user']['password'])
			{
				$msg = '原密码不正确';
			}
			else
			{
				FDB::update('user',array('password'=>md5($data['newpassword'])),'uid = '.$_FANWE['uid']);
				$msg = '修改成功';
                fSetCookie('sync_password','');
				$user = array(
					'uid'=>$_FANWE['uid'],
					'password'=>md5($data['newpassword']),
				);

				FS('User')->setSession($user);
			}
		}

		include template('page/settings/settings_password');
		display();
	}

	public function bind()
	{
		global $_FANWE;
		if(file_exists(FANWE_ROOT."login/api_config.php"))
		{
			$api_config = include FANWE_ROOT."login/api_config.php";
		}
		$bind_module = array();
		if($api_config)
		{
			foreach($api_config as $class_name=>$cfg)
			{
				if(file_exists(FANWE_ROOT."login/".$class_name.".php"))
				{
					require FANWE_ROOT."login/".$class_name.".php";
					if(class_exists($class_name))
					{
						$module = new $class_name;
						$bind_module[] = $module->get_bind_info();
					}
				}
			}
		}

		include template('page/settings/settings_bind');
		display();
	}

	public function setsyn()
	{
		global $_FANWE;
		$uid = intval($GLOBALS['_FANWE']['uid']);
		FDB::query("update ".FDB::table("user")." set ".$_FANWE['request']['cls']."_syn_weibo = '".$_FANWE['request']['syn_weibo']."',".$_FANWE['request']['cls']."_syn_topic = '".$_FANWE['request']['syn_topic']."' where uid = ".$uid);

	}
}
?>