<?php
// +----------------------------------------------------------------------
// | 方维购物分享网站系统 (Build on ThinkPHP)
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://fanwe.com All rights reserved.
// +----------------------------------------------------------------------

/**
 * global.func
 *
 * 公共函数
 *
 * @package function
 * @author awfigq <awfigq@qq.com>
 */

if(!defined('IS_CGI'))
define('IS_CGI',substr(PHP_SAPI, 0,3)=='cgi' ? 1 : 0 );
if(!defined('_PHP_FILE_'))
{
	if(IS_CGI)
	{
		//CGI/FASTCGI模式下
		$_temp  = explode('.php',$_SERVER["PHP_SELF"]);
		define('_PHP_FILE_',  rtrim(str_replace($_SERVER["HTTP_HOST"],'',$_temp[0].'.php'),'/'));
	}
	else
	{
		define('_PHP_FILE_',  rtrim($_SERVER["SCRIPT_NAME"],'/'));
	}
}

if(!defined('APP_ROOT'))
{
	// 网站URL根目录
	$_root = dirname(_PHP_FILE_);
	$_root = (($_root=='/' || $_root=='\\')?'':$_root);
	$_root = str_replace("/core/function","",$_root);
	define('APP_ROOT', $_root  );
}

function get_http()
{
	return (isset($_SERVER['HTTPS']) && (strtolower($_SERVER['HTTPS']) != 'off')) ? 'https://' : 'http://';
}

function get_domain()
{
	/* 协议 */
	$protocol = get_http();

	/* 域名或IP地址 */
	if (isset($_SERVER['HTTP_X_FORWARDED_HOST']))
	{
		$host = $_SERVER['HTTP_X_FORWARDED_HOST'];
	}
	elseif (isset($_SERVER['HTTP_HOST']))
	{
		$host = $_SERVER['HTTP_HOST'];
	}
	else
	{
		/* 端口 */
		if (isset($_SERVER['SERVER_PORT']))
		{
			$port = ':' . $_SERVER['SERVER_PORT'];

			if ((':80' == $port && 'http://' == $protocol) || (':443' == $port && 'https://' == $protocol))
			{
				$port = '';
			}
		}
		else
		{
			$port = '';
		}

		if (isset($_SERVER['SERVER_NAME']))
		{
			$host = $_SERVER['SERVER_NAME'] . $port;
		}
		elseif (isset($_SERVER['SERVER_ADDR']))
		{
			$host = $_SERVER['SERVER_ADDR'] . $port;
		}
	}

	return $protocol . $host;
}

function load_login_api($class_name)
{
	if(file_exists(FANWE_ROOT."login/".$class_name.".php"))
	{
		require FANWE_ROOT."login/".$class_name.".php";
		if(class_exists($class_name))
		{
			$module = new $class_name;
			return $module->get_api_url();
		}
		else
			return "";
	}
	else
		return "";
}

/**
 * 获取引用文件路径
 * @param string $file_name 文件名称
 * @param string $folder 所在目录(默认为空)
 * @return string
 */
function fimport($file_name, $folder = '')
{
	global $_FANWE;
	static $sufix = array(
		'module'=>'.module',
		'service'=>'.service',
		'class'=>'.class',
		'function' => '.func',
		'include' => '.inc',
		'language' => '.lang',
		'cache' => '.cache',
		'dynamic'=>'.dynamic',
	);

	$file_name = strtolower($file_name);
	$file_path = FANWE_ROOT.'./core';
	if(strstr($file_name, '/'))
	{
		list($pre, $name) = explode('/', $file_name);

		$insert = '';
		if($pre == 'language')
			$insert = $_FANWE['config']['default_lang'].'/';

		return "{$file_path}/{$pre}/".$insert.(empty($folder) ? "" : $folder . "/")."{$name}".$sufix[$pre].".php";
	}
	else
	{
		return "{$file_path}/".(empty($folder) ? "" : $folder . "/")."{$file_name}.php";
	}
}

/**
 * 获取页面显示操作类
 * @param string $module 类名
 * @return object
 */
function FM($module)
{
	static $modules = array();
	if($modules[$module] === NULL)
	{
		require fimport("module/".strtolower($module));
		$m = ucfirst($module)."Module";
		$modules[$module] = new $m();
		unset($m);
	}
	return $modules[$module];
}

/**
 * 获取服务类
 * @param string $service 类名
 * @return object
 */
function FS($service)
{
	static $services = array();
	if($services[$service] === NULL)
	{
		require_once fimport("service/".strtolower($service));
		$s = ucfirst($service)."Service";
		$services[$service] = new $s();
		unset($s);
	}

	return $services[$service];
}

/**
 * 页面路径处理
 * @param string $type 页面
 * @param array $args 参数
 * @return string
 */
function FU($type,$args)
{
	global $_FANWE;
	static $is_rewrite = NULL,$site_url = NULL;

    if ($is_rewrite === NULL)
    {
        $is_rewrite = intval($_FANWE['setting']['url_model']);
    }

	if ($site_url === NULL)
    {
        $site_url = $_FANWE['site_root'];
    }

	$depr = '/';

	$url = $site_url;

	$apps = explode('/',$type);
	$module = $apps[0];
	$action = isset($apps[1]) ? $apps[1] : 'index';
	$type = $module.'/'.$action;

	$query = '';

	if($is_rewrite == 0)
	{
		$query = http_build_query($args);
		if(!empty($query))
			$query = '&'.$query;
	}

	if($is_rewrite == 0)
	{
		$url .= $module.'.php?action='.$action.$query;
	}
	else
	{
		$params = array();
		switch($type)
		{
			case 'club/index':
			case 'ask/index':
			case 'daren/index':
				$search = array('/index');
				$replace = array('');
			break;

			case 'club/forum':
				$params = array('fid' => 0,'sort' => '','page' => 0);
				$search = array('forum/','fid/','sort/','page/');
				$replace = array('','','','');
			break;

			case 'club/best':
				$params = array('fid' => 0,'sort' => '','page' => 0);
				$search = array('fid/','sort/','page/');
				$replace = array('','','');
			break;

			case "club/newtopic":
				$search = array('fid/');
				$replace = array('');
			break;

			case "club/detail":
				$params = array('tid' => 0,'page' => 0);
				$search = array('tid/','page/');
				$replace = array('','');
			break;

			case 'ask/forum':
				$params = array('aid' => 0,'type' => '','page' => 0);
				$search = array('forum/','aid/','type/','page/');
				$replace = array('','','','');
			break;

			case "ask/newtopic":
				$search = array('aid/');
				$replace = array('');
			break;

			case "ask/detail":
				$params = array('tid' => 0,'page' => 0);
				$search = array('tid/','page/');
				$replace = array('','');
			break;

			case 'book/cate':
			case 'book/shopping':
			case 'book/search':
				$params = array('cate' => '','sort'=>'','tag' => '','page' => 0);
				$search = array('cate/','sort/','tag/','page/');
				$replace = array('','','','');
				$url =  str_replace($search,$replace,$url);
			break;
		}

		if(!empty($params))
			$args = array_merge($params, $args);

		foreach($args as $var=>$val)
		{
			if($var == 'page' && $val == '0')
				$val = '';

			if($val != '')
				$query .= $depr.$var.$depr.$val;
		}

		$url .= $module.$depr.$action.$query;
		if(!empty($search))
			$url = str_replace($search,$replace,$url);

		switch($module)
		{
			case 'index':
				$url = $site_url.'welcome';
			break;

			case 'u':
				if(!isset($args['uid']))
					$args['uid'] = $_FANWE['uid'];

				if($action == 'all')
					$url = $site_url.$module.$depr.$action;
                elseif($action == 'msgview')
                {

                }
				else
				{
					if($action == 'index')
					{
						if($args['uid'] == $_FANWE['uid'])
							$url = $site_url.'me';
						else
							$url = $site_url.$module.$depr.$args['uid'];
					}
					else
						$url = $site_url.$module.$depr.$args['uid'].$depr.$action;

					if(isset($args['type']) && $args['type'] != '')
						$url.= $depr.$args['type'];

					if(isset($args['sort']) && $args['sort'] != '')
						$url.= $depr.$args['sort'];

					if(isset($args['page']) && $args['page'] != '0')
						$url.= $depr.$args['page'];
				}
			break;

			case 'note':
				if($action == 'index')
					$url = $site_url.$module.$depr.$args['sid'];
				else
					$url = $site_url.$module.$depr.$args['sid'].$depr.$action.$depr.$args['id'];

				if(isset($args['page']) && $args['page'] != '0')
					$url.= $depr.$args['page'];
			break;
		}
	}

    if($type == 'tgo/index')
		$url = $site_url.'tgo.php?url='.base64_encode($args['url']);

	return $url;
}

