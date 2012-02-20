<?php
class UModule
{
	public function me()
	{
		global $_FANWE;
		Cache::getInstance()->loadCache('citys');
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);

		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$page_size = 30;

		$uids = array();
		$uids[] = $_FANWE['uid'];

		//获取我关注的会员编号
		$sql = 'SELECT uid
			FROM '.FDB::table('user_follow').'
			WHERE f_uid = '.$_FANWE['uid'];
		$res = FDB::query($sql);
		while($data = FDB::fetch($res))
		{
			$uids[] = $data['uid'];
		}

		$is_all = false;

		$sql = 'SELECT COUNT(share_id)
			FROM '.FDB::table("share").'
			WHERE uid IN ('.implode(',',$uids).')';
		$count = FDB::resultFirst($sql);

		if($count == 0)
		{
			$max_count = $page_size * 5;
			$is_all = true;
			$sql = 'SELECT COUNT(share_id) FROM '.FDB::table("share");
			$count = FDB::resultFirst($sql);
			if($count > $max_count)
				$count = $max_count;
		}

		$pager = buildPage('u/'.ACTION_NAME,array(),$count,$_FANWE['page'],$page_size);

		if($is_all)
			$sql = 'SELECT share_id
				FROM '.FDB::table("share").'
				ORDER BY share_id DESC LIMIT '.$pager['limit'];
		else
			$sql = 'SELECT share_id
				FROM '.FDB::table("share").'
				WHERE uid IN ('.implode(',',$uids).')
				ORDER BY share_id DESC LIMIT '.$pager['limit'];

		$share_list = FDB::fetchAll($sql);
		$share_list = FS('Share')->getShareDetailList($share_list,true,true,true,true,true);

		$args = array('share_list'=>&$share_list,'pager'=>&$pager);
		$share_list_html = tplFetch("inc/u/me_share_list",$args);

		$hot_events = FS('Topic')->getHotEventTopic(3);
		$today_daren = FS('Daren')->getIndexTodayDaren();
		$is_follow_daren = FS('User')->getIsFollowUId($today_daren['user']['uid']);

