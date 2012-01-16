<?php
class ArticleAction extends Action{
	
	public function index()
	{	
		$category_id = $_GET["id"];
		
		$Article = M("Article"); // 实例化User对象
		import("ORG.Util.Page"); // 导入分页类
		$count = $Article->count(); // 查询满足要求的总记录数
		$Page = new Page($count,10); // 实例化分页类传入总记录数和每页显示的记录数
		$show = $Page->show(); // 分页显示输出
		// 进行分页数据查询注意limit方法的参数要使用Page类的属性
		$condition = new stdClass(); 
		$condition->category_id = $category_id;  // 查询name的值为thinkphp的记录
		$list = $Article->where($condition)->order('id')->limit($Page->firstRow.','.$Page->listRows)->select();
		
		$this->assign('list',$list); // 赋值数据集
		$this->assign('page',$show); // 赋值分页输出
		
		$this->assign('cid', $category_id); // 赋值数据集
		
		$this->display();
	}
	
	public function direct(){
		
		$id = $_GET["id"];
		$cid = $_GET["cid"];
		if($id){
			$this->assign("article", D("Article")->find($id));
		}
		$this->assign('cid', $cid); // 赋值数据集
		
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
		
		$this->display();
		
	}
	
	public function option()
	{
		$Link = D("Article");
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