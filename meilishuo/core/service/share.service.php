<?php
// +----------------------------------------------------------------------
// | 方维购物分享网站系统 (Build on ThinkPHP)
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://fanwe.com All rights reserved.
// +----------------------------------------------------------------------

/**
 * share.service.php
 *
 * 分享服务类
 *
 * @package service
 * @author awfigq <awfigq@qq.com>
 */
class ShareService
{
	/*===========分享列表、详细 Begin==============*/
	/**
	 * 通过的分享提交表单的数据处理
	 * @param mix $_POST 为标准分享表单 $_POST['type'] default:默认,bar:主题,ershou:二手,ask:问答
	 * $_POST['share_data'] = photo 有图 goods 有产品 goods_photo:有图有商品 default:都没有
	 * 	* 返回
	 *  array(
	 *   'status' => xxx  状态  bool
	 *   'share_id' => share_id
	 * )
	 */
	public function submit($_POST)
	{
		//创建分享数据
		global $_FANWE;
		$share_content = htmlspecialchars(trim($_POST['content']));
		$share_data = array();
		$share_data['content'] = $share_content;
		$share_data['uid'] = intval($_FANWE['uid']);
		$share_data['parent_id'] = intval($_POST['parent_id']); //分享的转发
		$share_data['rec_id'] = intval($_POST['rec_id']); //关联的编号
		$share_data['base_id'] = intval($_POST['base_id']);

		/*//当为转发的时候，获取原创ID
		if($share_data['parent_id'] > 0 && $share_data['base_id'] == 0)
		{
			$base_id = intval(FDB::resultFirst('SELECT base_id
				FROM '.FDB::table("share").'
				WHERE share_id = '.$share_data['parent_id']));

			$share_data['base_id'] = $base_id == 0 ? $share_data['parent_id'] : $base_id;
		}*/

		if(isset($_POST['type']))
			$share_data['type'] = $_POST['type'];

		$share_data['title'] = isset($_POST['title']) ? htmlspecialchars(trim($_POST['title'])) : '';
		$data['share'] = $share_data;

		//创建分享商品数据
		$share_goods_data = array();
		if(isset($_POST['goods']) && is_array($_POST['goods']) && count($_POST['goods']) > 0)
		{
			$share_goods = $_POST['goods'];
			foreach($share_goods as $goods)
			{
				$goods = unserialize(authcode($goods,'DECODE'));
				$gkey = $goods['item']['key'];
				$c_data = array();
				$c_data['img'] = $goods['item']['img'];
				$c_data['name'] = addslashes(htmlspecialchars($goods['item']['name']));
				$c_data['url'] = $goods['item']['url'];
				$c_data['taoke_url'] = $goods['item']['taoke_url'];
				$c_data['price'] = $goods['item']['price'];
				$c_data['sort'] = isset($_POST['goods_sort'][$gkey]) ? intval($_POST['goods_sort'][$gkey]) : 10;
				$c_data['shop_name'] = addslashes(htmlspecialchars($goods['shop']['name']));
				$c_data['shop_logo'] = $goods['shop']['logo'];
				$c_data['shop_url'] = $goods['shop']['url'];
				$c_data['shop_taoke_url'] = $goods['shop']['taoke_url'];
				array_push($share_goods_data,$c_data);
			}
		}
		$data['share_goods'] = $share_goods_data;
		//创建图库数据
		$share_photos_data = array();
		if(isset($_POST['pics']) && is_array($_POST['pics']) && count($_POST['pics']) > 0)
		{
			$share_photos = $_POST['pics'];
			foreach($share_photos as $pkey => $photo)
			{
				$photo = authcode($photo,'DECODE');
				$c_data = array();
				$c_data['img'] = $photo;
				$c_data['sort'] = isset($_POST['pics_sort'][$pkey]) ? intval($_POST['pics_sort'][$pkey]) : 10;
				array_push($share_photos_data,$c_data);
			}
		}
		$data['share_photo'] = $share_photos_data;

		$data['share_tag'] = array();

		if(isset($_POST['tags']) && trim($_POST['tags']) != '')
		{
			$tags = htmlspecialchars(trim($_POST['tags']));
			$tags = str_replace('　',' ',$tags);
			$data['share_tag'] = explode(' ',$tags);
		}

		$data['pub_out_check'] = intval($_POST['pub_out_check']);  //发送到外部微博
		return ShareService::save($data);
	}

