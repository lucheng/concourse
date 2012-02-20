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
 * 分享
 +------------------------------------------------------------------------------
 */
class ShareAction extends CommonAction
{
	public function index()
	{
		Vendor('common');
		$where = '';
		$parameter = array();
		$keyword = trim($_REQUEST['keyword']);
		$uname = trim($_REQUEST['uname']);
		$type = trim($_REQUEST['type']);
		$share_data = trim($_REQUEST['share_data']);
		$cate_id = intval($_REQUEST['cate_id']);
		
		if(!empty($keyword))
		{
			$this->assign("keyword",$keyword);
			$parameter['keyword'] = $keyword;
			$where .= " AND (s.title LIKE '%$keyword%' OR s.content LIKE '%$keyword%')";
		}
		
		if(!empty($uname))
		{
			$this->assign("uname",$uname);
			$parameter['uname'] = $uname;
			$users = D("User")->where("user_name like '%".$uname."%'")->findAll();
			foreach($users as $u)
			{
				$uids[] = $u['uid'];
			}
			
			if(count($uids)>0)
				$where .= " AND s.uid IN (".implode(',',$uids).")";
		}
		
		if(!empty($type) && $type != 'all')
		{
			$this->assign("type",$type);
			$parameter['type'] = $type;
			$where .= " AND s.type = '$type'";
		}
		
		if(!empty($share_data) && $share_data != 'all')
		{
			$this->assign("share_data",$share_data);
			$parameter['share_data'] = $share_data;
			$where .= " AND s.share_data = '$share_data'";
		}
		
		if($cate_id != 0)
		{
			$this->assign("cate_id",$cate_id);
			$parameter['cate_id'] = $cate_id;

			if($cate_id > 0)
			{
				$child_ids = D('GoodsCategory')->getChildIds($cate_id,'cate_id');
				$child_ids[] = $cate_id;
				
				$where .= " AND sc.cate_id IN (".implode(',',$child_ids).")";
			}
			else
				$where .= " AND sc.cate_id IS NULL";
		}
		
		$model = M();
		
		if(!empty($where))
			$where = 'WHERE 1' . $where;
		
		$sql = 'SELECT COUNT(s.share_id) AS scount 
			FROM '.C("DB_PREFIX").'share AS s 
			LEFT JOIN '.C("DB_PREFIX").'share_category AS sc ON sc.share_id = s.share_id '.$where;
		
		$count = $model->query($sql);
		$count = $count[0]['scount'];
		
		$sql = 'SELECT s.* 
			FROM '.C("DB_PREFIX").'share AS s 
			LEFT JOIN '.C("DB_PREFIX").'share_category AS sc ON sc.share_id = s.share_id '.$where;
		$this->_sqlList($model,$sql,$count,$parameter,'s.share_id');
		
		$root_id = D('GoodsCategory')->where('is_root = 1')->getField('cate_id');
		$root_id = intval($root_id);
		$root_ids = D('GoodsCategory')->getChildIds($root_id,'cate_id');
		$root_ids[] = $root_id;

		$cate_list = D('GoodsCategory')->where('cate_id not in ('.implode(',',$root_ids).')')->order('sort asc')->findAll();
		$cate_list = D('GoodsCategory')->toFormatTree($cate_list,'cate_name','cate_id','parent_id');
		$this->assign("cate_list",$cate_list);
		$this->display ();
		return;
	}
	function edit()
	{
		Vendor('common');
		$id = $_REQUEST ['share_id'];
		$share = D ("Share")->getById ( $id );
		if(!$share)
		{
			$this->error(L("NO_SHARE"));
		}
		$share['share_photo'] = FDB::fetchAll("select photo_id,img from ".FDB::table("share_photo")." where share_id = ".$share['share_id']);
		$share['share_goods'] = FDB::fetchAll("select goods_id,img,name,url,price from ".FDB::table("share_goods")." where share_id = ".$share['share_id']);
		$share['parent_share'] = FDB::fetchFirst("select u.user_name,s.share_id,s.content,s.uid,s.collect_count,s.relay_count,s.comment_count,s.create_time,s.type,s.title from ".FDB::table("share")." as s left join ".FDB::table("user")." as u on u.uid = s.uid where s.share_id = ".$share['parent_id']);
		
		$share['share_tags'] = FDB::resultFirst("select group_concat(tag_name SEPARATOR ' ') from ".FDB::table("share_tags")." where share_id = ".$share['share_id']);


		$root_id = D('GoodsCategory')->where('is_root = 1')->getField('cate_id');
		$root_id = intval($root_id);
		$root_ids = D('GoodsCategory')->getChildIds($root_id,'cate_id');
		$root_ids[] = $root_id;

		$category = D('GoodsCategory')->where('cate_id not in ('.implode(',',$root_ids).')')->order('sort asc')->findAll();
		$category = D('GoodsCategory')->toFormatTree($category,'cate_name','cate_id','parent_id');

		$share_category = FDB::fetchAll("select c.cate_id,c.cate_name from ".FDB::table("share_category")." as sc left join ".FDB::table("goods_category")." as c on sc.cate_id = c.cate_id where sc.share_id = ".$share['share_id']);
		
		$this->assign ( 'category', $category );
		$this->assign ( 'share_category', $share_category );
		$this->assign ( 'share', $share );
		$this->display ();
	}
	public function remove()
	{
		//删除指定记录
		Vendor('common');
		$result = array('isErr'=>0,'content'=>'');
		$id = $_REQUEST['id'];
		if(!empty($id))
		{
			$ids =  explode ( ',', $id );
			foreach($ids as $iid)
			{
				FS("Share")->deleteShare($iid);
			}
			$this->saveLog(1,$id);
		}
		else
		{
			$result['isErr'] = 1;
			$result['content'] = L('ACCESS_DENIED');
		}
		die(json_encode($result));
	}

