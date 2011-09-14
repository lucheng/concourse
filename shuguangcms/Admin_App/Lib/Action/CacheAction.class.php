<?php
class CacheAction extends GlobalAction{
	function _initialize()
	{
		parent::_initialize();
		$this->_checkSecurity('system');
		
	}
	
	public function index()
	{	
		$this->assign("cache",array(
			"Admin_App(后台)"=>array("模版缓存(Cache)"=>"./Admin_App/Cache","数据缓存目录(Temp)"=>"./Admin_App/Temp","日志目录(Logs)"=>"./Admin_App/Logs","数据目录(Data)"=>"./Admin_App/Data"),
			"Huanshang_App(前台)"=>array("模版缓存(Cache)"=>"./Huanshang_App/Cache","数据缓存目录(Temp)"=>"./Huanshang_App/Temp","日志目录(Logs)"=>"./Huanshang_App/Logs","数据目录(Data)"=>"./Huanshang_App/Data"),
			));
		$this->display();
	}
	public function submit(){
		$dirs = $_POST['id'];
		//dump($dirs);
		foreach($dirs as $value)
			{
				clearCache($type=0,$path=$value);
				$say.= "清理缓存文件夹成功! ".$value."</br>";
			}
			$this->success($say);
		
		
	}
	public  function cache(){
		
		
		
	}
}
?>