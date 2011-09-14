<?php
class CategoryModel extends Model 
{

	protected $_validate=array(
		array('title','require','标题必填',0,'','all'),
	);	
/*	*/
	protected $_auto	 =	 array(
		array('title','dhtml','ALL','function'),
	);

}
?>