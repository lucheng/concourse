<?php
class AnnounceModel extends Model 
{
	protected $_validate=array(
		array('title','require','标题必填',0,'','all'),
		array('content','require','内容必填',0,'','all'),
	);	
	protected $_auto	 =	 array(
		array('subject','dhtml','ALL','function'),
		array('postdate','time','ADD','function'),
		array('link','cvhttp','ALL','function'),
		);		
}
?>