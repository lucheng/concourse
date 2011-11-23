<?php 
class CategoryModel extends Model 
{

	public $_link = array(

        'Category'=> array(

			'mapping_type'=>HAS_MANY,

			'class_name'=>'Category',

			'foreign_key'=>'parent_id',

			'mapping_name'=>'children',

			'mapping_order'=>'displayorder desc',

		),

	
	);
}
?>