<?php
// +----------------------------------------------------------------------
// | 方维购物分享网站系统 (Build on ThinkPHP)
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://fanwe.com All rights reserved.
// +----------------------------------------------------------------------

/**
 * image.service.php
 *
 * 图片服务类
 *
 * @package service
 * @author awfigq <awfigq@qq.com>
 */
class ImageService
{
	/**
	 * 保存图片
	 * @param array $key $_FILES 中的键名 为空则保存 $_FILES 中的所有图片
	 * @param string $dir 保存的目录 为空则保存到临时目录
	 * @param bool $is_thumb 是否缩略图片
	 * @param array $whs 缩略图大小信息 为空则取后台设置,并返回 大图键名big 小图键名small
	 	可生成多个缩略图
		数组 参数1 为宽度，
			 参数2为高度，
			 参数3为处理方式:0(缩放,默认)，1(剪裁)，
			 参数4为是否水印 默认为 0(不生成水印)
	 	array(
			'thumb1'=>array(300,300,0,0),
			'thumb2'=>array(100,100,0,0),
			...
		)，
	 * @param bool $is_delete_origin 是否删除原图(当有缩略图时，此设置才生效)
	 * @param bool $is_water 是否水印
	 * @return array
	 	如果只有一个图片，则返回
		array(
			'name'=>图片名称，
			'url'=>原图web路径，
			'path'=>原图物理路径，
			有略图时
			'thumb'=>array(
				'thumb1'=>array('url'=>web路径,'path'=>物理路径),
				'thumb2'=>array('url'=>web路径,'path'=>物理路径),
				...
			)
		)
		如果有多个图片，则返回(key 为 $_FILES 中的键名)
		array(
			'key'=>array(
				'name'=>图片名称，
				'url'=>原图web路径，
				'path'=>原图物理路径，
				有略图时
				'thumb'=>array(
					'thumb1'=>array('url'=>web路径,'path'=>物理路径),
					'thumb2'=>array('url'=>web路径,'path'=>物理路径),
					...
				)
			)
			....
		)
	 */
	public function save($key='',$dir='temp',$is_thumb=false,$whs=array(),$is_delete_origin = false,$is_water = false)
	{
		global $_FANWE;
		include_once fimport('class/image');
		$image = new Image();
		if(intval($_FANWE['setting']['max_upload']) > 0)
			$image->max_size = intval($_FANWE['setting']['max_upload']);

		$list = array();

		if(empty($key))
		{
			foreach($_FILES as $fkey=>$file)
			{
				$list[$fkey] = false;
				$image->init($file,$dir);
				if($image->save())
				{
					$list[$fkey] = array();
					$list[$fkey]['url'] = $image->file['target'];
					$list[$fkey]['path'] = $image->file['local_target'];
					$list[$fkey]['name'] = $image->file['prefix'];
				}
			}
		}
		else
		{
			$list[$key] = false;
			$image->init($_FILES[$key],$dir);
			if($image->save())
			{
				$list[$key] = array();
				$list[$key]['url'] = $image->file['target'];
				$list[$key]['path'] = $image->file['local_target'];
				$list[$key]['name'] = $image->file['prefix'];
			}
		}

		$water_image = FANWE_ROOT . $_FANWE['setting']['water_image'];
		$water_mark = intval($_FANWE['setting']['water_mark']);
		$alpha = intval($_FANWE['setting']['water_alpha']);
		$place = intval($_FANWE['setting']['water_position']);

		if($is_thumb)
		{
			if(empty($whs))
			{
				$big_width = intval($_FANWE['setting']['big_width']);
				$big_height = intval($_FANWE['setting']['big_height']);
				$small_width = intval($_FANWE['setting']['small_width']);
				$small_height = intval($_FANWE['setting']['small_height']);
				$thumb_type = intval($_FANWE['setting']['auto_gen_image']);

				$whs = array(
					'big'=>array($big_width,$big_height,$thumb_type,$water_mark),
					'small'=>array($small_width,$small_height,1,0),
				);
			}
		}

		foreach($list as $lkey=>$item)
		{
			if($is_thumb)
			{
				foreach($whs as $tkey=>$wh)
				{
					$list[$lkey]['thumb'][$tkey]['url'] = false;
					$list[$lkey]['thumb'][$tkey]['path'] = false;

					if($wh[0] > 0 || $wh[1] > 0)
					{
						$thumb_bln = false;
						$thumb_type = isset($wh[2]) ? intval($wh[2]) : 0;
						if($thumb = $image->thumb($item['path'],$wh[0],$wh[1],$thumb_type))
						{
							$thumb_bln = true;
							$list[$lkey]['thumb'][$tkey]['url'] = $thumb['url'];
							$list[$lkey]['thumb'][$tkey]['path'] = $thumb['path'];
							if(isset($wh[3]) && intval($wh[3]) > 0)
								$image->water($list[$lkey]['thumb'][$tkey]['path'],$water_image,$alpha, $place);
						}
					}
				}

				if($is_delete_origin && $thumb_bln)
				{
					@unlink($item['path']);
					$list[$lkey]['url'] = false;
					$list[$lkey]['path'] = false;
				}
			}

			if($is_water)
			{
				$image->water($item['path'],$water_image,$alpha, $place);
			}
		}
		
		if($key != '')
			return $list[$key];
		else
			return $list;
	}
}
?>