<?php
// 新浪的api登录接口
class sina{

	private $config;
	public function __construct()
	{
		//为用户表创建sina_id
		$api_config = require FANWE_ROOT."login/api_config.php";
		$this->config = $api_config['sina'];
	}
	public function get_bind_info()
	{
		$data['name'] = "新浪微博";
		$data['class'] = "sina";
		$data['logo'] = APP_ROOT.'/login/sina/bind_sina.png';
		$uid = intval($GLOBALS['_FANWE']['uid']);
		if(FDB::resultFirst("select sina_id from ".FDB::table("user")." where uid = ".$uid)!='')
		$data['is_bind'] = 1;
		else
		$data['is_bind'] = 0;
		$data['bind_url'] = APP_ROOT."/login.php?bind=sina";
		$data['unbind_url'] = APP_ROOT."/login.php?unbind=sina";
		$data['is_syn'] = $this->config['is_syn'];
		$syn_config = FDB::fetchFirst("select sina_syn_weibo,sina_syn_topic from ".FDB::table("user")." where uid = ".$uid);
		$data['syn_weibo'] = $syn_config['sina_syn_weibo'];
		$data['syn_topic'] = $syn_config['sina_syn_topic'];
		return $data;
	}

	public function get_url()
	{
		global $_FANWE;
		return $_FANWE['site_root']."login.php?mod=sina";
	}

	public function get_api_url()
	{
		@session_start();
		$url = APP_ROOT."/login.php?mod=sina";
		$str = "<a href='".$url."' title='新浪登录'><img src='".APP_ROOT."/login/sina/login_sina.png' alt='新浪登录' /></a>&nbsp;";
		return $str;
	}

	public function jump()
	{
		require_once FANWE_ROOT.'login/sina/weibooauth.php';
		$o = new WeiboOAuth($this->config['app_key'],$this->config['app_secret']);
		@session_start();
		$keys = $o->getRequestToken();
		$aurl = $o->getAuthorizeURL($keys['oauth_token'] ,false , get_domain().APP_ROOT."/login.php?rel=sina");
		$_SESSION['sina_keys'] = $keys;

		fHeader("location:".$aurl);
	}

	public function bindjump()
	{
		require_once FANWE_ROOT.'login/sina/weibooauth.php';
		$o = new WeiboOAuth($this->config['app_key'],$this->config['app_secret']);
		@session_start();
		$keys = $o->getRequestToken();
		$aurl = $o->getAuthorizeURL($keys['oauth_token'] ,false , get_domain().APP_ROOT."/login.php?bindrel=sina");
		$_SESSION['sina_keys'] = $keys;

		fHeader("location:".$aurl);
	}

	public function bindcallback()
	{

		require_once FANWE_ROOT.'login/sina/weibooauth.php';
		@session_start();

		$o = new WeiboOAuth($this->config['app_key'],$this->config['app_secret'], $_SESSION['sina_keys']['oauth_token'] , $_SESSION['sina_keys']['oauth_token_secret']);
		$last_key = $o->getAccessToken($_REQUEST['oauth_verifier']) ;
		$u_id = $last_key['user_id'];
		$uid = intval($GLOBALS['_FANWE']['uid']);


		$c = new WeiboClient($this->config['app_key'],
					 $this->config['app_secret'],
                      $last_key['oauth_token'] ,
                      $last_key['oauth_token_secret']  );


		$msg = $c->show_user($u_id);
		if ($msg === false || $msg === null){
			echo "Error occured";
			return false;
		}
		if (isset($msg['error_code']) && isset($msg['error'])){
			echo ('Error_code: '.$msg['error_code'].';  Error: '.$msg['error'] );
			return false;
		}


		FDB::query("update ".FDB::table("user")." set sina_app_key = '".$last_key['oauth_token']."',sina_app_secret = '".$last_key['oauth_token_secret']."',sina_id='".$msg['id']."' where uid = ".$uid);
		fHeader("location: ".FU('settings/bind'));

	}

