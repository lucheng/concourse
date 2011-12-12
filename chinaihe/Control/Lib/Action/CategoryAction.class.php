<?php
     class CategoryAction extends Action {
     	
     	public function index(){
     		
     		$this->assign("title", "文章分类");
     		$Category=D("Category");
			$list=$Category->relation(true)->order('displayorder asc')->where('parent_id=0')->findAll();
			$this->assign('list',$list);
			$this->display();
     	}
     	
     	public function article(){
     		
     		$this->assign("title", "文章分类");
     		$category = $_GET['cid'];
     		$Product = D("Product");
			$list = $Product->order('displayorder asc')->where('category_id='.$category)->findAll();
			$this->assign('list',$list);
			dump($list);
			$this->display();
     	}
     	
    }
?>