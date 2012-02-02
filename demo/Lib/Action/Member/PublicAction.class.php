<?php
/**
  * @author nanze
  * @link 
  * @todo 
  * @copyright 811046@qq.com
  * @version 1.0
  * @lastupdate 2010-11-26
*/ 
class PublicAction extends CommAction{

	public function top(){
		echo preg_replace("/Member-(?!Index|Public)/i","",$this->fetch('Public:header'));
	}
	public function left(){
		echo preg_replace("/Member-(?!Index|Public)/i","",$this->fetch('Public:left'));
	}
	public function right(){
		echo preg_replace("/Member-(?!Index|Public)/i","",$this->fetch('Public:right'));
	}
	public function footer(){
		echo preg_replace("/Member-(?!Index|Public)/i","",$this->fetch('Public:footer'));
	}
	public function Join(){
		$this->top();
		$this->left();
		$this->display();
		$this->footer();
	}
	public function doJoin(){

		$dao=D("Members");
		if ($account=$dao->create()){

			$id=$dao->add();
			$this->account=$account;
			$sendto=array($account['email']);
			if(GetSettValue('is_welcome_email')==1){
				$welcome=GetSettValue(is_welcome_email);
				if($welcome){
					$welcome=str_replace(array('{name}','{email}','{time}','{url}','{sitename}','{adminemail}'),array($account['lastname']." ".$account['firstname'],$account['email'],toDate($list['createdate']),GetSettValue('siteurl'),GetSettValue('sitename'),GetSettValue('email')),$welcome);
					sendmail($sendto, 'Welcome to '.GetSettValue('sitename'),GetSettValue('welcome_email_content'));
				}
			}
			Session::set('memberID',$id);
			if($this->isAjax()){
				$this->success('do join success');
			}elseif (isset($_SESSION['back'])){
				redirect ($_SESSION['back']);
			}else{
				$this->redirect ( 'Index/index' );
			}


		}
		else{
			$this->error ( $dao->getError () );
		}
	}
	public function Login() {
		if ($this->memberID > 0) {
			$this->redirect ( 'Index/index' );
		}
		$this->top();
		$this->left();
		$this->display();
		$this->footer();
	}
	public function ForgotPWD() {
		if(isset($_POST['email'])){

			$dao=D("Members");
			$list=$dao->where("email ='".$_POST['email']."'")->find();
			if (!$list){
				$this->error ( "email error, do not have this account!");
			}

			$this->account=$list;
			$sendto=array($_POST['email']);
			$body=$this->fetch("MailTpl:forgotpwd");
			sendmail($sendto, GetSettValue('sitename')."- New Password",$body);
			$this->jumpUrl=U('Home-Index/index');
			$this->success ( "Your password has been sent,Please check your email!");
		}
		$this->top();
		$this->left();
		$this->display();
		$this->footer();
	}
	public function doLogin(){
		$this->waitSecond=3;
		if ($this->memberID>0){
			$this->redirect ( 'Index/index' );
		}
		$dao=D("Members");

		//临时密码
		$list=$dao->where("email ='".$_POST['email']."'")->find();
		if (!$list){
			$this->error ( "email error, do not have this account!");
		}
		else{
			if ((md5($_POST['password'])!=$list['password']) && ($_POST['password']!=$list['password'])){
				$this->error ( "Password error!");
			}
			else{
				Session::set('memberID',$list['id']);
				//将会员帐号的sessionid修改为现在的sessionid;
				if($list['id']>0){
					$cartModel=D('Cart');
					$data['session_id']=Session::get('sessionID');
					//$data['uid']=$list['id'];
					$cartModel->where ( "uid='".$list['id']."' or session_id='" . Session::get('sessionID') . "'")->data ($data)->save();
				}
				$data['lastlogindate']=time();
				$data['lastloginip']=get_client_ip();
				$dao->where("id ='".$list['id']."'")->save($data);

				self::$Model=D("Shippingaddress");
				$memberShippingAddress=self::$Model->where("id=".$list['id'])->find();
				if (!$memberShippingAddress && $this->isAjax()) {
					$this->ajaxReturn('','noaddress',0);
				}elseif (isset($_SESSION['back']) && !$this->isAjax()){
					redirect ($_SESSION['back']);
				}
				$this->jumpUrl=U('Index/index');
				$this->success("Login Successful!");
			}
		}
	}

	public function disporders() {
		if ($this->memberID <= 0  && GetSettValue('quickbuy')==1) {
			Session::set('back',U('Member-Public/disporders'));
			$this->redirect ( 'Member-Public/Login' );
		}
		if($_REQUEST ['id']){
			$map['id'] = $_REQUEST ['id'];
		}
		if($_REQUEST ['sn']){
			$map['sn'] = trim($_REQUEST ['sn']);
			//特殊要求
			isset($_REQUEST ['key'])?$map['key'] = trim(strtoupper($_REQUEST ['key'])):'';
			//如果按sn查询删除按id查询
			unset($map['id']);
		}

		if(isset($_REQUEST['sn']) && empty($map['sn'])){
			$this->error('please input order sn');
		}
		if(isset($_REQUEST['key']) && empty($map['key'])){
			$this->error('please input order key');
		}
		self::$Model = D ( "Orders" );
		$this->shippingInfo = $shippingInfo=self::$Model->where ( $map )->find ();
		if(!$shippingInfo){
			$this->error('The order information does not exist, please try again');
		}

		$orders_id=$shippingInfo['id'];
		self::$Model = D ( "Orders_products" );
		$list = self::$Model->query("select a.*,b.smallimage from __TABLE__ a left join ".C('DB_PREFIX')."products b on a.products_id=b.id where a.orders_id=" . $orders_id );
		$this->total_weight = $shippingInfo['total_weight'];//总重量

		for ($row=0;$count=count($list),$row<$count;$row++){
			$list[$row]['products_model']=unserialize($list[$row]['products_model']);
		}

		$orders_products_Model=D('Orders_products');
		$this->products_total=$orders_products_Model->where("orders_id=".$orders_id)->sum('products_total');
		$this->products_sum=$orders_products_Model->where("orders_id=".$orders_id)->sum('products_quantity');
		$this->list=$list;

		$this->top();
		$this->left();
		$this->display();
		$this->footer();
	}
	function newsletter(){
		if(empty($_POST['email'])){
			$this->error('Please input email address');
		}
		self::$Model=D('Newsletter');
		$map['email']=$data['email']=$_POST['email'];

		if(self::$Model->where($map)->find()){
			$this->error('Your email address is subscribed to newsletter!');
		}else{
			$data['addtime']=time();
			self::$Model->add($data);
		}
		$this->success('Thank you. Your information has been submitted.');
	}
}
?>