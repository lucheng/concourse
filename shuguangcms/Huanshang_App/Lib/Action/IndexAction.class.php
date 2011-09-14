<?php
class IndexAction extends GlobalAction 
{
	public function Index(){
		
		$Article=D("Article");	
		$Articles=$Article->order('id desc')->limit('5')->findall();
		if (S('pic')) {
			$Pic=S('pic');
		}else{
			$Pic=$Article->where("attachment!=''")->order('id desc')->limit('6')->findall();
			S('pic',$Pic,C('SDATA_TIME'));
		}
		//公司简介
		$intro=D('Pages')->where('id=1')->find();
		//产品
		$Product=D('Product')->limit('8')->order('id desc')->findall();
		//链接
		if (S('link')) {
			$Link=S('link');
		}else{
			$Link=D('Link')->findall();
			S('link',$Link,C('SDATA_TIME'));
		}
		//公告
		$Announce=D('Announce')->order('id desc')->limit('8')->findall();
		//幻灯
		$Scroll=D('Scroll')->limit('5')->order('orders desc')->findall();
		
		$Category=D('Category')->order('id desc')->findall();
		
		$this->assign('Scroll',$Scroll);
		$this->assign('Announce',$Announce);
		$this->assign('Link',$Link);
		$this->assign('article',$Articles);
		$this->assign('pic',$Pic);
		$this->assign('Product',$Product);
		$this->assign('Category',$Category);
		$this->assign('intro',$intro);
		$this->display();
	}	
}
?>