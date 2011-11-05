<?php 
class ArticleAction extends GlobalAction 
{
	public function index()
	{
		$Article=D("Article");
		
		$count=$Article->count('cid=51');
		import("ORG.Util.Page");
		$listRows=15;
		$p1=new Page($count,$listRows);
		$cate1=$Article->findAll('cid=51','*','id desc',$p1->firstRow.','.$p1->listRows);
		$page1=$p1->show();
		
		$count=$Article->count('cid=50');
		$p2=new Page($count,$listRows);
		$cate2=$Article->findAll('cid=50','*','id desc',$p1->firstRow.','.$p1->listRows);
		$page2=$p2->show();
		
		$this->assign('titler','公司新闻');
		$this->assign('cate1',$cate1);
		$this->assign('cate2',$cate2);
		
		$this->assign('page1',$page1);
		$this->assign('page2',$page2);
		$this->display();
	}
	
	public function read(){
		$id=intval($_REQUEST['id']);
		$Article=D("Article");
		$list=$Article->find($id);
		if (!$list) {
			$this->error("信息不存在");
		}
		$this->assign("article", $list);
//		dump($article);
		$this->display();
		
		/*//分类
		$map['module']=2;//新闻分类
		$Category=D('Category')->order("id desc")->where($map)->findall();
		$this->assign('cate',$Category);
		//上一篇
		$front=$Article->where("id<".$id." and cid=".$list['cid'])->order('id desc')->limit('1')->find();
		$f=!$front?'没有了':'<A href="'.__URL__.'/'.$front['id'].'.html'.'">'.$front['subject'].'</A>';
		$this->assign('front',$f);
		//下一篇
		$after=$Article->where("id>".$id." and cid=".$list['cid'])->order('id desc')->limit('1')->find();
		$a=!$after?'没有了':'<A href="'.__URL__.'/'.$after['id'].'.html'.'">'.$after['subject'].'</A>';
		$this->assign('after',$a);
		$this->assign('vo',$list);
		//评论
		$Comment=D('Comment')->limit('5')->findall('tid='.$id);
		$this->assign('commentlist',$Comment);
		$this->display();*/

	}
	public function commentsave()
	{
		$seccode=trim($_POST['seccode']);
		if(md5($seccode)!=Session::get('verify'))$this->error('验证码错误!!!');
		$Comment=D("Comment");
        if($Comment->create()) { 
        	$Comment->ip=get_client_ip();
            if($Comment->add()){ 
            	$this->assign('jumpUrl',__URL__);
				$this->success(L('_INSERT_SUCCESS_'));
            }else{ 
                $this->error(L(_INSERTFAIL)); 
            } 
        }else{ 
            $this->error($Comment->getError()); 
        } 
	}
}
?>