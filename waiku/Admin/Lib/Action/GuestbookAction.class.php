<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 留言管理

    @Filename GuestbookAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 15:03:17 $
*************************************************************/
class GuestbookAction extends CommonAction
{
	Public function _empty()
	{ 
	alert('方法不存在!',1);
	} 
	
    public function index()
    {
		Load('extend');//加载扩展函数,模板里需要使用
		$guestbook = M('guestbook');
		import('@.ORG.Page');
		if(isset($_GET['status']))
		{
			$count = $guestbook->where('status='.$_GET['status'])->order('addtime desc')->count();
			$p = new Page($count,20); 
			$list = $guestbook->where('status='.$_GET['status'])->order('addtime desc')->limit($p->firstRow.','.$p->listRows)->select();
		}
		elseif(isset($_GET['keyword']))
		{
			$map['content'] = array('like','%'.$_GET['keyword'].'%');
			$count = $guestbook->where($map)->order('addtime desc')->count();
			$p = new Page($count,20); 
			$list = $guestbook->where($map)->order('addtime desc')->limit($p->firstRow.','.$p->listRows)->select();
		}
		else
		{
			$count = $guestbook->order('addtime desc')->count();
			$p = new Page($count,20); 
			$list = $guestbook->order('addtime desc')->limit($p->firstRow.','.$p->listRows)->select();
		}
		
		$p->setConfig('prev','上一页');
		$p->setConfig('header','条评论');
		$p->setConfig('first','首 页');
		$p->setConfig('last','末 页');
		$p->setConfig('next','下一页');
		$p->setConfig('theme',"%first%%upPage%%linkPage%%downPage%%end%
		<li><span><select name='select' onChange='javascript:window.location.href=(this.options[this.selectedIndex].value);'>%allPage%</select></span></li>\n<li><span>共<font color='#009900'><b>%totalRow%</b></font>条评论 20条/每页</span></li>");
		$this->assign('page',$p->show());
		$this->assign('list',$list);
		$this->display('index');
    }
	
	public function edit()
    {
    $type = M('guestbook');
	$list = $type->where('id='.$_GET['id'])->find();
	$this->assign('list',$list);
    $this->display('edit');
    }
	
	public function doedit()
    {
		$guestbook = M('guestbook');
		$data['id'] = $_POST['id'];
		$data['content'] = $_POST['content'];
		$data['recontent'] = $_POST['recontent'];
		if($guestbook->save($data))
		{
			alert('操作成功!',U('Guestbook/index'));
		}
		alert('操作失败!',1);
    }
	
	public function del()
    {
		$type = M('guestbook');
		if($type->where('id='.$_GET['id'])->delete())
		{
			alert('操作成功!',U('Guestbook/index'));
		} 
		alert('操作失败!',1);
    }
	
	public function status()
	{
		$a = M('guestbook');
		if($_GET['status'] == 0)
		{
			$a->where( 'id='.$_GET['id'] )-> setField( 'status',1);
		}
		elseif($_GET['status'] == 1)
		{
			$a->where( 'id='.$_GET['id'] )-> setField( 'status',0);
		}
		else
		{
			alert('非法操作!',3);
		}
		$this->redirect('index');
	}

	public function delall()
	{
		$id = $_REQUEST['id'];  //获取文章id
		$ids = implode(',',$id);//批量获取id
		$id = is_array($id)?$ids:$id;
		$map['id'] = array('in',$id);
		if(!$id)
		{
			alert('请勾选记录!',1);
		}
		$guestbook = M('guestbook');
		if($_REQUEST['Del']	==	'删除')
		{
			if($guestbook->where($map)->delete())
			{
				alert('操作成功!',U('Guestbook/index'));
			}
			alert('操作失败!',1);
		}
		
		if($_REQUEST['Del']	==	'批量未审')
		{
			$data['status'] = 0;
			if($guestbook->where($map)->save($data))
			{
				alert('操作成功!',U('Guestbook/index'));
			}
			alert('操作失败!',1);
		}
		
		if($_REQUEST['Del']	==	'批量审核')
		{
			$data['status']=1;
			if($guestbook->where($map)->save($data))
			{
				alert('操作成功!',U('Guestbook/index'));
			}
			alert('操作失败!',1);
		}
	}
}
?>