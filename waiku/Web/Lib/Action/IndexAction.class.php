<?php
class IndexAction extends BaseAction
{
	Public function _empty()
	{ 
		alert('方法不存在',__APP__);
	} 

     public function index()
    {
		//查询数据库,读取缓存
		$type = M('type');
		$article = M('article');
		
		$config = F('basic','','./Web/Conf/');
		
		//首页栏目内容
		/*$list = $type->where('isindex=1')->order('irank asc')->field('typeid,typename,indexnum')->select();
		foreach ($list as $k=>$v)
		{
			$data['status'] = 1;
			$data['typeid'] = $v['typeid'];
			$k % 2 ==0 ? $list[$k]['i'] = 0 : $list[$k]['i'] = 1;
			$list[$k]['article'] = $article->where($data)->order('addtime desc')->field('title,aid')->limit($v['indexnum'])->select();
		}*/
		
		$list1 = $article->where("typeid=1")->order('addtime desc')->field('title,aid')->limit(8)->select();
		$list2 = $article->where("typeid=2")->order('addtime desc')->field('title,aid')->limit(8)->select();
		$list3 = $article->where("typeid=3")->order('addtime desc')->field('title,aid')->limit(4)->select();
		$list4 = $article->where("typeid=4")->order('addtime desc')->field('title,aid')->limit(4)->select();

		$this->assign('list1',$list1);
		$this->assign('list2',$list2);
		$this->assign('list3',$list3);
		$this->assign('list4',$list4);

		$this->display('index');
    }
	
	public function search()
	{
		if(empty($_POST['k'])){
			alert('请输入关键字!',1);
		}
		
		//查询数据库准备
		$article = M('article');
		$map['status'] = 1;
		$keyword = $_POST['k'];
		$map['title'] = array('like','%'.$keyword.'%');
		
		//导入分页类
		import('@.ORG.Page');
		
		//分页相关配置
		$count = $article->where($map)->count();
		$p = new Page($count,20);
		$p->setConfig('prev','上一页'); 
		$p->setConfig('header','篇文章');
		$p->setConfig('first','首 页');
		$p->setConfig('last','末 页');
		$p->setConfig('next','下一页');
		$p->setConfig('theme',"%first%%upPage%%linkPage%%downPage%%end%
		<li><span><select name='select' onChange='javascript:window.location.href=(this.options[this.selectedIndex].value);'>%allPage%</select></span></li><li><span>共<font color='#CD4F07'><b>%totalRow%</b></font>篇文章 20篇/每页</span></li>");
		
		//查询数据库
		$prefix = C('DB_PREFIX');
		$list = $article->join('left join '.$prefix.'type on '.$prefix.'article.typeid='.$prefix.'type.typeid')->where($map)->field("aid,title,addtime,".$prefix."article.typeid as typeid,typename")->limit($p->firstRow.','.$p->listRows)->order("addtime desc")->select(); ////获得列表，$p->firstRow()表示获得开始位置；
		//echo $article->getLastSql(); 验证sql
		
		//封装变量
		$this->assign('list',$list);
		$this->assign('num',$count);
		$this->assign('page',$p->show());
		$this->assign('keyword',$keyword);
		//模板输出
		$this->display('search');
	}

	//调查模块
	private function vote($isvote)
	{
		$vote = M('vote');
		$vo = $vote->where('id='.$isvote)->find();
		if($vo)
		{
			$strs = explode("\n",trim($vo['vote']));
			for($i = 0;$i < count($strs);$i++)
			{
					$s = explode("=",$strs[$i]);
					$data[$i]['num'] = $s[1];
					$data[$i]['title'] = $s[0];
			}
		}
		else
		{
			$vo['title'] = '投票ID不存在!请检查网站配置!';
		}
		$this->assign('vtype',$vo['stype']);
		$this->assign('vid',$isvote);
		$this->assign('vtitle',$vo['title']);
		$this->assign('vdata',$data);
	}
}
?>