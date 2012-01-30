<?php
/***********************************************************
    [WaiKuCms] (C)2011 - 2011 waikucms.com

	@function article 视图模型

    @Filename ArticleViewModel.class.php $

    @Author pengyong $

    @Date 2011-11-17 15:22:07 $
*************************************************************/
class ArticleViewModel extends ViewModel
{
	public $viewFields = array( 

  'article'=>array('aid','typeid','title','addtime','istop','hits','status','isimg','ishot','_type'=>'LEFT'), 

  'type'=>array('typename', '_on'=>'article.typeid=type.typeid'), 

 ); 

}
?>