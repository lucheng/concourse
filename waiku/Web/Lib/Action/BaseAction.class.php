<?php
     class BaseAction extends Action {
     	
     	public function _initialize(){
		
     		$category = D("Category")->order("displayorder")->findAll();
     		$this->assign("category", $category);
     	}
     	
    }
?>