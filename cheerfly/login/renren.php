<?php
// 人人的api登录接口
require_once FANWE_ROOT.'sdks/renren/RenrenOAth.php';

class renren
{
	private $config;
	
	public function __construct()
	{
		global $_FANWE;
		$this->config = $_FANWE['cache']['logins']['renren'];
	}

	public function getInfo()
	{
		global $_FANWE;
		$data['name'] = $this->config['name'];
		$data['short_name'] = $this->config['short_name'];
		$data['is_syn'] = $this->config['is_syn'];
		$data['bind_img'] = SITE_URL.'login/renren/bind_renren.png';
		$data['icon_img'] = SITE_URL.'login/renren/icon_renren.png';
		$data['login_img'] = SITE_URL.'login/renren/login_renren.png';
		$data['login_url'] = SITE_URL."login.php?mod=renren";
		$data['bind_url'] = SITE_URL."login.php?bind=renren";
		$data['unbind_url'] = SITE_URL."login.php?unbind=renren";
		return $data;
	}

	public function loginJump()
	{
		global $_FANWE;
		if($_FANWE['uid'] > 0)
		{
			$this->bindJump();
			exit;
		}
		
		fSetCookie('callback_type','login');
		$this->jump();
	}

	public function bindJump()
	{
		global $_FANWE;
		if($_FANWE['uid'] == 0)
		{
			$this->loginJump();
			exit;
		}
		
		fSetCookie('callback_type','bind');
		$this->jump();
	}
	
	private function jump()
	{
		global $_FANWE;
		$oauth = new RenrenOAth($this->config['app_id'],$this->config['app_key'],$this->config['app_secret']);
		$url = $oauth->getJumpUrl();
		$url = FU('tgo',array('url'=>$url));
		fHeader("location:".$url);
		fHeader("location:".$url);
	}

	public function unBind()
	{
		global $_FANWE;
		if($_FANWE['uid'] > 0)
		{
			FDB::delete('user_bind',"uid = ".$_FANWE['uid']." AND type = 'renren'");
		}
		fHeader("location: ".FU('settings/bind'));
	}
	
	public function sendMessage($data)
	{
		global $_FANWE;
		$uid = $_FANWE['uid'];

		static $renren = NULL;
		if($renren === NULL)
		{
			require_once FANWE_ROOT."core/class/user/renren.class.php";
			$renren = new renrenUser();
		}
		$renren->sentShare($uid,$data);
	}
}
?>