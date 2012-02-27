<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../Public/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="__PUBLIC__/js/artDialog/artDialog.min.js"></script>
<title>网站地图生成XML</title>
</head>
<body>
<script language="javascript">
function clicktodosome(type){
 if(!window.confirm('确定要生成网站地图吗？')){
  return; 
 }
 var testDialog;
 testDialog = art.dialog({
  lock: false,
  title:'',
  id:'loaddialog',
  content:'<font color="#ff0000">正在生成网站地图中...</font>',
  width:220
 });
 //url="<?php echo U('indexrightlist');?>";
 switch(type){
  case 1:
   var url="<?php echo U('buildingXML');?>"; 
   break;
  case 2:
   var url="<?php echo U('newsXML');?>";
   break;
 }
 
 $.get(url,null,function(data){
  //$("#con").append(data);
  testDialog.close();
  $("#con").html(data);
 });
}
function showpage(url){
 var testDialog;
 testDialog = art.dialog({
  lock: false,
  title:'',
  id:'loaddialog',
  content:'<font color="#ff0000">正在加载中...</font>',
  width:220
 });
 $.get(url,null,function(data){
  //$("#con").append(data);
  testDialog.close();
  $("#con").html(data);
 });
}
</script>
<style type="text/css">
#con ul li{ line-height:22px;}
.d_page { padding-top:10px;}
</style>
<div class="right_box">
  <div class="dqwz">
    <div class="left l17"><strong class="f14">网站地图管理</strong><span class="all366C padl_13">&nbsp;</span></div>
    <div class="right all366C"></div>
  </div>
  <dl class="qbright w_100">
    <dd style="border:none;">
      <li style="font-size:15px;"><strong>生成<span style="color:#F00;">楼盘</span>网站地图：</strong>  <input name="save" type="submit" class="agin tj cur" value="生 成" onClick="clicktodosome(1)"/></li>
    </dd>
  </dl>
  
  
  <dl class="qbright w_100">
    <dd style="border:none;">
      <li style="font-size:15px;"><strong>生成<span style="color:#F00;">资讯</span>网站地图：</strong>  <input name="save" type="submit" class="agin tj cur" value="生 成" onClick="clicktodosome(2)"/></li>
    </dd>
  </dl>
  
    <div id="con"></div>
  <div class="clear"></div>
</div>
<br><br>
</body>
</html>