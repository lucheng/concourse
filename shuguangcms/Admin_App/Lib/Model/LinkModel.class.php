<?php
class LinkModel extends Model 
{
	protected $autoCreateTimestamps = array('postdate');	
	protected $_validate=array(
		array('title','require','网站名称必填',0,'','all'),
		array('url','require','链接地址必填',0,'','all'),
	);	
	protected $_auto	 =	 array(
		array('ischecked','1','ADD'),
		array('title','dhtml','ALL','function'),
//		array('url','cvhttp','ALL','function'),
	);			
}
?>