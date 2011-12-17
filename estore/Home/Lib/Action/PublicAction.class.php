<?php
import('Com.top.TopClient');
class PublicAction extends Action
{
	public function login()
    {
        $this->display();
    }
    
	public function checkLogin(){
		
		$top_parameters = trim($_GET['top_parameters']);
		$top_session = trim($_GET['top_session']);
		$top_sign = trim($_GET['top_sign']);
		
		$_SESSION[C('USER_AUTH_KEY')] = $top_session;
         
        $this->assign('jumpUrl',__APP__.'/Index/bangding');
        $this->success('登录成功！');
		
	}

}
?>