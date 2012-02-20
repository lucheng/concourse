<?php
class UserModule
{
	public function login()
	{
		global $_FANWE;

		if($_FANWE['uid'] > 0)
			fHeader("location: ".FU('u/index'));

		$cache_file = getTplCache('page/user/user_login');
		if(!@include($cache_file))
		{
			if(file_exists(FANWE_ROOT."login/api_config.php"))
			{
				$api_config = include FANWE_ROOT."login/api_config.php";
			}
			include template('page/user/user_login');
		}

		display($cache_file);
	}

	/**
	 * AJAX登陆
	 *
	 */
	public function ajaxLogin()
	{
		global $_FANWE;
		$user_name_or_email = addslashes($_FANWE['request']['email_name']);
		$password = md5(trim($_FANWE['request']['pass']));
		$life = isset($_FANWE['request']['remember']) ? intval($_FANWE['request']['remember']) : 0;
		$rhash = $_FANWE['request']['rhash'];

		if(empty($rhash) || $rhash != FORM_HASH)
			exit('Access Denied');

		$return = array();
		$sql = 'SELECT uid FROM '.FDB::table('user')." WHERE (email = '$user_name_or_email' OR user_name = '$user_name_or_email') AND password = '$password'";
		$uid = intval(FDB::resultFirst($sql));
		if ($uid > 0)
		{
			$user = array(
				'uid'=>$uid,
				'password'=>$password,
			);

			FS('User')->setSession($user,$life);
			$return['status'] = 1;
			$return['uid'] = $uid;
		}
		else
		{
			$return['status'] = 0;
		}

		outputJson($return);
	}

	public function register()
	{
		global $_FANWE;

		if($_FANWE['uid'] > 0)
			fHeader("location: ".FU('u/index'));

		$cache_file = getTplCache('page/user/user_register');
		if(!@include($cache_file))
		{
			if(file_exists(FANWE_ROOT."login/api_config.php"))
			{
				$api_config = include FANWE_ROOT."login/api_config.php";
				foreach($api_config as $ac_key => $api)
				{
					if(file_exists(FANWE_ROOT."login/".$ac_key.".php"))
					{
						require FANWE_ROOT."login/".$ac_key.".php";
						if(class_exists($ac_key))
						{
							$module = new $ac_key;
							$api_config[$ac_key]['url'] = $module->get_url();
						}
					}
				}
			}
			include template('page/user/user_register');
		}

		display($cache_file);
	}

	public function ajaxRegister()
	{
		global $_FANWE;

		$rhash = $_FANWE['request']['rhash'];
		$agreement = isset($_FANWE['request']['agreement']) ? intval($_FANWE['request']['agreement']) : 0;

		if($agreement == 0)
			exit('Access Denied');

		/*$verify = fAddslashes(explode("\t", authcode($_FANWE['cookie']['verify'.$rhash], 'DECODE',$_FANWE['config']['security']['authkey'])));
		if(empty($rhash) || empty($verify) || $verify[2] != $rhash || $verify[3] != $form_hash)
			exit('Access Denied'.$form_hash.';'.$verify);*/

		if(empty($rhash) || $rhash != FORM_HASH)
			exit('Access Denied');

		$result = array();

		$data = array(
			'email'            => $_FANWE['request']['email'],
			'user_name'        => $_FANWE['request']['user_name'],
			'password'         => $_FANWE['request']['password'],
			'confirm_password' => $_FANWE['request']['confirm_password'],
			'gender'           => intval($_FANWE['request']['gender']),
		);

		$vservice = FS('Validate');
		$validate = array(
			array('email','required',lang('user','register_email_require')),
			array('email','email',lang('user','register_email_error')),
			array('user_name','required',lang('user','register_user_name_require')),
			array('user_name','range_length',lang('user','register_user_name_len'),6,20),
			array('user_name','/^[\x{4e00}-\x{9fa5}a-zA-Z][\x{4e00}-\x{9fa5}a-zA-Z0-9_]+$/u',lang('user','register_user_name_error')),
			array('password','range_length',lang('user','register_password_range'),6,20),
			array('confirm_password','equal',lang('user','confirm_password_error'),$data['password']),
		);

		if(!$vservice->validation($validate,$data))
		{
			$result['status'] = 0;
			$result['msg'] = $vservice->getError();
			outputJson($result);
		}

		$uservice = FS('User');
		if($uservice->getEmailExists($data['email']))
		{
			$result['status'] = 0;
			$result['msg']	= lang('user','register_email_exist');
			outputJson($result);
		}

		if($uservice->getUserNameExists($data['user_name']))
		{
			$result['status'] = 0;
			$result['msg']	= lang('user','register_user_name_exist');
			outputJson($result);
		}

		$user = array(
			'email' => $data['email'],
			'user_name' => $data['user_name'],
			'user_name_match'=>segmentToUnicode($data['user_name']),
			'password'  => md5($data['password']),
			'status'    => 1,
			'email_status' => 0,
			'avatar_status' => 0,
			'gid' => 7,
			'reg_time' => TIME_UTC,
		);

		$uid = FDB::insert('user',$user,true);
		if($uid > 0)
		{
			unset($user);
			FDB::insert('user_count',array('uid' => $uid));

			$user_profile = array(
				'uid' => $uid,
				'gender' => $data['gender'],
			);
			FDB::insert('user_profile',$user_profile);
			unset($user_profile);

			$user_status = array(
				'uid' => $uid,
				'reg_ip' => $_FANWE['client_ip'],
				'last_ip' => $_FANWE['client_ip'],
				'last_time' => TIME_UTC,
				'last_activity' => TIME_UTC,
			);
			FDB::insert('user_status',$user_status);

			$user = array(
				'uid'=>$uid,
				'password'=>md5($data['password']),
			);

			FS('User')->setSession($user);

			$result['status'] = 1;
			outputJson($result);
		}
		else
		{
			$result['status'] = 0;
			$result['msg']	= lang('user','register_error');
			outputJson($result);
		}
	}

