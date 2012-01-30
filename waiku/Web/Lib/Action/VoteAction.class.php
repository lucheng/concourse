<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 前台投票	Action

    @Filename VoteAction.class.php $

    @Author pengyong $

    @Date 2011-11-18 11:58:00 $
*************************************************************/
class VoteAction extends Action
{
	Public function _empty()
	{ 
		alert('方法不存在',3);
	} 
	
     public function index()
    {
		if(empty($_GET['id']))
		{
			alert('非法操作!',3);
		}
		
		//网站头部
		R('Public','head');
		
		//读取数据库
		$vote = M('vote');
		$vo = $vote->where('id='.$_GET['id'])->find();
		
		//业务处理
		if(!$vo)
		{
			alert('投票不存在或已删除!',__APP__);
		}
		
		$over='';
		if(!cptime($vo['overtime'],date('Y-m-d H:i:s')))
		{
			$over='[已结束]';
		}
		
		$total = 0;
		$strs = explode("\n",trim($vo['vote']));
		
		for($i = 0;$i < count($strs);$i++)
		{
			$s = explode('=',$strs[$i]);
			$data[$i]['num'] = $s[1];
			$data[$i]['title'] = $s[0];
			$total = $s[1] + $total;
		}
		
		foreach($data as $k=>$v)
		{
			$data[$k]['percent'] = round($v['num'] / $total * 100 + 0);
		}
		//封装变量
		$this->assign("vote",$data);
		$this->assign("over",$over);
		$this->assign("votetitle",$vo['title']);
		$this->assign("starttime",$vo['starttime']);
		$this->assign("overtime",$vo['overtime']);
		$this->assign("total",$total);
		//模板输出
		$this->display('index');
    }
	
	public function update()
	{ 
		if(!isset($_GET['id']))
		{
			alert('非法操作!',3);
		}
		if(empty($_POST))
		{
			alert('请选择投票项!',1);
		}
		//读取数据库
		$vote=M('vote');
		$vo=$vote->where('id='.$_GET['id'])->field('vote,overtime,starttime')->find();
		//业务处理
		if(!$vo)
		{
			alert('投票不存在!',3);
		}
		
		if(cptime(date('Y-m-d H:i:s'),$vo['overtime']))
		{
			alert('投票已结束!',U('votes/'.$_GET['id']));
		}
		
		if(!cptime(date('Y-m-d H:i:s'),$vo['starttime']))
		{
			alert('投票没有开始!',U('votes/'.$_GET['id']));
		}
		
		if(Cookie::is_set('wkvote'.$_GET['id']))
		{
			alert('您已投过票了!',1);
		}
		
		$data['vote'] = $vo['vote'];
		
		foreach($_POST as $k=>$v)
		{
			$pattern = "/{$k}=[0-9]{1,}/";
			$v += 1;
			$replacement = $k.'='.$v;
			$data['vote'] = preg_replace($pattern,$replacement,$data['vote']);
		}
		
		if($vote->where('id='.$_GET['id'])->save($data))
		{
			Cookie::set('wkvote'.$_GET['id'],'1',365 * 60 * 60 * 24);
			alert('投票成功!',U('votes/'.$_GET['id']));
		}
	}
}
?>