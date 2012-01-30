<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 广告管理

    @Filename AdAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 14:33:32 $
*************************************************************/
class AdAction extends CommonAction
{
	Public function _empty()
	{ 
		alert('方法不存在!',1);
	} 
	
    public function index()
    {
		$ad = M('ad');
		$count = $ad->count();
		import('@.ORG.Page');
		$p = new Page($count,20);
		$p->setConfig('prev','上一页'); 
		$p->setConfig('header','条记录');
		$p->setConfig('first','首 页');
		$p->setConfig('last','末 页');
		$p->setConfig('next','下一页');
		$p->setConfig('theme',"%first%%upPage%%linkPage%%downPage%%end%
		<li><span><select name='select' onChange='javascript:window.location.href=(this.options[this.selectedIndex].value);'>%allPage%</select></span></li>\n<li><span>共<font color='#009900'><b>%totalRow%</b></font>条记录 20条/每页</span></li>");
		$this->assign('page',$p->show());
		$list=$ad->order('addtime desc')->limit($p->firstRow.','.$p->listRows)->select();
		$this->assign('list',$list);
		$this->display();	
    }
	
	public function add()
    {
		$this->display('add');
    }
	
	public function edit()
    {
		$type = M('ad');
		$list = $type->where('id='.$_GET['id'])->find();
		$this->assign('list',$list);
		$this->display('edit');
    }
	
	public function doedit()
    {
		$ad = M('ad');
		$ad->create();
		if($ad->save())
		{
			alert('操作成功!',U('Ad/index'));
		}
       alert('操作失败!',1);
    }
	
	public function doadd()
    {
		$ad = M('ad');
		$data['title'] = $_POST['title'];
		$data['description'] = $_POST['description'];
		$data['content'] = $_POST['content'];
		$data['addtime'] = date('Y-m-d H:i:s');
		if($ad->data($data)->add())
		{
			alert('操作成功!',U('Ad/index'));
		}
		alert('操作失败!',1);
    }
	
	public function del()
    {
		$type = M('ad');
		if($type->where('id='.$_GET['id'])->delete())
		{
			alert('操作成功!',U('Ad/index'));
		}
		alert('操作失败!',1);	
    }
	
	public function status(){
		$a = M('ad');
		if($_GET['status'] == 0)
		{
			$a->where( 'id='.$_GET['id'] )-> setField( 'status',1); 
		}
		else
		{
			$a->where( 'id='.$_GET['id'] )-> setField( 'status',0); 
		}
		$this->redirect('index');
	}

	
	public function delall()
	{
		$id = $_REQUEST['id'];  //获取文章id
		$ids = implode(',',$id);//批量获取id
		$id = is_array($id) ? $ids : $id;
		$map['id'] = array('in',$id); 
		if(!$id)
		{
			alert('请勾选广告!',1);
		}
		$ad = M('ad');
		if($_REQUEST['Del'] == '显示')
		{ 
			$data['status'] = 1;
			if($ad->where($map)->save($data))
			{
			alert('操作成功!',U('Ad/index'));
			}
			alert('操作失败!',1);
		}
		
		if($_REQUEST['Del'] == '隐藏')
		{ 
			$data['status'] = 0;
			if($ad->where($map)->save($data))
			{
				alert('操作成功!',U('Ad/index'));
			}
			alert('操作失败!',1);
		}
	}
}
?>