<?php
class LinkAction extends Action{
	
	public function index()
	{	
		$Link = M("Link"); // 实例化User对象
		import("ORG.Util.Page"); // 导入分页类
		$count = $Link->where("status=1")->count(); // 查询满足要求的总记录数
		$Page = new Page($count,5); // 实例化分页类传入总记录数和每页显示的记录数
		$show = $Page->show(); // 分页显示输出
		// 进行分页数据查询注意limit方法的参数要使用Page类的属性
		$list = $Link->where('status=1')->order('orders')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list); // 赋值数据集
		$this->assign('page',$show); // 赋值分页输出
		$this->display(); // 输出模板
	}
	
	public function direct(){
		
		$id = $_GET["id"];
		if($id){
			$this->assign("link", D("Link")->find($id));
		}
		$this->display();
		
	}
	
	public function option()
	{
		$Link = D("Link");
		$id = $_POST["id"];
//		dump($id);
		if($id){
			// 根据表单提交的POST数据创建数据对象
			$Link->create();
			$Link->save();
			$this->assign('jumpUrl',__URL__);
			$this->success(L('_INSERT_SUCCESS_'));
		}else{
			if($Link->create()) { 
				$Link->postdate =  time();
	            if($Link->add()){ 
	            	$this->assign('jumpUrl',__URL__);
					$this->success(L('_INSERT_SUCCESS_'));
	            }else{ 
	               	$this->error(L('_INSERT_FAIL_')); 
	            } 
	        }else{ 
	            $this->error($Link->getError()); 
	        }
		}
		 
	}
	
	public function delete()
	{
		$id = $_GET["id"];
		$Link = D("Link");
		
		if($Link->where('id='.$id)->delete()) { 
            $this->success(L('_INSERT_SUCCESS_'));
        }else{ 
            $this->error($Link->getError()); 
        } 
	}
	
}
?>