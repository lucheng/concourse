<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com
    
	@function 前台心情 Action

    @Filename MoodAction.class.php $

    @Author pengyong $

    @Date 2011-11-17 22:01:55 $
*************************************************************/
class MoodAction extends Action
{
	Public function _empty()
	{ 
		alert('方法不存在',3);
	} 
	
	public function index()
	{
		$mood = M('mood');
		$list = $mood->where('aid='.$_GET['aid'])->find();
		if($list)
		{
			echo "{$list['mood1']},{$list['mood2']},{$list['mood3']},{$list['mood4']},{$list['mood5']},{$list['mood6']},{$list['mood7']},{$list['mood8']}";
		}
		else
		{
		$data['aid'] = $_GET['aid'];
		$mood->add($data);
		echo "0,0,0,0,0,0,0,0";
		}
	}
 
	public function update()
	{
		$type = $_GET['type'];
		$mood = M('mood');
		$list = $mood->where('aid='.$_GET['aid'])->find();
		if($list)
		{
			switch($type)
			{
				case 'mood1':
					$mood->setInc('mood1','aid='.$_GET['aid']);
					break;
				case 'mood2':
					$mood->setInc('mood2','aid='.$_GET['aid']); 
					break;
				case 'mood3':
					$mood->setInc('mood3','aid='.$_GET['aid']); 
					break;
				case 'mood4':
					$mood->setInc('mood4','aid='.$_GET['aid']); 
					break;
				case 'mood5':
					$mood->setInc('mood5','aid='.$_GET['aid']); 
					break;
				case 'mood6':
					$mood->setInc('mood6','aid='.$_GET['aid']); 
					break;
				case 'mood7':
					$mood->setInc('mood7','aid='.$_GET['aid']); 
					break;
				case 'mood8':
					$mood->setInc('mood8','aid='.$_GET['aid']); 
					break;
			}
		$list=$mood->where("aid=".$_GET['aid'])->find(); 
		echo "{$list['mood1']},{$list['mood2']},{$list['mood3']},{$list['mood4']},{$list['mood5']},{$list['mood6']},{$list['mood7']},{$list['mood8']}";
		}
		else
		{
			echo '0,0,0,0,0,0,0,0';
		}
	}
}
?>