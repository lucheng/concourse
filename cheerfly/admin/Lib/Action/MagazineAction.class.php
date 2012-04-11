<?php
/**
 +------------------------------------------------------------------------------
	电子杂志
 +------------------------------------------------------------------------------
 */
class MagazineAction extends CommonAction
{
	public function index()
	{
		$where = '';
		$parameter = array();
		$keyword = trim($_REQUEST['keyword']);
		$uname = trim($_REQUEST['uname']);
		$fid = intval($_REQUEST['fid']);

		if(!empty($keyword))
		{
			$this->assign("keyword",$keyword);
			$parameter['keyword'] = $keyword;
			$where.=" AND ft.title LIKE '%".mysqlLikeQuote($keyword)."%' ";
		}

		if(!empty($uname))
		{
			$this->assign("uname",$uname);
			$parameter['uname'] = $uname;
			$match_key = segmentToUnicodeA($uname,'+');
			$where.=" AND match(u.user_name_match) against('".$match_key."' IN BOOLEAN MODE) ";
		}
		
		if($fid > 0)
		{
			$this->assign("fid",$fid);
			$parameter['fid'] = $fid;
			$where .= " AND ft.fid = $fid";
		}

		$model = M();

		if(!empty($where))
			$where = 'WHERE 1' . $where;

		$sql = 'SELECT COUNT(DISTINCT ft.tid) AS tcount
			FROM '.C("DB_PREFIX").'magazine AS ft 
			LEFT JOIN '.C("DB_PREFIX").'user AS u ON u.uid = ft.uid 
			'.$where;

		$count = $model->query($sql);
		$count = $count[0]['tcount'];

		$sql = 'SELECT ft.tid,LEFT(ft.title,80) AS title,f.name,u.user_name,ft.create_time,ft.post_count,ft.is_top,ft.is_best,
			ft.is_event
			FROM '.C("DB_PREFIX").'magazine AS ft 
			LEFT JOIN '.C("DB_PREFIX").'user AS u ON u.uid = ft.uid 
			LEFT JOIN '.C("DB_PREFIX").'magazine_category AS f ON f.id = ft.fid 
			'.$where.' GROUP BY ft.tid';
		$this->_sqlList($model,$sql,$count,$parameter,'ft.tid');
//		dump($sql);
		
		$cate_tree = M("MagazineCategory")->findAll();
//		$cate_tree = D("MagazineCategory")->toFormatTree($cate_tree,'name','fid','parent_id');
		$this->assign("cate_tree",$cate_tree);
		$this->display ();
		return;
	}

	public function add()
	{
		$cate_tree = M("MagazineCategory")->where()->findAll();
//		$cate_tree = D("Forum")->toFormatTree($cate_tree,'name','fid','parent_id');
		$this->assign("cate_tree",$cate_tree);
		Cookie::set ( '_currentUrl_',NULL );
		$this->display();
	}
	
	public function insert()
	{
        Vendor("common");
		$_POST['is_best'] = intval($_POST['is_best']);
		$_POST['is_top'] = intval($_POST['is_top']);
		$_POST['is_event'] = intval($_POST['is_event']);
		
		$name=$this->getActionName();
		$model = D ($name);
		if (false === $data = $model->create ()) {
			$this->error ( $model->getError () );
		}
		$data['create_time'] = gmtTime();
		$data['uid'] = 1;
		
		if(D('Magazine')->add($data)){
			$this->saveLog(1,$uid);
			$this->assign ( 'jumpUrl', Cookie::get ( '_currentUrl_' ) );
			$this->success (L('ADD_SUCCESS'));
		}else {
			//失败提示
			$this->saveLog(0,$uid);
			$this->error (L('ADD_ERROR'));
		}

	}
	
	public function edit()
	{
		$cate_tree = M("MagazineCategory")->where()->findAll();
		$this->assign("cate_tree",$cate_tree);
		Cookie::set ( '_currentUrl_',NULL );
		parent::edit();
	}

	public function update()
	{
        Vendor("common");
		$_POST['is_best'] = intval($_POST['is_best']);
		$_POST['is_top'] = intval($_POST['is_top']);
		$_POST['is_event'] = intval($_POST['is_event']);
        $tid = intval($_REQUEST['tid']);
        $topic = D('Magazine')->where("tid = '$tid'")->find();
		
		parent::update();
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
            $ids = explode (',',$id);
            foreach($ids as $tid)
            {
                D("Magazine")->delete($tid);
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
}


function getForumName($fid)
{
	return M("Forum")->where("fid=".$fid)->getField("name");
}

function getPostCount($count,$tid)
{
	if($count>0)
		return "(".$count.")&nbsp;&nbsp; <a href='".u("ForumPost/index",array("tid"=>$tid))."'>".l("CHECK_REPLY")."</a>";
	else
		return $count;
}

?>