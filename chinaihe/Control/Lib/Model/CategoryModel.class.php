<?php
class CategoryModel extends RelationModel 
{

	public $_link = array(

		'children'=> array(  
			'mapping_type'	=>	HAS_MANY,
			'class_name'	=>	'Category',
			'foreign_key'	=>	'parent_id',
		),
	);
 
}
?>