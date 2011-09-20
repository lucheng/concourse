<?php 
class SearchAction extends GlobalAction 
{
	public function index()
	{
		$keyword=$_POST['keyword'];

		$data=array();
		$keyword=$_POST['keyword'];
		$keywords=$_REQUEST['keywords'];
		if($keyword){
			$data['subject']=array('like','%'.$keyword.'%');
			$data['spec']=array('like','%'.$keyword.'%');
			$data['size']=array('like','%'.$keyword.'%');
			$data['keywords']=array('like','%'.$keyword.'%');
			$data['content']=array('like','%'.$keyword.'%');
			$data['meno']=array('like','%'.$keyword.'%');
			$data['postdate']=array('like','%'.$keyword.'%');
		}
		$data['_logic']='or';
//		dump($data);
		$Product=D("Product");
		$count=$Product->count($data);
		//if($count<=1)$this->error('此类别无产品');
		import("ORG.Util.Page");
		$listRows=16;
		$p=new page($count,$listRows);
		$list=$Product->findAll($data,'*','id desc',$p->firstRow.','.$p->listRows);
		//$list=$p->order('pid desc')->limit("$p->firstRow.','.$p->listRows")->findAll();
		$page = $p->show();	
		/**/
		//分类
		$map['module']=1;//分类
		$Category=D('Category')->order("id desc")->where($map)->findall();
		
		$this->assign('titler','产品中心');
		$this->assign('module',$module);
		$this->assign('cate',$Category);
		$this->assign('Product',$Product);
		$this->assign('count',$count);
		$this->assign('page',$page);
		$this->assign('list', $list);
		$this->display();
	}
}
?>