/**
 * 页面重写参数处理
 * @param array $keys 键值对
 * @return void
 */
function getRewriteArgs($keys)
{
	global $_FANWE;
	$args = trim($_FANWE['request']['args']);
	foreach($keys as $key)
	{
		preg_match("/$key-(.+?)(?:$|-)/is",$args,$value);
		if(count($value) > 1)
		{
			$_FANWE['request'][$key] = $value[1];
			if($key == 'page')
				$_FANWE['page'] = $value[1];
		}
	}
	unset($_FANWE['request']['args']);
}

/**
 * 分页处理
 * @param string $type 所在页面
 * @param array  $args 参数
 * @param int $total_count 总数
 * @param int $page 当前页
 * @param int $page_size 分页大小
 * @param string $url 自定义路径
 * @param int $offset 偏移量
 * @return array
 */
function buildPage($type,$args,$total_count,$page = 1,$page_size = 0,$url='',$offset = 5)
{
	global $_FANWE;

	$pager['total_count'] = intval($total_count);
	$pager['page'] = $page;
	$pager['page_size'] = ($page_size == 0) ? ($_FANWE['setting']['page_listrows'] > 0 ? $_FANWE['setting']['page_listrows'] : 20) : $page_size;
	/* page 总数 */
	$pager['page_count'] = ($pager['total_count'] > 0) ? ceil($pager['total_count'] / $pager['page_size']) : 1;

	/* 边界处理 */
	if ($pager['page'] > $pager['page_count'])
		$pager['page'] = $pager['page_count'];

	$pager['limit'] = ($pager['page'] - 1) * $pager['page_size'] . "," . $pager['page_size'];

	$page_prev  = ($pager['page'] > 1) ? $pager['page'] - 1 : 1;
	$page_next  = ($pager['page'] < $pager['page_count']) ? $pager['page'] + 1 : $pager['page_count'];
	$pager['prev_page'] = $page_prev;
	$pager['next_page'] = $page_next;

	if (!empty($url))
	{
		$pager['page_first'] = $url . 1;
		$pager['page_prev']  = $url . $page_prev;
		$pager['page_next']  = $url . $page_next;
		$pager['page_last']  = $url . $pager['page_count'];
	}
	else
	{
		$args['page'] = '_page_';
		if(!empty($type))
			$page_url = FU($type,$args);
		else
			$page_url = 'javascript:;';

		$pager['page_first'] = str_replace('_page_',1,$page_url);
		$pager['page_prev']  = str_replace('_page_',$page_prev,$page_url);
		$pager['page_next']  = str_replace('_page_',$page_next,$page_url);
		$pager['page_last']  = str_replace('_page_',$pager['page_count'],$page_url);
	}

	$pager['page_nums'] = array();

	if($pager['page_count'] <= $offset * 2)
	{
		for ($i=1; $i <= $pager['page_count']; $i++)
		{
			$pager['page_nums'][] = array('name' => $i,'url' => empty($url) ? str_replace('_page_',$i,$page_url) : $url . $i);
		}
	}
	else
	{
		if($pager['page'] - $offset < 2)
		{
			$temp = $offset * 2;

			for ($i=1; $i<=$temp; $i++)
			{
				$pager['page_nums'][] = array('name' => $i,'url' => empty($url) ? str_replace('_page_',$i,$page_url) : $url . $i);
			}

			$pager['page_nums'][] = array('name'=>'...');
			$pager['page_nums'][] = array('name' => $pager['page_count'],'url' => empty($url) ? str_replace('_page_',$pager['page_count'],$page_url) : $url . $pager['page_count']);
		}
		else
		{
			$pager['page_nums'][] = array('name' => 1,'url' => empty($url) ? str_replace('_page_',1,$page_url) : $url . 1);
			$pager['page_nums'][] = array('name'=>'...');
			$start = $pager['page'] - $offset + 1;
			$end = $pager['page'] + $offset - 1;

			if($pager['page_count'] - $end > 1)
			{
				for ($i=$start;$i<=$end;$i++)
				{
					$pager['page_nums'][] = array('name' => $i,'url' => empty($url) ? str_replace('_page_',$i,$page_url) : $url . $i);
				}

				$pager['page_nums'][] = array('name'=>'...');
				$pager['page_nums'][] = array('name' => $pager['page_count'],'url' => empty($url) ? str_replace('_page_',$pager['page_count'],$page_url) : $url . $pager['page_count']);
			}
			else
			{
				$start = $pager['page_count'] - $offset * 2 + 1;
				$end = $pager['page_count'];
				for ($i=$start;$i<=$end;$i++)
				{
					$pager['page_nums'][] = array('name' => $i,'url' => empty($url) ? str_replace('_page_',$i,$page_url) : $url . $i);
				}
			}
		}
	}

	return $pager;
}

/**
 * 用于检测当前用户IP的可操作性,time_span为验证的时间间隔 秒
 *
 * @param string $ip_str  IP地址
 * @param string $module  操作的模块     *
 * @param integer $time_span 间隔
 * @param integer $id   操作的数据
 *
 * @return boolean
 */
function checkIpOperation($module,$time_span = 0,$id = 0)
{
	global $_FANWE;

	$key = $_FANWE['uid'].'_check_'.$module.($id > 0 ? '_'.$id : '');

	if(empty($_FANWE['cookie'][$key]))
		return false;
	else
	{
		list($cip,$time) = fAddslashes(explode("\t", authcode($_FANWE['cookie'][$key], 'DECODE')));

		if(TIMESTAMP - $time < $time_span)
		{
			return false;
		}
		else
		{
			fSetCookie($key, authcode($_FANWE['client_ip']."\t".TIMESTAMP, 'ENCODE'),604800, 1, true);
			return true;
		}
	}
}

/**
 * 字符串截断处理
 * @param string $string 要处理的字符串
 * @param int  $length 指定长度
 * @param string $dot 超出指定长度时显示
 * @return array
 */
function cutStr($string, $length, $dot = '...')
{
	if(getStrLen($string) <= $length)
		return $string;

	$pre = '{%';
	$end = '%}';
	$string = str_replace(array('&amp;', '&quot;', '&lt;', '&gt;'), array($pre.'&'.$end, $pre.'"'.$end, $pre.'<'.$end, $pre.'>'.$end), $string);

	$strcut = '';
	if(strtolower(CHARSET) == 'utf-8')
	{
		$n = $tn = $noc = 0;
		while($n < strlen($string))
		{
			$t = ord($string[$n]);
			if($t == 9 || $t == 10 || (32 <= $t && $t <= 126))
			{
				$tn = 1; $n++; $noc++;
			}
			elseif(194 <= $t && $t <= 223)
			{
				$tn = 2; $n += 2; $noc += 2;
			}
			elseif(224 <= $t && $t <= 239)
			{
				$tn = 3; $n += 3; $noc += 2;
			}
			elseif(240 <= $t && $t <= 247)
			{
				$tn = 4; $n += 4; $noc += 2;
			}
			elseif(248 <= $t && $t <= 251)
			{
				$tn = 5; $n += 5; $noc += 2;
			}
			elseif($t == 252 || $t == 253)
			{
				$tn = 6; $n += 6; $noc += 2;
			}
			else
			{
				$n++;
			}

			if($noc >= $length)
				break;
		}

		if($noc > $length)
			$n -= $tn;

		$strcut = substr($string,0,$n);
	}
	else
	{
		for($i = 0; $i < $length; $i++)
		{
			$strcut .= ord($string[$i]) > 127 ? $string[$i].$string[++$i] : $string[$i];
		}
	}

	$strcut = str_replace(array($pre.'&'.$end, $pre.'"'.$end, $pre.'<'.$end, $pre.'>'.$end), array('&amp;', '&quot;', '&lt;', '&gt;'), $strcut);

	return $strcut.$dot;
}