	/**
	 * 保存分享数据
	 * 注：所有图片地址经处理过并转存过的临时图片或远程图片
	 * $data = array( //分享的基本数据
	 *  'share'=>array(
	 * 	  'uid'=> xxx, //分享的会员ID
	 * 	  'parent_id'	=>	xxx //转发的分享ID
	 * 	  'content'	=>	xxx //分享的内容
	 * 	  'type'=> xxx  //分享的来源，默认为default
	 *    'title' => xxx //分享的标题
	 *    'base_id' => xxx //原创ID
	 * 	),
	 *
	 *  'share_photo'=>array( //图库  #可选#
	 *    array(  //多张图
	 *    'img' => xxx //原图
	 *    )
	 *  ),
	 *  'share_goods'=>array( //分享的商品 #可选#
	 *    array(
	 *    'img' => xxx  //商品图
	 *    'name' => xxx //品名
	 *    'url'  => xxx //商品地址
	 *    'price' => xxx  //价格
	 *    'shop_name' => xxx //商户名称
	 *    'shop_logo' => xxx //商户的logo
	 *    'shop_url' => xxx //商户地址
	 *    ) //多个商品
	 *  ),
	 *  'share_tag' => array(xxx,xxx,xxx),  //该分享的标签
	 * );
	 *
	 * 返回
	 * array(
	 *   'status' => xxx  状态  bool
	 *   'share_id' => share_id
	 * )
	 */
	public function save($data)
	{
		global $_FANWE;
		//保存分享数据
		$share_data = $data['share'];
		$share_data['create_time'] = fGmtTime();
		$share_id = FDB::insert('share',$share_data,true);
		if(intval($share_id)>0)
		{
			$share_cates = array();

			$result['status'] = true;
			$result['share_id'] = $share_id;

			/*$content_match = FS('Words')->segment(clearExpress($share_data['content']),100);
			$title_tags = FS('Words')->segment($share_data['title'],100);
            if(!empty($title_tags))
				$content_match = array_merge($content_match, $title_tags);*/

			$content_match = clearExpress($share_data['content']);
            $content_match .= $share_data['title'];

			$photo_count = 0;
			//保存分享图片
			$share_photo = $data['share_photo'];
			foreach($share_photo as $k=>$photo)
			{
				if($photo_count >= $_FANWE['setting']['share_pic_count'])
					break;

				$o_img = copyImage($photo['img'],md5(microtime(true)).random('6').".jpg",array(),'share',true,$share_id);
				if(!empty($o_img))
				{
					$share_photo_data['uid'] = $_FANWE['uid'];
					$share_photo_data['share_id'] = $share_id;
					$share_photo_data['img'] =  $o_img['url'];
					$share_photo_data['sort'] =  $photo['sort'];
					FDB::insert('share_photo',$share_photo_data,true);
					$photo_count++;
				}
			}

			$goods_count = 0;
			//保存分享的商品
			$share_goods = $data['share_goods'];
			foreach($share_goods as $goods)
			{
				if($goods_count >= $_FANWE['setting']['share_goods_count'])
					break;

				$shop_id = 0;
				if(!empty($goods['shop_url']))
				{
					$shop_id = FDB::resultFirst('SELECT shop_id
						FROM '.FDB::table('shop').'
						WHERE shop_url = \''.$goods['shop_url'].'\'');

					if(intval($shop_id) == 0)
					{
                        $content_match .= $goods['shop_name'];
						$shop_logo = copyFile(FANWE_ROOT.$goods['shop_logo'],'shop',md5(microtime(true)).random('6').'.jpg',true);
						$shop_data['shop_name'] = $goods['shop_name'];
						$shop_data['shop_logo'] =  $shop_logo['url'];
						$shop_data['shop_url'] = $goods['shop_url'];
						$shop_data['taoke_url'] = $goods['shop_taoke_url'];
						$shop_id = FDB::insert('shop',$shop_data,true);
					}
				}

				$goods_img = copyImage(FANWE_ROOT.$goods['img'],md5(microtime(true)).random('6').'.jpg',array(),'share',true,$share_id);
				if(!empty($goods_img))
				{
					$shop_id = intval($shop_id);
					//开始保存分享的商品
					$share_goods_data['uid'] = $_FANWE['uid'];
					$share_goods_data['share_id'] = $share_id;
					$share_goods_data['shop_id'] = $shop_id;
					$share_goods_data['img'] =  $goods_img['url'];
					$share_goods_data['name'] = $goods['name'];
					$share_goods_data['url'] = $goods['url'];
					$share_goods_data['price'] = $goods['price'];
					$share_goods_data['sort'] = $goods['sort'];
					$share_goods_data['taoke_url'] = $goods['taoke_url'];
					FDB::insert('share_goods',$share_goods_data,true);

					$goods_tags = FS('Words')->segment($goods['name'],100);
					if(!empty($goods_tags))
					{
						$share_cates[] = ShareService::getCateByTags($goods_tags);
						//$content_match = array_merge($content_match, $goods_tags);
					}
					$content_match .= $goods['name'];
					$goods_count++;
				}
			}

			if($goods_count > 0 && $photo_count > 0)
				$share_data_type = 'goods_photo';
			elseif($goods_count > 0)
				$share_data_type = 'goods';
			elseif($photo_count > 0)
				$share_data_type = 'photo';
			else
				$share_data_type = 'default';

			FDB::query('UPDATE '.FDB::table('share').'
				SET share_data = \''.$share_data_type.'\'
				WHERE share_id = '.$share_id);

			//更新会员统计
			FDB::query('UPDATE '.FDB::table('user_count').'
				SET shares = shares + 1,goods = goods + '.$goods_count.',photos = photos + '.$photo_count.'
				WHERE uid = '.$share_data['uid']);

			//清除会员缓存
			FS('User')->deleteUserCache($share_data['uid']);

			if(in_array($share_data_type,array('goods','photo','goods_photo')))
			{
				//更新会员发布的有图分享编号
				FS('User')->setShareIds($share_data['uid'],$share_id);

				if(!empty($share_cates))
				{
					$cids = ShareService::getCidsByCates($share_cates);
				}

				if(!empty($data['share_tag']))
				{
					if(empty($cids))
					{
						$share_cates = array();
						$share_cates[] = ShareService::getCateByTags($data['share_tag']);
						$cids = ShareService::getCidsByCates($share_cates);
					}

					//$content_match = array_merge($content_match, $data['share_tag']);
				}

				//保存标签
				$share_tags = array();
				foreach($data['share_tag'] as $tag)
				{
					if(trim($tag) != '' && !in_array($tag,$share_tags))
					{
						array_push($share_tags,$tag);

						//为已存在的tags更新统计
						FDB::query('UPDATE '.FDB::table('goods_tags').'
							SET count = count + 1
							WHERE tag_name = \''.$tag.'\'');

						//数量大于100时为热门标签
						FDB::query('UPDATE '.FDB::table('goods_tags').'
							SET is_hot = 1
							WHERE tag_name = \''.$tag.'\' AND count >= 100');

						$content_match.=$tag;
						$tag_data = array();
						$tag_data['share_id'] = $share_id;
						$tag_data['tag_name'] = $tag;
						FDB::insert('share_tags',$tag_data);
					}
				}
				unset($share_tags);

				if(!empty($cids))
				{
					foreach($cids as $cid)
					{
						$cate_data = array();
						$cate_data['share_id'] = $share_id;
						$cate_data['cate_id'] = $cid;
						FDB::insert('share_category',$cate_data);
					}
				}

				//保存匹配查询
				$share_match['share_id'] = $share_id;
				$share_match['content_match'] = segmentToUnicode(clearSymbol($content_match));
				FDB::insert("share_match",$share_match);
			}

			if($data['pub_out_check'])
			{
				//转发到外部微博
				$uid = $_FANWE['uid'];
				$syn_module = require_once FANWE_ROOT."login/api_config.php";
				foreach($syn_module as $class => $md)
				{
					if($md['is_syn']&&file_exists(FANWE_ROOT."login/".$class.".php"))
					{
						$check_field = "";
						if(in_array($share_data['type'],array('default')))
						{
							$check_field = $class."_syn_weibo";
						}
						if(in_array($share_data['type'],array('bar','ershou','bar','ask')))
						{
							$check_field = $class."_syn_topic";
						}
						if($check_field!='')
						{
							$is_pub = intval(FDB::resultFirst("select ".$check_field." from ".FDB::table("user")." where uid = ".$uid." and ".$class."_app_key <> '' and ".$class."_app_secret <> '' and ".$class."_id <> ''"));

						}
						if($is_pub)
						{
							//开始推送
							$schedule['uid'] = $uid;
							$schedule['type'] = $class;
							$schedule['data'] = base64_encode(serialize($data));
							FDB::insert('pub_schedule',$schedule,true);
						}
					}
				}

				do{
					$loop = intval(@file_get_contents(get_domain().APP_ROOT."/login.php?loop=true&uid=".$uid));
				}
				while($loop);
			}
		}
		else
		{
			$result['status'] = false;
		}
		return $result;
	}

	/*根据标签获取所属分类*/
	public function getCateByTags($tags)
	{
		static $tag_cates = array();

		$tags = array_unique($tags);

		$cates = array();
		foreach($tags as $tag)
		{
			if(!empty($tag))
			{
				if(isset($tag_cates[$tag]))
				{
					foreach($tag_cates[$tag] as $data)
					{
						if(isset($cates[$data['cate_id']]))
							$cates[$data['cate_id']] += $data['weight'];
						else
							$cates[$data['cate_id']] = $data['weight'];
					}
					continue;
				}

				$is_bln = true;
				$res = FDB::query('SELECT gct.cate_id,gct.weight
					FROM '.FDB::table('goods_tags').' AS gt
					LEFT JOIN '.FDB::table('goods_category_tags')." AS gct ON gct.tag_id = gt.tag_id
					WHERE gt.tag_name = '$tag'");
				while($data = FDB::fetch($res))
				{
					if($data['weight'] < 1)
						$data['weight'] = 1;

					if(isset($cates[$data['cate_id']]))
						$cates[$data['cate_id']] += $data['weight'];
					else
						$cates[$data['cate_id']] = $data['weight'];

					$tag_cates[$tag][] = $data;
					$is_bln = false;
				}

				if($is_bln)
				{
					$like_tag = fMysqlLikeQuote($tag);
					$res = FDB::query('SELECT gct.cate_id,gct.weight
						FROM '.FDB::table('goods_tags').' AS gt
						LEFT JOIN '.FDB::table('goods_category_tags')." AS gct ON gct.tag_id = gt.tag_id
						WHERE gt.tag_name LIKE '%".$like_tag."%' OR INSTR('$tag',gt.tag_name) > 0");
					while($data = FDB::fetch($res))
					{
						if($data['weight'] < 1)
							$data['weight'] = 1;

						if(isset($cates[$data['cate_id']]))
							$cates[$data['cate_id']] += $data['weight'];
						else
							$cates[$data['cate_id']] = $data['weight'];

						$tag_cates[$tag] = $data;
					}
				}
			}
		}

		if(empty($cates))
			return array();

		$cids = array();
		foreach($cates as $cate_id => $weight)
		{
			$cids[$weight][] = $cate_id;
		}

		krsort($cids);
		return each($cids);
	}

	public function getCidsByCates($cates)
	{
		$list = array();
		$cids = array();
		foreach($cates as $cate)
		{
			foreach($cate['value'] as $cid)
			{
				if(isset($cids[$cid]))
					$cids[$cid] = $cate['key'];
				else
					$cids[$cid] += $cate['key'];
			}
		}

		foreach($cates as $cate)
		{
			$id = 0;
			$weight = 0;
			foreach($cate['value'] as $cid)
			{
				if($cids[$cid] > $weight)
					$id = $cid;
			}

			if($id > 0)
				$list[] = $id;
		}

		return array_unique($list);
	}

	public function deleteShare($share_id)
	{
		$share = ShareService::getShareById($share_id);
		if(!empty($share))
		{
			$goods_count = FDB::resultFirst('SELECT COUNT(goods_id) FROM '.FDB::table('share_goods').' WHERE share_id = '.$share_id);
			$photo_count = FDB::resultFirst('SELECT COUNT(photo_id) FROM '.FDB::table('share_photo').' WHERE share_id = '.$share_id);
			$photo_count = FDB::resultFirst('SELECT COUNT(photo_id) FROM '.FDB::table('share_photo').' WHERE share_id = '.$share_id);
			$collect_count = FDB::resultFirst('SELECT COUNT(c_uid) FROM '.FDB::table('user_collect').' WHERE share_id = '.$share_id);

			FDB::delete('share','share_id = '.$share_id);
			FDB::delete('share_goods','share_id = '.$share_id);
			FDB::delete('share_photo','share_id = '.$share_id);
			FDB::delete('share_category','share_id = '.$share_id);
			FDB::delete('share_comment','share_id = '.$share_id);
			FDB::delete('share_match','share_id = '.$share_id);
			FDB::delete('share_tags','share_id = '.$share_id);
			FDB::delete('user_collect','share_id = '.$share_id);

			FDB::query('UPDATE '.FDB::table('user_count').' SET
				shares = shares - 1,
				photos = photos - '.$photo_count.',
				goods = goods - '.$goods_count.',
				collects = collects - '.$collect_count.' WHERE uid = '.$share['uid']);

			$key = getDirsById($share_id);
			clearCacheDir('share/'.$key);
			clearDir(PUBLIC_ROOT.'./upload/share/'.$key);
		}
	}

	/**
	 * 根据编号获取分享
	 * @param int $share_id 分享编号
	 * @return array
	 */
	public function getShareById($share_id)
	{
		$key = 'share/'.getDirsById($share_id).'/share';
		$share = getCache($key);
		if($share !== NULL)
			return $share;

		$share = FDB::fetchFirst('SELECT *
			FROM '.FDB::table('share').'
			WHERE share_id = '.$share_id);
		if($share)
			$share['url'] = FU('note/index',array('sid'=>$share_id));
		else
			$share = false;

		setCache($key,$share);
		return $share;
	}

	/**
	 * 删除分享缓存
	 * @param int $share_id 分享编号
	 * @return void
	 */
	public function deleteShareCache($share_id)
	{
		deleteCache('share/'.getDirsById($share_id).'/share');
		deleteCache('share/'.getDirsById($share_id).'/detail');
	}

	/**
	 * 获取分享详细
	 * @param int $share_id 分享编号
	 * @return array
	 */
	public function getShareDetail($share_id)
	{
		$key = 'share/'.getDirsById($share_id).'/detail';
		$share = getCache($key);
		if($share === NULL)
		{
			$share_datas = array();
			$list = array();
			$share = ShareService::getShareById($share_id);
			if(!empty($share))
			{
				$share['imgs'] = array();
				$list[$share_id] = $share;
				$share_datas[$share['share_data']][] = $share_id;
				ShareService::getShareImages($share_datas,$list);
				$share = &$list[$share_id];
				setCache($key,$share);
			}
			else
				$share = false;
		}

		if($share !== false)
		{
			$share['authoritys'] = ShareService::getIsEditShare($share);
			$share['time'] = getBeforeTimelag($share['create_time']);
		}

		return $share;
	}

	/**
	 * 获取分享的动态数据
	 * @param int $share_id 分享编号
	 * @return array
	 */
	public function getShareDynamic($share_id)
	{
		$dynamic = FDB::fetchFirst('SELECT collect_count,comment_count,relay_count,click_count
				FROM '.FDB::table('share').'
				WHERE share_id = '.$share_id);
		return $dynamic;
	}

	/**
	 * 获取分享的动态数据列表
	 * @param int $share_ids 分享编号数组
	 * @return array
	 */
	public function getShareDynamics($share_ids,&$list,$relay_shares_ids = array(),$parent_shares_ids = array())
	{
		if(empty($share_ids))
			return;

		$share_ids = array_unique($share_ids);
		$res = FDB::query('SELECT share_id,collect_count,comment_count,relay_count,click_count
				FROM '.FDB::table('share').'
				WHERE share_id IN ('.implode(',',$share_ids).')');
		while($data = FDB::fetch($res))
		{
			if(isset($list[$data['share_id']]))
				$list[$data['share_id']] = array_merge($list[$data['share_id']],$data);

			if(isset($relay_shares_ids[$data['share_id']]))
			{
				foreach($relay_shares_ids[$data['share_id']] as $share_id)
				{
					$list[$share_id]['relay_share'] = array_merge($list[$share_id]['relay_share'],$data);
				}
			}

			if(isset($parent_shares_ids[$data['share_id']]))
			{
				foreach($parent_shares_ids[$data['share_id']] as $share_id)
				{
					$list[$share_id]['parent_share'] = array_merge($list[$share_id]['parent_share'],$data);
				}
			}
		}
	}

	/**
	 * 分享列表详细数据
	 * @param array $list 分享列表
	   $list 为至少包含 share_id 的数据集
	 * @param bool $is_parent 是否获取转发信息
	 * @param bool $is_collect 是否获取喜欢的会员
	 * @param bool $is_parent 是否获取分享标签
	 * @return array
	 */
	public function getShareDetailList($list,$is_dynamic = false,$is_parent = false,$is_collect = false,$is_tag = false,$is_follow = false,$is_comment = false)
	{
		global $_FANWE;
		$shares = array();
		$shares_ids = array();
		$relay_shares_ids = array();
		$parent_shares_ids = array();
		foreach($list as $item)
		{
			$share_id = $item['share_id'];
			$share = ShareService::getShareDetail($share_id);
			if(empty($share))
				continue;

			$item = array_merge($share,$item);
			if($is_dynamic)
				$shares_ids[] = $share_id;

			$item['user'] = FS('User')->getUserCache($item['uid']);

			if($is_comment)
				$item['comments'] = ShareService::getShareComments($share_id,10);

			if($is_collect)
				$item['collects'] = ShareService::getShareCollectUser($share_id,$_FANWE['uid']);

			if($is_tag)
			{
				$item['is_eidt_tag'] = ShareService::getIsEditTag($item);
				$item['tags'] = ShareService::getShareTagsCache($share_id);
			}

			if($is_follow)
				$item['is_follow_user'] = FS('User')->getIsFollowUId($item['uid']);

			$item['is_relay'] = false;
			$item['is_parent'] = false;

			if($is_parent)
			{
				if($item['base_id'] > 0)
				{
					$item['is_relay'] = true;
					$shares_ids[] = $item['base_id'];
					$relay_shares_ids[$item['base_id']][] = $share_id;
					$relay_share = ShareService::getShareDetail($item['base_id']);
					$relay_share['user'] = FS('User')->getUserCache($relay_share['uid']);
					$item['relay_share'] = $relay_share;

					if($item['parent_id'] > 0 && $item['parent_id'] != $item['base_id'])
					{
						$item['is_parent'] = true;
						$shares_ids[] = $item['parent_id'];
						$parent_shares_ids[$item['parent_id']][] = $share_id;
						$parent_share = ShareService::getShareDetail($item['parent_id']);
						$parent_share['user'] = FS('User')->getUserCache($parent_share['uid']);
						$item['parent_share'] = $parent_share;
					}
				}
			}
			$shares[$share_id] = $item;
		}

		ShareService::getShareDynamics($shares_ids,$shares,$relay_shares_ids,$parent_shares_ids);
		return $shares;
	}

	/**
	 * 获取分享的图片集合
	 * @param array $share_datas 数据类型列表
	 	array(
			'类型'=>array(id1,id2,...),
			...
		);
	 * @param array $list 分享列表
	 	array(
			'分享id'=>分享详细,
			...
		)
	 * @param int $pic_num 图片数量
	 * @return array(
			array(
				'分享id'=>array(分享数据,
					'imgs'=>array(
						array('share_id'=>分享编号,
							'id'=>关联编号,
							'type'=>类型(g:商品,m:图片),
							'url'=>商品链接(图片类型为空),
							'price'=>商品价格(图片类型为0),
					),
			)
		)
	 */
	public function getShareImages(&$share_datas,&$list,$pic_num = 0,$is_dynamic = false)
	{
		foreach($share_datas as $share_data => $share_ids)
		{
			if($share_data == 'default')
				continue;

			if(!$is_dynamic)
			{
				foreach($share_ids as $k => $share_id)
				{
					$key = 'share/'.getDirsById($share_id).'/imgs';
					$data = getCache($key);
					if($data !== NULL)
					{
						unset($share_ids[$k]);
						$list[$share_id]['imgs'] = $data;
					}
				}
			}

			if(empty($share_ids))
				continue;

			switch($share_data)
			{
				case 'goods':
					$sql = 'SELECT share_id,goods_id AS id,img,\'g\' AS type,name,url,price,taoke_url
						FROM '.FDB::table('share_goods').'
						WHERE share_id IN ('.implode(',',$share_ids).') ORDER BY sort ASC';
					$res = FDB::query($sql);
					while($data = FDB::fetch($res))
					{
						$data['goods_url'] = $data['url'];
						if(empty($data['taoke_url']))
                            $data['to_url'] = FU('tgo',array('url'=>$data['url']));
                        else
                            $data['to_url'] = FU('tgo',array('url'=>$data['taoke_url']));
						$data['url'] = FU('note/'.$data['type'],array('sid'=>$data['share_id'],'id'=>$data['id']));
						$data['price_format'] = priceFormat($data['price']);
						$list[$data['share_id']]['imgs'][] = $data;
					}
				break;
				case 'photo':
					$sql = 'SELECT share_id,photo_id AS id,img,\'m\' AS type,\'\' AS name,\'\' AS url,0 AS price
						FROM '.FDB::table('share_photo').'
						WHERE share_id IN ('.implode(',',$share_ids).') ORDER BY sort ASC';
					$res = FDB::query($sql);
					while($data = FDB::fetch($res))
					{
						$data['url'] = FU('note/'.$data['type'],array('sid'=>$data['share_id'],'id'=>$data['id']));
						$list[$data['share_id']]['imgs'][] = $data;
					}
				break;
				case 'goods_photo':
					$sql = '(SELECT share_id,goods_id AS id,img,\'g\' AS type,name,url,price,taoke_url,sort
						FROM '.FDB::table('share_goods').'
						WHERE share_id IN ('.implode(',',$share_ids).'))
						UNION
						(SELECT share_id,photo_id AS id,img,\'m\' AS type,\'\' AS name,\'\' AS url,0 AS price,\'\' AS taoke_url,sort
						FROM '.FDB::table('share_photo').'
						WHERE share_id IN ('.implode(',',$share_ids).'))
						ORDER BY sort ASC';

					$res = FDB::query($sql);
					while($data = FDB::fetch($res))
					{
						if($data['type'] == 'g')
						{
							$data['goods_url'] = $data['url'];
                            if(empty($data['taoke_url']))
							    $data['to_url'] = FU('tgo',array('url'=>$data['url']));
                            else
                                $data['to_url'] = FU('tgo',array('url'=>$data['taoke_url']));

							$data['price_format'] = priceFormat($data['price']);
						}
						unset($data['sort']);
						$data['url'] = FU('note/'.$data['type'],array('sid'=>$data['share_id'],'id'=>$data['id']));
						$list[$data['share_id']]['imgs'][] = $data;
					}
				break;
			}

			if(!$is_dynamic)
			{
				foreach($share_ids as $share_id)
				{
					if(isset($list[$share_id]['imgs']))
					{
						$key = 'share/'.getDirsById($share_id).'/imgs';
						setCache($key,$list[$share_id]['imgs']);
					}
				}
			}
		}

		if($pic_num > 0)
		{
			foreach($list as $share_id => $item)
			{
				if(count($item['imgs']) > $pic_num)
					$list[$share_id]['imgs'] = array_slice($item['imgs'],0,$pic_num);
			}
		}
	}

	/**
	 * 获取会员的上一个和下一个有图片分享
	 * @param array $_POST 提交的数据
	 * @return array(
			'prev'=>上一个分享,
			'next'=>下一个分享,
		)
	 */
	public function getPrevNextShares($uid,$share_id)
	{
		$arr = array('prev'=>0,'next'=>0);
		$share_ids = FS('User')->getShareIds($uid);
		$key = array_search($share_id,$share_ids);
		if($key !== false)
		{
			$count = count($share_ids);
			if($count > 1)
			{
				if($key == 0)
					$arr['prev'] = $share_ids[1];
				elseif($key == $count - 1)
					$arr['next'] = $share_ids[$key - 1];
				else
				{
					$arr['next'] = $share_ids[$key - 1];
					if(isset($share_ids[$key + 1]))
						$arr['prev'] = $share_ids[$key + 1];
				}
			}
		}
		return $arr;
	}

    public function updateShareMatch($share_id)
    {
        $share = ShareService::getShareDetail($share_id);
        if(!in_array($share['share_data'],array('goods','photo','goods_photo')))
            return;

        $share['tags'] = ShareService::getShareTagsCache($share_id);

		/*$content_match = FS('Words')->segment(clearExpress($share['content']),100);
		$title_tags = FS('Words')->segment($share['title'],100);
		if(!empty($title_tags))
			$content_match = array_merge($content_match, $title_tags);*/

		$content_match = clearExpress($share['content']);
        $content_match .= $share['title'];

        if(isset($share['tags']['user']))
        {
            foreach($share['tags']['user'] as $tags)
            {
				//$content_match[] = $tags['tag_name'];
				$content_match.=$tag;
            }
        }

        if(isset($share['tags']['admin']))
        {
            foreach($share['tags']['admin'] as $tags)
            {
				//$content_match[] = $tags['tag_name'];
				$content_match.=$tag;
            }
        }

        if(isset($share['imgs']))
        {
            foreach($share['imgs'] as $img)
            {
                if(!empty($img['name']))
				{
					/*$img_tags = FS('Words')->segment($img['name'],100);
					if(!empty($img_tags))
						$content_match = array_merge($content_match, $img_tags);*/
					$content_match.=$img['name'];
				}
            }
        }

        //保存匹配查询
        $share_match = array();
        $share_match['share_id'] = $share_id;
        $share_match['content_match'] = segmentToUnicode(clearSymbol($content_match));
        FDB::insert("share_match",$share_match,false,true);
    }

	/**
	 * 获取是否可编辑分享
	 * @param int $share 分享
	 * @return array
	 */
	public function getIsEditShare(&$share)
	{
		static $edits = array();
		if(!isset($edits[$share['share_id']]))
		{
			global $_FANWE;
			$type = array('ask','bar');
			$is_edit = 0;
			$post = array('ask_post','bar_post');
			if(in_array($share['type'],$post))
			{
				if($share['uid'] == $_FANWE['uid'])
					$is_edit = 1;

				if($share['type'] == 'ask_post')
					$thread = FS('ask')->getTopicById($share['rec_id']);
				else
					$thread = FS('Topic')->getTopicById($share['rec_id']);

				if($thread['uid'] == $_FANWE['uid'])
					$is_edit = 2;
			}
			else
			{
				if(!in_array($share['type'],$type) && $share['uid'] == $_FANWE['uid'])
					$is_edit = 1;
			}

			$edits[$share['share_id']] = $is_edit;
		}

		return $edits[$share['share_id']];
	}
	/*===========分享列表、详细 END  ==============*/

	/*===========分享标签 BEGIN  ==============*/
	/**
	 * 获取是否可编辑分享标签
	 * @param int $share 分享
	 * @return array
	 */
	public function getIsEditTag(&$share)
	{
		global $_FANWE;
		$_img_data = array('goods','photo','goods_photo');
		$is_edit_tag = false;
		if(in_array($share['share_data'],$_img_data) && $share['uid'] == $_FANWE['uid'])
			$is_edit_tag = true;
		return $is_edit_tag;
	}

	/**
	 * 获取分享标签缓存
	 * @param int $share_id 分享编号
	 * @return array
	 */
	public function getShareTagsCache($share_id)
	{
		$key = 'share/'.getDirsById($share_id).'/tag';
		$tags = getCache($key);
		if($tags === NULL)
		{
			$tags = array();
			$res = FDB::query('SELECT tag_name,is_admin
				FROM '.FDB::table('share_tags').'
				WHERE share_id = '.$share_id);
			while($data = FDB::fetch($res))
			{
				$data['url'] = FU('book/shopping',array('tag'=>urlencode($data['tag_name'])));
				if($data['is_admin'] == 0)
					$tags['user'][] = $data;
				else
					$tags['admin'][] = $data;
			}

			setCache($key,$tags);
		}

		return $tags;
	}

	/**
	 * 更新分享标签缓存
	 * @param int $share_id 分享编号
	 * @param array $tags = array(
	 		'user'=>会员设置标签,
			'admin'=>管理员设置标签,(如果不存在admin键名，则不删除会员设置标签)
	 	);
	 * @return array
	 */
	public function updateShareTags($share_id,$tags)
	{
		global $_FANWE;
		//更新分享的会员标签
		FDB::delete('share_tags','share_id = '.$share_id.' AND is_admin = 0');
		if(isset($tags['user']))
		{
			$tags['user'] = str_replace('　',' ',$tags['user']);
			$tags['user'] = explode(' ',htmlspecialchars(trim($tags['user'])));
            $tags['user'] = array_unique($tags['user']);
            $tags['user'] = array_slice($tags['user'],0,$_FANWE['setting']['share_tag_count']);

			$share_tags = array();
			foreach($tags['user'] as $tag)
			{
				if(trim($tag) != '' && !in_array($tag,$share_tags))
				{
					array_push($share_tags,$tag);

					//为已存在的tags更新统计
					FDB::query('UPDATE '.FDB::table('goods_tags').'
						SET count = count + 1
						WHERE tag_name = \''.$tag.'\'');

					//数量大于100时为热门标签
					FDB::query('UPDATE '.FDB::table('goods_tags').'
						SET is_hot = 1
						WHERE tag_name = \''.$tag.'\' AND count >= 100');

					$tag_data = array();
					$tag_data['share_id'] = $share_id;
					$tag_data['tag_name'] = $tag;
					FDB::insert('share_tags',$tag_data);
				}
			}
		}

		//更新分享的管理员标签
		if(isset($tags['admin']))
		{
			FDB::delete('share_tags','share_id = '.$share_id.' AND is_admin = 1');

			$tags['admin'] = str_replace('　',' ',$tags['admin']);
			$tags['admin'] = explode(' ',htmlspecialchars(trim($tags['admin'])));
            $tags['admin'] = array_unique($tags['admin']);

			$share_tags = array();
			foreach($tags['admin'] as $tag)
			{
				if(trim($tag) != '' && !in_array($tag,$share_tags))
				{
					array_push($share_tags,$tag);

					//为已存在的tags更新统计
					FDB::query('UPDATE '.FDB::table('goods_tags').'
						SET count = count + 1
						WHERE tag_name = \''.$tag.'\'');

					//数量大于100时为热门标签
					FDB::query('UPDATE '.FDB::table('goods_tags').'
						SET is_hot = 1
						WHERE tag_name = \''.$tag.'\' AND count >= 100');

					$tag_data = array();
					$tag_data['share_id'] = $share_id;
					$tag_data['tag_name'] = $tag;
					$tag_data['is_admin'] = 1;
					FDB::insert('share_tags',$tag_data);
				}
			}
		}
		ShareService::deleteShareTagsCache($share_id);
        ShareService::updateShareMatch($share_id);
	}

	/**
	 * 删除分享标签缓存
	 * @param int $share_id 分享编号
	 * @return void
	 */
	public function deleteShareTagsCache($share_id)
	{
		deleteCache('share/'.getDirsById($share_id).'/tag');
	}
	/*===========分享标签 END  ==============*/

	/*===========分享转发 BEGIN  ==============*/
	/**
	 * 转发分享
	 * @param array $_POST 提交的数据
	 * @return array(
			'share_id'=>分享编号,
			'pc_id'=>评论编号(如果勾选评论给转发分享),
			'bc_id'=>原文评论编号(如果勾选评论给原文分享),
		)
	 */
	public function saveRelay($_POST)
	{
		global $_FANWE;
		$share_id = intval($_POST['share_id']);
		$share = ShareService::getShareById($share_id);
		if(empty($share))
			return false;

		$data = array();
		$data['share']['uid'] = $_FANWE['uid'];
		$data['share']['parent_id'] = $share_id;
		$content = htmlspecialchars(trim($_POST['content']));
		$data['share']['content'] = $content;
		$type = 'default';
		$base_id = $share['base_id'];
		if($base_id > 0)
		{
			$base = ShareService::getShareById($share['base_id']);
			if(!empty($base))
				$base_id = $base['share_id'];
			else
				$base_id = 0;
		}

		$rec_id = $share['rec_id'];

		if($share['type'] == 'ask' || $share['type'] == 'ask_post')
			$type = 'ask_post';
		elseif($share['type'] == 'bar' || $share['type'] == 'bar_post')
			$type = 'bar_post';

		$data['share']['rec_id'] = $share['rec_id'];
		$data['share']['title'] = addslashes($share['title']);
		$data['share']['base_id'] = $base_id > 0 ? $base_id : $share_id;
		$data['share']['type'] = $type;

		$relay_share = ShareService::save($data);
		if(!$relay_share['status'])
			return false;

		FDB::query('UPDATE '.FDB::table('share').'
			SET relay_count = relay_count + 1
			WHERE share_id = '.$share_id);

		if($base_id > 0 && $share_id != $base_id)
		{
			FDB::query('UPDATE '.FDB::table('share').'
				SET relay_count = relay_count + 1
				WHERE share_id = '.$base_id);
		}

		$is_no_post = isset($_POST['is_no_post']) ? intval($_POST['is_no_post']) : 0;
		$share_id = $relay_share['share_id'];
		if($rec_id > 0 && $is_no_post == 0)
		{
			if($type == 'bar_post')
				FS('Topic')->saveTopicPost($rec_id,$content,$share_id);
			elseif($type == 'ask_post')
				FS('Ask')->saveTopicPost($rec_id,$content,$share_id);
		}

		$is_comment_parent = isset($_POST['is_comment_parent']) ? intval($_POST['is_comment_parent']) : 0;
		$is_comment_base = isset($_POST['is_comment_base']) ? intval($_POST['is_comment_base']) : 0;

		//评论给分享
		$parent_comment_id = 0;
		if($is_comment_parent == 1)
		{
			$data = array();
			$data['content'] = 	$_POST['content'];
			$data['share_id'] = $share['share_id'];
			$parent_comment_id = ShareService::saveComment($data);
		}

		//评论给原创分享
		$base_comment_id = 0;
		if($is_comment_base == 1 && $base_id > 0)
		{
			$data = array();
			$data['content'] = 	$_POST['content'];
			$data['share_id'] = $base_id;
			$base_comment_id = ShareService::saveComment($data);
		}

		return array(
			'share_id'=>$share_id,
			'pc_id'=>$parent_comment_id,
			'bc_id'=>$base_comment_id,
		);
	}

	/*===========分享转发 END  ==============*/

	/*===========喜欢收藏分享 BEGIN  ==============*/
	/**
	 * 保存喜欢分享
	 * @param int $share 分享
	 * @return void
	 */
	public function saveFav($share)
	{
		if($share['type'] == 'fav')
			return false;

		global $_FANWE;
		ShareService::setShareCollectUser($share['share_id'],$share['uid']);

		$base_id = $share['base_id'];
		if($base_id > 0)
		{
			$base = ShareService::getShareById($share['base_id']);
			if(!empty($base))
			{
				ShareService::setShareCollectUser($base['share_id'],$base['uid']);
				$base_id = $base['share_id'];
			}
			else
				$base_id = 0;
		}

		$share_user = FS('User')->getUserCache($share['uid']);
		$data = array();
		$data['share']['uid'] = $_FANWE['uid'];
		$data['share']['rec_id'] = $share['rec_id'];
		$data['share']['parent_id'] = $share['share_id'];
		$data['share']['content'] = lang('share','fav_share').'//@'.$share_user['user_name'].':'.$share['content'];
		$data['share']['type'] = "fav";
		$data['share']['base_id'] = $base_id > 0 ? $base_id : $share['share_id'];
		ShareService::save($data);
	}

	/**
	 * 获取喜欢这个分享的会员
	 * @param int $share_id 分享编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getShareCollectUser($share_id,$uid = 0,$num = 12)
	{
		$list = array();
		$key = 'share/'.getDirsById($share_id).'/collect';
		$uids = ShareService::getShareCollectUserCache($share_id);

		if(count($uids) == 0)
			return $list;

		if($uid > 0)
		{
			$key = array_search($uid,$uids);
			if($key !== false)
			{
				unset($uids[$key]);
				array_push($uids,$uid);
			}
		}

		if($num > 0)
			$uids = array_slice($uids,-$num,$num);

		$uids = array_reverse($uids);

		if(count($uids) > 0)
		{
			foreach($uids as $uid)
			{
				$list[] = FS('User')->getUserCache($uid);
			}
		}

		return $list;
	}

	/**
	 * 添加喜欢这个分享的会员
	 * @param int $share_id 分享编号
	 * @param int $uid 会员会员数量
	 * @return array
	 */
	public function setShareCollectUser($share_id,$uid)
	{
		global $_FANWE;
		$c_uid = $_FANWE['uid'];
		$data = array();
		$data['uid'] = $uid;
		$data['c_uid'] = $c_uid;
		$data['share_id'] = $share_id;
		$data['create_time'] = fGmtTime();
		FDB::insert('user_collect',$data);

		ShareService::setShareCollectUserCache($share_id,$c_uid);

		//分享被喜欢数加1
		FDB::query('UPDATE '.FDB::table('share').'
			SET collect_count = collect_count + 1
			WHERE share_id = '.$share_id);

		//分享会员被喜欢数加1
		FDB::query('UPDATE '.FDB::table('user_count').'
			SET collects = collects + 1
			WHERE uid = '.$uid);

		FS('User')->deleteUserCache($uid);
	}

	/**
	 * 获取喜欢这个分享的会员缓存
	 * @param int $share_id 分享编号
	 * @return array
	 */
	public function getShareCollectUserCache($share_id)
	{
		$key = 'share/'.getDirsById($share_id).'/collect';
		$uids = getCache($key);
		if($uids === NULL)
		{
			$uids = array();

			$res = FDB::query('SELECT c_uid FROM '.FDB::table('user_collect').'
				WHERE share_id = '.$share_id.'
				ORDER BY create_time ASC');

			while($data = FDB::fetch($res))
			{
				$uids[] = $data['c_uid'];
			}
			setCache($key,$uids);
		}

		return $uids;
	}

	public function setShareCollectUserCache($share_id,$uid)
	{
		$uids = ShareService::getShareCollectUserCache($share_id);
		$key = array_search($uid,$uids);
		if($key === false)
			array_push($uids,$uid);
		$key = 'share/'.getDirsById($share_id).'/collect';
		setCache($key,$uids);
	}

	public function deleteShareCollectUser($share_id,$uid)
	{
		$share = ShareService::getShareById($share_id);
		if(empty($share))
			return false;

		FDB::query('DELETE FROM '.FDB::table('user_collect').'
			WHERE c_uid = '.$uid.' AND share_id = '.$share_id);

		//分享被喜欢数减1
		FDB::query('UPDATE '.FDB::table('share').'
			SET collect_count = collect_count - 1
			WHERE share_id = '.$share_id);

		//分享会员被喜欢数减1
		FDB::query('UPDATE '.FDB::table('user_count').'
			SET collects = collects - 1
			WHERE uid = '.$share['uid']);

		FS('User')->deleteUserCache($share['uid']);

		$uids = ShareService::getShareCollectUserCache($share_id);
		$key = array_search($uid,$uids);

		if($key !== false)
			unset($uids[$key]);
		$key = 'share/'.getDirsById($share_id).'/collect';
		setCache($key,$uids);
		return true;
	}
	/*===========喜欢收藏分享 END  ==============*/

	/*===========分享评论 BEGIN  ==============*/
	/**
	 * 获取是否可删除评论
	 * @param int $share 分享
	 * @return array
	 */
	public function getIsRemoveComment(&$share)
	{
		global $_FANWE;
		$is_bln = false;
		if($share['uid'] == $_FANWE['uid'])
			$is_bln = true;
		return $is_bln;
	}

	/**
	 * 保存分享的评论
	 * @param array $_POST 提交的数据
	 * @return int 评论编号
	 */
	public function saveComment($_POST)
	{
		global $_FANWE;
		$share_id = intval($_POST['share_id']);
		$data = array();
		$data['content'] = 	htmlspecialchars(trim($_POST['content']));
		$data['uid'] = $_FANWE['uid'];
		$data['parent_id'] = intval($_POST['parent_id']);
		$data['share_id'] = $share_id;
		$data['create_time'] = fGmtTime();
		$comment_id =  FDB::insert('share_comment',$data,true);

		$is_relay = isset($_POST['is_relay']) ? intval($_POST['is_relay']) : 0;
		//转发分享
		if($is_relay == 1)
		{
			$share = ShareService::getShareById($share_id);
			if($share['base_id'] > 0)
			{
				$share_user = FS('User')->getUserCache($share['uid']);
				$_POST['content'] = trim($_POST['content']).'//@'.$share_user['user_name'].':'.$share['content'];
			}

			ShareService::saveRelay($_POST);
		}

		//分享评论数量加1
		FDB::query('UPDATE '.FDB::table('share').'
			SET comment_count = comment_count + 1
			WHERE share_id = '.$share_id);

		//清除分享评论列表缓存
		ShareService::clearShareCommentCache($share_id);
		return $comment_id;
	}

	/**
	 * 获取分享评论
	 * @param int $share_id 分享编号
	 * @param int $count 数量
	 * @return array
	 */
	public function getShareComment($comment_id)
	{
		$key = 'share/'.getDirsById($share_id).'/comment/'.$comment_id;
		$comment = getCache($key);
		if($comment === NULL)
		{
			$comment = FDB::fetchFirst('SELECT *
					FROM '.FDB::table("share_comment").'
					WHERE comment_id = '.$comment_id);

			setCache($key,$comment);
		}

		if(!empty($comment))
		{
			$comment['user'] = FS('User')->getUserCache($comment['uid']);
			$comment['time'] = getBeforeTimelag($comment['create_time']);
		}

		return $comment;
	}

	/**
	 * 删除分享评论
	 * @param int $comment_id 评论编号
	 * @return void
	 */
	public function deleteShareComment($comment_id)
	{
		$comment = ShareService::getShareComment($comment_id);
		if(empty($comment))
			return;

		FDB::delete('share_comment','comment_id = '.$comment_id);

		$share_id = $comment['share_id'];
		//分享评论数量减1
		FDB::query('UPDATE '.FDB::table('share').'
			SET comment_count = comment_count - 1
			WHERE share_id = '.$share_id);

		//删除分享评论缓存
		deleteCache('share/'.getDirsById($share_id).'/comment/'.$comment_id);

		//清除分享评论列表缓存
		ShareService::clearShareCommentCache($share_id);
	}

	/**
	 * 获取分享的最新评论列表
	 * @param int $share_id 分享编号
	 * @param int $count 数量
	 * @return array
	 */
	public function getShareComments($share_id,$count = 10)
	{
		$key = 'share/'.getDirsById($share_id).'/commentlist/'.$count;
		$comments = getCache($key);

		if($comments === NULL)
		{
			$comments = FDB::fetchAll('SELECT *
					FROM '.FDB::table("share_comment").'
					WHERE share_id = '.$share_id.'
					ORDER BY comment_id DESC LIMIT 0,'.$count);

			setCache($key,$comments);
		}

		if(is_array($comments))
		{
			foreach($comments as $key => $comment)
			{
				$comment['user'] = FS('User')->getUserCache($comment['uid']);
				$comment['time'] = getBeforeTimelag($comment['create_time']);
				$comments[$key] = $comment;
			}
		}

		return $comments;
	}

	/**
	 * 获取分享的分页评论列表
	 * @param int $share_id 分享编号
	 * @param int $count 分页
	 * @return array
	 */
	public function getShareCommentList($share_id,$limit = '0,10')
	{
		$key = 'share/'.getDirsById($share_id).'/commentlist/'.str_replace(',','_',$limit);
		$comments = getCache($key);
		if($comments === NULL)
		{
			$comments = FDB::fetchAll('SELECT *
					FROM '.FDB::table("share_comment").'
					WHERE share_id = '.$share_id.'
					ORDER BY comment_id DESC LIMIT '.$limit);

			setCache($key,$comments);
		}

		if(is_array($comments))
		{
			foreach($comments as $key => $comment)
			{
				$comment['user'] = FS('User')->getUserCache($comment['uid']);
				$comment['time'] = getBeforeTimelag($comment['create_time']);
				$comments[$key] = $comment;
			}
		}

		return $comments;
	}

	/**
	 * 清除分享评论列表缓存
	 * @param int $share_id 分享编号
	 * @return void
	 */
	public function clearShareCommentCache($share_id)
	{
		clearCacheDir('share/'.getDirsById($share_id).'/commentlist/');
	}
	/*===========分享评论 END  ==============*/

	/**
	 * 获取喜欢这个分享的会员还喜欢的分享（有图片或商品的分享）
	 * @param int $share_id 分享编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getCollectShareByShare($share_id,$num = 20)
	{
		$list = array();
		$uids = ShareService::getShareCollectUserCache($share_id);

		if(count($uids) > 0)
		{
			$share_ids = array();
			$res = FDB::query('SELECT GROUP_CONCAT(DISTINCT s.share_id
					ORDER BY s.share_id DESC SEPARATOR \',\') AS share_ids,s.uid
				FROM '.FDB::table('user_collect').' AS uc
				INNER JOIN '.FDB::table('share').' AS s ON s.share_id = uc.share_id
				WHERE uc.c_uid IN ('.implode(',',$uids).')
					AND s.share_id <> '.$share_id.'
					AND s.share_data IN (\'goods\',\'photo\',\'goods_photo\')
				GROUP BY s.uid LIMIT 0,'.$num);
			while($data = FDB::fetch($res))
			{
				$share_ids = explode(',',$data['share_ids']);
				$share_id = current($share_ids);
				$share = ShareService::getShareDetail($share_id);
				$share['user'] = FS('User')->getUserCache($share['uid']);
				$list[] = $share;
			}
		}

		return $list;
	}

	/**
	 * 获取会员喜欢的分享（有图片或商品的分享）
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getCollectShareByUser($uid,$num = 10)
	{
		$list = array();
		$share_ids = array();
		$res = FDB::query('SELECT share_id FROM '.FDB::table('user_collect').' WHERE c_uid = '.$uid);
		while($data = FDB::fetch($res))
		{
			$share_ids[] = $data['share_id'];
		}

		if(count($share_ids) > 0)
		{
			$res = FDB::query('SELECT GROUP_CONCAT(DISTINCT share_id
					ORDER BY share_id DESC SEPARATOR \',\') AS share_ids,uid
				FROM '.FDB::table('share').'
				WHERE share_data IN (\'goods\',\'photo\',\'goods_photo\')
					AND share_id IN ('.implode(',',$share_ids).')
				GROUP BY uid
				LIMIT 0,'.$num);
			while($data = FDB::fetch($res))
			{
				$share_ids = explode(',',$data['share_ids']);
				$share_id = current($share_ids);
				$share = ShareService::getShareDetail($share_id);
				$share['user'] = FS('User')->getUserCache($share['uid']);
				$list[] = $share;
			}
		}

		return $list;
	}

	/**
	 * 获取会员最被喜欢的宝贝分享
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getBestCollectGoodsShareByUser($uid,$num = 9)
	{
		$list = array();
		$res = FDB::query('SELECT s.share_id,sg.img,sg.goods_id FROM '.FDB::table('share').' AS s
			INNER JOIN '.FDB::table('share_goods').' AS sg ON sg.share_id = s.share_id
			WHERE s.share_data IN (\'goods\',\'goods_photo\') AND s.uid ='.$uid.' ORDER BY s.collect_count DESC LIMIT 0,'.$num);
		while($data = FDB::fetch($res))
		{
			$data['url'] = FU('note/g',array('sid'=>$data['share_id'],'id'=>$data['goods_id']));
			$list[] = $data;
		}

		return $list;
	}

	/**
	 * 获取会员喜欢的宝贝分享
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getUserFavGoodsShare($uid,$num = 9)
	{
		$list = array();
		$share_ids = array();
		$res = FDB::query('SELECT share_id FROM '.FDB::table('user_collect').' WHERE c_uid = '.$uid);
		while($data = FDB::fetch($res))
		{
			$share_ids[] = $data['share_id'];
		}

		if(count($share_ids) > 0)
		{
			$res = FDB::query('SELECT s.share_id,sg.img,sg.goods_id FROM '.FDB::table('share').' AS s
				INNER JOIN '.FDB::table('share_goods').' AS sg ON sg.share_id = s.share_id
				WHERE s.share_data IN (\'goods\',\'goods_photo\') AND s.share_id IN ('.implode(',',$share_ids).') LIMIT 0,'.$num);
			while($data = FDB::fetch($res))
			{
				$data['url'] = FU('note/g',array('sid'=>$data['share_id'],'id'=>$data['goods_id']));
				$list[] = $data;
			}
		}

		return $list;
	}

	/**
	 * 获取会员最被喜欢的照片分享
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getBestCollectPhotoShareByUser($uid,$num = 9)
	{
		$list = array();
		$res = FDB::query('SELECT s.share_id,sp.img,sp.photo_id FROM '.FDB::table('share').' AS s
			INNER JOIN '.FDB::table('share_photo').' AS sp ON sp.share_id = s.share_id
			WHERE s.share_data IN (\'photo\',\'goods_photo\') AND s.uid ='.$uid.' ORDER BY s.collect_count DESC LIMIT 0,'.$num);
		while($data = FDB::fetch($res))
		{
			$data['url'] = FU('note/m',array('sid'=>$data['share_id'],'id'=>$data['photo_id']));
			$list[] = $data;
		}

		return $list;
	}

	/**
	 * 获取会员喜欢的照片分享
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getUserFavPhotoShare($uid,$num = 9)
	{
		$list = array();
		$share_ids = array();
		$res = FDB::query('SELECT share_id FROM '.FDB::table('user_collect').' WHERE c_uid = '.$uid);
		while($data = FDB::fetch($res))
		{
			$share_ids[] = $data['share_id'];
		}

		if(count($share_ids) > 0)
		{
			$res = FDB::query('SELECT s.share_id,sp.img,sp.photo_id FROM '.FDB::table('share').' AS s
				INNER JOIN '.FDB::table('share_photo').' AS sp ON sp.share_id = s.share_id
				WHERE s.share_data IN (\'photo\',\'goods_photo\') AND s.share_id IN ('.implode(',',$share_ids).') LIMIT 0,'.$num);
			while($data = FDB::fetch($res))
			{
				$data['url'] = FU('note/m',array('sid'=>$data['share_id'],'id'=>$data['photo_id']));
				$list[] = $data;
			}
		}

		return $list;
	}

	/**
	 * 获取会员分享的商品
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getUserShareGoods($uid,$num = 10)
	{
		$key = 'user/'.$uid.'/share/goods/'.$num;
		$list = getCache($key);
		if($list === NULL)
		{
			$list = array();
			$res = FDB::query('SELECT goods_id,share_id,img,price FROM '.FDB::table('share_goods').'
					WHERE uid = '.$uid.' ORDER BY goods_id DESC LIMIT 0,'.$num);
			while($goods = FDB::fetch($res))
			{
				$goods['price_format'] = priceFormat($goods['price']);
				$goods['url'] = FU('note/g',array('sid'=>$goods['share_id'],'id'=>$goods['goods_id']));
				$list[] = $goods;
			}

			setCache($key,$list);
		}

		return $list;
	}

	/**
	 * 获取会员分享的相册
	 * @param int $uid 会员编号
	 * @param int $num 获取数量
	 * @return array
	 */
	public function getUserSharePhoto($uid,$num = 10)
	{
		$key = 'user/'.$uid.'/share/photo/'.$num;
		$list = getCache($key);
		if($list === NULL)
		{
			$list = array();
			$res = FDB::query('SELECT photo_id,share_id,img FROM '.FDB::table('share_photo').'
				WHERE uid = '.$uid.' ORDER BY photo_id DESC LIMIT 0,'.$num);
			while($photo = FDB::fetch($res))
			{
				$photo['url'] = FU('note/m',array('sid'=>$photo['share_id'],'id'=>$photo['photo_id']));
				$list[] = $photo;
			}

			setCache($key,$list);
		}

		return $list;
	}

	/**
	 * 获取会员发表的分享列表
	 * @param int $uid 会员编号
	 * @param string $limit
	 * @return array
	 */
	public function getUserShareList($uid,$limit)
	{
		$sql = 'SELECT share_id
			FROM '.FDB::table('share').'
			WHERE uid = '.$uid.' ORDER BY share_id DESC LIMIT '.$limit;
		$list = FDB::fetchAll($sql);

		return ShareService::getShareDetailList($list,true,true,true,true,true);
	}

	/**
	 * 获取会员发表的分享数量
	 * @param int $uid 会员编号
	 * @return int
	 */
	public function getUserShareCount($uid)
	{
		return FDB::resultFirst('SELECT COUNT(share_id) FROM '.FDB::table('share').' WHERE uid = '.$uid);
	}

	/**
	 * 获取会员喜欢的分享列表
	 * @param int $uid 会员编号
	 * @param string $limit
	 * @return array
	 */
	public function getUserFavShareList($uid,$limit)
	{
		$sql = 'SELECT s.share_id,s.parent_id,u.is_daren,s.share_data,u.user_name,s.content,s.uid,s.collect_count,s.relay_count,s.comment_count,s.create_time,s.type,s.title
			FROM '.FDB::table('user_collect').' AS uc
			INNER JOIN '.FDB::table('share').' AS s ON s.share_id = uc.share_id
			INNER JOIN '.FDB::table('user').' AS u ON u.uid = s.uid
			WHERE uc.c_uid = '.$uid.' GROUP BY s.share_id ORDER BY s.share_id DESC LIMIT '.$limit;
		$list = FDB::fetchAll($sql);

		require_once fimport("service/share");
		return ShareService::getShareDetailList($list,true,true,true,true,true);
	}

	/**
	 * 获取会员喜欢的分享数量
	 * @param int $uid 会员编号
	 * @return int
	 */
	public function getUserFavShareCount($uid)
	{
		return FDB::resultFirst('SELECT COUNT(DISTINCT share_id) FROM '.FDB::table('user_collect').' WHERE c_uid = '.$uid);
	}

	/**
	 * 获取当前的最新商品\图片分享
	 * @param int $num 获取数量
	 * @param int $pic_num 获取图片数量
	 * @return int
	 */
	public function getNewShare($num = 20)
	{
		$sql = 'SELECT share_id
			FROM '.FDB::table('share').'
			WHERE share_data IN (\'goods\',\'goods_photo\',\'photo\')
			ORDER BY share_id DESC
			LIMIT 0,'.$num;
		$list = FDB::FetchAll($sql);
		return ShareService::getShareDetailList($list);
	}

	/**
	 * 获取首页显示的分享分类最近7天最热标签
	 * @return array
	 */
	public function getIndexShareCateHotTags($num = 30)
	{
		static $list = NULL;
		if($list === NULL)
		{
			global $_FANWE;
			FanweService::instance()->cache->loadCache('goods_category');
			$cate_indexs = $_FANWE['cache']['goods_category']['index'];
			$day7_time = getTodayTime() - 604800;
			$list = array();
			foreach($cate_indexs as $cate_id)
			{
				$cids = array();
				FS('Share')->getChildCids($cate_id,$cids);
				$sql = 'SELECT st.tag_name,(gct.tag_id > 0) AS gt_tag,COUNT(DISTINCT t.share_id) AS share_count,
					GROUP_CONCAT(DISTINCT t.share_id ORDER BY t.is_best DESC,t.collect_count DESC SEPARATOR \',\') AS share_ids
					FROM (SELECT DISTINCT(s.share_id),s.is_best,s.collect_count,sc.cate_id
                        FROM '.FDB::table('share_category').' AS sc FORCE INDEX (cate_id)
                        INNER JOIN '.FDB::table('share').' AS s ON s.share_id = sc.share_id
                        WHERE sc.cate_id IN ('.implode(',',$cids).')
                        ORDER BY s.share_id DESC LIMIT 0,2000) AS t
                    STRAIGHT_JOIN '.FDB::table('share_tags').' AS st ON st.share_id = t.share_id
                    STRAIGHT_JOIN '.FDB::table('goods_tags').' AS gt ON gt.tag_name = st.tag_name
                    STRAIGHT_JOIN '.FDB::table('goods_category_tags').' AS gct ON gct.cate_id IN ('.implode(',',$cids).') AND gct.tag_id = gt.tag_id
                    GROUP BY st.tag_name
                    ORDER BY gt_tag DESC,gt.sort ASC,share_count DESC LIMIT 0,'.$num;

				$res = FDB::query($sql);
				while($data = FDB::fetch($res))
				{
					$tag_encode = urlencode($data['tag_name']);
					$list[$cate_id]['tags'][$data['tag_name']] = $tag_encode;
					$share_ids = explode(',',$data['share_ids']);
					$share_ids = array_slice($share_ids,0,11);
                    if(count($share_ids) > 1)
					    array_pop($share_ids);

					foreach($share_ids as $share_id)
					{
						if(!isset($list['shares'][$share_id]))
						{
							$list['share_list'][] = $share_id;
							$list['shares'][$share_id] = array('cate_id'=>$cate_id,
								'tag_name'=>$data['tag_name'],
								'tag_encode'=>$tag_encode);

							break;
						}
					}
				}
			}
		}

		return $list;
	}

	/**
	 * 获取首页显示的分享分类最近7天最热标签的分享
	 * @return array
	 */
	public function getIndexCateTagShares($num = 30)
	{
		global $_FANWE;
		$day7_time = getTodayTime() - 604800;
		$cate_list = &ShareService::getIndexShareCateHotTags($num);
		if(!empty($cate_list['share_list']))
		{
			$list = array();
			$share_datas = array();
			$sql = 'SELECT s.*,u.user_name
				FROM '.FDB::table('share').' AS s
				INNER JOIN '.FDB::table('user').' AS u ON u.uid = s.uid
				WHERE s.share_id IN ('.implode(',',$cate_list['share_list']).')';
			$res = FDB::query($sql);
			while($data = FDB::fetch($res))
			{
				$share_datas[$data['share_data']][] = $data['share_id'];
				$list[$data['share_id']] = $data;
			}

			ShareService::getShareImages($share_datas,$list,1,true);

			foreach($list as $data)
			{
				$cate_list['shares'][$data['share_id']]['share'] = $data;
			}
		}

		foreach($cate_list['shares'] as $share)
		{
			$cate_id = $share['cate_id'];
			unset($share['cate_id']);

			$uid = $share['share']['uid'];
			if(!isset($cate_list[$cate_id]['user'][$uid]))
				$cate_list[$cate_id]['user'][$uid] = array('uid'=>$uid,'user_name'=>$share['share']['user']['user_name']);
			$cate_list[$cate_id]['shares'][] = $share;
		}

		unset($cate_list['shares']);
		unset($cate_list['share_list']);

		return $cate_list;
	}

	public function getChildCids($rid,&$cids)
	{
		global $_FANWE;
		$root_cate = $_FANWE['cache']['goods_category']['all'][$rid];
		$cids[] = $rid;
		if(isset($root_cate['child']))
		{
			foreach($root_cate['child'] as $cid)
			{
				ShareService::getChildCids($cid,$cids);
			}
		}
	}
}
?>