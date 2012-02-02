<?php
/**
  * @author nanze
  * @link 
  * @todo 
  * @copyright 811046@qq.com
  * @version 1.0
  * @lastupdate 2010-11-23
*/ 
class PaymentModel extends Model{
	public function getlist(){
		$list=$this->order('sort desc')->findAll();
		$array=array();
		for ($row=0;$row<count($list);$row++){
			$status=GetSettValue($list[$row]['name']."_status");
			if($status){
				$array[]=$list[$row];
			}
		}	
		return $array;

	}
	public function get_id($name){
		$id=$this->where(array('name'=>$name))->getField('id');
		return $id;

	}
}
?>