	public function removePhoto()
	{
		$photo_id = intval($_REQUEST['photo_id']);
		$photo_data = D("SharePhoto")->where("photo_id=".$photo_id)->find();
		D("SharePhoto")->where("photo_id=".$photo_id)->delete();
		//开始同步data
		$this->init_share_data($photo_data['share_id']);
		$err = D()->getDbError();
		if($err)
		{
			$result['isErr'] = 1;
			$result['content'] = $err;
		}
		else
		{
			$result['isErr'] = 0;
		}
		die(json_encode($result));
	}

	public function removeGoods()
	{
		$goods_id = intval($_REQUEST['goods_id']);
		$goods_data = D("ShareGoods")->where("goods_id=".$goods_id)->find();
		D("ShareGoods")->where("goods_id=".$goods_id)->delete();
		//开始同步data
		$this->init_share_data($goods_data['share_id']);
		$err = D()->getDbError();
		if($err)
		{
			$result['isErr'] = 1;
			$result['content'] = $err;
		}
		else
		{
			$result['isErr'] = 0;
		}
		die(json_encode($result));
	}


	public function update() {
		vendor("common");
		//B('FilterString');
		$name=$this->getActionName();
		$model = D ( $name );
		if (false === $data = $model->create ()) {
			$this->error ( $model->getError () );
		}

		// 更新数据
		$list=$model->save ();
		$id = $data[$model->getPk()];
		if (false !== $list) {
			$tags = ($_REQUEST['tags']);
			$tags = explode(" ",$tags);

            FS('Share')->updateShareTags($data['share_id'],array('user'=>implode(' ',$tags)));
			
			//更新分类
			$cates_arr = explode(",",$_REQUEST['share_cates']);
			foreach($cates_arr as $k=>$v)
			{
				$cates[] = intval($v);
			}

			FDB::query("delete from ".FDB::table("share_category")." where share_id = ".$data['share_id']);
			foreach($cates as $cate_id)
			{
				if(intval($cate_id) > 0)
                {
                    FDB::query("insert into ".FDB::table("share_category")."(`share_id`,`cate_id`) values($data[share_id],$cate_id)");
                }
			}

			//成功提示
			$this->saveLog(1,$id);
			//$this->assign ( 'jumpUrl', Cookie::get ( '_currentUrl_' ) );
			$this->success (L('EDIT_SUCCESS'));
		} else {
			//错误提示
			$this->saveLog(0,$id);
			$this->error (L('EDIT_ERROR'));
		}
	}

	private function init_share_data($share_id)
	{
		$photo_count = D("SharePhoto")->where("share_id=".$share_id)->count();
		$goods_count = D("ShareGoods")->where("share_id=".$share_id)->count();
		if($photo_count==0&&$goods_count==0)
		{
			$share_data = "default";
		}
		elseif($photo_count==0&&$goods_count>0)
		{
			$share_data = "goods";
		}
		elseif($photo_count>0&&$goods_count==0)
		{
			$share_data = "photo";
		}
		else
		{
			$share_data = "goods_photo";
		}
		D("Share")->where("share_id=".$share_id)->setField("share_data",$share_data);
	}

}
?>