<?php
class PagesAction extends BaseAction
{
    public function index(){
    	$page = $_GET["page"];
    	$this->display($page);
    }
	
    public function expert()
    {
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