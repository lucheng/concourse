<?php
// 淘宝登录接口
include_once FANWE_ROOT.'core/class/sharegoods/taobao/TopClient.php';
include_once FANWE_ROOT.'core/class/sharegoods/taobao/request/UserGetRequest.php';
include_once FANWE_ROOT.'core/class/sharegoods/taobao/request/ItemGetRequest.php';

class taobao{

	private $config;

	public function __construct()
	{
		$api_config = require FANWE_ROOT."login/api_config.php";
		$this->config = $api_config['taobao'];
	}

	public function get_bind_info()
	{
		$data['name'] = "淘宝登录";
		$data['logo'] = APP_ROOT.'/login/taobao/bind_taobao.png';
		$uid = intval($GLOBALS['_FANWE']['uid']);
		if(FDB::resultFirst("select taobao_id from ".FDB::table("user")." where uid = ".$uid)!='')
		$data['is_bind'] = 1;
		else
		$data['is_bind'] = 0;
		$data['bind_url'] = APP_ROOT."/login.php?bind=taobao";
		$data['unbind_url'] = APP_ROOT."/login.php?unbind=taobao";

		return $data;
	}

	public function get_url()
	{
		global $_FANWE;
		return $_FANWE['site_root']."login.php?mod=taobao";
	}

	public function get_api_url()
	{
		@session_start();
		$url = APP_ROOT."/login.php?mod=taobao";
		$str = "<a href='".$url."' title='淘宝登录'><img src='".APP_ROOT."/login/taobao/login_taobao.png' alt='淘宝登录' /></a>&nbsp;";
		return $str;
	}

	public function jump()
	{
		@session_start();
		require_once FANWE_ROOT."login/taobao/taobao_service.class.php";
		$taobao_config['app_key']		= $this->config['app_key'];
		$taobao_config['app_secret']	=  $this->config['app_secret'];
		$taobao_config['return_url']	= get_domain().APP_ROOT."/login.php?rel=taobao";
		$taobao_config['sign_type']		= 'MD5';
		$taobao_config['encode'] = 'utf-8';
		$taobao_config['transport']		= 'http';
		$taobao_config['login_url']		= 'http://container.open.taobao.com/container';
		$taobao_config['service_url']	= 'http://gw.api.taobao.com/router/rest';
		
		//构造快捷登录接口
		$taobaoService = new TaobaoService($taobao_config);
		$html_text = $taobaoService->taobao_auth_authorize();
		echo $html_text;
	}

	public function bindjump()
	{
		@session_start();
		require_once FANWE_ROOT."login/taobao/taobao_service.class.php";
		$taobao_config['partner']		= $this->config['app_key'];
		$taobao_config['key']			=  $this->config['app_secret'];
		$taobao_config['return_url']   = get_domain().APP_ROOT."/login.php?bindrel=taobao";
		$taobao_config['sign_type']    = 'MD5';
		$taobao_config['input_charset']      = 'utf-8';
		$taobao_config['transport']    = 'http';
		$anti_phishing_key  = '';
		$exter_invoke_ip = '';

		$parameter = array(
		        //扩展功能参数——防钓鱼
		        "anti_phishing_key"	=> $anti_phishing_key,
				"exter_invoke_ip"	=> $exter_invoke_ip,
		);

		//构造快捷登录接口
		$taobaoService = new TaobaoService($taobao_config);
		$html_text = $taobaoService->taobao_auth_authorize($parameter);
		echo $html_text;
	}

	public function bindcallback()
	{

		@session_start();
		$taobao_config['partner']		= $this->config['app_key'];
		$taobao_config['key']			=  $this->config['app_secret'];
		$taobao_config['return_url']   = get_domain().APP_ROOT."/login.php?bindrel=taobao";
		$taobao_config['sign_type']    = 'MD5';
		$taobao_config['input_charset']      = 'utf-8';
		$taobao_config['transport']    = 'http';
		require_once FANWE_ROOT."login/taobao/taobao_notify.class.php";


		$alipayNotify = new AlipayNotify($taobao_config);
		$verify_result = $alipayNotify->verifyReturn();
		if($verify_result) {//验证成功
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码

			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
		    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
		    $user_id	= $_GET['user_id'];	//支付宝用户id
		    $token		= $_GET['token'];	//授权令牌
			$real_name=$_GET['real_name'];

			//执行商户的业务程序
			$msg['id'] = $user_id;
			$msg['name'] = $real_name;
			$uid = intval($GLOBALS['_FANWE']['uid']);

			FDB::query("update ".FDB::table("user")." set taobao_id='".$msg['id']."' where uid = ".$uid);
			fHeader("location: ".FU('settings/bind'));

			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}
		else {
		    //验证失败
		    //如要调试，请看alipay_notify.php页面的return_verify函数，比对sign和mysign的值是否相等，或者检查$veryfy_result有没有返回true
		    fHeader("location: ".FU('settings/bind'));
		}


	}

	public function unbind()
	{
		$uid = intval($GLOBALS['_FANWE']['uid']);
		FDB::query("update ".FDB::table("user")." set taobao_id='' where uid = ".$uid);
		fHeader("location: ".FU('settings/bind'));
	}

	public function callback()
	{

		@session_start();
		$taobao_config['app_key']		= $this->config['app_key'];
		$taobao_config['app_secret']	=  $this->config['app_secret'];
		$taobao_config['return_url']	= get_domain().APP_ROOT."/login.php?bindrel=taobao";
		$taobao_config['sign_type']		= 'MD5';
		$taobao_config['input_charset']	= 'utf-8';
		$taobao_config['transport']		= 'http';
		require_once FANWE_ROOT."login/taobao/taobao_notify.class.php";


		$taobaoNotify = new TaobaoNotify($taobao_config);
		$verify_result = $taobaoNotify->verifyReturn();
		if($verify_result)
		{

			$top_parameters = $_GET["top_parameters"];
			$sessionKey = $_GET["top_session"];
			$top_sign = $_GET["top_sign"];
			
			$client = new TopClient;
			$client->appkey = $taobao_config['app_key'];
			$client->secretKey = $taobao_config['app_secret'];
	
			echo $sessionKey;
			
			$req = new UserGetRequest;
			
			$req->setFields("user_id,uid,nick,sex,alipay_account,email");
			$resp = $client->execute($req, $sessionKey);
			
			$jsonArray = get_object_vars($resp);
			$user = get_object_vars($jsonArray['user']);
			
			if(!isset($user)){
				return false;
			}

			$msg['id'] = $user['uid'];
			$msg['name'] = $user['nick'];

			$sql = 'SELECT uid,password FROM '.FDB::table('user')." WHERE taobao_id = '".$msg['id']."'";
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
				$max_count = FDB::resultFirst("select count(*) from ".FDB::table("user")." where user_name like 'taobao_".$msg['name']."%' and taobao_id <> ''");
				$user_name = "taobao_".$msg['name']."_".($max_count+rand(10,99));
				//开始自动注册会员
				$data = array(
					'user_name'       => $user_name,
                    'password'        => md5($password),
					'taobao_id'       => $msg['id'],
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
		else
		{
			fHeader("location: ".FU('index'));
		}
	}
}
?>