/**
 * 获取字符串长度
 * @param string $str 要获取长度的字符串
 * @return int
 */
function getStrLen($str)
{
    $length = strlen(preg_replace('/[\x00-\x7F]/', '', $str));

    if ($length)
    {
        return strlen($str) - $length + intval($length / 3) * 2;
    }
    else
    {
        return strlen($str);
    }
}

/**
 * 获取字节数
 * @param string $val 要获取字节数的字符串
 * @return int
 */
function getBytes($val)
{
    $val = trim($val);
    $last = strtolower($val{strlen($val)-1});
    switch($last)
	{
        case 'g': $val *= 1024;
        case 'm': $val *= 1024;
        case 'k': $val *= 1024;
    }

    return $val;
}

/**
 * 错误处理
 * @param string $message 错误信息
 * @param bool $show 是否显示
 * @param bool $save 是否保存
 * @param bool $halt 是否停止
 * @return void
 */
function systemError($message, $show = true, $save = true, $halt = true)
{
	require_once fimport('class/error');
	FanweError::systemError($message, $show, $save, $halt);
}

/**
 * 显示成功信息
 * @param string $title 标题
 * @param string $message 成功信息
 * @param string $jump_url 跳转地址
 * @param int $wait 等待时间
 * @return void
 */
function showSuccess($title, $message,$jump_url,$wait = 3)
{
	global $_FANWE;
	include template('page/success');
	display();
	exit;
}

/**
 * 显示错误信息
 * @param string $title 标题
 * @param string $message 错误信息
 * @param string $jump_url 跳转地址
 * @param int $wait 等待时间
 * @param bool $is_close 是否显示网站关闭
 * @return void
 */
function showError($title, $message,$jump_url,$wait = 3,$is_close = false)
{
	global $_FANWE;

	if($is_close)
		include template('page/close');
	else
		include template('page/error');

	display();
	exit;
}

/**
 * 查询字符串是否存在
 * @param string $string
 * @param string $find
 * @return bool
 */
function strExists($string, $find)
{
	return !(strpos($string, $find) === FALSE);
}

/**
 * 获取是否为搜索引擎爬虫
 * @param string $userAgent 用户信息
 * @return bool
 */
function checkRobot($userAgent = '')
{
	static $kwSpiders = 'Bot|Crawl|Spider|slurp|sohu-search|lycos|robozilla';
	static $kwBrowsers = 'MSIE|Netscape|Opera|Konqueror|Mozilla';

	$userAgent = empty($userAgent) ? $_SERVER['HTTP_USER_AGENT'] : $userAgent;

	if(!strExists($userAgent, 'http://') && preg_match("/($kwBrowsers)/i", $userAgent))
		return false;
	elseif(preg_match("/($kwSpiders)/i", $userAgent))
		return true;
	else
		return false;
}

/**
 * 获取链接格式是否正确
 * @param string $url 链接
 * @return bool
 */
function parseUrl($url)
{
	$parse_url = parse_url($url);
	return (!empty($parse_url['scheme']) && !empty($parse_url['host']));
}


/**
 * 获取客户端IP
 * @return string
 */
function getFClientIp()
{
	$ip = $_SERVER['REMOTE_ADDR'];
	if (isset($_SERVER['HTTP_CLIENT_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CLIENT_IP']))
	{
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	}
	elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s', $_SERVER['HTTP_X_FORWARDED_FOR'], $matches))
	{
		foreach ($matches[0] AS $xip)
		{
			if (!preg_match('#^(10|172\.16|192\.168)\.#', $xip))
			{
				$ip = $xip;
				break;
			}
		}
	}
	return $ip;
}

/**
 * 字符转义
 * @return string
 */
function fAddslashes($string)
{
	if(is_array($string))
	{
		foreach($string as $key => $val)
		{
			unset($string[$key]);
			$string[addslashes($key)] = fAddslashes($val);
		}
	}
	else
	{
		$string = addslashes($string);
	}

	return $string;
}

/**
 * 生成随机数
 * @param int $length 随机数长度
 * @param int $numeric 是否只生成数字
 * @return string
 */
function random($length, $numeric = 0)
{
	$seed = base_convert(md5(microtime().$_SERVER['DOCUMENT_ROOT']), 16, $numeric ? 10 : 35);
	$seed = $numeric ? (str_replace('0', '', $seed).'012340567890') : ($seed.'zZ'.strtoupper($seed));
	$hash = '';
	$max = strlen($seed) - 1;
	for($i = 0; $i < $length; $i++)
	{
		$hash .= $seed{mt_rand(0, $max)};
	}
	return $hash;
}

/**
 * 生成cookie
 * @param string $var 键名
 * @param string $value 值
 * @param int $life 过期时间
 * @param bool $prefix 是否加入前缘
 * @param bool $http_only
 * @return void
 */
function fSetCookie($var, $value = '', $life = 0, $prefix = true, $http_only = false)
{
	global $_FANWE;
	$config = $_FANWE['config']['cookie'];
	$_FANWE['cookie'][$var] = $value;
	$var = ($prefix ? $config['cookie_pre'] : '').$var;
	$_COOKIE[$var] = $value;

	if($value == '' || $life < 0)
	{
		$value = '';
		$life = -1;
	}

	$life = $life > 0 ? TIME_UTC + $life : ($life < 0 ? TIME_UTC - 31536000 : 0);
	$path = $http_only && PHP_VERSION < '5.2.0' ? $config['cookie_path'].'; HttpOnly' : $config['cookie_path'];

	$secure = $_SERVER['SERVER_PORT'] == 443 ? 1 : 0;
	if(PHP_VERSION < '5.2.0')
	{
		setcookie($var, $value, $life, $path, $config['cookie_domain'], $secure);
	}
	else
	{
		setcookie($var, $value, $life, $path, $config['cookie_domain'], $secure, $http_only);
	}
}

/**
 * 更新session
 * @param bool $force 强制更新
 * @return bool
 */
function updateSession($force = false) {

	global $_FANWE;
	static $updated = false;

	if(!$updated)
	{
		$fanwe = & FanweService::instance();
		foreach($fanwe->session->var as $k => $v)
		{
			if(isset($_FANWE['user'][$k]) && $k != 'last_activity')
				$fanwe->session->set($k, $_FANWE['user'][$k]);
		}

		$fanwe->session->update();

		$updated = true;
	}

	return $updated;
}

/**
 * 获取cookie
 * @param string $key 键名
 * @return bool
 */
function getCookie($key)
{
	global $_FANWE;
	return isset($_FANWE['cookie'][$key]) ? $_FANWE['cookie'][$key] : '';
}

/**
 * 生成表单随机数
 * @param string $specialadd 增加文本
 * @return string
 */
function formHash($specialadd = '')
{
	global $_FANWE;
	return substr(md5(substr(TIME_UTC, 0, -7).$_FANWE['user_name'].$_FANWE['uid'].$_FANWE['authkey'].$specialadd), 8, 8);
}

/**
 * 安全代码处理
 * @param string $string 要处理的文本
 * @param string $operation 处理方式(DECODE:解码,ENCODE:编码)
 * @param string $key 密匙
 * @param int $expiry 过期时间
 * @return string
 */
function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0)
{
	global $_FANWE;
	$ckey_length = 4;
	$key = md5($key != '' ? $key : $_FANWE['authkey']);
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++)
	{
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++)
	{
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++)
	{
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE')
	{
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16))
		{
			return substr($result, 26);
		} else {
			return '';
		}
	}
	else
	{
		return $keyc.str_replace('=', '', base64_encode($result));
	}

}

/**
 * 获取语言文本
 * @param string $file 所在文件
 * @param string $var 键
 * @param string $default 默认值
 * @return mixed
 */
