<?php
// QQ的api登录接口
class qq{

	private $config;

	public function __construct()
	{
		//为用户表创建qq_id
		$api_config = require FANWE_ROOT."login/api_config.php";
		$this->config = $api_config['qq'];
	}

	public function get_bind_info()
	{
		$data['name'] = "QQ登录";
		$data['logo'] = APP_ROOT.'/login/qq/bind_qq.png';
		$uid = intval($GLOBALS['_FANWE']['uid']);
		if(FDB::resultFirst("select qq_id from ".FDB::table("user")." where uid = ".$uid)!='')
		$data['is_bind'] = 1;
		else
		$data['is_bind'] = 0;
		$data['bind_url'] = APP_ROOT."/login.php?bind=qq";
		$data['unbind_url'] = APP_ROOT."/login.php?unbind=qq";

		return $data;
	}

	public function get_url()
	{
		global $_FANWE;
		return $_FANWE['site_root']."login.php?mod=qq";
	}

	public function get_api_url()
	{
		@session_start();
		$url = APP_ROOT."/login.php?mod=qq";
		$str = "<a href='".$url."' title='QQ登录'><img src='".APP_ROOT."/login/qq/login_qq.png' alt='QQ登录' /></a>&nbsp;";
		return $str;
	}

	public function jump()
	{
		@session_start();
		$callback = get_domain().APP_ROOT."/login.php?rel=qq";
		$url = get_domain().APP_ROOT."/login/qq/redirect_to_login.php?appid=".$this->config['app_key']."&appkey=".$this->config['app_secret']."&callback=".urlencode($callback);
		fHeader("location:".$url);
	}

	public function bindjump()
	{
		@session_start();
		$callback = get_domain().APP_ROOT."/login.php?bindrel=qq";
		$url = get_domain().APP_ROOT."/login/qq/redirect_to_login.php?appid=".$this->config['app_key']."&appkey=".$this->config['app_secret']."&callback=".urlencode($callback);
		fHeader("location:".$url);
	}

	public function bindcallback()
	{

		@session_start();
		require_once FANWE_ROOT.'login/qq/get_access_token.php';

		//申请到的appid
		$_SESSION["appid"]    =  $this->config['app_key'];

		//申请到的appkey
		$_SESSION["appkey"]   = $this->config['app_secret'];

		/**
		 * Tips：
		 * QQ互联登录，授权成功后会回调注册的callback地址
		 * 必须要用授权的request token换取access token
		 * 访问QQ互联的任何资源都需要access token
		 * 目前access token是长期有效的，除非用户解除与第三方绑定
		 * 如果第三方发现access token失效，请引导用户重新登录QQ互联，授权，获取access token
		 */


		//用户使用QQ登录，并授权成功后，会返回用户的openid。此时需要检查返回的openid是否是合法id
		//我们不建议开发者使用该openid，而是使用获取access token之后返回的openid。
		if (!is_valid_openid($_REQUEST["openid"], $_REQUEST["timestamp"], $_REQUEST["oauth_signature"]))
		{
		    //demo对错误简单处理
		    echo "###invalid openid\n";
		    echo "sig:".$_REQUEST["oauth_signature"]."\n";
		    exit;
		}

		//Tips
		//这里已经获取到了openid，可以处理第三方账户与openid的绑定逻辑。
		//但是我们建议第三方等到获取access token之后在做绑定逻辑

		//用授权的request token换取access token
		$access_str = get_access_token($_SESSION["appid"], $_SESSION["appkey"], $_REQUEST["oauth_token"], $_SESSION["secret"], $_REQUEST["oauth_vericode"]);
		//echo "access_str:$access_str\n";
		$result = array();
		parse_str($access_str, $result);

		//print_r($result);

		//错误处理
		if (isset($result["error_code"]))
		{
		    echo "get access token error<br>";
		    echo "error msg: $request_token<br>";
		    echo "点击<a href=\"http://wiki.opensns.qq.com/wiki/%E3%80%90QQ%E7%99%BB%E5%BD%95%E3%80%91%E5%85%AC%E5%85%B1%E8%BF%94%E5%9B%9E%E7%A0%81%E8%AF%B4%E6%98%8E\" target=_blank>查看错误码</a>";
		    exit;
		}


		//将access token，openid保存起来！！！
		//在demo演示中，直接保存在全局变量中.
		//正式网站运营环境中，我们强烈建议你将这两个值保存在MySQL或者其他永久的存储中以便于后续使用
		//尤其是在网站不止一台服务器的情况下，两次请求的sessoin信息可能不会保存再同一台服务器导致访问出错
		$_SESSION["token"]   = $result["oauth_token"];
		$_SESSION["secret"]  = $result["oauth_token_secret"];
		$_SESSION["openid"]  = $result["openid"];


		$arr = get_qquser_info($_SESSION["appid"], $_SESSION["appkey"], $_SESSION["token"], $_SESSION["secret"], $_SESSION["openid"]);


		$msg['id'] = $result["openid"];
		$msg['name'] = $arr["nickname"];
		$uid = intval($GLOBALS['_FANWE']['uid']);

		FDB::query("update ".FDB::table("user")." set qq_id='".$msg['id']."' where uid = ".$uid);
		fHeader("location: ".FU('settings/bind'));

	}

