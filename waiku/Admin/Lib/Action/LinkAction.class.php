<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 友情链接管理

    @Filename LinkAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 15:11:31 $
*************************************************************/
class LinkAction extends CommonAction
{
	Public function _empty()
	{ 
		alert('方法不存在!',1);
	}
	
    public function index()
    {
		$link = M('link');
		$count = $link->count();
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
		
		if(isset($_GET['status']))
		{
			$list = $link->where('status='.$_GET['status'])->limit($p->firstRow.','.$p->listRows)->select(); 
		}
		elseif(isset($_GET['logo']))
		{
			$list = $link->where('islogo=1')->limit($p->firstRow.','.$p->listRows)->select();
		}
		elseif(isset($_GET['typeid']))
		{
			$list = $link->where('typeid='.$_GET['typeid'])->limit($p->firstRow.','.$p->listRows)->select();
		}
		elseif(isset($_GET['out']))
		{
			$now = date('Y-m-d');
			$t = date(time() + 24 * 60 * 60 );
			$tt = date(time() + 2 * 24 * 60 * 60 );
		
			switch($_GET['out'])
			{
				case 0:
					$list = $link->where('overtime<'.$now)->limit($p->firstRow.','.$p->listRows)->select();
				break;
				case 1:
					$data['overtime'] = array('between',array($now,$t));
					$list = $link->where($data)->limit($p->firstRow.','.$p->listRows)->select();
				break;
				case 2:
					$data['overtime'] = array('between',array($t,$tt));
					$list = $link->where($data)->limit($p->firstRow.','.$p->listRows)->select();
				break;
			}
		
		}
		elseif(isset($_GET['keyword']))
		{
			$map['title'] = array('like','%'.$_GET['keyword'].'%'); 
			$list = $link->where($map)->limit($p->firstRow.','.$p->listRows)->select();
		}
		else
		{
			$list = $link->limit($p->firstRow.','.$p->listRows)->select();
		}
		
		$this->assign('list',$list);
		$this->jumpop();//快速跳转
		$this->moveop();//快速移动
		$this->total();//计算费用
		$this->display();	
    }
	
	  public function add()
    {
		$this->jumpop();//快速跳转
		$this->moveop();//快速移动
		$this->display('add');
    }
	
	 public function edit()
    {
		if(!isset($_GET['id']))
		{
			alert('非法操作!',1);
		}
		$link = M('link');
		$list = $link->where('id='.$_GET['id'])->find();
		$type = M('link_type');
		$tlist = $type->field('id,typename')->select();
		$op='';
		foreach($tlist as $v)
		{
			if($v['id'] == $list['typeid'])
			{
				$op.="<option value=\"{$v['id']}\" selected>{$v['typename']}</option>";
			}
			else
			{
				$op.="<option value=\"{$v['id']}\">{$v['typename']}</option>";
			}
		}
		$this->assign('editop',$op);
		$this->assign('list',$list);
		$this->jumpop();//快速跳转
		$this->display();
    }
	
	public function doedit()
    {
		$data['id'] = $_POST['id'];
		$data['money'] = $_POST['money'];
		$data['typeid'] = $_POST['typeid'];
		$data['title'] = $_POST['title'];
		$data['url'] = $_POST['url'];
		$data['qq'] = $_POST['qq'];
		$data['description'] = $_POST['description'];
		$data['rank'] = $_POST['rank'];
		$data['starttime'] = $_POST['starttime'];
		$data['overtime'] = $_POST['overtime'];
		$data['logo'] = $_POST['logo'];
		$data['islogo'] = $_POST['islogo'];
		$link = M('link');
		if($link->data($data)->save())
		{
			alert('操作成功!',U('Link/index'));
		}
		alert('操作失败!',1);
    }
	public function doadd()
    {
		$data['money'] = $_POST['money'];
		$data['typeid'] = $_POST['typeid'];
		$data['title'] = $_POST['title'];
		$data['url'] = $_POST['url'];
		$data['qq'] = $_POST['qq'];
		$data['description'] = $_POST['description'];
		$data['rank'] = $_POST['rank'];
		$data['starttime'] = $_POST['starttime'];
		$data['overtime'] = $_POST['overtime'];
		$data['logo'] = $_POST['logo'];
		$data['islogo'] = $_POST['islogo'];
		$data['status'] = 1;
		$link = M('link');
		if($link->data($data)->add())
		{
			alert('操作成功!',U('Link/index'));
		}
		alert('操作失败!',1);
    }
	
