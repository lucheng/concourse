<?php
/**
  * @author nanze
  * @link 
  * @todo 
  * @copyright 811046@qq.com
  * @version 1.0
  * @lastupdate 2011-9-16
*/ 
class CommAction extends Action{
	protected static $Model=null;	//数据Model
	protected $ProModel=null;
	protected $theme;
	public $sessionID,$memberID,$memberInfo,$memberShippingAddress;


	function _initialize() {
		header("Content-Type:text/html; charset=utf-8");
		L('_OPERATION_SUCCESS_',"Operation Success");
		L('_OPERATION_FAIL_','Operation Fail');
		//是否关闭网站
		if(GetSettValue('close_site')==1){
			header("HTTP/1.1 500 Internal Server Error");
			header("Status: 500 Internal Server Error");
			die('<div style="margin: 10px; text-align: center; font-size: 14px"><p>The temporary closure of this site, you can not access!</p><p>' . GetSettValue('close_site_content') . '</p></div>');
		}
		//IP封锁
		if(isset($_COOKIE['ipblock']) && $_COOKIE['ipblock']==0){

		}elseif((isset($_COOKIE['ipblock']) && $_COOKIE["ipblock"] ==1) || (GetSettValue('ipblock') == 1 && GetSettValue('ipblock_pwd') != '')) {
			import('@.Action.Home.IpblockAction');
			$ipblock=new IpblockAction();
			$ipblock->index();
		}
		$this->ProModel=D('Products');


		//多主题
		if($this->theme=GetSettValue('theme')){
			setcookie('think_template',$this->theme,time()+3600,'/');
		}else{
			setcookie('think_template','default',time()+3600,'/');
		}
		//多语言
		/*$lang=GetSettValue('lang');
		if('auto'!=$lang){
		setcookie('think_language',$lang?$lang:'en-us',time()+3600,'/');
		}*/
		//浏览历史
		$this->product_history=product_history();

		//货币初始化
		$this->currencies=$currencies=get_currencies_arr();
		if (! isset ( $_SESSION ['currency'] )) {
			for($row = 0; $row < count ( $currencies ); $row ++) {
				if ($currencies [$row] ['symbol'] == C ( 'DEFAULT_CURRENCIES_SYMBOL' )) {
					$_SESSION ['currency'] = $currencies [$row];
				}
			}
		}
		//生产一个唯一的session id
		$this->sessionID = Session::get ( 'sessionID' );
		if (! $this->sessionID ) {
			$this->sessionID  = md5 ( uniqid ( rand () ) );
			Session::set ( 'sessionID', $this->sessionID  );
		}
		//读取用户id
		$this->memberID=Session::get('memberID');
		if (! $this->memberID ) {
			$this->memberID=0;
		}
		else{
			//读取用户信息
			$this->mid=$this->memberID;
			self::$Model=D("Members");
			$this->memberInfo=self::$Model->where("id=".$this->memberID)->find();
			$this->member_Info=$this->memberInfo;
			self::$Model=D("Shippingaddress");
			$this->memberShippingAddress=self::$Model->where("id=".$this->memberID)->find();
			Session::set('memberShippingAddress',$this->memberShippingAddress);
			$this->member_ShippingAddress=$this->memberShippingAddress;
			/*$this->_365call="
			<script type=\"text/javascript\">
			//<![CDATA[
			var _365call_memberID  = \"{$this->memberInfo['email']}\"; //  char(20)  账号(会员号)
			var _365call_clientName= \"{$this->memberInfo['firstname']}{$this->memberInfo['lastname']}\"; //  char(50)  用户名(姓名)
			var _365call_email     = \"{$this->memberInfo['email']}\"; //  char(50)  邮件地址
			var _365call_phone     = \"{$this->memberShippingAddress['telphone']}\"; //  char(20)  联系电话
			var _365call_msn       = \"\"; //  char(50)  MSN
			var _365call_qq        = \"\"; //  char(20)  QQ
			var _365call_note      = \"{$this->memberShippingAddress['address']}\"; //  char(100) 其他
			//]]>
			</script>";*/
		}

		//当前月份
		$today=getdate();
		$this->month=$today['month'];

		//总重量
		self::$Model=D("Cart");
		$this->Total_weight=self::$Model->cart_total_weight($this->sessionID);

		//会员等级
		$this->memberGropuInfo=get_members_group($this->memberID);
		if (get_members_group($this->memberID)){
			$this->isVip=1;
		}
		else{
			$this->isVip=0;
		}

		/**
		 * bof缓存模板变量
		 */

		//全局模板变量
		if(F('Common_Cache')==''){
			F('Common_Cache',$this->_Common_Cache());
		}
		$this->assign(F('Common_Cache'));

		//产品缓存
		if(F('Products_Cache')==''){
			F('Products_Cache',$this->_Products_Cache());
		}
		//打乱随机显示
		$Products_Cache=F('Products_Cache');
		$Products_Cache['FeaturedProducts']=$this->ProModel->rand($Products_Cache['FeaturedProducts']);
		$Products_Cache['HotProducts']=$this->ProModel->rand($Products_Cache['HotProducts']);
		$Products_Cache['NewProducts']=$this->ProModel->rand($Products_Cache['NewProducts']);
		$Products_Cache['SpeProducts']=$this->ProModel->rand($Products_Cache['SpeProducts']);
		$this->assign($Products_Cache);

		/**
		 * eof缓存模板变量
		 */

	}
	private function _Common_Cache(){

		$Common_Cache=array();
		$Common_Cache['catetree'] = get_indexcate_arr ();
		$Common_Cache['toptenviews']=$this->ProModel->order("viewcount desc")->limit('0,3')->findall();

		//热门类别
		self::$Model=D('Cate');
		$Common_Cache['HotClass']=self::$Model->where("ishot=1")->order("id desc")->limit('0,5')->findall();
		//首页幻灯片
		$list=get_ad_arr("flash");
		for ($row=0;$row<count($list);$row++){
			$flashpic[$row]=__ROOT__."/".$list[$row]['img_url'];
			$flashlink[$row]=$list[$row]['link'];
			$flashremark[$row]=$list[$row]['remark'];
		}
		$Common_Cache['flashpic']=implode("|",$flashpic);
		$Common_Cache['flashlink']=implode("|",$flashlink);
		$Common_Cache['flashremark']=implode("|",$flashremark);//是否显示幻灯片描述
		$Common_Cache['brandlist']=get_brand_tree();

		/**
		 * 广告部分
		 */
		//调用方法img_url图片content文字//remark标题get_ad('leftad','img_url');
		//$Common_Cache['leftad'] = get_ad('leftad');//单个
		//$Common_Cache['link'] = get_ad_arr("link");//广告组

		//文章类别
		self::$Model=D('Article_cate');
		$Common_Cache['Article']=self::$Model->findall();

		self::$Model= D('Article');
		foreach ($Common_Cache['Article'] as $k=>$v){
			$Common_Cache['Article'][$v['name']]=self::$Model->where(array('pid'=>$v['id'],'status'=>1))->limit(10)->order('sort desc')->findall();
		}

		$Common_Cache['News']=&$Common_Cache['Article']['新闻中心'];
		$Common_Cache['art_sys']=&$Common_Cache['Article']['系统文章'];

		$Common_Cache['Footer'] = GetSettValue('footer_content');
		$Common_Cache['footcode'] = GetSettValue('footcode');
		$Common_Cache['tel'] = build_url(GetSettValue('tel'),'tel');
		$Common_Cache['Hotmail'] = build_url(GetSettValue('hotmail'),'hotmail');
		$Common_Cache['Yahoo'] = build_url(GetSettValue('yahoo'),'yahoo');
		$Common_Cache['Skype'] = build_url(GetSettValue('skype'),'skype');
		
		$Common_Cache['Email'] = build_url(GetSettValue('email'),'email');
		//产品说明
		$Common_Cache['allpro_remark'] = GetSettValue('allpro_remark');
		$Common_Cache['newpro_remark'] = GetSettValue('newpro_remark');
		$Common_Cache['hotpro_remark'] = GetSettValue('hotpro_remark');
		$Common_Cache['recpro_remark'] = GetSettValue('recpro_remark');
		$Common_Cache['spepro_remark'] = GetSettValue('spepro_remark');
		$Common_Cache['proinfo_remark'] = GetSettValue('proinfo_remark');
		$Common_Cache['cart_remark'] = GetSettValue('cart_remark');

		//热门搜索
		$hotsearch = GetSettValue('hotsearch');
		foreach (explode(',',$hotsearch) as $v){
			$Common_Cache['hotsearch'].="<a href='".U('Search/index',array('key'=>$v))."'>".$v."</a>&nbsp;";
		}
		//导航
		self::$Model= D('Nav');
		$Common_Cache['nav'] = self::$Model->where('status=1')->order('sort asc')->findall();

		//历史订单
		self::$Model= D('Orders');
		$Common_Cache['orders'] = self::$Model->order('id desc')->limit(10)->findall();

		return $Common_Cache;
	}
	private function _Products_Cache(){
		$newpro_num=GetSettValue('newpro_num')?GetSettValue('newpro_num'):9;
		$recpro_num=GetSettValue('recpro_num')?GetSettValue('recpro_num'):9;
		$hotpro_num=GetSettValue('hotpro_num')?GetSettValue('hotpro_num'):9;
		$spepro_num=GetSettValue('spepro_num')?GetSettValue('spepro_num'):9;
		$Products_Cache['FeaturedProducts']=$this->ProModel->where("isrec=1 and isdown!=1")->order("sort desc,id desc")->limit("0,$recpro_num")->findall();
		$Products_Cache['HotProducts']=$this->ProModel->where("ishot=1 and isdown!=1")->order("sort desc,id desc")->limit("0,$hotpro_num")->findall();
		$Products_Cache['NewProducts']=$this->ProModel->where("isnew=1 and isdown!=1")->order("sort desc,id desc")->limit("0,$newpro_num")->findall();
		$Products_Cache['SpeProducts']=$this->ProModel->where("isprice=1 and isdown!=1")->order("sort desc,id desc")->limit("0,$spepro_num")->findall();
		return $Products_Cache;
	}
	/**
	 * 空操作
	 */
	protected function _empty(){
		C('TMPL_ACTION_ERROR','Public:404');
		header("HTTP/1.1 404 Not Found");
		header("Status: 404 Not Found");
		$this->error('404-Document Not Found');
	}



}
?>