<?php
/**
 *  当前模板用到的相关函数
*/

/**
 * 首页 热门活动,最新活动
 */
function getUUHotEvent()
{
	$cache_file = getTplCache('inc/index/hot_event',array(),1);
	if(getCacheIsUpdate($cache_file,300))
	{
		$args['img_event'] = FS('Topic')->getHotEventTopic(1);
		$img_tid = array();
		if(!empty($args['img_event']))
		{
			$args['img_event'] = current($args['img_event']);
			$img_tid[] = $args['img_event']['tid'];
		}
		$args['new_topics'] = FS('Topic')->getEventTopic(3,$img_tid);
	}
	return tplFetch('inc/index/hot_event',$args,'',$cache_file);
}

/**
 * 新入会员
 */
function getUUNewUsers()
{
    $args['users'] = FS('User')->getNewUsers(10);
    return tplFetch('inc/index/new_user',$args);
}

/**
 * 首页 热门主题
 */
function getUUHotTopic()
{
	$cache_file = getTplCache('inc/index/hot_topic',array(),1);
	if(getCacheIsUpdate($cache_file,300))
	{
		$args['hot_topics'] = FS('Topic')->getImgTopic('hot',6,1);
		if(!empty($args['hot_topics']))
		{
			$args['img_topic'] = current(array_slice($args['hot_topics'],0,1));
			$args['hot_topics'] = array_slice($args['hot_topics'],1);
		}
	}
	return tplFetch('inc/index/hot_topic',$args,'',$cache_file);
}

/**
 * 首页 推荐达人
 */
function getUUBestDarens()
{
	$args['daren_list'] = FS('Daren')->getBestDarens(4);
	return tplFetch('inc/index/best_daren',$args);
}

/**
 * 首页 最新的主题
 */
function getUUIndexTopic()
{
	global $_FANWE;
	$args = array();
	$cache_file = getTplCache('inc/index/new_topic',array(),1);
	if(getCacheIsUpdate($cache_file,300))
	{
		$res = FDB::query('SELECT fid,thread_count FROM '.FDB::table('forum').' WHERE parent_id = 0');
		while($data = FDB::fetch($res))
		{
			$_FANWE['cache']['forums']['all'][$data['fid']]['thread_count'] = $data['thread_count'];
		}

		$args['new_list'] = FS('Topic')->getImgTopic('new',5,1);
		$args['top_list'] = FS('Topic')->getImgTopic('top',3,1);
	}

	return tplFetch('inc/index/topics',$args,'',$cache_file);
}
?>