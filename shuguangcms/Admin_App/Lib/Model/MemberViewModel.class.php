<?php
class MemberViewModel extends Model{
	protected $viewModel = true;
	//protected $masterModel = 'Member';
	protected $viewFields = array(
		'Member'=>array('id'=>'memberid','username','groupid','regtime','ischecked','realname','_type'=>'LEFT'),
		'Usergroup'=>array('id'=>'usergroupid','grouptitle','_on'=>'Member.groupid=Usergroup.id'),
		);
	//protected $viewCondition = array("Member.groupid" => array('eqf',"Usergroup.id"));
	
}
?>