	function forgetPassword()
	{
		global $_FANWE;
		$method = strtolower($_SERVER["REQUEST_METHOD"]);
		if($method == 'post')
		{
			$data = array(
				'email'            => $_FANWE['request']['email'],
				'user_name'        => $_FANWE['request']['user_name']
			);

			$data_error = false;
			$send_error = true;

			$vservice = FS('Validate');
			$validate = array(
				array('email','required',lang('user','register_email_require')),
				array('email','email',lang('user','register_email_error')),
				array('user_name','required',lang('user','register_user_name_require')),
				array('user_name','range_length',lang('user','register_user_name_len'),6,20),
				array('user_name','/^[\x{4e00}-\x{9fa5}a-zA-Z][\x{4e00}-\x{9fa5}a-zA-Z0-9_]+$/u',lang('user','register_user_name_error'))
			);

			if(!$vservice->validation($validate,$data))
				$data_error = true;
			else
			{
				$uid = FDB::resultFirst('SELECT uid
					FROM '.FDB::table('user').'
					WHERE user_name = \''.$data['user_name'].'\' AND email = \''.$data['email'].'\'');

				$uid = intval($uid);
				if($uid == 0)
					$data_error = true;
				else
				{
					$reset_hash = md5(microtime(true).random(8));
					FDB::query('UPDATE '.FDB::table('user_status').'
						SET reset_hash = \''.$reset_hash.'\'
						WHERE uid = '.$uid);

					$site_name = $_FANWE['setting']['site_name'];
					$reset_url = $_FANWE['site_url'].'user.php?action=resetpassword&resethash='.$reset_hash;
					$title = sprintf(lang('user','get_pwd_title'),$site_name);
					$content = sprintf(lang('user','get_pwd_html'),$site_name,$reset_url,$reset_url,$site_name,$_FANWE['site_url'],$site_name);
					include fimport("class/mail");
					$mail = new Mail();
					if($mail->send($data['user_name'],$data['email'],$title,$content,1))
						$send_error = false;
				}
			}
		}

		include template('page/user/user_getpwd');
		display();
	}

	public function resetPassword()
	{
		global $_FANWE;
		$hash = $_FANWE['request']['resethash'];
		if(empty($hash))
			fHeader("location: ".FU('user/login'));

		$uid = FDB::resultFirst('SELECT uid
			FROM '.FDB::table('user_status').'
			WHERE reset_hash = \''.$hash.'\'');
		$uid = intval($uid);
		if($uid == 0)
			fHeader("location: ".FU('user/login'));

		$method = strtolower($_SERVER["REQUEST_METHOD"]);
		if($method == 'post')
		{
			$data_error = false;

			$data = array(
				'password'         => $_FANWE['request']['password'],
				'confirm_password' => $_FANWE['request']['confirm_password']
			);

			$vservice = FS('Validate');
			$validate = array(
				array('password','range_length',lang('user','register_password_range'),6,20),
				array('confirm_password','equal',lang('user','confirm_password_error'),$data['password']),
			);

			if(!$vservice->validation($validate,$data))
				$data_error = true;
			else
			{
				FDB::query('UPDATE '.FDB::table('user').'
					SET password = \''.md5($data['password']).'\'
					WHERE uid = '.$uid);

				FDB::query('UPDATE '.FDB::table('user_status').'
					SET reset_hash = \'\'
					WHERE uid = '.$uid);
			}
		}
		include template('page/user/user_resetpwd');
		display();
	}

	public function logout()
	{
		global $_FANWE;
		$_FANWE['nav_title'] = lang('common','user_logout');
		FS('User')->clearSession();
		fHeader("location: ".FU('index/index'));
	}

	public function interest()
	{
		global $_FANWE;
		FanweService::instance()->cache->loadCache('usertagcate');
		include template('page/user/user_interest');
		display();
	}

}
?>