	public function unbind()
	{
		$uid = intval($GLOBALS['_FANWE']['uid']);
		FDB::query("update ".FDB::table("user")." set qq_id='' where uid = ".$uid);
		fHeader("location: ".FU('settings/bind'));
	}

	public function callback()
	{

		@session_start();
		require FANWE_ROOT.'login/qq/get_access_token.php';

		//申请到的appid
		$_SESSION["appid"]    =  $this->config['app_key'];

		//申请到的appkey
		$_SESSION["appkey"]   = $this->config['app_secret'];

		/**
		 * Tips：
		 * QQ互联登录，授权成功后会回调注册的callback地址
		 * 必须要用授权的request token换取access token
		 * 访问QQ互联的任何资源都需要access token
		 * 目前access token是长期有效的，除非用户解除与第三方绑定
		 * 如果第三方发现access token失效，请引导用户重新登录QQ互联，授权，获取access token
		 */


		//用户使用QQ登录，并授权成功后，会返回用户的openid。此时需要检查返回的openid是否是合法id
		//我们不建议开发者使用该openid，而是使用获取access token之后返回的openid。
		if (!is_valid_openid($_REQUEST["openid"], $_REQUEST["timestamp"], $_REQUEST["oauth_signature"]))
		{
		    //demo对错误简单处理
		    echo "###invalid openid\n";
		    echo "sig:".$_REQUEST["oauth_signature"]."\n";
		    exit;
		}

		//Tips
		//这里已经获取到了openid，可以处理第三方账户与openid的绑定逻辑。
		//但是我们建议第三方等到获取access token之后在做绑定逻辑

		//用授权的request token换取access token
		$access_str = get_access_token($_SESSION["appid"], $_SESSION["appkey"], $_REQUEST["oauth_token"], $_SESSION["secret"], $_REQUEST["oauth_vericode"]);
		//echo "access_str:$access_str\n";
		$result = array();
		parse_str($access_str, $result);

		//print_r($result);

		//错误处理
		if (isset($result["error_code"]))
		{
		    echo "get access token error<br>";
		    echo "error msg: $request_token<br>";
		    echo "点击<a href=\"http://wiki.opensns.qq.com/wiki/%E3%80%90QQ%E7%99%BB%E5%BD%95%E3%80%91%E5%85%AC%E5%85%B1%E8%BF%94%E5%9B%9E%E7%A0%81%E8%AF%B4%E6%98%8E\" target=_blank>查看错误码</a>";
		    exit;
		}


		//将access token，openid保存起来！！！
		//在demo演示中，直接保存在全局变量中.
		//正式网站运营环境中，我们强烈建议你将这两个值保存在MySQL或者其他永久的存储中以便于后续使用
		//尤其是在网站不止一台服务器的情况下，两次请求的sessoin信息可能不会保存再同一台服务器导致访问出错
		$_SESSION["token"]   = $result["oauth_token"];
		$_SESSION["secret"]  = $result["oauth_token_secret"];
		$_SESSION["openid"]  = $result["openid"];


		$arr = get_qquser_info($_SESSION["appid"], $_SESSION["appkey"], $_SESSION["token"], $_SESSION["secret"], $_SESSION["openid"]);


		$msg['id'] = $result["openid"];
		$msg['name'] = $arr["nickname"];


		$sql = 'SELECT uid,password FROM '.FDB::table('user')." WHERE qq_id = '".$msg['id']."'";
		$user = FDB::fetchFirst($sql);
		if(!empty($user) && $user['uid'] > 0)
		{
			$user = array(
                'uid'=>$user['uid'],
                'password'=>$user['password'],
            );
            FS('User')->setSession($user,1209600);
            fHeader("location: ".FU('index'));
		}
		else
		{
            $password = random(6,1);
			$max_count = FDB::resultFirst("select count(*) from ".FDB::table("user")." where user_name like 'qq_".$msg['name']."%' and qq_id <> ''");
			$user_name = "qq_".$msg['name']."_".($max_count+rand(10,99));
			//开始自动注册会员
			$data = array(
				'user_name'        => $user_name,
                'password'        => md5($password),
				'qq_id'           => $msg['id'],
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
}
?>