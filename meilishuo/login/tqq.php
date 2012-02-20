<?php
// 腾讯微博的api登录接口
class tqq{

	private $config;
	public function __construct()
	{
		//为用户表创建qq_id
		$api_config = require FANWE_ROOT."login/api_config.php";
		$this->config = $api_config['tqq'];

	}
	public function get_bind_info()
	{
		$data['name'] = "腾讯微博";
		$data['class'] = "tqq";
		$data['logo'] = APP_ROOT.'/login/tqq/bind_tqq.png';
		$uid = intval($GLOBALS['_FANWE']['uid']);
		if(FDB::resultFirst("select tqq_id from ".FDB::table("user")." where uid = ".$uid)!='')
		$data['is_bind'] = 1;
		else
		$data['is_bind'] = 0;
		$data['bind_url'] = APP_ROOT."/login.php?bind=tqq";
		$data['unbind_url'] = APP_ROOT."/login.php?unbind=tqq";
		$data['is_syn'] = $this->config['is_syn'];
		$syn_config = FDB::fetchFirst("select tqq_syn_weibo,tqq_syn_topic from ".FDB::table("user")." where uid = ".$uid);
		$data['syn_weibo'] = $syn_config['tqq_syn_weibo'];
		$data['syn_topic'] = $syn_config['tqq_syn_topic'];
		return $data;
	}

	public function get_url()
	{
        global $_FANWE;
		return $_FANWE['site_root']."login.php?mod=tqq";
	}

	public function get_api_url()
	{
		@session_start();
		$url = APP_ROOT."/login.php?mod=tqq";
		$str = "<a href='".$url."' title='腾讯微博登录'><img src='".APP_ROOT."/login/tqq/login_tqq.png' alt='腾讯微博登录' /></a>&nbsp;";
		return $str;
	}

	public function jump()
	{
		@session_start();
		require_once FANWE_ROOT.'login/tqq/opent.php';
		define( "MB_RETURN_FORMAT" , 'json' );
		define( "MB_API_HOST" , 'open.t.qq.com' );

		$o = new MBOpenTOAuth( $this->config['app_key'],$this->config['app_secret'] );
		$keys = $o->getRequestToken(get_domain().APP_ROOT."/login.php?rel=tqq");//这里填上你的回调URL
		$aurl = $o->getAuthorizeURL( $keys['oauth_token'] ,false,'');
		$_SESSION['keys'] = $keys;
		fHeader("location:".$aurl);
	}

	public function bindjump()
	{
		@session_start();
		require_once FANWE_ROOT.'login/tqq/opent.php';
		define( "MB_RETURN_FORMAT" , 'json' );
		define( "MB_API_HOST" , 'open.t.qq.com' );

		$o = new MBOpenTOAuth( $this->config['app_key'],$this->config['app_secret'] );
		$keys = $o->getRequestToken(get_domain().APP_ROOT."/login.php?bindrel=tqq");//这里填上你的回调URL
		$aurl = $o->getAuthorizeURL( $keys['oauth_token'] ,false,'');
		$_SESSION['keys'] = $keys;
		fHeader("location:".$aurl);
	}


	public function bindcallback()
	{

		@session_start();
		require_once FANWE_ROOT.'login/tqq/opent.php';
		define( "MB_RETURN_FORMAT" , 'json' );
		define( "MB_API_HOST" , 'open.t.qq.com' );

		$o = new MBOpenTOAuth( $this->config['app_key'],$this->config['app_secret'] , $_SESSION['keys']['oauth_token'] , $_SESSION['keys']['oauth_token_secret']  );
		$last_key = $o->getAccessToken(  $_REQUEST['oauth_verifier'] ) ;//获取ACCESSTOKEN
		$tencent_id = $last_key['name'];

		$msg['id'] = $tencent_id;
		$uid = intval($GLOBALS['_FANWE']['uid']);

		FDB::query("update ".FDB::table("user")." set tqq_app_key = '".$last_key['oauth_token']."',tqq_app_secret = '".$last_key['oauth_token_secret']."',tqq_id='".$tencent_id."' where uid = ".$uid);

		fHeader("location: ".FU('settings/bind'));

	}

