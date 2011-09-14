<?php
class ReviewModel extends Model 
{
	protected $_validate=array(
		array('rtitle','require','回复主题必填'),
		array('rcontent','require','回复内容必填'),
	);	
}
?>