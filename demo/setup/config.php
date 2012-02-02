<?php
/*
***************************************************************************
*   maker.tp@gmail.com                                                    *
*   Usage:设置文件                                             *
***************************************************************************
*/
$conf=array(
	/* 基本设置 */
	'APP_NAME'=>"EASYCART开源PHP网店系统",			//项目名字
	'APP_TITLE'=>"EASYCART开源PHP网店系统",			//项中文说明
	'APP_ROOT'=>"../",			//你想安装的路径,相对路径
	'APP_INFO'=>array(			//本信息会出现在安装后的最后一页,可以扩展增加
		array('title'=>'项目网址:','info'=>'<a href="http://www.easycart.cn/" target="_blank" >http://www.easycart.cn</a>'),
		array('title'=>'开发人员:','info'=>'许正楠,吴煜'),
		array('title'=>'交流论坛:','info'=>'<a href="http://www.easycart.cn/bbs" target="_blank" >http://www.easycart.cn/bbs</a>'),
		array('title'=>'案例展示:','info'=>'<a href="http://demo.easycart.cn" target="_blank" >http://demo.easycart.cn</a>'),
		array('title'=>'联系人:','info'=>'811046@qq.com')
	),
	/* SVN设置,如果没有请留空 */
	'APP_SVN'=>array(
		/* 项目SVN设置 */
		
		/* thinkphp设置 */
		
	),

	/* SQL安装设置,如果没有请留空 */
	'APP_SQL'=>array(
		/* 设置 */
		array(
			'SQL_FILE'=>"./sql/setup.sql",		//SQL文件
			'SQL_INFO'=>"安装EASYCART 基本的数据结构",		//SQL说明
			'SQL_KEY'=>"{key}"				//SQL中可变的变量,如前缀等,用于替换
			),
		/* 设置*/ 
		array(
			'SQL_FILE'=>"./sql/base.sql",		//SQL文件
			'SQL_INFO'=>"安装EASYCART基本的基础数据",			//SQL说明
			'SQL_KEY'=>"{key}"				//SQL中可变的变量,如前缀等,用于替换
			)
	),

	/* COPY设置 */
	'COPYRIGHT'=>array(

		/* 设置 */
		array(
			'TITLE'=>"EASYCART开源PHP网店系统 说明",					//版权文件
			'LOGO'=>"easy_logo.jpg",	//根文件夹重命名
			'COPY_TYPE'=>"Apache2",						//请对照$conf_copyright
			'SHOW_TYPE'=>0,								//0只显示公共的版本,1只显示自己版权,2两者都显示.选1和2需要设置'COPY_TEXT'//功能无效
			'COPY_TEXT'=>"",						//只有上面'SHOW_TYPE'不为0时需要设置,支持HTML,暂时不支持外部文件引用
			),
		/* 设置 */
		array(
			'TITLE'=>"THINKPHP版权说明",
			'LOGO'=>"http://thinkphp.cn/logo_1.png",
			'COPY_TYPE'=>"Apache2",
			'SHOW_TYPE'=>0,
			'COPY_TEXT'=>"",
			)
	),

);

$tpl_path='./tpl/default/';	//模板路径
$app_tmppath='./tmp/';	//缓存文件的路径
$app_check=array(
	//检查项目,项目说明,检查类型0不能小于,1,不能为否.属性
	//请确保已经有相应的函数如:check_version
	'check_version'=>array('ischeck'=>true,'title'=>'检查PHP版本','type'=>0,'value'=>5),
	'check_globals'=>array('ischeck'=>false,'title'=>'自定义全局变量 (register_globals)','type'=>1,'value'=>true),
	'check_fopen'=>array('ischeck'=>true,'title'=>'允许使用URL打开文件','type'=>1,'value'=>true),
	'check_mysql'=>array('ischeck'=>true,'title'=>'MySQL 数据库版本','type'=>0,'value'=>5),
	'check_gd'=>array('ischeck'=>true,'title'=>'图像函数库(GD Library)','type'=>1,'value'=>true),
	'check_smtp'=>array('ischeck'=>false,'title'=>'SMTP支持','type'=>1,'value'=>true),
	'check_iconv'=>array('ischeck'=>true,'title'=>'Iconv编码转换','type'=>1,'value'=>true),
	'check_stocket'=>array('ischeck'=>false,'title'=>'stocket为可用','type'=>1,'value'=>true),
	'check_online'=>array('ischeck'=>false,'title'=>'安装时主机必须需要接入互联网','type'=>1,'value'=>true),
);

