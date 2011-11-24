<?php
class CategoryModel extends Model 
{

	public $_link = array(

        /*'parent'=> array(  
			'mapping_type'	=>	BELONGS_TO,
			'class_name'	=>	'Category',
			'foreign_key'	=>	'parent_id',
		),*/
		
		'children'=> array(  
			'mapping_type'	=>	HAS_MANY,
			'class_name'	=>	'Category',
			'foreign_key'	=>	'parent_id',
			'mapping_name'=>'children',
			'mapping_order'=>'displayorder desc',
		),
	);

}
?>