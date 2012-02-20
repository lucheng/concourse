<?php
/**
 * 用于分词返回的预设函数
 * @param string $content
 */
function load_tags($content='')
{

	if($content!='')
	{
		//$sh = scws_open();
		//scws_set_charset($sh, 'utf-8');
		//scws_set_dict($sh, FANWE_ROOT.'/public/dict.utf8.xdb');
		//scws_set_rule($sh, '/path/to/rules.ini');
		$text = $content;
		//scws_send_text($sh, $text);
		//$arr = scws_get_tops($sh);
		$arr = array();
		$str ="";
		foreach($arr as $item)
		{
			$str .=  "<a href='javascript:void(0);' onclick='set_tag(\"tags\",this);'>".$item['word']."</a> ";
		}

		return $str;
	}
	else
	{
			$str =  "";
	}

	return $str;
}

/**
 * 用于分词返回的预设函数,用于载入预选的标签
 * @param string $content
 */
function load_tags_input($content='')
{

	if($content!='')
	{
		//$sh = scws_open();
		//scws_set_charset($sh, 'utf-8');
		//scws_set_dict($sh, FANWE_ROOT.'/public/dict.utf8.xdb');
		//scws_set_rule($sh, '/path/to/rules.ini');
		$text = $content;
		//scws_send_text($sh, $text);
		//$arr = scws_get_tops($sh);
		$arr = array();
		$str ="";
		foreach($arr as $item)
		{
			$str .=  $item['word']." ";
		}

		return $str;
	}
	else
	{
			$str =  "";
	}

	return $str;
}

/**
 *
 * @param $cids  分类ID数组
 * @param $limit
 */
function getHotTags($cids = array(),$cate_code,$limit)
{
	$hot_tags = array();
	$sql = 'SELECT gt.tag_name,gt.tag_code,gt.count,gt.is_hot
		FROM '.FDB::table('goods_tags').' as gt
		INNER JOIN '.FDB::table("goods_category_tags").' AS gct ON gct.tag_id = gt.tag_id
		WHERE gct.cate_id IN ('.implode(',',$cids).')
		ORDER BY gt.count DESC,gt.sort ASC LIMIT 0,'.$limit;

	$res  = FDB::query($sql);
	while($data = FDB::fetch($res))
	{
		$data['url'] = FU("book/cate",array('cate'=>$cate_code,'tag'=>urlencode($data['tag_name'])));
		$hot_tags[] = $data;
	}
	return $hot_tags;
}



//获取xxx之家内的分享数据集
function getMeList()
{
	global $_FANWE;
	$page_size = 25;
	//查询被关注会员以及自己发表的相关分享
	$sql = 'SELECT DISTINCT s.share_id FROM '.FDB::table("share").' AS s
		LEFT JOIN '.FDB::table('user_follow').' AS uf ON uf.uid = s.uid
		WHERE (uf.f_uid = '.$_FANWE['uid'].' OR s.uid = '.$_FANWE['uid'].')
		ORDER BY s.share_id DESC';

	$sql_count = 'SELECT COUNT(DISTINCT s.share_id) FROM '.FDB::table("share").' AS s
		INNER JOIN '.FDB::table('user_follow').' AS uf ON uf.uid = s.uid
		WHERE (uf.f_uid = '.$_FANWE['uid'].' OR s.uid = '.$_FANWE['uid'].')';

	$count = FDB::resultFirst($sql_count);

	$pager = buildPage('home/me',array(),$count,$_FANWE['page'],$page_size);

	$sql  = $sql.' LIMIT '.$pager['limit'];

	$list = FDB::fetchAll($sql);

	require_once fimport("service/share");
	$share_list = ShareService::getShareDetailList($list,true,true,true,true,true);

	$args = array('share_list'=>&$share_list,'pager'=>&$pager);
	return tplFetch("inc/shareutil/share_me_list",$args);
}

//我的发表
function getTalkList()
{
	global $_FANWE;
	$page_size = 5;

	$sql = "select distinct(s.share_id),s.parent_id,u.is_daren,s.share_data,u.user_name,s.content,s.uid,s.collect_count,s.relay_count,s.comment_count,s.create_time,s.type,s.title from ".FDB::table("share")." as s left join ".
			FDB::table("user")." as u on u.uid = s.uid ".
			" where (s.uid = ".intval($_FANWE['uid']).") and s.type in ('default','fav') order by s.create_time desc ";
	$sql_count = "select count(distinct(s.share_id)) from ".FDB::table("share")." as s  ".

					" where ( s.uid = ".intval($_FANWE['uid']).") and s.type in ('default','fav')";

	$count = FDB::resultFirst($sql_count);

	$pager = buildPage('home/talk',array(),$count,$_FANWE['page'],$page_size);

	$sql  = $sql." limit ".$pager['limit'];

	$list = FDB::fetchAll($sql);

	require_once fimport("service/share");
	$share_list = ShareService::getShareDetailList($list,true,true,true,true,true);

	$args = array('share_list'=>&$share_list,'pager'=>&$pager);
	return tplFetch("inc/shareutil/share_u_list",$args);
}