function lang($file, $var = NULL, $default = NULL)
{
	global $_FANWE;

	$key = $file."_lang";

	if(!isset($_FANWE['lang'][$key]))
	{
		include fimport("language/$file");
		$_FANWE['lang'][$key] = $lang;
	}

	$return = $var !== NULL ? (isset($_FANWE['lang'][$key][$var]) ? $_FANWE['lang'][$key][$var] : NULL) : $_FANWE['lang'][$key];

	$return = $return === NULL ? ($default !== NULL ? $default : $var) : $return;

	return $return;
}

/**
 * 获取IP列表中是否存在指定的IP
 * @param string $ip ip
 * @param string $access_list ip列表
 * @return bool
 */
function ipAccess($ip, $access_list)
{
	return preg_match("/^(".str_replace(array("\r\n", ' '), array('|', ''), preg_quote($access_list, '/')).")/", $ip);
}

/**
 * 获取IP是否充许访问
 * @param string $ip ip
 * @return bool
 */
function ipBanned($ip)
{
	global $_FANWE;

	if($_FANWE['setting']['ip_access'] && !ipAccess($ip, $_FANWE['setting']['ip_access']))
	{
		return true;
	}

	FanweService::instance()->cache->loadCache('ipbanned');

	if(empty($_FANWE['cache']['ipbanned']))
		return false;
	else
	{
		if($_FANWE['cache']['ipbanned']['expiration'] < TIME_UTC)
		{
			FanweService::instance()->cache->updateCache('ipbanned');
		}

		return preg_match("/^(".$_FANWE['cache']['ipbanned']['regexp'].")$/", $ip);
	}
}

/**
 * 获取模板cache文件路径
 * @param string $file 模板文件
 * @param array $args 参数
 * @param int $is_dynamic 是否为动态缓存(动态缓存页面在清空缓存，不删除)
 * @param string $dir 缓存目录
 * @return string
 */
function getTplCache($file, $args, $is_dynamic = 0,$dir = '')
{
	global $_FANWE;
	$tpl_dir = './tpl/'.$_FANWE['setting']['site_tmpl'];
	$tpl_file = $tpl_dir.'/'.$file.'.htm';

	if(!empty($dir))
		$dir .= '/';

	$dir = ($is_dynamic == 1 ? 'dynamic/' : 'static/').$dir;

	return PUBLIC_ROOT.'./data/tpl/caches/'.$dir.str_replace('/', '_', $file).'/'.md5($tpl_file.implode(',',$args)).".htm";
}

/**
 * 检测模板是否需要更新
 * @param string $main_tpl
 * @param string $sub_tpl
 * @param int $time_compare
 * @param string $cache_file
 * @param string $tpl_dir
 * @param string $file
 * @return bool
 */