	public function del()
    {
		$type = M('link');
		if($type->where('id='.$_GET['id'])->delete())
		{
			alert('操作成功!',U('Link/index'));
		}
		alert('操作失败!',1);	
    }
	
	public function status(){
		$link = M('link');
		if($_GET['status'] == 0)
		{
			$link->where( 'id='.$_GET['id'] )-> setField( 'status',1); 
		}
		elseif($_GET['status']==1)
		{
			$link->where( 'id='.$_GET['id'] )-> setField( 'status',0); 
		}
		else
		{
			alert('非法操作!',3);
		}
		$this->redirect('index');
	}

	
	public function delall()
	{
		$id = $_REQUEST['id'];  //获取id
		$ids = implode(',',$id);//批量获取id
		$id = is_array($id)?$ids:$id;
		$map['id'] = array('in',$id); 
		$link = M('link');
		
		if($_REQUEST['Del'] == '编辑')
		{ 
			for($i = 0;$i < count($_REQUEST['linkid']);$i++)
			{
				$data['qq'] = $_REQUEST['qq'][$i];
				$data['title'] = $_REQUEST['title'][$i];
				$data['url'] = $_REQUEST['url'][$i];
				$data['money'] = $_REQUEST['money'][$i];
				$data['starttime'] = $_REQUEST['starttime'][$i];
				$data['overtime'] = $_REQUEST['overtime'][$i];
				$data['rank'] = $_REQUEST['rank'][$i];
				$link->where('id='.$_REQUEST['linkid'][$i])->save($data);
			}
			alert('操作成功!',U('Link/index'));
		}
		
		if(!$id)
		{
			alert('请先勾选记录!',1);
		}
		
		if($_REQUEST['Del'] == '移动') 
		{ 
			$data['typeid'] = $_REQUEST['typeid'];
			if($link->where($map)->save($data))
			{
				alert('操作成功!',U('Link/index'));
			}else{
				alert('操作失败!',1);
			}
		}
		
		if($_REQUEST['Del'] == '删除') 
		{ 
			if($link->where($map)->delete())
			{
				alert('操作成功!',U('Link/index'));
			}
		}
		
		if($_REQUEST['Del'] == '批量显示') 
		{ 
			$data['status'] = 1;
			if($link->where($map)->save($data))
			{
				alert('操作成功!',U('Link/index'));
				
			}
		}
		
		if($_REQUEST['Del'] == '批量隐藏')
		{ 
			$data['status']=0;
			if($link->where($map)->save($data))
			{
				alert('操作成功!',U('Link/index'));
			}
		}
	}
	
	//快速跳转栏目option
	private function jumpop()
	{
		$type = M('link_type');
		$oplist = $type->field('id,typename')->select();
		$op='';
		foreach($oplist as $v)
		{
			$op.="<option value=\"".__URL__."/index/typeid/{$v['id']}\">{$v['typename']}</option>";
		}
		$this->assign('op',$op);
	}
	
	//快速移动栏目option
	private function moveop()
	{
		$type = M('link_type');
		$oplist = $type->field('id,typename')->select();
		$op='';
		foreach($oplist as $v)
		{
			$op.="<option value=\"{$v['id']}\">{$v['typename']}</option>";
		}
		$this->assign('op2',$op);
	}
	
	private function total()
	{
		$type = M('link');
		$money = $type->field('money')->select();
		$moneys = 0;
		foreach($money as $v)
		{
			$moneys = $v['money'] + $moneys;
		}
		$this->assign('moneys',$moneys);
	}
	
	//友情链接栏目分类
	public function type()
	{
		$type = M('link_type');
		$list = $type->select();
		$this->assign('list',$list);
		$this->display();
	}
	
	public function add_t()
	{
		$this->display('add_t');
	}
	
	public function doadd_t()
	{
		$type = M('link_type');
		$type->create(); 
		$type->add(); 
		$this->redirect('type');
	}
	
	public function edit_t()
	{
		$type = M('link_type');
		$list = $type->where('id='.$_GET['id'])->find(); 
		$this->assign('list',$list);
		$this->display('edit_t');
	}
	
	public function doedit_t()
	{
		$type = M('link_type');
		$type->create(); 
		$type->save(); 
		$this->redirect('type');
	}
	
	public function del_t()
	{
		$type =M('link_type');
		$link = M('link');
		if($type->where('id='.$_GET['id'])->delete())
		{
			$link->where('typeid='.$_GET['id'])->delete();
			$this->redirect('type');
		}
		else
		{
			alert('操作失败!',1);
		}
	}
}
?>