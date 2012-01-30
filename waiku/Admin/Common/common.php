<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
	
	@function 后台函数库
	
    @Filename common.php $

    @Author pengyong $

    @Date 2011-11-14 08:45:20 $
*************************************************************/
//删除目录函数
	function deldir($dirname)
	{
		if(file_exists($dirname))
		{
			$dir = opendir($dirname);
			while($filename = readdir($dir))
			{
				if($filename != "." && $filename != "..")
				{
					$file = $dirname."/".$filename;
					if(is_dir($file))
					{
						deldir($file); //使用递归删除子目录	
					}
					else
					{
						@unlink($file);
					}
				}
			}
			closedir($dir);
			rmdir($dirname);
		}
	}
	//弹框信息
	function alert($msg,$url)
	{
		header('Content-type: text/html; charset=utf-8');
		$msg = str_replace("'","\\'",$msg);
		$str = '<script>';
		$str.="alert('".$msg."');";
		switch($url)
		{
			case 1:
				$s = 'window.history.go(-1);';
				break;
			case 2:
				$s = 'window.history.go(-2);';
				break;
			case 3:
				$s = 'self.close();';
				break;
			default:
				$s = "location.href='{$url}';";
		}
		$str.=$s;
		$str.='</script>';
		exit($str);
	}
	//传入typeid;获取typename[友情链接]
	function lt($typeid){
		$tp=M('link_type');
		$alist=$tp->where("id=".$typeid)->find();
	return $alist['typename'];
}
?>