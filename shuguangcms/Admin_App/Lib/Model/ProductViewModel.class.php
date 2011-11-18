<?php
class ProductViewModel extends Model{
	protected $viewModel = true;
	protected $masterModel = 'Product';
	protected $viewFields = array(
		'Product'=>array('id','cid','color','attachpath','attachthumb','subject','spec','size','meno','keywords','content','ischecked','isgood','istop','hits','postdate','_type'=>'LEFT'),
		'Category'=>array('title','_on'=>'Product.cid=Category.id'),
//		'Category'=>array('ptitle','_on'=>'Category.id=Category.parent_id'),
		);
	//protected $viewCondition = array("Product.cid" => array('eqf',"Category.id"));
	public function getPk() {
		return 'id';
	}
}
?>