<?php
class FeedbackAction extends Action 
{
	public function index()
	{
		$reply = $_GET["reply"];
		$Feedback=D("Feedback");
		
		import("ORG.Util.Page"); // 导入分页类
		$count = $Feedback->count(); // 查询满足要求的总记录数
		$Page = new Page($count,10); // 实例化分页类传入总记录数和每页显示的记录数
		$show = $Page->show(); // 分页显示输出
		// 进行分页数据查询注意limit方法的参数要使用Page类的属性
		$condition = new stdClass(); 
		$condition->reply = $reply;  // 查询name的值为thinkphp的记录
		if($reply){
			$list = $Feedback->where($condition)->order('id')->limit($Page->firstRow.','.$Page->listRows)->select();
		}else {
			$list = $Feedback->order('id')->limit($Page->firstRow.','.$Page->listRows)->select();
		}
		
		$this->assign('list',$list); // 赋值数据集
		$this->assign('page',$show); // 赋值分页输出
		
		$this->assign('reply', $reply); // 赋值数据集
		
		$this->display();
		
		
		
	}
	
	public function add(){
		$this->display();
	}
	
	public function adds()
	{
        $Feedback=D("Feedback");
        if($Feedback->create()) { 
            if($Feedback->add()){ 
            	$this->assign('jumpUrl',__URL__);
				$this->success(L('_INSERT_SUCCESS_'));
            }else{ 
                $this->error(L('_INSERT_FAIL_')); 
            } 
        }else{ 
            $this->error($Feedback->getError()); 
        } 
 
	}
	public function edit()
	{
		$id=intval($_GET["id"]);
		if (!$id) $this->error(L('_SELECT_NOT_EXIST_'));
		$Feedback=D("Feedback");
		$list=$Feedback->find($id);
		if (!$list) $this->error(L('_SELECT_NOT_EXIST_'));
		$this->assign('vo',$list);
		$this->display();
	}
	public function edits()
	{
		$id=intval($_POST['id']);
		if (!$id) $this->error(L('_SELECT_NOT_EXIST_'));
		$Feedback=D("Feedback");
		if($Feedback->create()) { 
            if($Feedback->save()){ 
            	$this->assign('jumpUrl',__URL__);
				$this->success(L('_UPDATE_SUCCESS_'));
            }else{ 
                $this->error(L('_UPDATE_FAIL_')); 
            } 
        }else{ 
            $this->error($Feedback->getError()); 
        } 
	}
	public function reply()
	{
		$id=intval($_GET["id"]);
		if (!$id) $this->error(L('_SELECT_NOT_EXIST_'));
		$Feedback=D("Feedback");
		$list=$Feedback->find($id);
		if (!$list) $this->error(L('_SELECT_NOT_EXIST_'));
		$this->assign('vo',$list);
		$this->display();
	}

	public function replysave()
	{
		$data=$_POST;
		$Feedback=D("Feedback");
		$data['replydate']=strtotime($data['replydate']);
		if($Feedback->create()) { 
			$Feedback->ischecked=1;
            if($Feedback->save()){ 
            	$this->assign('jumpUrl',__URL__);
				$this->success(L('_UPDATE_SUCCESS_'));
            }else{ 
                $this->error(L('_UPDATE_FAIL_')); 
            } 
        }else{ 
            $this->error($Feedback->getError()); 
        }		
	}
	public function submit(){
		$this->_subAction();
	}
	
}
?>