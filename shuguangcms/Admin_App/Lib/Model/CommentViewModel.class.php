<?php
class CommentViewModel extends Model{
	protected $viewModel = true;
	protected $masterModel = 'Comment';	
	protected $viewFields = array(
		'Comment'=>array('id'=>'commentid','tid','ip','username'=>'commentuser','ischecked'=>'commentischecked','postdate'=>'commentpostdate'),
		'Article'=>array('id','subject','uid','attachthumb','color','istop','isgood','ischecked','username','comefrom','postdate','hits','ischecked','istop'),
		'Category'=>array('title'),
		);
	protected $viewCondition = array(
	"Comment.tid" => array('eqf',"Article.id"),
	"Article.id" => array('eqf',"Category.id"),
	);
	public function getPk() {
		return 'id';
	}
}
?>