function checkTplRefresh($main_tpl, $sub_tpl, $time_compare, $cache_file, $tpl_dir, $file)
{
	global $_FANWE;
	static $tpl_refresh = NULL;
	if($tpl_refresh === NULL)
	{
		$tpl_refresh = $_FANWE['config']['output']['tpl_refresh'];
	}

	if(empty($time_compare) || $tpl_refresh == 1 || ($tpl_refresh > 1 && !(TIMESTAMP % $tpl_refresh)))
	{
		if(empty($time_compare) || @filemtime(FANWE_ROOT.$sub_tpl) > $time_compare)
		{
			require_once fimport('class/template');
			$template = new Template();
			$template->parseTemplate($main_tpl, $tpl_dir, $file, $cache_file);
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * 模板处理
 * @param string $file
 * @param string $tpl_dir
 * @param bool $get_tpl_file
 * @return string
 */
function template($file, $tpl_dir = '', $get_tpl_file = 0)
{
	global $_FANWE;

	$tpl_dir = $tpl_dir ? $tpl_dir : './tpl/'.$_FANWE['setting']['site_tmpl'];
	$tpl_file = $tpl_dir.'/'.$file.'.htm';
	$cache_file = './data/tpl/compiled/'.str_replace('/', '_', $file).'.tpl.php';

	if($get_tpl_file)
		return $tpl_file;

	checkTplRefresh($tpl_file, $tpl_file, @filemtime(PUBLIC_ROOT.$cache_file), $cache_file, $tpl_dir, $file);
	return PUBLIC_ROOT.$cache_file;
}

/**
 * 获取模板编译后内容
 * @param string $file
 * @param array $args
 * @param string $tpl_dir
 * @return string
 */
function tplFetch($file,&$args = array(), $tpl_dir = '',$cache_file = '')
{
	global $_FANWE;

	if(!empty($args))
	{
		foreach($args as $key=>$val)
		{
			$$key = &$args[$key];
		}
	}

	ob_start();
	if(!empty($cache_file) && file_exists($cache_file))
		include $cache_file;
	else
		include template($file,$tpl_dir);
	$content = ob_get_contents();
	ob_end_clean();

	if(!empty($cache_file) && !file_exists($cache_file) && diskfreespace(PUBLIC_ROOT.'./data/tpl/caches') > 1000000)
	{
		if(makeDir(preg_replace("/^(.*)\/.*?\.htm$/is", "\\1", $cache_file)))
			writeFile($cache_file,$content);
	}

	require_once fimport('dynamic/common');
	$module_dynamic = '';
	if(defined('MODULE_NAME') && MODULE_NAME != '')
		$module_dynamic = fimport('dynamic/'.MODULE_NAME);

	if(!empty($module_dynamic) && file_exists($module_dynamic))
		require_once $module_dynamic;

	$content = preg_replace('/<!--dynamic\s+(.+?)(?:|\sargs=(.*?))-->/ies', "\\1('\\2');", $content);

	express($content);
	contentParse($content);

	return $content;
}

/**
 * 处理模板字符串，并返回编译后内容
 * @param string $string
 * @param string $cache_key
 * @param array $args
 * @return string
 */
function tplString($string,$cache_key,&$args = array())
{
	global $_FANWE;

	if(!empty($args))
	{
		foreach($args as $key=>$val)
		{
			$$key = &$args[$key];
		}
	}

	if(empty($cache_key))
		$cache_key = md5($string);

	$cache_file = PUBLIC_ROOT.'./data/tpl/caches/'.$cache_key.'.htm';

	if(!file_exists($cache_file))
	{
		if(makeDir(preg_replace("/^(.*)\/.*?\.htm$/is", "\\1", $cache_file)))
		{
			require_once fimport('class/template');
			$template = new Template();
			$string = $template->parseString($string);
			writeFile($cache_file,$string);
		}
	}

	ob_start();
	include $cache_file;
	$content = ob_get_contents();
	ob_end_clean();

	require_once fimport('dynamic/common');
	$module_dynamic = '';
	if(defined('MODULE_NAME') && MODULE_NAME != '')
		$module_dynamic = fimport('dynamic/'.MODULE_NAME);

	if(!empty($module_dynamic) && file_exists($module_dynamic))
		require_once $module_dynamic;

	$content = preg_replace('/<!--dynamic\s+(.+?)(?:|\sargs=(.*?))-->/ies', "\\1('\\2');", $content);
	express($content);
	contentParse($content);

	return $content;
}

/**
 * 显示页面
 * @param string $cache_file 缓存路径
 * @param bool $is_session 是否更新session
 * @param bool $is_return 是否返回页面内容
 * @return mixed
 */
function display($cache_file,$is_session = true,$is_return = false)
{
	global $_FANWE;
	$content = NULL;
	if(!empty($cache_file) && !file_exists($cache_file) && diskfreespace(PUBLIC_ROOT.'./data/tpl/caches') > 1000000)
	{
		if(makeDir(preg_replace("/^(.*)\/.*?\.htm$/is", "\\1", $cache_file)))
		{
			$content = ob_get_contents();
			writeFile($cache_file,$content);
		}
	}

	require_once fimport('dynamic/common');
	$module_dynamic = '';
	if(defined('MODULE_NAME') && MODULE_NAME != '')
		$module_dynamic = fimport('dynamic/'.MODULE_NAME);

	if(!empty($module_dynamic) && file_exists($module_dynamic))
		require_once $module_dynamic;

	if($content === NULL)
		$content = ob_get_contents();
	ob_end_clean();

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
$content = preg_replace('/<!--dynamic\s+(.+?)(?:|\sargs=(.*?))-->/ies', "\\1('\\2');", $content);
	express($content);
	contentParse($content);

	if($is_session)
		updateSession();

	if($is_return)
		return $content;

	$_FANWE['gzip_compress'] ? ob_start('ob_gzhandler') : ob_start();

	echo $content;
}

function contentParse(&$content)
{
	global $_FANWE;

	$patterns = array (
		"/\.\/public\/js\//i",
		"/\.\/public\/upload\//i",
		"/\.\/public\//i",
		//"/\.\/tpl\/(.*?)\/css\//i",
		//"/\.\/tpl\/(.*?)\/js\//i",
		//"/\.\/tpl\/(.*?)\/images\//i",
		"/\.\/tpl\/css\//i",
		"/\.\/tpl\/images\//i",
		"/\.\/tpl\/js\//i",
		"/\.\/tpl\/(.*?)\//i",
	);

	$image_url = !empty($_FANWE['config']['cdn']['image']) ? $_FANWE['config']['cdn']['image'] : $_FANWE['site_root'];
	$css_url = !empty($_FANWE['config']['cdn']['css']) ? $_FANWE['config']['cdn']['css'] : $_FANWE['site_root'];
	$js_url = !empty($_FANWE['config']['cdn']['js']) ? $_FANWE['config']['cdn']['js'] : $_FANWE['site_root'];

	$replace = array (
		$js_url.'public/js/',
		$image_url.'public/upload/',
		$_FANWE['site_root'].'public/',
		//$css_url.'tpl/\\1/css/',
		//$js_url.'tpl/\\1/js/',
		//$image_url.'tpl/\\1/images/',
		$_FANWE['site_root'].'public/data/tpl/css/',
		$_FANWE['site_root'].'tpl/'.TMPL.'/images/',
		$_FANWE['site_root'].'tpl/'.TMPL.'/js/',
		$_FANWE['site_root'].'tpl/\\1/',
	);

	$content = preg_replace($patterns,$replace, $content);
}

function clearExpress($content)
{
	return preg_replace("/\[[^\]]+\]/i",'',$content);
}

function express(&$content)
{
	global $_FANWE;

	$express = getCache('emotion_express_cache'); //缓存过的表情hash
	if(!$express)
	{
		$express_rs = FDB::fetchAll("select `emotion`,concat('./public/expression/',`type`,'/',`filename`) as fname from ".FDB::table('expression'));
		foreach($express_rs as $k=>$row)
		{
			$express[0][] = $row['emotion'];
			$express[1][] = "<img src='".$row['fname']."' title='".preg_replace("/[\[\]]/",'',$row['emotion'])."' />";
		}
		setCache('emotion_express_cache',$express);
	}

	preg_match_all("/(<textarea.*?>.*?<\/textarea>)/s",$content,$data);
	$textareas = $data[1];
	if(count($textareas) > 0)
	{
		foreach($textareas as $key => $textarea)
		{
			$content = str_replace($textarea,'<!--TAG_TEXTAREA_'.$key.'-->',$content);
		}

	}

	$content = (str_replace($express[0],$express[1],$content));

	preg_match_all("/@(.+?):/",$content,$users);
	if(!empty($users[1]))
	{
		$patterns = array();
		$replace = array();
		$users = array_unique($users[1]);
		$res = FDB::query('SELECT uid,user_name
			FROM '.FDB::table('user').'
			WHERE user_name '.FDB::createIN($users));
		while($data = FDB::fetch($res))
		{
			$patterns[] = '/@'.$data['user_name'].':/';
			$replace[] = '<a class="u_name GUID" uid="'.$data['uid'].'" href="'.FU('u/index',array('uid'=>$data['uid'])).'">@'.$data['user_name'].'</a>:';
		}

		$content = preg_replace($patterns,$replace,$content);
	}

	if(count($textareas) > 0)
	{
		foreach($textareas as $key => $textarea)
		{
			$content = str_replace('<!--TAG_TEXTAREA_'.$key.'-->',$textarea,$content);
		}
	}

	return $content;
}

/**
 * 清除缓存目录
 * @param string $file 缓存模板目录
 * @param int $is_dynamic 是否为动态缓存
 * @param string $dir 缓存目录
 * @return void
 */
function clearTplCache($file,$is_dynamic = 0,$dir='')
{
	if(!empty($dir))
		$dir .= '/';
	$dir = ($is_dynamic == 1 ? 'dynamic/' : 'static/').$dir;
	clearDir(PUBLIC_ROOT.'./data/tpl/caches/'.$dir.str_replace('/', '_', $file));
}

/**
 * 检测缓存文件是否需要更新
 * @param string $cache_file 缓存文件路径
 * @param int $time_out 缓存时间(秒)
 * @return bool 需要更新返回 true
 */
function getCacheIsUpdate($cache_file,$time_out)
{
	if (!file_exists($cache_file))
		return true;

	$mtime = filemtime($cache_file);

	if(TIMESTAMP - $mtime > $time_out)
	{
		removeFile($cache_file);
		return true;
	}
	else
		return false;
}

/**
 * 输出json信息
 * @param mixed $result 要输出的信息
 * @return void
 */
function outputJson($result)
{
	static $json = NULL;
	if($json === NULL)
	{
		require fimport('class/json');
		$json = new Json();
	}
	die($json->encode($result));
}

/**
 * 返回json信息
 * @param mixed $result
 * @return string
 */
function getJson($result)
{
	static $json = NULL;
	if($json === NULL)
	{
		require fimport('class/json');
		$json = new Json();
	}
	return $json->encode($result);
}

/**
 * 清除指定目录下的文件
 * @param string $dir 目录路径
 * @return void
 */
function clearDir($dir)
{
	if(!file_exists($dir))
		return;

	$directory = dir($dir);

	while($entry = $directory->read())
	{
		if($entry != '.' && $entry != '..')
		{
			$filename = $dir.'/'.$entry;
			if(is_dir($filename))
				clearDir($filename);

			if(is_file($filename))
				removeFile($filename);
		}
	}

	$directory->close();
}

/**
 * 检查目标文件夹是否存在，如果不存在则自动创建该目录
 *
 * @access      public
 * @param       string      folder     目录路径。不能使用相对于网站根目录的URL
 *
 * @return      bool
 */
function makeDir($folder)
{
    $reval = false;
    if (!file_exists($folder))
    {
		$folder = str_replace(FANWE_ROOT,'',$folder);
        /* 如果目录不存在则尝试创建该目录 */
        @umask(0);
        /* 将目录路径拆分成数组 */
        preg_match_all('/([^\/]*)\/?/i', $folder, $atmp);
        /* 如果第一个字符为/则当作物理路径处理 */
        $base = FANWE_ROOT.(($atmp[0][0] == '/') ? '/' : '');

        /* 遍历包含路径信息的数组 */
        foreach ($atmp[1] AS $val)
        {
            if ('' != $val)
            {
                $base .= $val;
                if ('..' == $val || '.' == $val)
                {
                    /* 如果目录为.或者..则直接补/继续下一个循环 */
                    $base .= '/';
                    continue;
                }
            }
            else
            {
                continue;
            }
            $base .= '/';

            if (!file_exists($base))
            {
                /* 尝试创建目录，如果创建失败则继续循环 */
                if (@mkdir(rtrim($base, '/'), 0777))
                {
                    @chmod($base, 0777);
                    $reval = true;
                }
            }
        }
    }
    else
    {
        /* 路径已经存在。返回该路径是不是一个目录 */
        $reval = is_dir($folder);
    }

    clearstatcache();
    return $reval;
}

/**
 * utf8字符串转为GBK字符串
 * @param string $str 要转换的字符串
 * @return void
 */
function utf8ToGB($str)
{
	static $chinese = NULL;
	if($chinese === NULL)
	{
		require_once fimport('class/chinese');
		$chinese = new Chinese('UTF-8','GBK');
	}
	return $chinese->convert($str);
}

/**
 * GBK字符串转utf8为字符串
 * @param string $str 要转换的字符串
 * @return void
 */
function gbToUTF8($str)
{
	static $chinese = NULL;
	if($chinese === NULL)
	{
		require_once fimport('class/chinese');
		$chinese = new Chinese('GBK','UTF-8');
	}
	return $chinese->convert($str);
}

/**
 * utf8字符转Unicode字符
 * @param string $char 要转换的单字符
 * @return void
 */
function utf8ToUnicode($char)
{
	switch(strlen($char))
	{
		case 1:
			return ord($char);
		case 2:
			$n = (ord($char[0]) & 0x3f) << 6;
			$n += ord($char[1]) & 0x3f;
			return $n;
		case 3:
			$n = (ord($char[0]) & 0x1f) << 12;
			$n += (ord($char[1]) & 0x3f) << 6;
			$n += ord($char[2]) & 0x3f;
			return $n;
		case 4:
			$n = (ord($char[0]) & 0x0f) << 18;
			$n += (ord($char[1]) & 0x3f) << 12;
			$n += (ord($char[2]) & 0x3f) << 6;
			$n += ord($char[3]) & 0x3f;
			return $n;
	}
}

/**
 * utf8字符串分隔为unicode字符串
 * @param string $str 要转换的字符串
 * @param string $pre
 * @return string
 */
function segmentToUnicode($str,$pre = '')
{
	$arr = array();
	$str_len = mb_strlen($str,'UTF-8');
	for($i = 0;$i < $str_len;$i++)
	{
		$s = mb_substr($str,$i,1,'UTF-8');
		if($s != ' ' && $s != '　')
		{
			$arr[] = $pre.'ux'.utf8ToUnicode($s);
		}
	}

	$arr = array_unique($arr);

	return implode(' ',$arr);
}

/**
 * 将标签数组转换为unicode字符串
 * @param array $tags 要转换的标签
 * @param string $pre
 * @return string
 */
function tagToUnicode($tags,$pre = '')
{
	$tags = array_unique($tags);

	$arr = array();
	foreach($tags as $tag)
	{
		$tmp = '';
		$str_len = mb_strlen($tag,'UTF-8');
		for($i = 0;$i < $str_len;$i++)
		{
			$s = mb_substr($tag,$i,1,'UTF-8');
			if($s != ' ' && $s != '　')
			{
				$tmp.= 'ux'.utf8ToUnicode($s);
			}
		}

		if($tmp != '')
			$arr[] = $pre.$tmp;
	}

	$arr = array_unique($arr);
	return implode(' ',$arr);
}

/**
 * 清除符号
 * @param string $str 要清除符号的字符串
 * @return string
 */
function clearSymbol($str)
{
	static $symbols = NULL;
	if($symbols === NULL)
	{
		$symbols = file_get_contents(PUBLIC_ROOT.'./table/symbol.table');
		$symbols = explode("\r\n",$symbols);
	}

	return str_replace($symbols,"",$str);
}

/**
 * 对 MYSQL LIKE 的内容进行转义
 *
 * @access      public
 * @param       string      string  内容
 * @return      string
 */
function fMysqlLikeQuote($str)
{
    return strtr($str, array("\\\\" => "\\\\\\\\", '_' => '\_', '%' => '\%', "\'" => "\\\\\'"));
}

/**
 * 页面跳转
 * @param string $string
 * @param bool $replace
 * @param int $http_response_code
 * @return void
 */
function fHeader($string, $replace = true, $http_response_code = 0)
{
	$string = str_replace(array("\r", "\n"), array('', ''), $string);
	if(empty($http_response_code) || PHP_VERSION < '4.3' )
	{
		@header($string, $replace);
	}
	else
	{
		@header($string, $replace, $http_response_code);
	}

	if(preg_match('/^\s*location:/is', $string))
	{
		exit();
	}
}

/**
 * 显示指定名称的广告位布局
 * @param string $id 布局编号
 * @param int $count 显示数量
 * @param string $target 关键字
 * @return array
 */
function getAdvLayout($id,$count = '',$target='')
{
	global $_FANWE;
	$layout = FDB::fetchFirst('SELECT rec_id AS pid,item_limit AS acount,target_id AS target FROM '.FDB::table('layout')." WHERE layout_id ='$id' AND tmpl = '".$_FANWE['setting']['site_tmpl']."' AND rec_module = 'AdvPosition'");

	if(!$layout)
		return '';

	if($count != '')
		$layout['acount'] = intval($count);

	if($target != '')
		$layout['target'] = explode(',',$target);

	return getAdvPosition($layout['pid'],$layout['acount'],$layout['target']);
}

/**
 * 显示指定ID的广告位ID
 * @param string $id 广告位
 * @param int $count 显示数量
 * @param string $target 关键字
 * @return array
 */
function getAdvPosition($pid = 0,$count = 0,$target='')
{
	global $_FANWE;

	$ap = FDB::fetchFirst('SELECT * FROM '.FDB::table('adv_position').' WHERE id ='.$pid);
	if(!$ap)
		return '';

	$where = "a.status = 1 AND a.is_show = 1 AND a.position_id = '$pid'";
	if($target != '')
		$where .= ' AND a.target_key'.FDB::createIN($target);

	if(!defined('CURRENT_CITY_PY'))
	{
		$sql = 'SELECT a.* FROM '.FDB::table('adv').' AS a WHERE '.$where.' ORDER BY sort DESC,id ASC';
	}
	elseif(CURRENT_CITY_PY == CHINA_CITY_PY)
	{
		$sql = 'SELECT a.*,
				IF((SELECT COUNT(city_id) FROM '.FDB::table('auction_city').' WHERE auction_id = a.auction_id AND city_id = 0) > 0,1,0) AS all_ad
				FROM '.FDB::table('adv').' AS a
				WHERE '.$where.'
				HAVING a.auction_id = 0 OR all_ad = 1
				ORDER BY all_ad DESC,a.sort DESC,a.id ASC';
	}
	else
	{
		$sql = 'SELECT a.*,
				IF((SELECT COUNT(city_id) FROM '.FDB::table('auction_city').' WHERE auction_id = a.auction_id AND city_id = 0) > 0,1,0) AS all_ad,
				IF((SELECT COUNT(city_id) FROM '.FDB::table('auction_city').' WHERE auction_id = a.auction_id AND city_id = 39) > 0,1,0) AS city_ad
				FROM '.FDB::table('adv').' AS a
				WHERE '.$where.' ORDER BY city_ad DESC,all_ad DESC,a.sort DESC,a.id ASC';
	}

	if($count > 0)
		$sql .= ' LIMIT 0,'.$count;

	$adv_res = FDB::query($sql);

	$adv_list = array();

	while($adv = FDB::fetch($adv_res))
	{
		$adv['html'] = getAdvHTML($adv,$ap);
		$adv['url'] = urlencode(FU("adv/show",array("id"=>$adv['id'])));
		$adv_list[] = $adv;
	}

	$ap['adv_list'] = $adv_list;
	return $ap;
}

/**
 * 获取广告的html代码
 * @param array $adv 广告
 * @param array $ap 广告位
 * @return string
 */
function getAdvHTML($adv,$ap)
{
	if($adv['width'] > 0)
		$ap['width'] = $adv['width'];

	if($adv['height'] > 0)
		$ap['height'] = $adv['height'];

	if($ap['width'] == 0)
		$ap['width']="";
	else
		$ap['width']=" width='".$ap['width']."'";

	if($ap['height'] == 0)
		$ap['height']="";
	else
		$ap['height']=" height='".$ap['height']."'";

	switch($adv['type'])
	{
		case '1':
			if($adv['url']=='')
				$adv_str = "<img src='".SITE_PATH.$adv['code']."'".$ap['width'].$ap['height']."/>";
			else
				$adv_str = "<a href='".FU("adv/show",array("id"=>$adv['id']))."' target='_blank'><img src='".SITE_PATH.$adv['code']."'".$ap['width'].$ap['height']."/></a>";
			break;
		case '2':
			$adv_str = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0'".$ap['width'].$ap['height'].">".
					   "<param name='movie' value='".SITE_PATH.$adv['code']."' />".
    				   "<param name='quality' value='high' />".
					   "<param name='menu' value='false' />".
					   "<embed src='".SITE_PATH.$adv['code']."' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash'".$ap['width'].$ap['height']."></embed>".
					   "</object>";
			break;
		case '3':
			$adv_str = $adv['code'];
			break;
	}

	return $adv_str;
}

/**
 * 写入文件内容
 * @param string $filepat 文件路径
 * @param string $content 写入内容
 * @param string $type 写入方式 w:将文件指针指向文件头并将文件大小截为零 a:将文件指针指向文件末尾
 * @return string
 */
function writeFile($filepath,$content,$type='w')
{
	$is_success = false;

	if($fp = fopen($filepath,$type))
	{
		$start_time = microtime();
		do
		{
	        $is_write = flock($fp, LOCK_EX);
			if(!$is_write)
				usleep(round(rand(0,100) * 1000));
		}
		while(!$is_write && ((microtime() - $start_time) < 10000));

		if ($is_write && fwrite($fp, $content))
	  		$is_success = true;

		flock($fp,LOCK_UN);
		fclose($fp);
		@chmod($filepath, 0777);
	}

	return $is_success;
}

/**
 * 删除文件
 * @param string $filepat 文件路径
 * @return bool
 */
function removeFile($filepath)
{
	$is_success = false;
	do
	{
		@unlink($filepath);
		$is_exists = file_exists($filepath);
		if($is_exists)
			usleep(round(rand(0,100) * 1000));
		else
			$is_success = true;
	}
	while($is_exists && ((microtime() - $start_time) < 10000));
	return $is_success;
}

/**
 * 获取缓存的数据
 * @param string $key 缓存键名 如果有目录 格式为 目录1/目录2/.../键名
 * @return mixed
 */
function getCache($key)
{
	static $caches = array();
	if(!isset($caches[$key]))
	{
		if(!file_exists(PUBLIC_ROOT.'./data/caches/custom/'.$key.'.cache.php'))
			return NULL;
		else
		{
			include(PUBLIC_ROOT.'./data/caches/custom/'.$key.'.cache.php');
			$list = explode('/',$key);
			$key = end($list);
			$caches[$key] = $data[$key];
		}
	}
	return $caches[$key];
}

/**
 * 设置缓存数据
 * @param string $key 缓存键名 可设置所在目录 格式为 目录1/目录2/.../键名
 * @param string $data 缓存的数据
 * @return bool
 */
function setCache($key,$data)
{
	$cache_path = PUBLIC_ROOT.'./data/caches/custom/'.$key.'.cache.php';
	$phth = dirname($cache_path);
	makeDir($phth);
	$list = explode('/',$key);
	$key = end($list);
    $cache_data = "<?php\n".'$data[\''.$key."'] = ".var_export($data, true).";\n\n?>";
	return writeFile($cache_path,$cache_data);
}

/**
 * 删除缓存
 * @param string $key 缓存键名 如果有目录 格式为 目录1/目录2/.../键名
 * @return bool
 */
function deleteCache($key)
{
    return removeFile(PUBLIC_ROOT.'./data/caches/custom/'.$key.'.cache.php');
}

/**
 * 清空缓存目录
 * @param string $dir 缓存目录
 * @return void
 */
function clearCacheDir($dir)
{
    clearDir(PUBLIC_ROOT.'./data/caches/custom/'.$dir);
}

function avatar($uid, $type = 'm', $is_src = 0)
{
	static $avatars = array();
	static $types = array(
		's'=>'small',
		'm'=>'middle',
		'b'=>'big',
	);

	$size = 'small';
	if(array_key_exists($type,$types))
		$size = $types[$type];

	if($avatars[$uid][$size] === NULL)
	{
		global $_FANWE;
		$uid = sprintf("%09d", $uid);
		$dir1 = substr($uid, 0, 3);
		$dir2 = substr($uid, 3, 2);
		$dir3 = substr($uid, 5, 2);
		$file_path = PUBLIC_ROOT.'./upload/avatar/'.$dir1.'/'.$dir2.'/'.$dir3.'/'.substr($uid, -2).'_'.$size.'.jpg';
		$file = $_FANWE['site_root'].'public/upload/avatar/'.$dir1.'/'.$dir2.'/'.$dir3.'/'.substr($uid, -2).'_'.$size.'.jpg';
		if(!file_exists($file_path))
			$file = $_FANWE['site_root'].'public/upload/avatar/noavatar_'.$size.'.jpg';

		$avatars[$uid][$size] = $file;
	}

	return $is_src ? $avatars[$uid][$size] : '<img src="'.$avatars[$uid][$size].'" />';
}

/**
 * 根据图片原图地址。 获取规格图片的地址
 * by fzmatthew
 */
function getImgName($img_url,$width=0,$height=0)
{
	if($width>0&&$height>0)
	{
		$img_url_arr[0] = substr($img_url,0,-4);
		$img_url_arr[1] = substr($img_url,-3,3);
		$img_url = $img_url_arr[0]."_".$width."x".$height.".".$img_url_arr[1];
	}
	return $img_url;
}


/**
 *
 * @param $origin_path 原始物理图片地址
 * @param $path 存储的路径
 * @param $file_name 保存的文件名
 * @param $del_temp 是否删除临时文件
 * @param $id 关联编号，将根据编号生成目录
 *
 * 返回 复制成功的信息,如为false则复制失败
 * array(
 * 	'path'	=>	xxx  //物理路径
 *  'url'	=>	xxx  //相对路径
 * );
 *
 * by fzmatthew
 */
function copyFile($origin_path, $path = 'share',$file_name, $del_temp = true,$id = 0)
{
	if($path == 'temp')
		$dir = './public/upload/temp/'.fToDate(NULL,'Y/m/d/H');
	else
	{
		if($id > 0)
			$dir = './public/upload/'.$path.'/'.getDirsById($id);
		else
			$dir = './public/upload/'.$path.'/'.fToDate(NULL,'Y/m/d');
	}

	makeDir(FANWE_ROOT.$dir);

	$file_path = FANWE_ROOT.$dir."/".$file_name;
	if(@copy($origin_path,$file_path))
	{
		if($del_temp)
			@unlink($origin_path);

		return array(
			'path' => $file_path,
			'url' => $dir."/".$file_name
		);
	}
	else
		return false;
}

/**
 *
 * @param $origin_path 原始物理图片地址
 * @param array $sizes 缩略图大小信息 为空则取后台设置
	 	可生成多个缩略图
		数组 参数1 为宽度，
			 参数2为高度，
			 参数3为处理方式:0(缩放,默认)，1(剪裁)，
			 参数4为是否水印 默认为 0(不生成水印)
	 	array(
			array(300,300,0,0),
			array(100,100,0,0),
			...
		)，
 * @param $path 存储的路径
 * @param $file_name 保存的文件名
 * @param $del_temp 是否删除临时文件
 * @param $id 关联编号，将根据编号生成目录
 *
 * 返回 复制成功的信息,如为false则复制失败
 * array(
 * 	'path'	=>	xxx  //物理路径
 *  'url'	=>	xxx  //相对路径
 * );
 *
 * by fzmatthew
 */
function copyImage($origin_path,$file_name,$sizes = array(),$path = 'share', $del_temp = true,$id = 0)
{
	static $size_setting = NULL,$image = NULL;

	if($path == 'temp')
		$dir = './public/upload/temp/'.fToDate(NULL,'YmdH');
	else
	{
		if($id > 0)
			$dir = './public/upload/'.$path.'/'.getDirsById($id);
		else
			$dir = './public/upload/'.$path.'/'.fToDate(NULL,'Y/m/d');
	}

	makeDir(FANWE_ROOT.$dir);

	$file_path = FANWE_ROOT.$dir."/".$file_name;

	if(@copy($origin_path,$file_path))
	{
		if($image === NULL)
		{
			include_once fimport('class/image');
			$image = new Image();
		}

		$water_image = FANWE_ROOT . $_FANWE['setting']['water_image'];
		$water_mark = intval($_FANWE['setting']['water_mark']);
		$alpha = intval($_FANWE['setting']['water_alpha']);
		$place = intval($_FANWE['setting']['water_position']);

		if($sizes !== false && empty($sizes))
		{
			if($size_setting === NULL)
			{
				$res = FDB::query('SELECT * FROM '.FDB::table('share_image_sizes').' WHERE status = 1');
				while($data = FDB::fetch($res))
				{
					$size_setting[] = array($data['width'],$data['height'],$data['is_cut'],$data['is_water']);
				}
			}

			$sizes = $size_setting;
		}

		foreach($sizes as $size)
		{
			if($size[0] > 0 || $size[1] > 0)
			{
				$thumb_bln = false;
				$thumb_type = isset($size[2]) ? intval($size[2]) : 0;
				if($thumb = $image->thumb($file_path,$size[0],$size[1],$thumb_type))
				{
					if(isset($size[3]) && intval($size[3]) > 0)
						$image->water($thumb['path'],$water_image,$alpha, $place);
				}
			}
		}

		if($del_temp)
			@unlink($origin_path);

		return array(
			'path' => FANWE_ROOT.$dir."/".$file_name,
			'url' => $dir."/".$file_name
		);
	}
	else
		return false;
}

/**
 * 搜索Club的分类
 *
 * @param 父类ID $pid
 * @return 数组
 */

function getForumClass($pid = 0)
{
	global $_FANWE;
	FanweService::instance()->cache->loadCache('forums');
	$list = $_FANWE['cache']['forums'];
	if($pid > 0){
		foreach($list as $k => $v)
		{
			if(intval($pid)==$v['fid'])
				return $v;
		}
	}
	else {
		return $list;
	}
}

function getAskClass($pid = 0)
{
	global $_FANWE;
	FanweService::instance()->cache->loadCache('asks');
	$list = $_FANWE['cache']['asks'];
	if($pid > 0){
		foreach($list as $k => $v)
		{
			if(intval($pid)==$v['aid'])
				return $v;
		}
	}
	else {
		return $list;
	}
}
/**
 * 获取CDN链接
 * @param string $url 链接
 * @param string $type (image:图片,css:样式,js:脚本),为空则根据后缀获取
 * @return string
 */

function getCDNUrl($url,$type='')
{
	global $_FANWE;
	static $img_exts = array('jpg', 'jpeg', 'png', 'bmp','gif','giff'),
		   $types = array('image','css','js');

	if(empty($type))
	{
		$ext = fileExt($url);
		if(in_array($ext,$img_exts))
			$type = 'image';
		elseif($ext == 'css')
			$type = 'css';
		elseif($ext == 'js')
			$type = 'js';
	}

	$url_pre = $_FANWE['site_root'];
	if(in_array($type,$types))
	{
		switch($type)
		{
			case 'image':
				if(!empty($_FANWE['config']['cdn']['image']))
					$url_pre = $_FANWE['config']['cdn']['image'];
			break;

			case 'css':
				if(!empty($_FANWE['config']['cdn']['css']))
					$url_pre = $_FANWE['config']['cdn']['css'];
			break;

			case 'js':
				if(!empty($_FANWE['config']['cdn']['js']))
					$url_pre = $_FANWE['config']['cdn']['js'];
			break;
		}
	}

	return $url_pre.$url;
}

/**
 * 获取文件扩展名
 * @return string
 */
function fileExt($file)
{
	return addslashes(strtolower(substr(strrchr($file, '.'), 1, 10)));
}

function priceFormat($price)
{
	return '¥'.number_format(round($price,2),2);
}

/**
 * 根据ID划分目录
 * @return string
 */
function getDirsById($id)
{
	$id = sprintf("%011d", $id);
	$dir1 = substr($id, 0, 3);
	$dir2 = substr($id, 3, 3);
	$dir3 = substr($id, 6, 3);
	$dir4 = substr($id, -2);
	return $dir1.'/'.$dir2.'/'.$dir3.'/'.$dir4;
}

function cssParse($urls)
{
	global $_FANWE;
	if(is_array($urls))
	{
		$url = md5(implode(',',$urls));
		$css_url = './public/data/tpl/css/'.$url.'.css';
		$url_path = FANWE_ROOT.$css_url;
		if(!file_exists($url_path))
		{
			$css_content = '';
			foreach($urls as $url)
			{
				$url = str_replace('./tpl/css/','./public/data/tpl/css/',$url);
				$css_content .= @file_get_contents(FANWE_ROOT.$url);
			}
			$css_content = preg_replace("/[\r\n]/",'',$css_content);
			@file_put_contents($url_path,$css_content);
		}

		return $css_url;
	}
	else
	{
		return $urls;
	}
}

function scriptParse($urls)
{
	global $_FANWE;
	if(is_array($urls))
	{
		$url = md5(implode(',',$urls));
		$js_url = './public/data/tpl/js/'.$url.'.js';
		$url_path = FANWE_ROOT.$js_url;
		if(!file_exists($url_path))
		{
			$js_content = '';
			foreach($urls as $url)
			{
				$url = str_replace('./tpl/js/','./tpl/'.TMPL.'/js/',$url);
				$js_content .= @file_get_contents(FANWE_ROOT.$url)."\r\n";
			}

			@file_put_contents($url_path,$js_content);
		}

		return $js_url;
	}
	else
	{
		return $urls;
	}
}

/**
 * 获取是否显示前台管理
 * @return bool
 */
function getIsManage($module)
{
	global $_FANWE;
	if($_FANWE['uid'] == 0)
		return false;

	$module = strtolower($module);
	if(isset($_FANWE['authoritys'][$module]))
		return true;
	else
		return false;
}

/**
 * 检测是否具有指定的前台管理权限
 * @return bool
 */
function checkAuthority($module,$action)
{
	global $_FANWE;
	if($_FANWE['uid'] == 0)
		return false;

	$module = strtolower($module);
	$action = strtolower($action);

	if(isset($_FANWE['authoritys'][$module]) && isset($_FANWE['authoritys'][$module][$action]))
		return true;
	else
		return false;
	return true;
}

/**
 * 检测所管理的对像是否锁定,已锁定返回锁定数据array,未锁定返回false
   如果锁定30分钟以上,还未解锁,将设为未锁定
 * @return
 */
function checkIsManageLock($module,$id)
{
	global $_FANWE;
	$module = strtolower($module);
	$lock_file = PUBLIC_ROOT.'./manage/'.$module.'/'.$id.'.lock';
	if(file_exists($lock_file))
	{
		include $lock_file;

		if(TIME_UTC - $lock['time'] > 1800)
		{
			removeFile($lock_file);
			return false;
		}
		if($lock['uid'] == $_FANWE['uid'])
			return false;
		else
			return $lock;
	}
	else
		return false;
}

/**
 * 获取前台管理锁定
 * @return void
 */
function getManageLock($module,$id)
{
	$module = strtolower($module);
	$lock_file = PUBLIC_ROOT.'./manage/'.$module.'/'.$id.'.lock';
	if(file_exists($lock_file))
	{
		include $lock_file;
		return $lock;
	}
	else
		return false;
}

/**
 * 创建前台管理锁定
 * @return void
 */
function createManageLock($module,$id)
{
	global $_FANWE;
	$module = strtolower($module);
	$phth = PUBLIC_ROOT.'./manage/'.$module;
	makeDir($phth);
	$lock_file = $phth.'/'.$id.'.lock';
	$data = array(
		'uid'=>$_FANWE['uid'],
		'user_name'=>$_FANWE['user_name'],
		'time'=>TIME_UTC,
	);
	$data = "<?php\n".'$lock = '.var_export($data, true).";\n?>";
	return writeFile($lock_file,$data);
}

/**
 * 删除前台管理锁定
 * @return void
 */
function deleteManageLock($module,$id)
{
	$module = strtolower($module);
	$lock_file = PUBLIC_ROOT.'./manage/'.$module.'/'.$id.'.lock';
	removeFile($lock_file);
}

/**
 * 前台管理日志
 * @return void
 */
function createManageLog($module,$action,$id,$content = '')
{
	global $_FANWE;

	$log = array(
		'rec_id'=>$id,
		'module'=>$module,
		'action'=>$action,
		'uid'=>$_FANWE['uid'],
		'user_name'=>$_FANWE['user_name'],
		'content'=>$content,
		'create_time'=>TIME_UTC
	);

	FDB::insert('manage_log',$log);
}

function load_syn_module_name()
{
	$config = require_once FANWE_ROOT."login/api_config.php";
	$str = "";
	foreach($config as $item)
	{
		if($item['is_syn'])
		$str.=$item['name'].",";
	}

	if($str!='')
		$str=substr($str,0,-1);

	return $str;
}
?>