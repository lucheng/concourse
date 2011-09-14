<?php
class ScrollModel extends Model 
{
	protected $autoCreateTimestamps = array('postdate');	
	protected $_validate=array(
		array('subject','require','标题必填',0,'','all'),
		array('url','require','链接地址必填',0,'','all'),
	);	
	protected $_auto	 =	 array(
		array('subject','dhtml','ALL','function'),
		array('url','cvhttp','ALL','function'),
	);			
}
?>