$app_lang=array(
	'step'=>array(
		array('key'=>'0','step_title'=>'Step0.版权信息'),
		array('key'=>'1','step_title'=>'Step1.检查安装环境'),
		array('key'=>'2','step_title'=>'Step2.基础安装设定'),
		array('key'=>'3','step_title'=>'Step3.下载程序'),
		array('key'=>'4','step_title'=>'Step4.安装程序及数据库'),
		array('key'=>'5','step_title'=>'Step5.完成')
	),
	'btn_next'=>'进入下一步安装',
	'btn_redo'=>'重试本步安装',
	'btn_cancal'=>'退出安装',
	'note_title'=>'信息提示',
	'check_title'=>'检查信息列表',
	'base_title'=>'基础安装设置',
	'down_title'=>'数据下载状态,处理完成自动跳转下一步.',
	'setup_title'=>'程序安装状态,处理完成自动跳转下一步.',
	'ok_title'=>'程序安装完成',
	'step0_1'=>'同意并愿意接受版权:',
	'step0_2'=>'查看公共约详细说明',
	'step0_3'=>'公共版权约定',
	
	'step2_1'=>'SVN数据仓库',
	'step2_2'=>'SVN目录',
	'step2_3'=>'目标目录',
	'step2_4'=>'SQL文件路径',
	'step2_5'=>'程序的根目录',
	'step2_6'=>'数据表前缀',
	'step2_7'=>'数据库名称',
	'step2_8'=>'删除旧库',
	'step2_9'=>'端口',
	'step2_10'=>'数据库密码',
	'step2_11'=>'数据库用户',
	'step2_12'=>'主机名',
	
	'step5_1'=>'进入程序首页',
	'step5_2'=>'马上进入安装好的程序',
	
	'err_step0'=>'你必须认可全部的版权才可以进入下一步的安装!',
	'err_step1'=>'你的运行环境必须满足下后所有条件才可以进入下一步的安装!',
	'err_step2'=>'请检查你的数据库设置,必须满足所有条件才可以进入下一步的安装!',
);

/* 默认的设置,用户可以在安装时改变*/
$app_default=array(
		array(
			'mysql_host'=>"localhost",	//数据库主机名
			'mysql_port'=>"3306",	//主机端口
			'mysql_user'=>"root",	//数据库用户
			'mysql_pwd'=>"",	//数据库密码
			'db_name'=>"easycart",	//数据库名称
			'db_isdrop'=>"0",	//是否删除旧数据库
			'db_pre'=>"ec_",	//数据表前缀
			'app_root'=>$conf['APP_ROOT'],	//安装程序的根目录
		)
	);

/* 公共开源版权 */
$conf_copyright=array(
		'BSD'=>array(
			'NAME'=>"BSD开源协议(FreeBSD license)",			//名称
			'LINK'=>"http://www.freebsd.org/copyright/freebsd-license.html",//LINK
			),
		'Apache2'=>array(
			'NAME'=>"Apache Licence 2.0",			//名称
			'LINK'=>"http://www.apache.org/licenses/LICENSE-2.0",//LINK
			),
		'GPL'=>array(
			'NAME'=>"GNU General Public License",			//名称
			'LINK'=>"http://www.fsf.org/licensing/licenses/gpl.html",//LINK
			),
		'LGPL'=>array(
			'NAME'=>"GNU Lesser General Public License",			//名称
			'LINK'=>"http://www.fsf.org/licensing/licenses/lgpl.html",//LINK
			),
		'MIT'=>array(
			'NAME'=>"MIT许可协议",			//名称
			'LINK'=>"http://www.opensource.org/licenses/mit-license.php",//LINK
			),
	);

?>
