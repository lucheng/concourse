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
class ShopCategoryAction extends CommonAction
{
	public function index()
	{
		
		//列表过滤器，生成查询Map对象
		$map = $this->_search ();
		$map['parent_id'] = intval($_REQUEST['parent_id']);
		if (method_exists ( $this, '_filter' )) {
			$this->_filter ( $map );
		}
		$name=$this->getActionName();
		$model = D ($name);
		if (! empty ( $model )) {
			$this->_list ( $model, $map );
		}
		$list = $this->get("list");
		
		$result = array();
		$row = 0;
		foreach($list as $k=>$v)
		{
			
			$v['level'] = -1;
			$v['name'] = $v['name'];
			$result[$row] = $v;
			$row++;
			$sub_cate = M(MODULE_NAME)->where(array("cate_id"=>array("in",D(MODULE_NAME)->getChildIds($v['cate_id'], $pk_str='cate_id' , $pid_str ='parent_id'))))->findAll();
			
			$sub_cate = D(MODULE_NAME)->toFormatTree($sub_cate,'name','cate_id','parent_id');
			foreach($sub_cate as $kk=>$vv)
			{
				$vv['name']	=	$vv['title_show'];
				$result[$row] = $vv;
				$row++;
			}
		}

		$this->assign("list",$result);
		$this->display ();
		return;
	}
	
	public function insert()
	{
		$_POST['create_time'] = gmtTime();
		parent::insert();
	}
	
	public function add()
	{	
		$this->assign("newsort",M(MODULE_NAME)->max("sort")+1);
		$cate_tree = M(MODULE_NAME)->findAll();
		$cate_tree = D(MODULE_NAME)->toFormatTree($cate_tree,'name','cate_id','parent_id');
		$this->assign("cate_tree",$cate_tree);
		parent::add();
	}
	public function edit()
	{	
		$id = intval($_REQUEST['cate_id']);
		
		$ids = D(MODULE_NAME)->getChildIds($id,'cate_id','parent_id');
		$ids[] = $id;
		

		$condition['cate_id'] = array('not in',$ids);

		$cate_tree = M(MODULE_NAME)->where($condition)->findAll();
		$cate_tree = D(MODULE_NAME)->toFormatTree($cate_tree,'name','cate_id','parent_id');
		$this->assign("cate_tree",$cate_tree);
		parent::edit();
	}	
	public function remove()
	{
		//删除指定记录
		$result = array('isErr'=>0,'content'=>'');
		$id = $_REQUEST['id'];
		if(!empty($id))
		{
			$name=$this->getActionName();
			$model = D($name);
			$pk = $model->getPk ();
			$condition = array ($pk => array ('in', explode ( ',', $id ) ) );
			if($model->where(array ("parent_id" => array ('in', explode ( ',', $id ) ) ))->count()>0)
			{
				$result['isErr'] = 1;
				$result['content'] = L('SUB_CATE_EXIST');
				die(json_encode($result));
			}
			
			if(M("Shop")->where(array ("cate_id" => array ('in', explode ( ',', $id ) ) ))->count()>0)
			{
				$result['isErr'] = 1;
				$result['content'] = L('SUB_SHOP_EXIST');
				die(json_encode($result));
			}
			if(false !== $model->where ( $condition )->delete ())
			{
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

?>