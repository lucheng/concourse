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
		$map1['types']=1;
		$map2['types']=2;
		$map3['types']=3;
		$map4['types']=4;
		$Link=D("Link");
		$links=$Link->order('orders desc')->findall($map1);
		$qq=$Link->order('orders desc')->findall($map2);
		$ww=$Link->order('orders desc')->findall($map3);
		$bb=$Link->order('orders desc')->findall($map4);
		
		$this->assign("links", $links);
		$this->assign("qqs", $qq);
		$this->assign("wws", $ww);
		$this->assign("bbs", $bb);

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