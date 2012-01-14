<?php
     class IndexAction extends Action {
     	
     	public function index(){
     		$this->display();
     	}
     	
     	public function top(){
     		$this->display();
     	}
     	
     	public function left() {
     		
			$this->assign('pages', M("Pages")->order('id')->select()); // 赋值分页输出
			
			$this->assign('categories', M("Category")->order('id')->select()); // 赋值分页输出
			
			$this->display();
			
     	}
     	public function main(){
     		$this->display();
     	}
     	
     	public function today(){
     		$this->display();
     	}
     	
     	public function stuList(){
     		
     		import("ORG.Util.Page"); //导入分页类
     		$p = new Page($count,2);
     		$Stu = D('Stu');
     		$count=$Stu->count();
			$listRows=5;
			$p=new page($count,$listRows);
			$list=$Stu->findAll('category_id desc,postdate desc',$p->firstRow.','.$p->listRows);
			$p->setConfig('header','篇记录');
			$p->setConfig('prev',"上一页");
			$p->setConfig('next','下一页');
			$p->setConfig('first','<<');
			$p->setConfig('last','>>');
			$page = $p->show ();
			$this->assign('jz_res',$jz_res);
			$this->assign( "page", $page );
			$this->display();
     	}
     	
     	public function jjList(){
     		import("@.ORG.Page"); //导入分页类
     		
     		$jj = new JjModel();
			$count = $jj->count();    //计算总数
			$p = new Page ($count,10);
			$jj_res=$jj->limit($p->firstRow.','.$p->listRows)->order('jj_id desc')->findAll();
			$p->setConfig('header','篇记录');
			$p->setConfig('prev',"上一页");
			$p->setConfig('next','下一页');
			$p->setConfig('first','<<');
			$p->setConfig('last','>>');
			$page = $p->show ();
			foreach ($jj_res as $k => $v) {
				$jj_res[$k]['jj_tel'] = authcode($v['jj_tel'],DECODE);
			}
			$this->assign( "page", $page );
			$this->assign ( "jj_res", $jj_res );
			$this->display();
     	}
     	public function jzSearch(){
     	   if($_POST){
     	      	$sql = "select * from jz";
     		    $sql_count = "select count(*) as num from jz";
     		    
     			$con = ' where 1=1';
     			$jz_name = $_POST['jz_name'];
     			$jz_tel =  authcode($_POST['jz_tel'],ENCODE);
     			$jz_place =$_POST['jz_place'];
     			
     			if(!empty($jz_name)){
     				
     				$con.= " and jz_name like '%$jz_name%'";
     				$p->parameter.= "jz_name=".urlencode($jz_name);
     			}
     			if(!empty($jz_place)){
     				$con.= " and jz_place like '%$jz_place%'";
     			}
     			if(!empty($_POST['jz_tel'])){
     				$con.=" and jz_tel = '$jz_tel' ";
     			}
     		$sql=$sql.$con;
     		$sql.=" order by jz_id desc";
     		$sql_count = $sql_count.$con;
     		$jz = new JzModel();
     		$jz_res = $jz->query($sql);
     	   	foreach ($jz_res as $k => $v) {
				$jz_res[$k]['jz_tel'] = authcode($v['jz_tel'],DECODE);
			}
     		$this->assign('jz_res',$jz_res);
     		$this->display();
     		}else{
     			$this->display();
     		}
     	}
     	public function jzList(){
     		import("@.ORG.Page"); //导入分页类
     		$jz = new JzModel();
     		$count = $jz->count();
     		
			$p = new Page ($count,15);
			$jz_res = $jz->limit($p->firstRow.','.$p->listRows)->order('jz_id desc')->findAll();
			foreach ($jz_res as $k => $v) {
				$jz_res[$k]['jz_tel'] = authcode($v['jz_tel'],DECODE);
			}
			$p->setConfig('header','篇记录');
			$p->setConfig('prev',"上一页");
			$p->setConfig('next','下一页');
			$p->setConfig('first','<<');
			$p->setConfig('last','>>');
			$page = $p->show ();
			$this->assign('jz_res',$jz_res);
			$this->assign( "page", $page );
			$this->display();
     	}
     	//查看某个家长的所有家教的历史
     	public function jzinfo(){
     		if($_GET['id']){
     			$jz_id = $_GET['id'];
     			$jz = new JzModel();
     			$jz_res = $jz->relation('Jj')->where("jz_id = $jz_id")->find();
     			$jz_res['jz_tel'] = authcode($jz_res['jz_tel'],DECODE);
     			$this->assign('jz_res',$jz_res);
     			dump($jz_res);
     			$this->display();
     		}else{
     			$this->error('非法访问！');
     		}
     	}
     	//更新家长信息
     	public function jzUpdate(){
     		if($_POST){
     			$jz = new JzModel();
     			$data = array();
     			$data = $jz->create();
     			$data['jz_tel'] = authcode($data['jz_tel'],ENCODE);
     			if($jz->save($data)){
     				$this->success("修改家长信息成功！");
     			}else{
     				$this->error("修改家长信息失败！");
     			}
     		}else{
     			$this->error('非法访问！');
     		}
     	}
     	//后台添加家教
     	public function jjAdd(){
     		$this->display();
     	}
		//删除家教
		public function jjDelete(){
			if($_GET['id']){
				$jj_id = $_GET['id'];
				$jj = new JjModel();
				if($jj->delete($jj_id)){
					$this->success('删除成功');
				}else{
					$this->error('删除失败');
				}
			}else{
				$this->error('非法访问');
			}
		}
     	//添加管理员评论
     	public function jjAdminIntroAdd(){
     		if($_POST){
     			$jj = new JjModel();
     			$data = $jj->create();
     			if($jj->save($data)){
     				$this->success('提交管理员评论成功！');
     			}else{
     				$this->error('提交失败！');
     			}
     		}else{
     			$this->error("非法访问！");
     		}
     	}
     	//通过家教
     	public function jjpass(){
     		if(!empty($_GET['id'])){
     			$jj_id = $_GET['id'];
     			$data = array();
     			$data['jj_id'] = $jj_id;
     			$data['jj_pass'] = 1;
     			$jj = new JjModel();
     			if($jj->save($data)){
     				$this->success("更新成功！");
     			}else{
     				$this->error("更新失败，请重试！");
     			}
     		}else{
     			$this->error('非法访问！');
     		}
     	}
     	//给家教指定学生
     	public function jjAddStu(){
     		$jj_id = $_GET['id'];
     		if(!empty($jj_id)){
     			$this->assign('jj_id',$jj_id);
     			$this->display();
     			
     		}else{
     			$this->error("非法访问！");
     		}
     	}
     	//给学生指定家教的操作
     	public function jjAddStuDo(){
     		if($_POST){
     			$stu_jj = new Stu_jjModel();
     			$data = $stu_jj->create();
     			$data['jj_yuyue_time'] = date('Y-m-d H:i:s');
     			$jj_data['jj_id'] = $_POST['jj_id'];
     			$jj_data['jj_state'] = 1;
     			$jj = new JjModel();
     			$stu_jj->startTrans();
     			 $jj->save($jj_data);
     			if($stu_jj->add($data)){
     				$stu_jj->commit();
     				$this->success("添加教员成功！");
     			}else{
     				$stu_jj->rollback();
     				$this->error("添加教员失败！");
     			}
     		}else{
     			$this->error('非法操作！');
     		}
     	}
     	
          	public function teaSearch(){
          		$school = new SchoolModel();
          		$school_res = $school->findAll();
          		$this->assign('school_res',$school_res);
          		$xueji_res = getXueji();
			$city_res = getCity();
			
			$this->assign('xueji_res',$xueji_res);
			$this->assign('city_res',$city_res);
          		
     	   if($_POST){
     	      	$sql = "select stu.*,school.*  from stu,school";
     		    $sql_count = "select count(*) as num from stu";
     		    
     			$con = ' where 1=1 and stu.school_id = school.school_id';
     			$stu_id = $_POST['stu_id'];
     			$school_id = $_POST['school_id'];
     			$stu_xueji = $_POST['stu_xueji'];
     			$stu_tel = $_POST['stu_tel'];
     			$stu_zhuanye = $_POST['stu_zhuanye'];
     			$stu_jiguan = $_POST['stu_jiguan'];
   
     			if(!empty($stu_id)){
     				$con.= " and stu_id = $stu_id";
     			}
     	        if(!empty($school_id)){
     				$con.= " and school.school_id = $school_id";
     			}
     	        if(!empty($stu_xueji)){
     				$con.= " and stu_xueji like '%$stu_xueji%'";
     			}
     	        if(!empty($stu_tel)){
     				$con.= " and stu_tel like '%$stu_tel%'";
     			}
     	        if(!empty($stu_jiguan)){
     				$con.= " and stu_jiguan like '%$stu_jiguan%'";
     			}
     	        if(!empty($stu_zhuanye)){
     				$con.= " and stu_zhuanye like '%$stu_zhuanye%'";
     			}
     		$sql=$sql.$con;
     		$sql.=" order by stu_id desc";
     		$sql_count = $sql_count.$con;
     		$stu = new StuModel();
     		$stu_res = $stu->query($sql);
     	   	$this->assign('stu_res',$stu_res);
     		$this->display();
     		}else{
     			$this->display();
     		}
     	}
     	public function teaList(){
     		import("@.ORG.Page"); //导入分页类
     		$stu = new StuModel();
     		$count = $stu->count();
			$p = new Page ($count,15);
			$stu_res = $stu->relation('School')->limit($p->firstRow.','.$p->listRows)->order('stu_id desc')->findAll();
			$p->setConfig('header','篇记录');
			$p->setConfig('prev',"上一页");
			$p->setConfig('next','下一页');
			$p->setConfig('first','<<');
			$p->setConfig('last','>>');
			$page = $p->show ();
			$school = new SchoolModel();
			$school_res = $school->findAll();
			$xueji_res = getXueji();
			$city_res = getCity();
			
			$this->assign('xueji_res',$xueji_res);
			$this->assign('city_res',$city_res);
			$this->assign('school_res',$school_res);
			$this->assign('stu_res',$stu_res);
			$this->assign( "page", $page );
			$this->display();
     	}

		//所有学生信息
		public function teaAll() {
			$stu = new StuModel();
			$stu_res = $stu->relation('School')->order('stu_id desc')->findAll();
			$this->assign('stu_res',$stu_res);
			$this->display();
		}
		//下载
		public function teaExcel() { 
			require_once '/Lib/ORG/phpexcel/PHPExcel.php';
			require_once '/Lib/ORG/phpexcel/PHPExcel/IOFactory.php';
			$objPHPExcel = new PHPExcel();
			echo("1");
			$excelArray = $newArray;
			array_unshift($excelArray, array('pname'=>'名称', 'videonum'=>'视频个数', 'datestr'=>'日期', 'vn'=>'播放量'));
			$cellNum = count($excelArray);
			for ($ei = 0;$ei < $cellNum;$ei ++){
				$j = $ei + 1;
				$objPHPExcel->setActiveSheetIndex(0)
							->setCellValue("A".$j, iconv("gbk", "utf-8", $excelArray[$ei]['pname']))
							->setCellValue("B".$j, iconv("gbk", "utf-8", $excelArray[$ei]['videonum']))
							->setCellValue("C".$j, iconv("gbk", "utf-8", $excelArray[$ei]['datestr']))
							->setCellValue("D".$j, iconv("gbk", "utf-8", $excelArray[$ei]['vn']));
			}
						
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="教员信息.xls"');
			header('Cache-Control: max-age=0');
			
			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
			$objWriter->save('php://output'); 
			exit;
		}
     	//教员详细信息
     	public function teaInfo(){
     		if($_GET['id']){
     			$stu_id =$_GET['id'];
     			$stu = new StuModel();
     			$stu_res = $stu->relation(true)->where("stu_id = $stu_id")->find();
     			$this->assign('stu_res',$stu_res);
     			$this->display();
     		}else{
     			$this->error('非法访问！');
     		}
     	}
     	
     	//发表文章
	public function articleNew(){
		if($_POST){
			$article = new ArticleModel();
			$data = $article->create();
		 
			$article_title = $_POST['article_title'];
			$article_type_id = $_POST['article_type_id'];
			$article_keywords = $_POST['article_keywords'];
			$article_intro = $_POST['article_intro'];
			$article_content = trim($_POST['article_content']);
			
			$sql = "INSERT INTO  `article` (`article_title` ,`article_type_id` ,`article_keywords` ,`article_intro` ,`article_content` )
			VALUES ('".mysql_escape_string($article_title)."',  '$article_type_id',  '".mysql_escape_string($article_keywords)."','".mysql_escape_string($article_intro)."','$article_content')";
 			
 			echo($sql);
			if($article->execute($sql)){
				$this->redirect('articleList');
			}else{
				$this->error("添加失败！");
			}
		}
		$article_type = new Article_typeModel();
		$article_type_res = $article_type->findAll();
//		var_dump($article_type_res);
		$this->assign('article_type_res',$article_type_res);
		$this->display();
	}
	//文章显示
	public function article(){
		$article = new ArticleModel();
		$article_id =$_GET['id'];
		$article_res = $article->find($article_id);
		$this->assign('article_res',$article_res);
		$this->display();
	}
	//文章列表
	public function articleList(){
		if (!empty($_GET['t'])){
			$condition['article_type_id'] = $_GET['t'];
		}
		$article = new ArticleModel();
		$article_res = $article->where($condition)->relation(true)->findAll();
		$this->assign('article_res',$article_res);
		$this->display();
	}
     	public function mail(){
     		$this->display();
   	}
	//文章更新
	public function articleEdit(){
		if($_GET){
			$id = $_GET['id'];
			$article = new ArticleModel();
			$article_res = $article->find($id);
			$this->assign('article_res',$article_res);
			$this->display();
		}else if($_POST){
			$article = new ArticleModel();
			$article_id = $_POST['article_id'];
			$article_title = $_POST['article_title'];
			$article_content = $_POST['article_content'];
			$article_intro = $_POST['article_intro'];
			$article_keywords = $_POST['article_keywords'];
			
			$sql = "update article set article_title = '".mysql_escape_string($article_title)."',
			article_content = '$article_content',
			article_intro = '".mysql_escape_string($article_intro)."',
			article_keywords = '".mysql_escape_string($article_keywords)."' where article_id = $article_id";
			
			if($article->execute($sql)){
				$this->success('修改成功!');
			}else{
				$this->error('修改失败');
			}
		}else{
			$this->error("非法访问！");
		}
	}
//删除article
   public function articleDel(){
		if($_GET){
			$id = $_GET['id'];
			$article = new ArticleModel();
			$article_res = $article->delete($id);
			if($article_res){
				$this->success('删除成功！');
			}else{
				$this->error('删除失败！');
			}
		}
	}
   public function articleTypeList(){
   	   $article_type = new Article_typeModel();
   	   $article_type_res = $article_type->order('article_type_order desc')->findAll();
   	   $this->assign('article_type_res',$article_type_res);
   	   $this->display();
   }
   //管理文章分类的页面
   public function articleTypeAdmin(){
   	    $article_type = new Article_typeModel();
   	   $article_type_res = $article_type->order('article_type_order desc')->findAll();
   	   $this->assign('article_type_res',$article_type_res);
   	   $this->display();
   }
  //更新家教分类信息
   public function articleTypeUpdate(){
   	   if($_POST){
   	   	  $article_type = new Article_typeModel();
   	   	  $data = $article_type->create();
   	   	  dump($data);
   	   	  if($article_type->save($data)){
   	   	  	$this->success('修改成功！');
   	   	  }else{
   	   	  	$this->error('修改失败！');
   	   	  }
   	   }else{
   	   	$this->error("非法访问！");
   	   }
   }
   //添加文章分类
   public function articleTypeAdd(){
   if($_POST){
   	   	  $article_type = new Article_typeModel();
   	   	  $data = $article_type->create();
   	   	  if($article_type->add($data)){
   	   	  	$this->success('修改成功！');
   	   	  }else{
   	   	  	$this->error('修改失败！');
   	   	  }
   	   }else{
   	   	$this->error("非法访问！");
   	   }
   }
     	public function mailConfig(){
     		$this->display();
    }
    public function liuyanList(){
    	import("@.ORG.Page"); //导入分页类
    	if(isset($_GET['state'])){
    		$condition = 'liuyan_state ='.$_GET['state'] ;
    	}else{
    		$condition = 'liuyan_state >= 0';
    	}
			$liuyan = new LiuyanModel();
			$count = $liuyan->where($condition)->count();    //计算总数
			$p = new Page ($count,10);
			$liuyan_res=$liuyan->where($condition)->limit($p->firstRow.','.$p->listRows)->order('liuyan_id desc')->findAll();
			$p->setConfig('header','篇记录');
			$p->setConfig('prev',"上一页");
			$p->setConfig('next','下一页');
			$p->setConfig('first','<<');
			$p->setConfig('last','>>');
			$page = $p->show ();
			$this->assign('liuyan_res',$liuyan_res);
			$this->assign( "page", $page );
    	$this->display();
    }
    //留言回复
    public function liuyanReply(){
    	extract($_POST);
    	$liuyan = new LiuyanModel();
    	$data['liuyan_id'] = $liuyan_id;
    	$data['liuyan_reply_content'] = $liuyan_reply_content;
    	$data['liuyan_reply_time'] = date('Y-m-d H:i:s');
    	$data['liuyan_state'] = 2;
    	if($liuyan->save($data)){
    		echo "回复成功！";
    	}else{
    		echo "回复失败！";
    	}
    }

    public function liuyanDel(){
    	$liuyan_id = $_GET['id'];
    	$liuyan = new LiuyanModel();
    	if($liuyan->delete($liuyan_id)){
    		$this->success('删除留言成功！');
    	}else{
    		$this->error('删除留言失败！');
    	}
    }
    public function liuyanPass(){
    	$liuyan_id = $_GET['id'];
    	$liuyan = new LiuyanModel();
    	$data['liuyan_id'] = $liuyan_id;
    	$data['liuyan_state'] = 1;
    	if($liuyan->save($data)){
    		$this->success('已经通过！');
    	}else{
    		$this->error('通过留言失败！');
    	}
    }
    //大学生找家教列表
    public function stuLiuyanList(){
    	
    	import("@.ORG.Page"); //导入分页类
     		$stu_liuyan = new Stu_liuyanModel();
			$count = $stu_liuyan->count();    //计算总数
			$p = new Page ($count,10);
			$stu_liuyan_res=$stu_liuyan->relation(true)->limit($p->firstRow.','.$p->listRows)->order('stu_liuyan_id desc')->findAll();
			$p->setConfig('header','篇记录');
			$p->setConfig('prev',"上一页");
			$p->setConfig('next','下一页');
			$p->setConfig('first','<<');
			$p->setConfig('last','>>');
			$page = $p->show ();
			$this->assign( "page", $page );
			$this->assign ( "stu_liuyan_res", $stu_liuyan_res );
			$this->display();
    }
    public function stuLiuyanDel(){
    	$stu_liuyan_id = $_GET['id'];
    	$stu_liuyan = new Stu_liuyanModel();
    	if($stu_liuyan->delete($stu_liuyan_id)){
    		$this->success('删除成功！');
    	}else{
    		$this->error('删除失败！');
    	}
    }
    //发帖账号管理
    public function account(){
    	$account = new AccountModel();
    	$type = trim($_GET['type']);
    	$account_type = getAccountType();
    	$sql = "select * from account where 1=1";
    	if(strlen($type) != 0){
    		$sql.=" and  type='$type'";
    	}
    	$account_res = $account->query($sql);
    	$this->assign('type_sel',$type);
    	$this->assign('account_res',$account_res);
    	$this->assign('account_type',$account_type);
    	$this->display();
    }

	//添加星级账户
	public function addStar(){
		$data['stu_star'] = $_GET['type'];
		$data['stu_id'] = $_GET['stu_id'];

		$stu = new StuModel();
     	if($stu->save($data)){
			$this->success('添加星级成功！');
		}else{
			$this->error('添加星级失败');
		}
	}

	//取消星级用户
	public function delStar(){
		$data['stu_star'] = $_GET['type'];
		$data['stu_id'] = $_GET['stu_id'];

		$stu = new StuModel();
     	if($stu->save($data)){
			$this->success('取消星级成功！');
		}else{
			$this->error('取消星级失败');
		}
	}
    //添加发帖的账号
    public function accountAdd(){
    	$account = new AccountModel();
    	$data = $account->create();
    	if($account->add($data)){
    		$this->success('添加成功！');
    	}else{
    		$this->error('添加失败！');
    	}
    }
    //更新发帖账号
    public  function accountUpdate(){
    	$account = new AccountModel();
    	$data = $account->create();
    	if($account->save($data)){
    		$this->success('修改成功！');
    	}else{
    		$this->error('修改失败！');
    	}
    }
    //删除账号
    public function accountDel(){
    	$id = trim($_GET['id']);
    	$account = new AccountModel();
    	if($account->delete($id)){
    		$this->success('删除成功！');	
    	}else{
    		$this->error('删除失败');
    	}
    }
	//显示大家的email
	public function themail(){
			$this->display();
		}

	//旧网站的学生信息
	public function oldStulist(){
		$student = new StudentModel();
		$student_res = $student->findAll();
		$this->assign("student_res",$student_res);
		$this->display();
	}
    }
?>