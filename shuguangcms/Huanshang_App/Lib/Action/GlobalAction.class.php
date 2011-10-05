<?php 
class GlobalAction extends Action  
{
	function _initialize()
	{
		if(C('STATUS')=='2'){
			die(C('STOPD'));
			exit();
		}
		if (S('settings')) {
			$Settings=S('settings');
		}else {
			$Settings=D('Settings')->findall();
			S('settings',$Settings,C('SDATA_TIME'));
		}
		foreach ($Settings AS $key ){
			$this->assign($key['title'],$key['values']);
		}
		$map2['types']=2;
		$map3['types']=3;
		$Link=D("Link");
		$qq=$Link->order('id desc')->findall($map2);
		$ww=$Link->order('id desc')->findall($map3);
		$this->assign("qqs", $qq);
		$this->assign("wws", $ww);
//		dump($Contect);
	}
	function verify()
	{
		import('ORG.Util.Image');
		if(isset($_REQUEST['adv']))
		{
			Image::showAdvVerify();
		}
		else
		{
			Image::buildImageVerify();
		}
	}
}
?>