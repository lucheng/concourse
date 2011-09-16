<?php 
class PagesAction extends GlobalAction 
{
	public function read()
	{
		$id=intval($_REQUEST['id']);
		$Pages=D("Pages");
		$page=$Pages->find($id);
		$list=$Pages->findall();
		$this->assign('pages',$list);
		$this->assign('page',$page);
		$this->display();
	}
	public function about()
	{
		$Pages=D("Pages");
		$condition['id']=17;
		$list=$Pages->find($condition);
		$this->assign('vo',$list);
		$this->display();
	}

}
?>