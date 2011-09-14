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