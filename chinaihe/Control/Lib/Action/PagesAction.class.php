<?php
class PagesAction extends BaseAction {
     	
	public function index(){
		
		$Pages = M("Pages"); // 实例化User对象
		import("ORG.Util.Page"); // 导入分页类
		$count = $Pages->count(); // 查询满足要求的总记录数
		$Page = new Page($count,10); // 实例化分页类传入总记录数和每页显示的记录数
		$show = $Page->show(); // 分页显示输出
		// 进行分页数据查询注意limit方法的参数要使用Page类的属性
		$list = $Pages->order('id')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list); // 赋值数据集
		$this->assign('page',$show); // 赋值分页输出
		
		$this->display();
		
	}
	
	public function direct(){
		
		$id = $_GET["id"];
		if($id){
			$this->assign("page", D("Pages")->find($id));
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
		$Page = D("Pages");
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
		$Link = D("Pages");
		
		if($Link->where('id='.$id)->delete()) { 
            $this->success('删除成功！');
        }else{ 
            $this->error($Link->getError()); 
        } 
	}
	
	
}
?>