	public function unbind()
	{
		$uid = intval($GLOBALS['_FANWE']['uid']);
		FDB::query("update ".FDB::table("user")." set sina_id='',sina_app_key='',sina_app_secret='' where uid = ".$uid);
		fHeader("location: ".FU('settings/bind'));
	}

	public function callback()
	{

		require_once FANWE_ROOT.'login/sina/weibooauth.php';
		@session_start();

		$o = new WeiboOAuth($this->config['app_key'],$this->config['app_secret'], $_SESSION['sina_keys']['oauth_token'] , $_SESSION['sina_keys']['oauth_token_secret']);
		$last_key = $o->getAccessToken($_REQUEST['oauth_verifier']) ;
		$u_id = $last_key['user_id'];


		$c = new WeiboClient($this->config['app_key'],
					 $this->config['app_secret'],
                      $last_key['oauth_token'] ,
                      $last_key['oauth_token_secret']  );


		$msg = $c->show_user($u_id);
		if ($msg === false || $msg === null){
			echo "Error occured";
			return false;
		}
		if (isset($msg['error_code']) && isset($msg['error'])){
			echo ('Error_code: '.$msg['error_code'].';  Error: '.$msg['error'] );
			return false;
		}
		//print_r($msg);exit;


		$sql = 'SELECT uid,password FROM '.FDB::table('user')." WHERE sina_id = '".intval($msg['id'])."'";
		$user = FDB::fetchFirst($sql);
		if(!empty($user) && $user['uid'] > 0)
		{
			$user = array(
                'uid'=>$user['uid'],
                'password'=>$user['password'],
            );
			FDB::query("update ".FDB::table("user")." set sina_app_key = '".$last_key['oauth_token']."',sina_app_secret = '".$last_key['oauth_token_secret']."',sina_id='".$msg['id']."' where uid = ".$user['uid']);
			FS('User')->setSession($user,1209600);
			fHeader("location: ".FU('index'));
		}
		else
		{
            $password = random(6,1);
			//开始自动注册会员
			$data = array(
				'user_name'        => "tsina_".$msg['name'],
                'password'        => md5($password),
				'sina_id'           => intval($msg['id']),
				'sina_app_key' 		=>	$last_key['oauth_token'],
				'sina_app_secret'	=>	$last_key['oauth_token_secret'],
				'user_name_match'=>segmentToUnicode("tsina_".$msg['name']),
				'status'    => 1,
                'gid' => 7,
				'reg_time' => TIME_UTC,
			);

			$uid = FDB::insert('user',$data,true);
			if($uid > 0)
			{
				unset($data);
				FDB::insert('user_count',array('uid' => $uid));

				$gender = $msg['gender']=='m'?1:0;
				$reside_province = FDB::resultFirst("select id from ".FDB::table("region")." where parent_id = 0 and locate(`name`,'".$msg['location']."')>0");
				$reside_city = FDB::resultFirst("select id from ".FDB::table("region")." where parent_id > 0 and locate(`name`,'".$msg['location']."')>0");

				$user_profile = array(
					'uid' => $uid,
					'gender' => $gender,
					'nick_name'	=> $msg['screen_name'],
					'reside_province'	=>	$reside_province,
					'reside_city'	=>	$reside_city
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
	//同步发表到新浪微博
	public function sendMessage($data)
	{
		require_once FANWE_ROOT.'login/sina/weibooauth.php';
		$uid = intval($GLOBALS['_FANWE']['uid']);
		$udata = FDB::fetchFirst("select sina_app_key,sina_app_secret from ".FDB::table("user")." where uid = ".$uid);
		$c = new WeiboClient($this->config['app_key'],$this->config['app_secret'],$udata['sina_app_key'],$udata['sina_app_secret']);
		$msg = $c->update($data['share']['content']);
		return $msg;
	}
}
?>