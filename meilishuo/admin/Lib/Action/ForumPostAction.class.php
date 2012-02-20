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
class ForumPostAction extends CommonAction
{
	public function index()
	{
		vendor("common");
		parent::index();
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
			$count = $model->where ( $condition )->count();
			$res = $model->where ( $condition )->findAll();
		
			foreach($res as $item)
			{						
				FS("Share")->deleteShare(intval($item['share_id']));				
			}
			
			if(false !== $model->where ( $condition )->delete ())
			{
				foreach($res as $item)
				{						
					FDB::query("update ".FDB::table("forum_thread")." set post_count = post_count - 1 where tid = ".intval($item['tid']));
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
	
	public function edit()
	{
		Cookie::set ( '_currentUrl_',NULL );
		parent::edit();
	}
	
}

?>