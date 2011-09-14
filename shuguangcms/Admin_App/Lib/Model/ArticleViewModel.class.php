<?php
class ArticleViewModel extends Model{
	protected $viewModel = true;
	protected $viewFields = array(
		'Article'=>array('id','subject','uid','attachthumb','color','istop','isgood','ischecked','username','comefrom','postdate','hits','ischecked','istop','_type'=>'LEFT'),
		'Category'=>array('title','_on'=>'Article.cid=Category.id'),
		);
	//protected $viewCondition = array("Article.cid" => array('eqf',"Category.id"));
	public function getPk() {
		return 'id';
	}
}
?>