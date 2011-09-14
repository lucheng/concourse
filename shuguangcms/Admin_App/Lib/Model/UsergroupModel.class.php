<?php
class UsergroupModel extends Model 
{
	protected $autoCreateTimestamps = array('regtime','lastlogintime');	
	/**/
	protected $_validate=array(
		array('grouptitle','require','组名必填',0,'','all'),
	);
}
?>