		include template('page/u/u_me');
		display();
	}

	public function book()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		Cache::getInstance()->loadCache('citys');
		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$tags_sql = 'SELECT DISTINCT(st.tag_name)
			FROM '.FDB::table('share').' AS s
			INNER JOIN '.FDB::table('share_tags').' AS st ON st.share_id = s.share_id
			WHERE s.uid = '.$home_uid.' LIMIT 0,20';
		$focus_tags = FDB::fetchAll($tags_sql);

		$condition = " WHERE s.share_data in ('goods','photo','goods_photo') AND s.uid = ".$home_uid;
		$sql = 'SELECT COUNT(DISTINCT s.share_id) FROM '.FDB::table('share').' AS s '.$condition;
		$count=FDB::resultFirst($sql);

		$page_size = 43;
		$pageargs = array();
		$pageargs['uid'] = $home_uid;
		$pager = buildPage('u/'.ACTION_NAME,$pageargs,$count,$_FANWE['page'],$page_size,'',2);

		$sql = 'SELECT DISTINCT(s.share_id),s.collect_count,s.click_count,s.comment_count,s.create_time
			FROM '.FDB::table('share').' as s '.$condition.' LIMIT '.$pager['limit'];

		$share_list = FDB::fetchAll($sql);
		$share_list = FS('Share')->getShareDetailList($share_list);

		$is_show_follow = false;
		if($home_uid != $_FANWE['uid'])
		{
			if(!FS('User')->getIsFollowUId($home_uid))
				$is_show_follow = true;
		}

		$col = 4;
		$index = 0;
		$findex = 0;
		$share_display = array();
		foreach($share_list as $share)
		{
			if($findex < 3)
			{
				$share_display['col'.($findex + 1)][] = $share;
			}
			else
			{
				$mod = $index % $col;
				$share_display['col'.$mod][] = $share;
				$index++;
			}
			$findex++;
		}

		include template('page/u/u_book');
		display();
	}

	public function talk()
	{
		global $_FANWE;
		Cache::getInstance()->loadCache('citys');
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);

		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$page_size = 30;

		$pageargs = array();
		$pageargs['uid'] = $home_uid;

		$sql = 'SELECT COUNT(share_id)
			FROM '.FDB::table("share").'
			WHERE uid = '.$home_uid;
		$count = FDB::resultFirst($sql);

		$pager = buildPage('u/'.ACTION_NAME,$pageargs,$count,$_FANWE['page'],$page_size);

		$sql = 'SELECT share_id
			FROM '.FDB::table("share").'
			WHERE uid = '.$home_uid.'
			ORDER BY share_id DESC LIMIT '.$pager['limit'];

		$share_list = FDB::fetchAll($sql);
		$share_list = FS('Share')->getShareDetailList($share_list,true,true,true,true,true);

		$args = array('share_list'=>&$share_list,'pager'=>&$pager);

        if($home_uid == $_FANWE['uid'])
		    $share_list_html = tplFetch("inc/u/u_share_list",$args);
        else
            $share_list_html = tplFetch("inc/u/me_share_list",$args);

		$hot_events = FS('Topic')->getHotEventTopic(3);
		$today_daren = FS('Daren')->getIndexTodayDaren();
		$is_follow_daren = FS('User')->getIsFollowUId($today_daren['user']['uid']);

		include template('page/u/u_me');
		display();
	}

	public function comments()
	{
		global $_FANWE;
		Cache::getInstance()->loadCache('citys');
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);

		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$page_size = 30;

		$pageargs = array();
		$pageargs['uid'] = $home_uid;

		$sql = 'SELECT COUNT(sc.comment_id)
			FROM '.FDB::table("share").' AS s
			INNER JOIN '.FDB::table("share_comment").' AS sc ON sc.share_id = s.share_id
			WHERE s.uid = '.$home_uid;

		$count = FDB::resultFirst($sql);

		$pager = buildPage('u/'.ACTION_NAME,$pageargs,$count,$_FANWE['page'],$page_size);
		$comment_list = array();
		$sql = 'SELECT sc.*,u.user_name,s.content as scontent
			FROM '.FDB::table("share").' AS s
			INNER JOIN '.FDB::table("share_comment").' AS sc ON sc.share_id = s.share_id
			INNER JOIN '.FDB::table("user").' AS u ON u.uid = sc.uid
			WHERE s.uid = '.$home_uid.'
			ORDER BY comment_id DESC LIMIT '.$pager['limit'];
		$res = FDB::query($sql);
		while($data = FDB::fetch($res))
		{
			$data['time'] = getBeforeTimelag($data['create_time']);
			$data['is_show_follow'] = $data['uid'] == $_FANWE['uid'] ? false : true;
			if($data['is_show_follow'])
				$data['is_follow_user'] = FS('User')->getIsFollowUId($data['uid']);
			$data['url'] = FU('note/index',array('sid'=>$data['share_id']));
			$data['user_url'] = FU('u/index',array('uid'=>$data['uid']));
			$comment_list[] = $data;
		}

		$args = array('comment_list'=>&$comment_list,'pager'=>&$pager);
		$share_list_html = tplFetch("inc/u/u_comments_list",$args);

		$hot_events = FS('Topic')->getHotEventTopic(3);
		$today_daren = FS('Daren')->getIndexTodayDaren();
		$is_follow_daren = FS('User')->getIsFollowUId($today_daren['user']['uid']);

		include template('page/u/u_me');
		display();
	}

	public function all()
	{
		global $_FANWE;
		Cache::getInstance()->loadCache('citys');
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);

		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$page_size = 30;

		$max_count = $page_size * 5;
		$is_all = true;
		$sql = 'SELECT COUNT(share_id) FROM '.FDB::table("share");
		$count = FDB::resultFirst($sql);
		if($count > $max_count)
			$count = $max_count;

		$pager = buildPage('u/'.ACTION_NAME,array(),$count,$_FANWE['page'],$page_size);

		$sql = 'SELECT share_id
			FROM '.FDB::table("share").'
			ORDER BY share_id DESC LIMIT '.$pager['limit'];

		$share_list = FDB::fetchAll($sql);
		$share_list = FS('Share')->getShareDetailList($share_list,true,true,true,true,true);

		$args = array('share_list'=>&$share_list,'pager'=>&$pager);
		$share_list_html = tplFetch("inc/u/me_share_list",$args);

		$hot_events = FS('Topic')->getHotEventTopic(3);
		$today_daren = FS('Daren')->getIndexTodayDaren();
		$is_follow_daren = FS('User')->getIsFollowUId($today_daren['user']['uid']);

		include template('page/u/u_me');
		display();
	}

	public function fav()
	{
		global $_FANWE;
		Cache::getInstance()->loadCache('citys');
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$current_menu = 'fav';
		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$page_size = 30;

		$pageargs = array();
		$pageargs['uid'] = $home_uid;

		$fav_share_ids = array();
		$sql = 'SELECT parent_id
			FROM '.FDB::table("share").'
			WHERE type = \'fav\' AND uid = '.$home_uid.'
			GROUP BY parent_id';

		$res = FDB::query($sql);
		while($data = FDB::fetch($res))
		{
			$fav_share_ids[] = $data['parent_id'];
		}

		$count = count($fav_share_ids);
		if($count > 0)
		{
			$sql = 'SELECT uid
				FROM '.FDB::table("share").'
				WHERE share_id '.FDB::createIN($fav_share_ids).'
				GROUP BY uid';
			$fav_uids = array();
			$res = FDB::query($sql);
			while($data = FDB::fetch($res))
			{
				$fav_uids[] = $data['uid'];
			}

			$fav_share_ids = array();
			$sql = 'SELECT parent_id
				FROM '.FDB::table("share").'
				WHERE type = \'fav\' AND uid '.FDB::createIN($fav_uids).'
				GROUP BY parent_id
				ORDER BY parent_id DESC LIMIT 0,100';
			$res = FDB::query($sql);
			while($data = FDB::fetch($res))
			{
				$fav_share_ids[] = $data['parent_id'];
			}

			$sql = 'SELECT share_id
				FROM '.FDB::table("share").'
				WHERE share_id '.FDB::createIN($fav_share_ids).'
					AND share_data IN (\'goods\',\'goods_photo\',\'photo\')
					AND uid <> '.$home_uid.'
				ORDER BY share_id DESC LIMIT 0,10';
			$fav_list = FDB::fetchAll($sql);
			$fav_list = FS('Share')->getShareDetailList($fav_list);
		}

		$pager = buildPage('u/'.ACTION_NAME,$pageargs,$count,$_FANWE['page'],$page_size);

		$sql = 'SELECT parent_id AS share_id
			FROM '.FDB::table("share").'
			WHERE type = \'fav\' AND uid = '.$home_uid.'
			GROUP BY parent_id
			ORDER BY parent_id DESC LIMIT '.$pager['limit'];

		$share_list = FDB::fetchAll($sql);
		$share_list = FS('Share')->getShareDetailList($share_list,true,true,true,true,true);

		$args = array('share_list'=>&$share_list,'pager'=>&$pager);
		$share_list_html = tplFetch("inc/u/u_share_list",$args);

		$hot_events = FS('Topic')->getHotEventTopic(3);
		$today_daren = FS('Daren')->getIndexTodayDaren();
		$is_follow_daren = FS('User')->getIsFollowUId($today_daren['user']['uid']);

		include template('page/u/u_fav');
		display();
	}

	public function bao()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$user_names = FS('User')->getUserShowName($home_uid);

		$page_args = array(
			'uid'=>$home_uid
		);
		$current_menu = 'bao';
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$home_user['goods'],$_FANWE['page'],36);

		$goods_list = array();
		$res = FDB::query('SELECT sg.goods_id,sg.share_id,sg.img,sg.name,sg.price,s.collect_count
			FROM '.FDB::table('share_goods').' AS sg
			INNER JOIN '.FDB::table("share").' AS s ON s.share_id = sg.share_id
			WHERE sg.uid = '.$home_uid.' ORDER BY sg.goods_id DESC LIMIT '.$pager['limit']);
		while($goods = FDB::fetch($res))
		{
			$goods['url'] = FU('note/g',array('sid'=>$goods['share_id'],'id'=>$goods['goods_id']));
			$goods_list[] = $goods;
		}

		include template('page/u/u_bao');
		display();
	}

	public function photo()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$user_names = FS('User')->getUserShowName($home_uid);

		$page_args = array(
			'uid'=>$home_uid
		);
		$current_menu = 'photo';
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$home_user['photos'],$_FANWE['page'],36);
		$photo_list = array();
		$res = FDB::query('SELECT sp.photo_id,sp.share_id,sp.img,s.collect_count
			FROM '.FDB::table('share_photo').' AS sp
			INNER JOIN '.FDB::table("share").' AS s ON s.share_id = sp.share_id
			WHERE sp.uid = '.$home_uid.' ORDER BY sp.photo_id DESC LIMIT '.$pager['limit']);
		while($photo = FDB::fetch($res))
		{
			$photo['url'] = FU('note/m',array('sid'=>$photo['share_id'],'id'=>$photo['photo_id']));
			$photo_list[] = $photo;
		}

		include template('page/u/u_photo');
		display();
	}

	public function topic()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		FanweService::instance()->cache->loadCache('forums');
		$current_menu = 'topic';
		$page_args = array(
			'uid'=>$home_uid
		);

		$share_datas = array();
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$home_user['forums'],$_FANWE['page'],10);

		$thread_list = array();
		$res = FDB::query('SELECT ft.*,s.share_data FROM '.FDB::table('forum_thread').' AS ft
			INNER JOIN '.FDB::table('share').' AS s ON s.share_id = ft.share_id
			WHERE ft.uid = '.$home_uid.' ORDER BY ft.tid DESC LIMIT '.$pager['limit']);
		while($thread = FDB::fetch($res))
		{
			$thread['url'] = FU('club/detail',array('tid'=>$thread['tid']));
			$thread['time'] = getBeforeTimelag($thread['create_time']);
			$thread['cate'] = $_FANWE['cache']['forums']['all'][$thread['fid']];
			$share_datas[$thread['share_data']][] = $thread['share_id'];
			$thread_list[$thread['share_id']] = $thread;
		}

		FS('Share')->getShareImages($share_datas,$thread_list);

		include template('page/u/u_topic');
		display();
	}

	public function maybe()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$user_names = FS('User')->getUserShowName($home_uid);
		FanweService::instance()->cache->loadCache('forums');

		$page_args = array(
			'uid'=>$home_uid
		);
		$current_menu = 'topic';
		$share_datas = array();
		$follow_uids = array();
		$sql = 'SELECT uid
			FROM '.FDB::table('user_follow').'
			WHERE f_uid = '.$home_uid.'
			GROUP BY uid';
		$res = FDB::query($sql);
		while($data = FDB::fetch($res))
		{
			$follow_uids[] = $data['uid'];
		}

		if(count($follow_uids) > 0)
		{
			$sql = 'SELECT COUNT(tid)
				FROM '.FDB::table('forum_thread').'
				WHERE uid '.FDB::createIN($follow_uids);
			$count = FDB::resultFirst($sql);
			$pager = buildPage('u/'.ACTION_NAME,$page_args,$count,$_FANWE['page'],10);

			$thread_list = array();
			$res = FDB::query('SELECT ft.*,s.share_data FROM '.FDB::table('forum_thread').' AS ft
				INNER JOIN '.FDB::table('share').' AS s ON s.share_id = ft.share_id
				WHERE ft.uid '.FDB::createIN($follow_uids).' ORDER BY ft.tid DESC LIMIT '.$pager['limit']);
			while($thread = FDB::fetch($res))
			{
				$thread['url'] = FU('club/detail',array('tid'=>$thread['tid']));
				$thread['time'] = getBeforeTimelag($thread['create_time']);
				$thread['cate'] = $_FANWE['cache']['forums']['all'][$thread['fid']];
				$share_datas[$thread['share_data']][] = $thread['share_id'];
				$thread_list[$thread['share_id']] = $thread;
			}

			FS('Share')->getShareImages($share_datas,$thread_list);
		}

		include template('page/u/u_topic');
		display();
	}

	public function ask()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		FanweService::instance()->cache->loadCache('asks');

		$page_args = array(
			'uid'=>$home_uid
		);
		$current_menu = 'topic';
		$share_datas = array();
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$home_user['ask'],$_FANWE['page'],10);

		$thread_list = array();
		$res = FDB::query('SELECT at.*,s.share_data FROM '.FDB::table('ask_thread').' AS at
			INNER JOIN '.FDB::table('share').' AS s ON s.share_id = at.share_id
			WHERE at.uid = '.$home_uid.' ORDER BY at.tid DESC LIMIT '.$pager['limit']);
		while($thread = FDB::fetch($res))
		{
			$thread['url'] = FU('ask/detail',array('tid'=>$thread['tid']));
			$thread['time'] = getBeforeTimelag($thread['create_time']);
			$thread['cate'] = $_FANWE['cache']['asks'][$thread['aid']];
			$share_datas[$thread['share_data']][] = $thread['share_id'];
			$thread_list[$thread['share_id']] = $thread;
		}

		FS('Share')->getShareImages($share_datas,$thread_list);

		include template('page/u/u_topic');
		display();
	}

	public function attention()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		FanweService::instance()->cache->loadCache('asks');
		FanweService::instance()->cache->loadCache('forums');

		$page_args = array(
			'uid'=>$home_uid
		);
		$current_menu = 'topic';
		$share_datas = array();
		$count = FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user_attention').' WHERE uid = '.$home_uid);
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$count,$_FANWE['page'],10);

		$thread_list = array();
		$res = FDB::query('SELECT ua.rec_id,s.share_data,ua.type,ua.share_id
			FROM '.FDB::table('user_attention').' AS ua
			INNER JOIN '.FDB::table('share').' AS s ON s.share_id = ua.share_id
			WHERE ua.uid = '.$home_uid.' ORDER BY ua.create_time DESC LIMIT '.$pager['limit']);
		while($attention = FDB::fetch($res))
		{
			if($attention['type'] == 'bar')
			{
				$sql = 'SELECT tid,fid,title,content,ft.uid,post_count,ft.create_time
					FROM '.FDB::table('forum_thread').' AS ft
					WHERE ft.tid = '.$attention['rec_id'];
			}
			else
			{
				$sql = 'SELECT tid,aid,title,content,at.uid,post_count,at.create_time
					FROM '.FDB::table('ask_thread').' AS at
					WHERE at.tid = '.$attention['rec_id'];
			}

			$thread = FDB::fetchFirst($sql);
			if($attention['type'] == 'bar')
			{
				$thread['url'] = FU('club/detail',array('tid'=>$thread['tid']));
				$thread['cate'] = $_FANWE['cache']['forums']['all'][$thread['fid']];
			}
			else
			{
				$thread['url'] = FU('ask/detail',array('tid'=>$thread['tid']));
				$thread['cate'] = $_FANWE['cache']['asks'][$thread['aid']];
			}

			$thread['time'] = getBeforeTimelag($thread['create_time']);

			$share_datas[$attention['share_data']][] = $attention['share_id'];
			$thread_list[$attention['share_id']] = $thread;
		}

		FS('Share')->getShareImages($share_datas,$thread_list);

		include template('page/u/u_topic');
		display();
	}

	public function feed()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);
		FanweService::instance()->cache->loadCache('asks');
		FanweService::instance()->cache->loadCache('forums');

		$page_args = array(
			'uid'=>$home_uid
		);
		$current_menu = 'topic';
		$share_datas = array();
		$count = FDB::resultFirst('SELECT COUNT(DISTINCT parent_id)
			FROM '.FDB::table('share').'
			WHERE type IN (\'bar_post\',\'ask_post\') AND uid = '.$home_uid);

		$pager = buildPage('u/'.ACTION_NAME,$page_args,$count,$_FANWE['page'],10);

		$thread_list = array();
		$res = FDB::query('SELECT s1.share_id,s.rec_id,s1.share_data,s.type
			FROM '.FDB::table('share').' AS s
			INNER JOIN '.FDB::table('share').' AS s1 ON s1.share_id = s.parent_id
			WHERE s.type IN (\'bar_post\',\'ask_post\') AND s.uid = '.$home_uid.'
			GROUP BY s.parent_id
			ORDER BY s.parent_id DESC LIMIT '.$pager['limit']);

		while($data = FDB::fetch($res))
		{
			if($data['type'] == 'bar_post')
			{
				$sql = 'SELECT tid,fid,title,content,ft.uid,post_count,ft.create_time
					FROM '.FDB::table('forum_thread').' AS ft
					WHERE ft.tid = '.$data['rec_id'];
			}
			else
			{
				$sql = 'SELECT tid,aid,title,content,at.uid,post_count,at.create_time
					FROM '.FDB::table('ask_thread').' AS at
					WHERE at.tid = '.$data['rec_id'];
			}

			$thread = FDB::fetchFirst($sql);
			if($data['type'] == 'bar_post')
			{
				$thread['url'] = FU('club/detail',array('tid'=>$thread['tid']));
				$thread['cate'] = $_FANWE['cache']['forums']['all'][$thread['fid']];
			}
			else
			{
				$thread['url'] = FU('ask/detail',array('tid'=>$thread['tid']));
				$thread['cate'] = $_FANWE['cache']['asks'][$thread['aid']];
			}

			$thread['time'] = getBeforeTimelag($thread['create_time']);

			$share_datas[$data['share_data']][] = $data['share_id'];
			$thread_list[$data['share_id']] = $thread;
		}
		FS('Share')->getShareImages($share_datas,$thread_list);

		include template('page/u/u_topic');
		display();
	}

	public function follow()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);

		$page_args = array(
			'uid'=>$home_uid
		);

		Cache::getInstance()->loadCache('citys');

		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$count = FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user_follow').' WHERE f_uid = '.$home_uid);
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$count,$_FANWE['page'],20);

		$user_list = array();

		$res = FDB::query('SELECT u.uid,u.user_name,uc.fans,up.reside_province,up.reside_city
				FROM '.FDB::table('user_follow').' AS uf
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = uf.uid
				INNER JOIN '.FDB::table('user_count').' AS uc ON uc.uid = uf.uid
				INNER JOIN '.FDB::table('user_profile').' AS up ON up.uid = uf.uid
				WHERE uf.f_uid = '.$home_uid.' ORDER BY uf.create_time DESC LIMIT '.$pager['limit']);
		while($data = FDB::fetch($res))
		{
			if($home_uid == $_FANWE['uid'])
				$data['is_follow'] = FS('User')->getIsFollowUId2($data['uid'],$home_uid);

			if($home_uid != $_FANWE['uid'])
				$data['is_follow'] = FS('User')->getIsFollowUId($data['uid']);

			$data['reside_province'] = $_FANWE['cache']['citys']['all'][$data['reside_province']]['name'];
			$data['reside_city'] = $_FANWE['cache']['citys']['all'][$data['reside_city']]['name'];

			$data['share'] = FDB::fetchFirst('SELECT share_id,create_time,content
				FROM '.FDB::table('share').'
				WHERE uid = '.$data['uid'].'
				ORDER BY share_id DESC
				LIMIT 0,1');
			if($data['share'])
			{
				$data['share']['url'] = FU('note/index',array('sid'=>$data['share']['share_id']));
				$data['share']['time'] = getBeforeTimelag($data['share']['create_time']);
			}

			$user_list[] = $data;
		}

		include template('page/u/u_follow');
		display();
	}

	public function fans()
	{
		global $_FANWE;
		$home_uid = $_FANWE['home_uid'];
		$home_user = FS('User')->getUserById($home_uid);

		$page_args = array(
			'uid'=>$home_uid
		);

		Cache::getInstance()->loadCache('citys');

		$reside_province = $_FANWE['cache']['citys']['all'][$home_user['reside_province']]['name'];
		$reside_city = $_FANWE['cache']['citys']['all'][$home_user['reside_city']]['name'];

		$count = FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user_follow').' WHERE uid = '.$home_uid);
		$pager = buildPage('u/'.ACTION_NAME,$page_args,$count,$_FANWE['page'],20);

		$user_list = array();

		$res = FDB::query('SELECT u.uid,u.user_name,uc.fans,up.reside_province,up.reside_city
				FROM '.FDB::table('user_follow').' AS uf
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = uf.f_uid
				INNER JOIN '.FDB::table('user_count').' AS uc ON uc.uid = uf.f_uid
				INNER JOIN '.FDB::table('user_profile').' AS up ON up.uid = uf.f_uid
				WHERE uf.uid = '.$home_uid.' ORDER BY uf.create_time DESC LIMIT '.$pager['limit']);
		while($data = FDB::fetch($res))
		{
			$data['is_follow'] = FS('User')->getIsFollowUId($data['uid']);

			$data['reside_province'] = $_FANWE['cache']['citys']['all'][$data['reside_province']]['name'];
			$data['reside_city'] = $_FANWE['cache']['citys']['all'][$data['reside_city']]['name'];

			$data['share'] = FDB::fetchFirst('SELECT share_id,create_time,content
				FROM '.FDB::table('share').'
				WHERE uid = '.$data['uid'].'
				ORDER BY share_id DESC
				LIMIT 0,1');
			if($data['share'])
			{
				$data['share']['url'] = FU('note/index',array('sid'=>$data['share']['share_id']));
				$data['share']['time'] = getBeforeTimelag($data['share']['create_time']);
			}

			$user_list[] = $data;
		}

		include template('page/u/u_fans');
		display();
	}
	
	public function message()
	{
		global $_FANWE;
		$home_uid = $_FANWE['uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$current_menu = 'message';

		$count = FS('Message')->getMsgCount($_FANWE['uid']);
		$pager = buildPage('u/'.ACTION_NAME,array(),$count,$_FANWE['page'],10);
		
		$sys_msgs = FS('Message')->getSysMsgs($_FANWE['uid']);
		$msg_list = FS('Message')->getMsgList($_FANWE['uid'],$pager['limit']);
		
		FDB::query("DELETE FROM ".FDB::table('user_notice')." WHERE uid='$home_uid' AND type=5");

		include template('page/u/u_message');
		display();
	}
	
	public function sendmsg()
	{
		global $_FANWE;
		$home_uid = $_FANWE['uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$current_menu = 'message';

		$count = FDB::resultFirst('SELECT COUNT(uid) FROM '.FDB::table('user_follow').' WHERE uid = '.$home_uid);
		$pager = buildPage('',array(),$count,$_FANWE['page'],30);

		$user_list = FDB::fetchAll('SELECT u.uid,u.user_name 
				FROM '.FDB::table('user_follow').' AS uf
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = uf.f_uid 
				WHERE uf.uid = '.$home_uid.' ORDER BY uf.create_time DESC LIMIT '.$pager['limit']);
		include template('page/u/u_sendmsg');
		display();
	}
	
	public function msgview()
	{
		global $_FANWE;
		$home_uid = $_FANWE['uid'];
		$home_user = FS('User')->getUserById($home_uid);
		$current_menu = 'message';
		
		$mlid = intval($_FANWE['request']['lid']);
		$mid = intval($_FANWE['request']['mid']);
		if($mlid == 0 && $mid == 0)
			fHeader("location: ".FU('u/message',array('uid'=>$_FANWE['uid'])));
		
		$pageargs = array();
		
		if($mlid > 0)
		{
			$pageargs['lid'] = $mlid;
			$mlist = FS('Message')->getListByMlid($mlid,$_FANWE['uid']);
			
			if(empty($mlist))
				fHeader("location: ".FU('u/message',array('uid'=>$_FANWE['uid'])));
			
			$pager = buildPage('u/'.ACTION_NAME,$pageargs,$mlist['num'],$_FANWE['page'],10);
			$msg_list = FS('Message')->getMsgsByMlid($mlid,$_FANWE['uid'],$pager['limit']);
			
			include template('page/u/u_msgview');
		}
		elseif($mid)
		{
			$msg = FS('Message')->getSysMsgByMid($_FANWE['uid'],$mid);
			include template('page/u/u_smsgview');
		}
		display();
	}
}
?>