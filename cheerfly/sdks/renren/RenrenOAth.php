<?php

require_once FANWE_ROOT.'sdks/renren/class/RenrenOAuthApiService.class.php';
require_once FANWE_ROOT.'sdks/renren/class/RenrenRestApiService.class.php';

class renren
{
	private $config;
	
	private static $APIURL		= 'http://api.renren.com/restserver.do'; //RenRen网的API调用地址，不需要修改
	private static $APPID		= '';	//你的API Key，请自行申请
	private static $APIKey		= '';	//你的API Key，请自行申请
	private static $SecretKey	= '';	//你的API 密钥
	private static $APIVersion	= '1.0';	//当前API的版本号，不需要修改
	private static $decodeFormat	= 'json';	//默认的返回格式，根据实际情况修改，支持：json,xml
	
	private static $redirecturi = '';//你的获取code的回调地址，也是accesstoken的回调地址
	
	private static $scope='publish_feed,photo_upload';
	
	public function __construct()
	{
		global $_FANWE;
		$this->config = $_FANWE['cache']['logins']['renren'];
		$this->APPID = $this->config['app_id'];
		$this->APIKey = $this->config['app_key'];
		$this->SecretKey = $this->config['app_secret'];
		$this->redirecturi = $_FANWE['site_url']."callback/renren.php";
//		echo $this->redirecturi;
	}


	public static function getJumpUrl(){
	
		self::$jumpUrl = "https://graph.renren.com/oauth/authorize?client_id=".$this->APPID."&response_type=code&scope=".$this->$scope."&state=a%3d1%26b%3d2&redirect_uri=".$this->$redirecturi."&x_renew=true";
		return $this->jumpUrl;
//		return "https://graph.renren.com/oauth/authorize?client_id=".$this->config['app_id']."&response_type=code&scope=".$this->$scope."&state=a%3d1%26b%3d2&redirect_uri=".$this->redirecturi."&x_renew=true";
	}
	
	/**
	 * 获取requestToken
	 *
	 * 返回的数组包括：
	 * oauth_token：返回的request_token
     * oauth_token_secret：返回的request_secret
	 * oauth_callback_confirmed：回调确认
	 * 
	 * @param string $callback 回调地址
	 * @return array
	 */
	public static function getAccessToken($code)
	{
		$oauthApi = new RenrenOAuthApiService;
		$post_params = array('client_id'=>$config->APIKey,
				'client_secret'=>$config->SecretKey,
				'redirect_uri'=>$config->redirecturi,
				'grant_type'=>'authorization_code',
				'code'=>$code
				);
		$token_url='http://graph.renren.com/oauth/token';
		$access_info=$oauthApi->rr_post_curl($token_url,$post_params);//使用code换取token
		//$access_info=$oauthApi->rr_post_fopen($token_url,$post_params);//如果你的环境无法支持curl函数，可以用基于fopen函数的该函数发送请求
		$access_token=$access_info["access_token"];
		$expires_in=$access_info["expires_in"];
		$refresh_token=$access_info["refresh_token"];
		//session_start();
		$_SESSION["access_token"]=$access_token;
		return $this->jumpUrl;
	}

}
