<?php
class PagesAction extends BaseAction
{
    public function index(){
    	$page = $_GET["page"];
    	$this->display($page);
    }
	
    public function expert()
    {
    	$User = M("User"); // 实例化User对象

		// 查找status值为1的用户数据以创建时间排序返回10条数据
		
		$list = $User->where('status=1')->order('create_time')->limit(1)->select();

    	
        $this->display();
    }
    
	public function introduction()
    {
        $this->display();
    }
    
	public function connectus()
    {
        $this->display();
    }
    
}
?>