<?php
class PagesAction extends BaseAction
{
    public function expert()
    {
    	$Pages = M("Pages"); // 实例化User对象
		
    	if($_SESSION['isenglish']==0){
			$list = $Pages->find(1);//中文版本
		}else{
			$list = $Pages->find(2);//英文版本
		}
		$this->assign("list", $list);
        $this->display();
    }
    
	public function introduction()
    {
    	$Pages = M("Pages"); // 实例化User对象
		
    	if($_SESSION['isenglish']==0){
			$list = $Pages->find(3);//中文版本
		}else{
			$list = $Pages->find(4);//英文版本
		}

		$this->assign("list", $list);
        $this->display();
    }
    
	public function connectus()
    {
    	$Pages = M("Pages"); // 实例化User对象
		
    	if($_SESSION['isenglish']==0){
			$list = $Pages->find(5);//中文版本
		}else{
			$list = $Pages->find(6);//英文版本
		}

		$this->assign("list", $list);
        $this->display();
    }
    
}
?>