<?php
     class CategoryAction extends Action {
     	
     	public function index(){
     		
     		$Category=D("Category");
			$list=$Category->relation(true)->order('displayorder asc')->findAll();
			$this->assign('list',$list);
			$this->display();
     	}
     	
	     public function direct(){
			
			$id = $_GET["id"];
			if($id){
				$this->assign("page", D("Category")->find($id));
			}
			
			
			$this->display();
		}
		
		public function option()
		{
			$Page = D("Category");
			$id = $_POST["id"];
	//		dump($id);
			if($id){
				// 根据表单提交的POST数据创建数据对象
				$Page->create();
				$Page->save();
				$this->assign('jumpUrl',__URL__);
				$this->success(L('_INSERT_SUCCESS_'));
			}else{
				if($Page->create()) { 
		            if($Page->add()){ 
		            	$this->assign('jumpUrl',__URL__);
						$this->success(L('_INSERT_SUCCESS_'));
		            }else{ 
		               	$this->error(L('_INSERT_FAIL_')); 
		            } 
		        }else{ 
		            $this->error($Page->getError()); 
		        }
			}
			 
		}
		
		public function delete()
		{
			$id = $_GET["id"];
			$Category = D("Category");
			
			if($Category->where('id='.$id)->delete()) { 
	            $this->success('删除成功！');
	        }else{ 
	            $this->error($Category->getError()); 
	        } 
		}
		
     	public function article(){
     		
     		$id = $_GET['id'];
     		$Category = D("Category");
			$list = $Category->order('displayorder asc')->where('category_id='.$category)->findAll();
			$this->assign('list',$list);
			dump($list);
			$this->display();
     	}
     	
     	
     	
    }
?>