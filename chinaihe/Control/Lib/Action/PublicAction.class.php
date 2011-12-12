<?php
	class PublicAction extends Action {
		
		public function index(){
			$this->display();
		}
		
		public function login(){
			$this->display();
		}
		
		public function checkLogin(){
			
//			$this->display("Index/index");
			$this->redirect("Index/index");
			/*$email=trim($_POST['admin_name']);
			$password=trim($_POST['admin_psw']);
			
			if(empty($email))
			{
				$this->error('用户名不能为空!!!');
			}
			
			if(empty($password))
			{
				$this->error('密码不能为空!!!');
			}
			$map=array();
			$map["email"]=$email;
			import('ORG.Util.RBAC');
			
			$authInfo = RBAC::authenticate($map);
			if(false === $authInfo)
			{
				$this->error('帐号不存在或已禁用！');
			} 
			else
			{
				if($authInfo['password'] != md5($_POST['password'])) 
				{
					$this->error('密码错误！');
				}
				
				if($authInfo['email']=='admin') {
	                $_SESSION['administrator'] = true;
	            }
	            
	            $_SESSION[C('USER_AUTH_KEY')] = $authInfo['id'];
				$_SESSION['email'] = $authInfo['email'];
				$_SESSION['loginUserName'] = $authInfo['nickname'];
				$_SESSION['lastLoginTime'] = $authInfo['last_login_time'];
				$_SESSION['login_count'] = $authInfo['login_count'];
				$_SESSION['login_account'] = $authInfo['account'];
				$_SESSION['tinyurl'] = $authInfo['tinyurl'];
				$_SESSION['headurl'] = $authInfo['headurl'];
				
				//保存登录信息
				$User = M('User');
				Load('extend');
				$ip = get_client_ip();
				$time = time();
				$data = array();
				$data['id'] = $authInfo['id'];
				$data['last_login_time'] = $time;
				$data['login_count'] = array('exp', 'login_count+1');
				$data['last_login_ip'] = $ip;
				$User->save($data);
	            // 通过RBAC类中的静态方法saveAccessList缓存访问权限
	            RBAC::saveAccessList();
	            
	            $this->assign('jumpUrl',__APP__.'/Index/index');
	            $this->success('登录成功！');*/
			}
			
		}
		
//	}
?>