<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 文件上传

    @Filename FileAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 15:00:15 $
*************************************************************/
import('@.ORG.Waikucms');
import('@.ORG.UploadFile');
class FileAction extends Waikucms
{
	Public function _empty()
	{ 
		alert('方法不存在!',1);
	} 
	//默认上传幻灯
	public function hd()
	{
		$this->display('hd');
	}
	//上传logo
	public function logo()
	{
		$this->display('logo');
	}
	//上传广告图片
	public function ad()
	{
		$this->display('ad');
	}
	//上传友情图片
	public function link()
	{
		$this->display('link');
	}
	//上传图片缩略图
	public function thumb()
	{
		$this->display('thumb');
	}
	//上传附件
	public function attach()
	{
		$this->display('attach');
	}
	//上传幻灯图片
	public function upload()
	{
		$this->upmethod('up','c');
	}

	//上传logo图片
	public function uploadlogo()
	{
		$this->upmethod('uplogo','l');
	}
	//上传广告图片
	public function uploadad()
	{
		$this->upmethod('upad','a');
	}
	//上传友情链接图片
	public function uploadlink()
	{
		$this->upmethod('uplink','k');
	}
	//上传缩略图
	public function uploadthumb()
	{
		$this->upmethod('upthumb','t');
	}
	//上传附件
	public function uploadattach()
	{
	$this->upmethod('upattach','at');
	}
	//幻灯代码处理
	private function c($data)
	{
		$js='';
		if(!empty($data[0]['savename']))
		{
			$js.="<script language=javascript>parent.myform.Pic.value='hd_".$data[0]['savename']."';</script>";
			$this->assign('js',$js);
			return true;
		}
		else
		{
			return false;
		}
	}
	//logo代码处理
	private function l($data)
	{
		$js='';
		if(!empty($data[0]['savename']))
		{
			$js.="<script language=javascript>parent.frm.oSiteLogo.value='".$data[0]['savename']."';</script>";
			$this->assign('js',$js);
			return true;
		}
		else
		{
			return false;
		}
	}
	//广告代码处理
	private function a($data)
	{
		if(!empty($data[0]['savename']))
		{
			$js='';
			$type = M('config');
			$siteurl = $type->where('id=1')->getField('siteurl');
			$js.="<script language=javascript>parent.myform.Content.value=parent.myform.Content.value+'<a href=\"".$siteurl."\"><img src=\"".__PUBLIC__."/ad/".$data[0]['savename']."\"></a>';</script>";
			$this->assign('js',$js);
			return true;
		}
		else
		{
			return false;
		}
	}
	//友链代码处理
	private function k($data)
	{
		$js='';
		if(!empty($data[0]['savename']))
		{
			$js.="<script language=javascript>parent.myform.LogoUrl.value='{$data[0]['savename']}';</script>";
			$this->assign('js',$js);
			return true;
		}
		else
		{
			return false;
		}
	}
	//缩略图代码处理
	private function t($data)
	{
		$js='';
		if(!empty($data[0]['savename']))
		{
			$js.="<script language=javascript>parent.myform.Images.value='".__PUBLIC__."/Uploads/thumb/thumb_{$data[0]['savename']}';</script>";
			$js.="<script language=javascript>parent.myform.Useimg.checked=true;</script>";
			$js.="<script language=javascript>parent.KE.insertHtml('Content', '<div align=\"center\" width=\"500px\"><a href=\"".__PUBLIC__."/Uploads/thumb/thumb_{$data[0]['savename']}\"><img src=\"".__PUBLIC__."/Uploads/thumb/thumb_{$data[0]['savename']}\"></a></div>');</script>";
			$this->assign('js',$js);
			return true;
		}
		else
		{
			return false;
		}
	}
	//附件代码处理
	private function at($data)
	{
		$js='';
		if(!empty($data[0]['savename']))
		{
			switch($data[0]['extension'])
			{
				case 'zip':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/zip.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'tar.gz':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/zip.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case '7z':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/zip.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'rar':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/rar.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'doc':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/doc.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'docx':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/doc.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'ppt':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/ppt.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'pptx':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/ppt.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'cls':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/cls.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'clsx':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/cls.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'txt':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/txt.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'pdf':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/pdf.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				case 'swf':
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<br>附件下载:<img src=\"".__PUBLIC__."/Editor/mini/swf.gif\"><a href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\">".$data[0]['savename']."</a></br>');</script>";
					break;
				default:
					$js.="<script language=javascript>parent.KE.insertHtml('Content', '<div style=\"text-align:center;width:500px;\"><a  href=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\"><img src=\"".__PUBLIC__."/Uploads/attach/".$data[0]['savename']."\"></a></div>');</script>";
				//default 默认为gif,png,jpg等图片
			}
			$this->assign('js',$js);
			return true;
		}
		else
		{
			return false;
		}
	}
	//*********************以下是执行上传的方法**************************
	//幻灯上传方法
	private function up()
	{
		$upload=new UploadFile();
		$upload->maxSize='204800';  
		$upload->savePath='./Public/Uploads/';       
		$upload->saveRule= time;   
		$upload->uploadReplace=true;     
		$upload->allowExts=array('jpg','jpeg','png','gif');     //准许上传的文件后缀
		$upload->allowTypes=array('image/jpeg','image/pjpeg','image/png','image/gif','image/x-png');//准许上传的文件类型
		$upload->imageClassPath = '@.ORG.Image';
		$upload->thumb=true;   //是否开启图片文件缩略,true表示开启
		$upload->thumbMaxWidth='300';  //以字串格式来传，如果你希望有多个，那就在此处，用,分格，写上多个最大宽
		$upload->thumbMaxHeight='280';	
		$upload->thumbPrefix='hd_';//缩略图文件前缀
		$upload->thumbPath='./Public/Uploads/hd/' ; 
		$upload->thumbRemoveOrigin=1;  
		if($upload->upload())
		{
			$info=$upload->getUploadFileInfo();
			return $info;
		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}
	//logo上传方法
	private function uplogo()
	{
		$upload=new UploadFile();
		$upload->maxSize='204800';  
		$upload->savePath='./Public/Uploads/logo/';       
		$upload->saveRule='logo_'.date('YmdHis');   
		$upload->uploadReplace=true;     
		$upload->allowExts=array('jpg','jpeg','png','gif');     //准许上传的文件后缀
		$upload->allowTypes=array('image/jpeg','image/pjpeg','image/png','image/gif','image/x-png');//准许上传的文件类型
		$upload->autoSub=false; //是否使用子目录进行保存上传文件
		if($upload->upload())
		{
			$info=$upload->getUploadFileInfo();
			return $info;
		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}
	private function upad()
	{
		$upload=new UploadFile();
		$upload->maxSize='204800';  
		$upload->savePath='./Public/Uploads/ad/'; 
		$upload->saveRule= time;   
		$upload->uploadReplace=true;     
		$upload->allowExts=array('jpg','jpeg','png','gif');     //准许上传的文件后缀
		$upload->allowTypes=array('image/jpeg','image/pjpeg','image/png','image/gif','image/x-png');//准许上传的文件类型
		$upload->autoSub=false; //是否使用子目录进行保存上传文件
		if($upload->upload())
		{
			$info=$upload->getUploadFileInfo();
			return $info;
		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}
	private function uplink()
	{
		$upload=new UploadFile();
		$upload->maxSize='204800';  
		$upload->savePath='./Public/Uploads/link/'; 
		$upload->saveRule= time;   
		$upload->uploadReplace=true;     
		$upload->allowExts=array('jpg','jpeg','png','gif');     //准许上传的文件后缀
		$upload->allowTypes=array('image/jpeg','image/pjpeg','image/png','image/gif','image/x-png');//准许上传的文件类型
		$upload->autoSub=false; //是否使用子目录进行保存上传文件
		if($upload->upload())
		{
			$info=$upload->getUploadFileInfo();
			return $info;
		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}
	private function upthumb()
	{
		$upload=new UploadFile();
		$upload->maxSize='204800';  
		$upload->savePath='./Public/Uploads/';       
		$upload->saveRule= time;   
		$upload->uploadReplace=true;     
		$upload->allowExts=array('jpg','jpeg','png','gif');     //准许上传的文件后缀
		$upload->allowTypes=array('image/jpeg','image/pjpeg','image/png','image/gif','image/x-png');//准许上传的文件类型
		$upload->imageClassPath = '@.ORG.Image';
		$upload->thumb=true;   //是否开启图片文件缩略,true表示开启
		$upload->thumbMaxWidth='500';  //以字串格式来传，如果你希望有多个，那就在此处，用,分格，写上多个最大宽
		$upload->thumbMaxHeight='400';	
		$upload->thumbPrefix='thumb_';//缩略图文件前缀
		$upload->thumbPath='./Public/Uploads/thumb/' ; 
		$upload->thumbRemoveOrigin=1;  		
		if($upload->upload())
		{
			$info=$upload->getUploadFileInfo();
			return $info;
		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}
	//上传附件方法
	private function upattach()
	{
		$upload=new UploadFile();
		$upload->maxSize='2048000';  
		$upload->savePath='./Public/Uploads/attach/';       
		$upload->saveRule= time;   
		$upload->uploadReplace = true; 
		$upload->allowExts = array('zip','rar','txt','ppt','pptx','cls','clsx','doc','docx','swf','jpg','png','gif','tar.gz','.7z');     //准许上传的文件后缀
		if($upload->upload())
		{
			$info=$upload->getUploadFileInfo();
			return $info;
		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}
	//上传方法,提取公共代码
	private function upmethod($upload,$method)
	{
		if(empty($_FILES))
		{
			$this->error('必须选择上传文件');
			
		}
		$a=$this->$upload();
		if(isset($a))
		{
			if($this->$method($a))
			{
				$this->success('上传成功');
			}
			else
			{
				$this->error('插入文本框失败');
			}
		}
		else
		{
			$this->error('上传文件有异常请与系统管理员联系');
		}
		
	}
}


?>