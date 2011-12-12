<?php
class SettingsAction extends Action{
	
	public function index()
	{	
		$this->assign('title', '基本设置');
		$list=D("Settings")->findall();
		foreach ($list AS $key ){
			//$set[$title['title']]=stripslashes($title['values']);
			$this->assign($key['title'],$key['values']);
		}
		$this->display();
	}
	
	public function mail()
	{	
		$this->assign('title', '邮件设置');
		$list=D("Settings")->findall();
		foreach ($list AS $key ){
			//$set[$title['title']]=stripslashes($title['values']);
			$this->assign($key['title'],$key['values']);
		}
		$this->display();
	}
	public function update(){
		$Settings=D("Settings");
		$data=$_POST;
		//填充为空的项目
		if($data["sitename"]=='')$data["sitename"]='gxfans cms' ;
		if($data["siteurl"]=='')$data["siteurl"]='http://www.gxfans.com' ;
		if($data["attach"]=='')$data["attach"]='true' ;
		if($data["attachdir"]=='')$data["attachdir"]='Attachments' ;
		if($data["attachsize"]=='')$data["attachsize"]=1048576 ;
		if($data["attachext"]=='')$data["attachext"]='jpg,gif,png' ;
		if($data["thumbmaxwidth"]=='')$data["thumbmaxwidth"]=200 ;
		if($data["thumbmaxheight"]=='')$data["thumbmaxheight"]=300 ;
		if($data["thumbsuffix"]=='')$data["thumbsuffix"]='_thumb' ;
		if($data["seotitle"]=='')$data["seotitle"]='gxfans cms' ;
		if($data["seokeywords"]=='')$data["seokeywords"]='gxfans,cms' ;
		/**/
		//更新配置数据
        foreach($data AS $key => $value) {
            $s=$Settings->query("REPLACE INTO __TABLE__ VALUES ('$key', '$value');");
        }
        $list=$Settings->findall();   
        $content = "<?php\r\n//核心配置文件\r\nif (!defined('THINK_PATH')) exit();\r\nreturn array(\r\n";
        //获取数组
		foreach ($list AS $title){
			$key=strtoupper($title['title']);
			$value=$title['values'];
			if(strtolower($value)=="true" || strtolower($value)=="false" || is_numeric($value))
				$content .= "\t'$key'=>$value, \r\n";
			else
				$content .= "\t'$key'=>'$value',\r\n";
		}
		$content .= ");\r\n?>";
		//写入配置文件
	        $file='./config.inc.php';
      	    $r=@chmod($file,0777);
			$hand=file_put_contents($file,$content);
			if (!$hand) $this->error($file.'配置文件写入失败');
		$this->assign('jumpUrl',__URL__);
       	$this->success(L('_UPDATE_SUCCESS_'));
		
	}

}
?>