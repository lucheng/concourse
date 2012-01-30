<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
	
    @function 评论管理

    @Filename PlAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 15:13:19 $
*************************************************************/
class PlAction extends CommonAction
{
	Public function _empty()
	{ 
		alert('方法不存在!',1);
	} 
	
    public function index()
    {
		Load('extend');//加载扩展函数,模板里需要使用
		$pl = M('pl');
		import('@.ORG.Page');
		if(isset($_GET['status']))
		{
			$count = $pl->where('status='.$_GET['status'])->order('ptime desc')->count();
			$p = new Page($count,20);
			$list = $pl->where('status='.$_GET['status'])->order('ptime desc')->limit($p->firstRow.','.$p->listRows)->select();
		}
		elseif(isset($_GET['keyword']))
		{
			$map['content'] = array('like','%'.$_GET['keyword'].'%');
			$count = $pl->where($map)->order('ptime desc')->count();
			$p = new Page($count,20); 
			$list = $pl->where($map)->order('ptime desc')->limit($p->firstRow.','.$p->listRows)->select();
		}
		else
		{
			$count = $pl->order('ptime desc')->count();
			$p = new Page($count,20); 
			$list = $pl->order('ptime desc')->limit($p->firstRow.','.$p->listRows)->select();
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
		$this->display();
    }
	
	 public function edit()
    {
		$type = M('pl');
		$list = $type->where('id='.$_GET['id'])->find();
		$this->assign('list',$list);
		$this->display();
    }
	
	public function doedit()
    {
		$pl=M('pl');
		$data['id'] = $_POST['id'];
		$data['content'] = $_POST['content'];
		$data['recontent'] = $_POST['recontent'];
		if($pl->save($data))
		{
			alert('操作成功!',U('Pl/index'));
		}
		alert('操作失败!',1);
    }
	
	public function del()
    {
		$type = M('pl');
		if($type->where('id='.$_GET['id'])->delete())
		{
			alert('删除成功!',U('Pl/index'));
		}
		alert('操作失败!',1);
    }
	
	public function status(){
		$pl = M('pl');
		if($_GET['status'] == 0)
		{
			$pl->where( 'id='.$_GET['id'] )-> setField( 'status',1);
		}elseif($_GET['status'] == 1)
		{
			$pl->where( 'id='.$_GET['id'] )-> setField( 'status',0);
		}else{
			alert('非法操作!',3);
		}
		 $this->redirect('index');
	}


	public function delall(){
		$id = $_REQUEST['id'];  //获取文章id
		$ids = implode(',',$id);//批量获取id
		$id = is_array($id) ? $ids : $id;
		$map['id'] = array('in',$id);
		if(!$id)
		{
			alert('请先勾选记录!',1);
		}
		$pl = M(pl);
		if($_REQUEST['Del'] == '删除')
		{
			if($pl->where($map)->delete())
			{
				alert('操作成功!',U('Pl/index'));
			}
			alert('操作失败!',1);
		}
		
		if($_REQUEST['Del'] == '批量未审')
		{
			$data['status'] = 0;
			if($pl->where($map)->save($data))
			{
				alert('操作成功!',U('Pl/index'));
			}
			alert('操作失败!',1);
		}
		
		if($_REQUEST['Del'] == '批量审核')
		{
			$data['status'] = 1;
			if($pl->where($map)->save($data))
			{
				alert('操作成功!',U('Pl/index'));
			}
				alert('操作失败!',1);
		}
	}
}
?>