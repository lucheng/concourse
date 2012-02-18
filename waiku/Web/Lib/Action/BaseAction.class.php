<?php
     class BaseAction extends Action {
     	
     	private $et;
     	public function _initialize(){
		
     		$_SESSION["et"];
     		//网站头部
			R('Public','head');
			//友情链接
			$link=M('link');
			$map['islogo'] = 0;
			$map['status'] = 1;
			$lk = $link->where($map)->field('url,title')->order('rank')->select();
			$this->assign('link',$lk);
			
			//幻灯内容
			$flash = M('flash');
			$hd = $flash->where('status=1')->order('rank asc')->select();
			$this->assign('hd',$hd);
			
			unset($hd,$flash,$link,$map);
			
     	}
     	
    }
?>