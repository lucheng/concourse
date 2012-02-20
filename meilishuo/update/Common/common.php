<?php
function xCopy($source,$destination,$child)
{
	//用法：
	//   xCopy("feiy","feiy2",1):拷贝feiy下的文件到   feiy2,包括子目录
	//   xCopy("feiy","feiy2",0):拷贝feiy下的文件到   feiy2,不包括子目录
	//参数说明：
	//   $source:源目录名
	//   $destination:目的目录名
	//   $child:复制时，是不是包含的子目录
	if(!is_dir($source))
	{
	  echo("Error:the   $source   is   not   a   direction!");
	  return   0;
	}
	if(!is_dir($destination))
		mkdir($destination,0777);


	$handle=dir($source);
	while($entry=$handle->read())
	{
		if(($entry!=".")&&($entry!=".."))
		{
			if(is_dir($source."/".$entry))
			{
				if($child)
					xCopy($source."/".$entry,$destination."/".$entry,$child);
			}
			else
			{
				copy($source."/".$entry,$destination."/".$entry);
			}
		}
	}

	return   1;
}

function showjsmessage($message,$isBack = 0){
	echo "<script type=\"text/javascript\">showmessage(\"".$message."\",".$isBack.");</script>"."\r\n";
	flush();
	ob_flush();
}

//全站通用的清除所有缓存的方法
function clear_cache()
{
	clearDir(ROOT_PATH."admin/Runtime/");
	clearDir(ROOT_PATH."install/Runtime/Cache/");
}

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
				@unlink($filename);
		}
	}

	$directory->close();
}

//由数据库取出系统的配置
function fanweC($name)
{
	return C($name);
}

function fAddslashes($string, $force = 0, $strip = FALSE)
{
	!defined('MAGIC_QUOTES_GPC') && define('MAGIC_QUOTES_GPC', get_magic_quotes_gpc());
	if(!MAGIC_QUOTES_GPC || $force)
	{
		if(is_array($string))
		{
			foreach($string as $key => $val)
			{
				$string[$key] = fAddslashes($val, $force, $strip);
			}
		}
		else
		{
			$string = addslashes($strip ? stripslashes($string) : $string);
		}
	}
	return $string;
}

function dumpEscapeString($str)
{
	if ($str === null)
    {
        return null;
    }
    else if($str == '')
    {
        return '';
    }
    else
    {
		if (PHP_VERSION >= '4.3')
        {
            return mysql_real_escape_string($str);
        }
        else
        {
            return mysql_escape_string($str);
        }
    }
}

function implodeInsertValues($values)
{
	$str = '';
	$values = array_values($values);
	foreach ($values as $k =>$v)
	{
		$v = ($v === null) ? 'null' : "'" . $v . "'";
		$str = ($k == 0) ? $str . $v : $str . ',' . $v;
	}
	return $str;
}

/**
 * 递归方式的对变量中的特殊字符去除转义
 *
 * @access  public
 * @param   mix     $value
 *
 * @return  mix
 */
function stripslashesDeep($value)
{
    if (empty($value))
    {
        return $value;
    }
    else
    {
        return is_array($value) ? array_map('stripslashesDeep', $value) : stripslashes($value);
    }
}

?>