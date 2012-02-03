<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
   
    @function 文章模块
 
    @Filename ArticleAction.class.php $

    @Author pengyong $

    @Date 2011-11-15 21:27:09 $
*************************************************************/
class ArticleAction extends BaseAction
{
	Public function _empty()
	{ 
		alert('方法不存在',__APP__);
	} 
	
	public function index()
	{
		if(!isset($_GET['aid']))
		{
			alert('非法操作',__APP__);
		}
	//读取数据库和缓存
		$article = M('article');
		$config = F('basic','','./Web/Conf/');
	//相关判断
		$alist = $article->where('aid='.$_GET['aid'])->find();
		if(!$alist)
		{
			alert('文章不存在或已删除!',__APP__);
		}
		if($alist['islink'] == 1)
		{
			Header('Location:'.$alist['linkurl']);
		}
		if($alist['status'] == 0)
		{
			alert('文章未审核!',__APP__);
		}
	//统计处理
		if($alist['status'] == 1)
		{
			$map['hits'] = $alist['hits']+1;
			$article->where('aid='.$_GET['aid'])->save($map);
		}
	//注销map
		unset($map);
		$alist['hits'] += 1;
	//关键字替换
		$alist['content'] = $this->key($alist['content']);
	//鼠标轮滚图片
		if($config['mouseimg'] == 1)
		{
			$alist['content'] = $this->mouseimg($alist['content']);
		}
	//文章内分页处理
		if($alist['pagenum']==0)
		{
		//手动分页
			$alist['content'] = $this->diypage($alist['content']);
		}
		else
		{
		//自动分页
			$alist['content'] = $this->autopage($alist['pagenum'],$alist['content']);
		}
	//文章内投票
		$this->vote($alist['voteid']);
	//心情投票
		$url = __ROOT__;//用于心情js的根路径变量
		$this->assign('url',$url);
	//文章上下篇
		$map['status'] = 1;
		$map['typeid'] = $alist['typeid'];
		$map['addtime'] = array('lt',$alist['addtime']);
		$up = $article->where($map)->field('aid,title')->order('addtime desc')->limit(1)->find();
		//dump($article->getLastsql());
		if(!$up)
		{
			$updown = '上一篇：<span>无</span>';
		}
		else
		{
			$updown = '上一篇：<span><a href="'.U('articles/'.$up['aid']).'">'.$up['title'].'</a></span>';
		}
		$map['addtime'] = array('gt',$alist['addtime']);
		$down =$article->where($map)->field('aid,title')->order('addtime desc')->limit(1)->find();
		if(!$down)
		{
			$updown .= '下一篇：<span>无</span>';
		}
		else
		{
			$updown .= '下一篇：<span><a href="'.U('articles/'.$down['aid']).'">'.$down['title'].'</a></span>';
		}
		$this->assign('updown',$updown);
	//释放相关内存
		unset($updown,$up,$down,$map);
	//相关文章
		$map['status'] = 1;
		$keywords=explode(",",$alist['keywords']);
		foreach ($keywords as $k=>$v)
		{
			if($k == 0)
			{
				$map['_string'] = "(keywords like '%{$v}%')";
			}
			else
			{
				$map['_string'] = " OR (keywords like '%{$v}%')";
			}
		}
		$klist = $article->where($map)->field('aid,title')->limit(6)->select();
	//封装变量
		$this->assign('keylist',$klist);
		$this->assign('article',$alist);
	//释放内存
		unset($article,$config,$alist,$klist,$map);
	//模板输出
		$this->display('index');
	}
	
	//投票模块
	private function vote($id)
	{
		$vote = M('vote');
		$vo = $vote->where('id='.$id)->find();
		if($vo)
		{
			$strs = explode("\n",trim($vo['vote']));
			for($i = 0;$i < count($strs);$i++)
			{
				$s = explode('=',$strs[$i]);
				$data[$i]['num'] = $s[1];
				$data[$i]['title'] = $s[0];
			}
		}
		else
		{
			$vo['title'] = '投票ID不存在!请检查网站配置!';
		}
	//封装变量
		$this->assign('votetype',$vo['stype']);
		$this->assign('voteid',$vo['id']);
		$this->assign('votetitle',$vo['title']);
		$this->assign('votedata',$data);
	//释放内存
		unset($vote,$vo,$data);
	}
	
	
	//关键字替换
	private function key($content)
	{
		$key = M('key');
		$keys = $key->field('url,title')->select();
		foreach($keys as $k=>$v)
		{
			$replace = "<a href=\"{$v['url']}\" target=\"_blank\">{$v['title']}</a>";
			if($v['num'] == 0)
			{
				$content = str_replace($v['title'],$replace,$content);
			}
			else
			{
				$content = preg_replace('/'.$v['title'].'/',$replace,$content,$v['num']);
			}
		}
	//释放内存
		unset($key,$keys);
		return $content;
	}
	
	//鼠标鼠标滚轮控制图片大小的函数
	private function mouseimg($content)
	{
		$pattern = "/<img.*?src=(\".*?\".*?\/)>/is";
		$content = preg_replace($pattern,"<img src=\${1} onload=\"javascript:resizeimg(this,575,600)\">",$content);
		return $content;
	}
	
	//文章内容分页-自定义分页
	private function diypage($content)
	{
		$str = explode('[wk_page]',$content);
		$num = count($str);
		if($num == 1)
		{
			return $content;
			exit;
		}
		import('@.ORG.Page');
		$p = new Page($num,1);
		$p->setConfig('prev','上一页');
		$p->setConfig('next','下一页');
		$p->setConfig('theme',"%upPage%%linkPage%%downPage%");
		$this->assign('page',$p->show());
		$this->assign('nowpage',$p->nowPage);
		$nowpage = $p->nowPage - 1;
	//释放内存
		unset($p);
		return $str[$nowpage];
	}
	
	
	//文章自动分页
	private function autopage($pagenum,$content)
	{
		if($pagenum == 0)
		{
			return $content;
		}
		if(strlen($content) < $pagenum)
		{
			return $content;
		}
	//导入分页类和函数库
		import('@.ORG.Page');
		Load('extend');
		$num = ceil(strlen($content) / $pagenum);
		$p = new Page($num,1);
		$p->setConfig('prev','上一页');
		$p->setConfig('next','下一页');
		$p->setConfig('theme',"%upPage%%linkPage%%downPage%");
		$this->assign('page',$p->show());
		$this->assign('nowpage',$p->nowPage);
		$content = msubstr($content,($p->nowPage-1) * $pagenum,$pagenum);
	//释放内存
		unset($p);
		return $content;
	}
}