<?php
import('Com.top.TopClient');
class UserAction extends Action
{
	public function login()
    {
        $this->display();
    }
    
	public function taobaoLogin(){
		
		$top_parameters = trim($_GET['top_parameters']);
		$top_session = trim($_GET['top_session']);
		$top_sign = trim($_GET['top_sign']);
		
		$_SESSION[C('USER_AUTH_KEY')] = $top_session;
         
        $this->assign('jumpUrl',__APP__.'/Index/bangding');
        $this->success('登录成功！');
		
	}
	
	public function checkLogin(){
		if($_POST['username'] == 'admin'){
            $this->ajaxReturn($_POST['username'],'用户名正确~',1);
            // success 方法返回
            //$this->success('用户名正确~',true);
            // 加载了 Js/Form/CheckForm.js 类库或提交了 ajax=1 隐藏表单元素
            //$this->success('用户名正确~');
        }else{
            $this->ajaxReturn('','用户名错误！',0);
            // error 方法返回
            //$this->error('用户名错误！',true);
            // 加载了 Js/Form/CheckForm.js 类库或提交了 ajax=1 隐藏表单元素
            //$this->error('用户名错误！');
        }
	}
	
}
?>