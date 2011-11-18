<?php
class ProductModel extends Model 
{
	public $_link = array(

        'category'=> array(  
			'mapping_type'	=>	BELONGS_TO,
			'class_name'	=>	'Category',
			'foreign_key'	=>	'category_id',
		),
		
		/*'children'=> array(  
			'mapping_type'	=>	HAS_MANY,
			'class_name'	=>	'Category',
			'foreign_key'	=>	'pid',
		),*/
	);
	
}
?>