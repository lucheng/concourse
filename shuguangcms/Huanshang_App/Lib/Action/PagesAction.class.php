<?php 
class PagesAction extends GlobalAction 
{
/*	public function about()
	{
		$id=intval($_REQUEST['id']);
		$module=intval($_REQUEST['module']);
		$Pages=D("Pages");
		$page=$Pages->find($id);
		$list=$Pages->findall();
		$this->assign('pages',$list);
		$this->assign('page',$page);
		$this->display("index");
	}*/
	public function index()
	{
//		$condition = new HashMap();
		
		$id=intval($_REQUEST['id']);
		$module=intval($_REQUEST['module']);
		$Pages=D("Pages");
		if ($module === 1){
			$this->assign("titler", "公司介绍");
		}else if($module === 2){
			$this->assign("titler", "品牌介绍");
		}else if($module === 3){
			$this->assign("titler", "订购流程");
		}else if($module === 4){
			$this->assign("titler", "代理加盟");
		}
		$condition['module']=$module;
		
		$list=$Pages->order("id asc")->findAll($condition);
		$page=$Pages->find($id);
		
		$this->assign('module',$module);
		$this->assign('pages',$list);
		$this->assign('page',$page);
		$this->display();
	}

}
?>