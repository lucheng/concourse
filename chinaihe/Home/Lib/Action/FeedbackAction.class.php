<?php
class FeedbackAction extends BaseAction
{
    public function add()
    {
    	$Feedback = D("Feedback");
    	
    	if($Feedback->create()) {
    		$Feedback->postdate = time();
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
}
?>