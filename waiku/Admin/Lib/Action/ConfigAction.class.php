<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 系统全局配置

    @Filename ConfigAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 11:41:34 $
*************************************************************/
class ConfigAction extends CommonAction
{
	Public function _empty()
	{ 
		alert('方法不存在!',__APP__);
	} 
	
	public function index()
	{
		$type = M('config');
		$list = $type->where('id=1')->find();
		$this->assign('list',$list);
		$this->display('index');
	} 
	public function update()
	{
		$data['sitetitle'] = $_POST['sitetitle']; 
		$data['sitetitle2'] = $_POST['sitetitle2']; 
		$data['siteurl'] = $_POST['siteurl']; 
		$data['updown'] = $_POST['updown']; 
		$data['xgwz'] = $_POST['xgwz']; 
		$data['sitedescription'] = $_POST['sitedescription']; 
		$data['sitekeywords'] = $_POST['sitekeywords']; 
		$data['sitelx'] = $_POST['sitelx']; 
		$data['sitetcp'] = $_POST['sitetcp']; 
		$data['tjnum'] = $_POST['tjnum']; 
		$data['phnum'] = $_POST['phnum']; 
		$data['noticeid'] = $_POST['noticeid']; 
		$data['noticenum'] = $_POST['noticenum']; 
		$data['isping'] = $_POST['isping']; 
		$data['isshare'] = $_POST['isshare']; 
		$data['pingoff'] = $_POST['pingoff']; 
		$data['bookoff'] = $_POST['bookoff']; 
		$data['mood'] = $_POST['mood']; 
		$data['sitelogo'] = $_POST['sitelogo']; 
		$data['ishits'] = $_POST['ishits']; 
		$data['iscopyfrom'] = $_POST['iscopyfrom']; 
		$data['isauthor'] = $_POST['isauthor']; 
		$data['isvote'] = $_POST['isvote']; 
		$data['ishomeimg'] = $_POST['ishomeimg']; 
		$data['mouseimg'] = $_POST['mouseimg'];
		$data['iszy'] = $_POST['iszy'];
		$data['id'] = $_POST['id']; 
		$data['artlistnum'] = $_POST['artlistnum']; 
		$data['rollnum'] = $_POST['rollnum']; 
		$data['postovertime'] = $_POST['postovertime']; 
		$data['urlmode'] = $_POST['urlmode']; 
		$data['suffix'] = $_POST['suffix']; 
		if($data['suffix'] ==0) $resuffix = '.html';
		if($data['suffix'] ==1) $resuffix = '.htm';
		if($data['suffix'] ==2) $resuffix = '.shtml';
		$type = M('config');
		$config = F('basic','','./Web/Conf/');
		if($config['suffix'] ==0) $suffix = '.html';
		if($config['suffix'] ==1) $suffix = '.htm';
		if($config['suffix'] ==2) $suffix = '.shtml';
		unset($config);
		$result = $type->data($data)->save(); 
		if($result)
		{
			F('basic',$data,'./Web/Conf/');
		//url模式处理
			$path = './Web/Conf';
			if($data['urlmode'] == 0)
			{
				$fp = fopen($path."/config.php","r");
				$configStr = fread($fp,filesize($path."/config.php"));
				fclose($fp);
				$configStr = str_replace('=>2','=>1',$configStr);
				$configStr = str_replace("=>'".$suffix."'","=>'".$resuffix."'",$configStr);
				@chmod($path,0777);
				$fp = fopen($path."/config.php","w") or die("<script>alert('写入配置失败，请检查../Web/Conf目录是否可写入！');history.go(-1);</script>");
				fwrite($fp,$configStr);
				fclose($fp);
			}
			if($data['urlmode'] == 1)
			{
				$fp = fopen($path."/config.php","r");
				$configStr = fread($fp,filesize($path."/config.php"));
				fclose($fp);
				$configStr = str_replace('=>1','=>2',$configStr);
				$configStr = str_replace("=>'".$suffix."'","=>'".$resuffix."'",$configStr);
				@chmod($path,0777);
				$fp = fopen($path."/config.php","w") or die("<script>alert('写入配置失败，请检查../Web/Conf目录是否可写入！');history.go(-1);</script>");
				fwrite($fp,$configStr);
				fclose($fp);
			}
			alert('操作成功!',U('Config/index'));	
		}
		alert('操作失败!',1);
	}
}
?>