	public function unbind()
	{
		$uid = intval($GLOBALS['_FANWE']['uid']);
		FDB::query("update ".FDB::table("user")." set tqq_id='',tqq_app_key='',tqq_app_secret='' where uid = ".$uid);
		fHeader("location: ".FU('settings/bind'));
	}


	public function callback()
	{

		@session_start();
		require_once FANWE_ROOT.'login/tqq/opent.php';
		define( "MB_RETURN_FORMAT" , 'json' );
		define( "MB_API_HOST" , 'open.t.qq.com' );

		$o = new MBOpenTOAuth( $this->config['app_key'],$this->config['app_secret'] , $_SESSION['keys']['oauth_token'] , $_SESSION['keys']['oauth_token_secret']  );
		$last_key = $o->getAccessToken(  $_REQUEST['oauth_verifier'] ) ;//获取ACCESSTOKEN
		$tencent_id = $last_key['name'];


		$msg['id'] = $tencent_id;
		$msg['name'] = $tencent_id;





		$sql = 'SELECT uid,password FROM '.FDB::table('user')." WHERE tqq_id = '".$msg['id']."'";
		$user = FDB::fetchFirst($sql);
		if(!empty($user) && $user['uid'] > 0)
		{
			$user = array(
                'uid'=>$user['uid'],
                'password'=>$user['password'],
            );
			FS('User')->setSession($user,1209600);
			FDB::query("update ".FDB::table("user")." set tqq_app_key = '".$last_key['oauth_token']."',tqq_app_secret = '".$last_key['oauth_token_secret']."',tqq_id='".$tencent_id."' where uid = ".$user['uid']);

			fHeader("location: ".FU('index'));
		}
		else
		{
            $password = random(6,1);
			$user_name = $msg['name'];
			//开始自动注册会员
			$data = array(
				'user_name'        => $user_name,
                'password'        => md5($password),
				'tqq_id'           => $msg['id'],
				'tqq_app_key'	=>	$last_key['oauth_token'],
				'tqq_app_secret'	=>	$last_key['oauth_token_secret'],
				'user_name_match'=>segmentToUnicode($user_name),
				'status'    => 1,
                'gid' => 7,
				'reg_time' => TIME_UTC,
			);

			$uid = FDB::insert('user',$data,true);
			if($uid > 0)
			{
				unset($data);
				FDB::insert('user_count',array('uid' => $uid));
				$user_profile = array(
					'uid' => $uid,
					'nick_name'	=> $msg['name'],

				);
				FDB::insert('user_profile',$user_profile);
				unset($user_profile);

				$user_status = array(
					'uid' => $uid,
					'reg_ip' => $GLOBALS['_FANWE']['client_ip'],
					'last_ip' => $GLOBALS['_FANWE']['client_ip'],
					'last_time' => TIME_UTC,
					'last_activity' => TIME_UTC,
				);
				FDB::insert('user_status',$user_status);

				$user = array(
                    'uid'=>$uid,
                    'password'=>md5($password),
                );

                fSetCookie('sync_password', authcode($password, 'ENCODE'),1209600);

                FS('User')->setSession($user,1209600);
                fHeader("location: ".FU('settings/password'));
			}

		}

	}

	public function sendMessage($data)
	{

		define( "MB_RETURN_FORMAT" , 'json' );
		define( "MB_API_HOST" , 'open.t.qq.com' );


		$res = require_once FANWE_ROOT.'login/tqq/api_client.php';

		$uid = intval($GLOBALS['_FANWE']['uid']);
		$udata = FDB::fetchFirst("select tqq_app_key,tqq_app_secret from ".FDB::table("user")." where uid = ".$uid);

		$c = new MBApiClient( $this->config['app_key'],$this->config['app_secret'],$udata['tqq_app_key'],$udata['tqq_app_secret']);
		$p['c'] = $data['share']['content'];
		$p['type']	=1;
		try {
			$msg = $c->postOne($p);
			return $msg;
		} catch (Exception $e) {

		}
	}
}
?>