<?php
class ListAction extends BaseAction
{
	Public function _empty()
	{ 
		alert('方法不存在',__APP__);
	} 
	
	public function index()
	{
		
		$type = M('type');
		$list = $type->where('typeid='.$_GET['typeid'])->field('typename,fid,keywords,description,islink,url')->find();
		if(!$list)
		{
			alert('栏目不存在!',__APP__);
		}
		if($list['islink'] == 1)
		{
			Header('Location:'.turl($list['url']));
		}
	//栏目基本信息封装
		$this->assign('type',$list);
	//栏目导航
		$map['fid'] = $list['fid'];
		$map['islink'] = 0;
		$nav = $type->where($map)->field('typeid,typename')->select();
		$this->assign('dh',$nav);
	//第一次释放内存
		unset($list,$nav,$map);
	//网站头部
//		R('Public','head');
	//查询数据库和缓存
		$article = D('ArticleView');
		$config = F('basic','','./Web/Conf/');
	//封装条件
		$map['status'] = 1;
	//导入分页类
		import('@.ORG.Page');
	//准备工作
		$data['fid'] = $_GET['typeid'];
		$tlist = $type->where($data)->field('typeid')->select();
		foreach ($tlist as $v)
		{
			$arr[] = $v['typeid'] ;
		}
		$arr[] = $_GET['typeid'];
		$map['article.typeid'] = array('in',$arr);	
	//分页处理
		$count=$article->where($map)->count();
		$p = new Page($count,$config['artlistnum']);
		$p->setConfig('prev','上一页'); 
		$p->setConfig('header','篇文章');
		$p->setConfig('first','首 页');
		$p->setConfig('last','末 页');
		$p->setConfig('next','下一页');
		$p->setConfig('theme',"%first%%upPage%%linkPage%%downPage%%end%
		<li><span><select name='select' onChange='javascript:window.location.href=(this.options[this.selectedIndex].value);'>%allPage%</select></span></li><li><span>共<font color='#CD4F07'><b>%totalRow%</b></font>篇文章".$config['artlistnum']."篇/每页</span></li>");
	//数据查询
		$alist = $article->where($map)->order('addtime desc')->limit($p->firstRow.','.$p->listRows)->select();
	//封装变量
		$this->assign('page',$p->show());
		$this->assign('list',$alist);
	//释放内存
		unset($article,$type,$config,$p,$tlist,$alist);
	//模板输出
//		$this->display('index');
//		
		if($_GET['typeid'] == 1){
			$this->display('view');
		}
		if($_GET['typeid'] == 2){
			$this->display('study');
		}
		if($_GET['typeid'] == 3){
			$this->display('cases');
		}
		if($_GET['typeid'] == 4){
			$this->display('news');
		}
 }
 
}