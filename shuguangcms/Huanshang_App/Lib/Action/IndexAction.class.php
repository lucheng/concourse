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
		$id=intval($_REQUEST['id']);
		$module=intval($_REQUEST['module']);
		if ($id>0){
			$mapc['cid']=$id;
		}
		
		if ($module>0){
			$mapc['module']=$module;
		}
		
		$Product=D("Product");
		$count=$Product->count($mapc);
		//if($count<=1)$this->error('此类别无产品');
		import("ORG.Util.Page");
		$listRows=6;
		$p=new page($count,$listRows);
		$list=$Product->findAll($mapc,'*','id desc',$p->firstRow.','.$p->listRows);
		//$list=$p->order('pid desc')->limit("$p->firstRow.','.$p->listRows")->findAll();
		$page = $p->show();
		/**/
		//分类
		$map['module']=1;//分类
		$Category=D('Category')->order("displayorder desc")->where($map)->findall();
//		dump($list);
		$this->assign('count',$count);
		$this->assign('page',$page);
		$this->assign('list', $list);
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
		
//		$Category=D('Category')->order('id desc')->findall();
		
		$this->assign('Scroll',$Scroll);
		$this->assign('Announce',$Announce);
		$this->assign('Link',$Link);
		$this->assign('article',$Articles);
		$this->assign('pic',$Pic);
		$this->assign('product',$Product);
		$this->assign('Category',$Category);
		$this->assign('intro',$intro);
		$this->display();
	}	
}
?>