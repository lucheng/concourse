<?php
class IntroductAction extends Action {
     	
	public function index(){
		
		$Introduction = D("Pages")->find(1);
		$this->assign("intro",$Introduction);
		
		import("ORG.Net.Keditor");
		$ke=new Keditor();
		$ke->id="content";//指定textarea的id
		$keshow=$ke->show();//生成js代码
		$this->assign("keshow",$keshow);
		$this->display();
	}
	
	public function update(){
		
		$Pages = D("Pages");
		$id = $_POST["id"];
//		dump($id);
		if($id){
			// 根据表单提交的POST数据创建数据对象
			$Pages->create();
			$Pages->save();
			$this->assign('jumpUrl',__URL__);
			$this->success(L('_UPDATE_SUCCESS_'));
		}
	}
	
	
}
?>