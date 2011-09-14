<?php
class FeedbackModel extends Model 
{
	/**/
	protected $_validate=array(
		array('type','require','类型必填',0,'','all'),
		array('username','require','姓名必填',0,'','all'),
		array('content','require','留言内容必填',0,'','all'),
	);	
	
	protected $_auto	 =	 array(
		array('ischecked','0','ADD'),
		array('postdate','time','ADD','function'),
		array('replydate','time','ALL','function'),
	);	
}
?>