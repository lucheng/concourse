<?php
/**
 * @author nanze
 * @link 
 * @todo 
 * @copyright 811046@qq.com
 * @version 1.0
 * @lastupdate 2010-11-16
 */
class WebcallAction extends AdminCommAction {

	function index(){
		if($this->isPost()){

			SetSettValue('365webcall_name',rawurlencode($_POST['365webcall_name']));
			SetSettValue('365webcall_email',$_POST['365webcall_email']);
			SetSettValue('365webcall_accountid','0594trade');
			SetSettValue('365webcall_status',$_POST['365webcall_status']);
			SetSettValue('365webcall_password',rawurlencode($_POST['365webcall_password']));
			SetSettValue('365webcall_url',$_SERVER['HTTP_HOST']);
			cleanCache();
			$this->success('操作成功！');
		}else{
			$this->name=GetSettValue('365webcall_name');
			$this->email=GetSettValue('365webcall_email');
			$this->accountid=GetSettValue('365webcall_accountid');
			$this->pwd=GetSettValue('365webcall_password');
			$this->url=GetSettValue('365webcall_url');

			$this->name2=rawurldecode(GetSettValue('365webcall_name'));
			$this->email2=GetSettValue('365webcall_email');
			$this->accountid2=GetSettValue('365webcall_accountid');
			$this->pwd2=rawurldecode(GetSettValue('365webcall_accountid'));


			$this->display();
		}
	}
	function opencall(){
		$url="http://p.365webcall.com/invite.aspx?".http_build_query($_GET);
		$ch=curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
		$content=curl_exec($ch);
		header("Content-Type:text/html; charset=utf-8"); 
		if($content>0){
			echo "<script>alert('开通成功!')</script>";
		}else{
			echo "<script>alert('开通失败!')</script>";
		}
		die("<script type=\"text/javascript\">window.location='".U('Webcall/index')."';</script>");
		  
	}
}
?>