//提到我的
function getAtmeList()
{
	global $_FANWE;
	$page_size = 5;

	$sql = "select distinct(s.share_id),s.parent_id,u.is_daren,s.share_data,u.user_name,s.content,s.uid,s.collect_count,s.relay_count,s.comment_count,s.create_time,s.type,s.title from ".FDB::table("share")." as s left join ".
			FDB::table("share")." as ps on ps.share_id = s.parent_id left join ".
			FDB::table("user")." as u on u.uid = s.uid ".
			" where (ps.uid = ".intval($_FANWE['uid']).") and s.type in ('default','fav') order by s.create_time desc ";
	$sql_count = "select count(distinct(s.share_id)) from ".FDB::table("share")." as s  left join ".
					FDB::table("share")." as ps on ps.share_id = s.parent_id ".
					" where ( ps.uid = ".intval($_FANWE['uid']).") and s.type in ('default','fav')";

	$count = FDB::resultFirst($sql_count);

	$pager = buildPage('home/atme',array(),$count,$_FANWE['page'],$page_size);

	$sql  = $sql." limit ".$pager['limit'];

	$list = FDB::fetchAll($sql);

	require_once fimport("service/share");
	$share_list = ShareService::getShareDetailList($list,true,true,true,true,true);

	$args = array('share_list'=>&$share_list,'pager'=>&$pager);
	return tplFetch("inc/shareutil/share_u_list",$args);
}

//评论我的
function getCommentsList()
{
	global $_FANWE;
	$page_size = 5;

	$sql = "select distinct(s.share_id),cs.share_id as parent_id,u.is_daren,s.share_data,u.user_name,s.content,s.uid,s.collect_count,s.relay_count,s.comment_count,s.create_time,s.type,s.title from ".FDB::table("share")." as s left join ".
			FDB::table("share_comment")." as c on c.comment_id = s.parent_id left join ".
			FDB::table("share")." as cs on c.share_id = cs.share_id left join ".
			FDB::table("user")." as u on u.uid = s.uid ".
			" where (cs.uid = ".intval($_FANWE['uid']).") and s.type in ('comments') order by s.create_time desc ";
	$sql_count = "select count(distinct(s.share_id)) from ".FDB::table("share")." as s  left join ".
					FDB::table("share_comment")." as c on c.comment_id = s.parent_id left join ".
					FDB::table("share")." as cs on c.share_id = cs.share_id ".
					" where ( cs.uid = ".intval($_FANWE['uid']).") and s.type in ('comments')";

	$count = FDB::resultFirst($sql_count);

	$pager = buildPage('home/comments',array(),$count,$_FANWE['page'],$page_size);

	$sql  = $sql." limit ".$pager['limit'];

	$list = FDB::fetchAll($sql);

	require_once fimport("service/share");
	$share_list = ShareService::getShareDetailList($list,true,true,true,true,true);

	$args = array('share_list'=>&$share_list,'pager'=>&$pager);
	return tplFetch("inc/shareutil/share_u_list",$args);
}


//随便逛逛
function getAllList()
{
	global $_FANWE;
	$page_size = 5;

	$sql = "select distinct(s.share_id),s.parent_id,u.is_daren,s.share_data,u.user_name,s.content,s.uid,s.collect_count,s.relay_count,s.comment_count,s.create_time,s.type,s.title from ".FDB::table("share")." as s left join ".
			FDB::table("user")." as u on u.uid = s.uid ".
			" where s.type in ('default','fav') order by s.create_time desc ";
	$sql_count = "select count(distinct(s.share_id)) from ".FDB::table("share")." as s ".
					" where s.type in ('default','fav')";

	$count = FDB::resultFirst($sql_count);

	$pager = buildPage('home/all',array(),$count,$_FANWE['page'],$page_size);

	$sql  = $sql." limit ".$pager['limit'];

	$list = FDB::fetchAll($sql);

	require_once fimport("service/share");
	$share_list = ShareService::getShareDetailList($list,true,true,true,true,true);

	$args = array('share_list'=>&$share_list,'pager'=>&$pager);
	return tplFetch("inc/shareutil/share_me_list",$args);
}
?>