<?php 
class PagesAction extends GlobalAction 
{
	public function read()
	{
		$id=intval($_REQUEST['id']);
		$Pages=D("Pages");
		$list=$Pages->find($id);
		$this->assign('vo',$list);
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