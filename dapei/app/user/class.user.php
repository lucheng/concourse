<?php
defined('IN_TS') or die('Access Denied.');

class user{

	var $db;

	function user($dbhandle){
		$this->db = $dbhandle;
	}
	
	//获取最新会员
	function getNewUser($num){
		$arrNewUserId = $this->db->fetch_all_assoc("select userid from ".dbprefix."user_info order by addtime desc limit $num");
		foreach($arrNewUserId as $item){
			$arrNewUser[] = $this->getSimpleUser($item['userid']);
		}
		return $arrNewUser;
	}
	
	//获取活跃会员
	function getHotUser($num){
		$arrNewUserId = $this->db->fetch_all_assoc("select userid from ".dbprefix."user_info order by uptime desc limit $num");
		foreach($arrNewUserId as $item){
			$arrHotUser[] = $this->getSimpleUser($item['userid']);
		}
		return $arrHotUser;
	}
	//
	 
	function getAllUser($page = 1, $prePageNum){
		$start_limit = !empty($page) ? ($page - 1) * $prePageNum : 0;
		$limit = $prePageNum ? "LIMIT $start_limit, $prePageNum" : '';
		$users	= $this->db->fetch_all_assoc("select * from ".dbprefix."user order by userid desc $limit");
		if($users){
		foreach($users as $item){
			$arrUser[]	= $this->getOneUserByUserid($item['userid']);	
		}}
		
		return $arrUser;
	}
	
	//
	 
	function getUserNum($virtue, $setvirtue){
		$where = 'where '.$virtue.'='.$setvirtue.'';
		$res = "SELECT * FROM ".dbprefix."user $where";
		$userNum = $this->db->once_num_rows($res);
		return $userNum;
	}
	
	//获取一个用户的信息
	function getOneUserByUserid($userid){
	
		$strUser = $this->db->once_fetch_assoc("select * from ".dbprefix."user_info where userid='$userid'");
		
		//头像
		if($strUser['face'] != ''){
			$strUser['bigface'] = SITE_URL.miniimg($strUser['face'],'user',120,120,$strUser['path']);
			$strUser['face'] = SITE_URL.miniimg($strUser['face'],'user',48,48,$strUser['path'],1);
			
		}else{
			$strUser['bigface'] = SITE_URL.'public/images/n_default.gif';
			$strUser['face']	= SITE_URL.'public/images/noavatar.gif';
		}
		
		$pattern='/(http:\/\/|https:\/\/|ftp:\/\/)([\w:\/\.\?=&-_]+)/is';

		$strUser['signed'] = hview(preg_replace($pattern, '<a rel="nofollow" target="_blank" href="\1\2">\1\2</a>', $strUser['signed']));
		
		return $strUser;
	}
	
	//获取要编辑的用户信息
	function getUserForEdit($userid){
	
		$strUser = $this->db->once_fetch_assoc("select * from ".dbprefix."user_info where userid='$userid'");
		
		//头像
		if($strUser['face'] == ''){
			$strUser['face']	= SITE_URL.'public/images/noavatar.gif';
		}else{
			$strUser['face'] = SITE_URL.miniimg($strUser['face'],'user',48,48,$strUser['path'],1);
		}
		
		return $strUser;
	}
	
	//获取简单用户信息为其他APP调用
	function getUserForApp($userid){
		$strUser = $this->db->once_fetch_assoc("select userid,username,areaid,path,face,signed,count_score,count_follow,count_followed from ".dbprefix."user_info where userid='$userid'");
		
		$strUser['area'] = aac('location')->getOneArea($strUser['areaid']);
		
		//头像
		if($strUser['face']==''){
			$strUser['face'] = SITE_URL.'public/images/noavatar.gif';
		}else{
			$strUser['face_32'] = SITE_URL.miniimg($strUser['face'],'user',32,32,$strUser['path'],1);
			$strUser['face'] = SITE_URL.miniimg($strUser['face'],'user',48,48,$strUser['path'],1);
		}
		//签名 
		$pattern='/(http:\/\/|https:\/\/|ftp:\/\/)([\w:\/\.\?=&-_]+)/is';
		$strUser['signed'] = hview(preg_replace($pattern, '<a rel="nofollow" target="_blank" href="\1\2">\1\2</a>', $strUser['signed']));
		
		return $strUser;
		
	}
	
	//获取简单的用户信息，用户ID和用户名
	function getSimpleUser($userid){
		$strUser = $this->db->once_fetch_assoc("select userid,username,path,face from ".dbprefix."user_info where userid='$userid'");
		
		//头像
		if($strUser['face']==''){
			$strUser['face'] = SITE_URL.'public/images/noavatar.gif';
			$strUser['face_32'] = SITE_URL.'public/images/noavatar.gif';
		}else{
			$strUser['face_32'] = SITE_URL.miniimg($strUser['face'],'user',32,32,$strUser['path'],1);
			$strUser['face'] = SITE_URL.miniimg($strUser['face'],'user',48,48,$strUser['path'],1);
		}
		
		return $strUser;
	}
	
	//收藏的帖子 
	function getCollectTopic($userid,$limit){
	
		$arrCollect = $this->db->fetch_all_assoc("select * from ".dbprefix."group_topics_collects where userid='".$userid."' order by addtime desc limit $limit");
		
		if(is_array($arrCollect)){
			foreach($arrCollect as $item){
				$strTopic = $this->db->once_fetch_assoc("select * from ".dbprefix."group_topics where topicid = '".$item['topicid']."'");
				$arrTopic[] = $strTopic;
			}
		}
		
		return $arrTopic;
		
	}
	
	//获取用户积分 
	function getUserScore($userid){
		$strUser = $this->db->once_fetch_assoc("select count_score from".dbprefix."user_info where userid='$userid'");
		return $strUser['count_score'];
	}
	
	//判断是否是否是会员
	function isUser($userid){
		$isUser = $this->db->once_fetch_assoc("select count(userid) from ".dbprefix."user where userid='$userid'");
		if($isUser['count(userid)'] == 0){
			header("Location: ".SITE_URL);
			exit;
		}
	}
	
	/*获取salt*/
	 function randstr($len=6) {
		$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-@#~*^%$!()'; 
		mt_srand((double)microtime()*1000000*getmypid()); 
		$passWord='';
	 while(strlen($passWord)<$len)
			$passWord.=substr($chars,(mt_rand()%strlen($chars)),1);
		return $passWord;
	}
	
	/*创建密码*/
	function createPwd($pwd,$salt)
	{
		global $TS_DB;
		return md5($pwd . $salt . $TS_DB['salt']);
	}


					
}