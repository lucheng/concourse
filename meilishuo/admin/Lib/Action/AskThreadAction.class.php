<?php
// +----------------------------------------------------------------------
// | 方维购物分享网站系统 (Build on ThinkPHP)
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: awfigq <awfigq@qq.com>
// +----------------------------------------------------------------------
/**
 +------------------------------------------------------------------------------

 +------------------------------------------------------------------------------
 */
class AskThreadAction extends CommonAction
{
	public function index()
	{
		vendor("common");
		parent::index();
	}
	
	public function edit()
	{
		$cate_tree = M("Ask")->findAll();
		$this->assign("cate_tree",$cate_tree);		
		Cookie::set ( '_currentUrl_',NULL );
		parent::edit();
	}
	
	public function remove()
	{
		//删除指定记录
		Vendor("common");
		$result = array('isErr'=>0,'content'=>'');
		$id = $_REQUEST['id'];
		if(!empty($id))
		{
			$name=$this->getActionName();
			$model = D($name);
			$pk = $model->getPk ();
			$condition = array ($pk => array ('in', explode ( ',', $id ) ) );
			$res = $model->where ( $condition )->findAll();
		
			foreach($res as $item)
			{						
				FS("Share")->deleteShare(intval($item['share_id']));				
			}
			M("AskPost")->where($condition)->delete();
			if(false !== $model->where ( $condition )->delete ())
			{
				//更新会员统计与贴子分类统计				
				foreach($res as $item)
				{
					FDB::query("update ".FDB::table("user_count")." set ask = ask - 1 where uid = ".intval($item['uid']));
					FDB::query("update ".FDB::table("ask")." set thread_count = thread_count - 1 where aid = ".intval($item['aid']));
				}
				$this->saveLog(1,$id);
			}
			else
			{
				$this->saveLog(0,$id);
				$result['isErr'] = 1;
				$result['content'] = L('REMOVE_ERROR');
			}
		}
		else
		{
			$result['isErr'] = 1;
			$result['content'] = L('ACCESS_DENIED');
		}
		
		die(json_encode($result));
	}
}


function getAskName($aid)
{
	return M("Ask")->where("aid=".$aid)->getField("name");
}

function getPostCount($count,$tid)
{
	if($count>0)
	return "(".$count.")&nbsp;&nbsp; <a href='".u("AskPost/index",array("tid"=>$tid))."'>".l("CHECK_REPLY")."</a>";
	else
	return $count;
}

?>