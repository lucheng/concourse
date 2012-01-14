<?php
     class CategoryAction extends Action {
     	
     	public function index(){
     		
     		$Category=D("Category");
			$list=$Category->relation(true)->order('displayorder asc')->where('parent_id=0')->findAll();
			$this->assign('list',$list);
			$this->display();
     	}
     	
	     public function direct(){
			
			$id = $_GET["id"];
			if($id){
				$this->assign("page", D("Category")->find($id));
			}
			import("ORG.Net.Keditor");
			$ke=new Keditor();
	//		$ke->items="little";//定义工具栏项目，little表示精简。
			
	    	$ke->id="content";//指定textarea的id
	    	$ke->fileManagerJson=__APP__."/Keditor/filemanager";//浏览过程
	        $ke->imageUploadJson=__APP__."/Keditor/upload";//上传过程
			$ke->allowFileManager=true;//允许浏览服务器图片，注意，为true或false的属性值，不要使用引号
	    	$ke->imgid="img";//
	//    	$ke->upload(__ROOT__.'/Public/Upload/', 'http://localhost/chinaihe/Public/Upload/',array('gif', 'jpg', 'jpeg', 'png', 'bmp'),1000000);
	    	$ke->jspath=__ROOT__."/Public/editor/kindeditor.js";
	    	
	    	$keshow=$ke->show();//生成js代码
	    	$this->assign("keshow",$keshow);
	    	
	    	$ke->id="content2";//指定textarea的id
	    	$keshow2=$ke->show();//生成js代码
	    	$this->assign("keshow2",$keshow2);
			
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