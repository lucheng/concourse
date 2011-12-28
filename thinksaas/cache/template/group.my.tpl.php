<?php include template('header'); ?>

<style>
.mygroup{}
.mygroup ul{}
.mygroup ul li{font-size:14px;padding:5px 0}

</style>

<div class="midder">


<div class="mc">
<div class="cleft">

<div class="top-wp">
<ul class="tabs">
<li><a href="<?php echo SITE_URL;?><?php echo tsurl('group','all')?>">全部小组</a></li>
<li><a class="current" href="<?php echo SITE_URL;?>"><span>最新帖子</span></a></li>
</ul>
</div>

<div class="clear"></div>

<?php include template('my_menu'); ?>

<div class="topic_list">
<ul>
<?php if($arrTopic) { ?>
<?php foreach((array)$arrTopic as $key=>$item) {?>
<li>
<div class="userimg">
<?php if($item['user'][userid] !=$arrTopic[$key-1][user][userid]) { ?>
<a href="<?php echo SITE_URL;?><?php echo tsurl('user','space',array(userid=>$item['user'][userid]))?>"><img src="<?php echo $item['user'][face_32];?>" width="32"></a>
<?php } else { ?>
&nbsp;
<?php } ?>
</div>

<div class="topic_title">
<div class="title">
<a title="<?php echo $item['title'];?>" href="<?php echo SITE_URL;?><?php echo tsurl('group','topic',array(topicid=>$item['topicid']))?>"><?php echo $item['title'];?></a>
<?php if($item['istop']=='1') { ?>
<img src="<?php echo SITE_URL;?>app/<?php echo $app;?>/skins/<?php echo $skin;?>/headtopic_1.gif" title="[置顶]" alt="[置顶]" />
<?php } ?>
<?php if($item['addtime']>strtotime(date('Y-m-d 00:00:00'))) { ?>
<img src="<?php echo SITE_URL;?>app/<?php echo $app;?>/skins/<?php echo $skin;?>/topic_new.gif" align="absmiddle"  title="[新帖]" alt="[新帖]" />
<?php } ?> 
<?php if($item['isphoto']=='1') { ?>
<img src="<?php echo SITE_URL;?>app/<?php echo $app;?>/skins/<?php echo $skin;?>/image_s.gif" title="[图片]" alt="[图片]" align="absmiddle" />
<?php } ?> 
<?php if($item['isattach'] == '1') { ?>
<img src="<?php echo SITE_URL;?>app/<?php echo $app;?>/skins/<?php echo $skin;?>/attach.gif" title="[附件]" alt="[附件]" />
<?php } ?>
<?php if($item['isposts'] == '1') { ?>
<img src="<?php echo SITE_URL;?>public/images/posts.gif" title="[精华]" alt="[精华]" />
<?php } ?>
</div>

<div class="topic_info">
<span style="float:left;">
<a href="<?php echo SITE_URL;?><?php echo tsurl('group','group',array(groupid=>$item['groupid']))?>"><?php echo $item['group'][groupname];?></a>
</span>

<span style="float:right;">
<?php echo getTime($item['uptime'],time())?>

<a href="<?php echo SITE_URL;?><?php echo tsurl('user','space',array(userid=>$item['userid']))?>"><?php echo $item['user'][username];?></a>

<?php if($item['count_comment']>0) { ?><a class="rank" style="color:#FFFFFF;" href="<?php echo SITE_URL;?><?php echo tsurl('group','topic',array(topicid=>$item['topicid']))?>"><?php echo $item['count_comment'];?></a><?php } ?>
</span>
</div>
</div>
<div class="clear"></div>

</li>	
<?php }?>
<?php } ?>
</ul>
</div>

<div class="clear"></div>


</div>

<div class="cright" id="cright">
<?php doAction('my_right_top')?>
<div>
<form method="GET" action="index.php">
<input type="hidden" name="app" value="search" />
<input type="hidden" name="ac" value="s" />
<span class="inp">
<input type="text" autocomplete="off" name="kw" onfocus="if(this.value=='ThinkSAAS') this.value='';" title="" size="22" maxlength="60" value="ThinkSAAS" style="color: rgb(212, 212, 212); width: 206px;"></span>
<span>
<input type="submit" class="submit" value="<?php echo $TS_HL['app'][1013];?>" />
</span>
</form>
</div>

<div class="clear"></div>
<h2><?php echo $TS_HL['app'][1027];?><span class="pl">(
<a href="<?php echo SITE_URL;?><?php echo tsurl('group','my_group')?>"><?php echo $TS_HL['app'][1026];?></a>
) </span></h2>
<div class="mygroup">
<ul>
<?php foreach((array)$arrMyGroup as $key=>$item) {?>
<li>
<a href="<?php echo SITE_URL;?><?php echo tsurl('group','group',array(groupid=>$item['groupid']))?>"><img alt="<?php echo $item['groupname'];?>" class="m_sub_img" src="<?php echo $item['icon_16'];?>" width="16" align="absmiddle" /></a> <a href="<?php echo SITE_URL;?><?php echo tsurl('group','group',array(groupid=>$item['groupid']))?>"><?php echo $item['groupname'];?></a> <span>(<?php echo $item['count_user'];?><?php if($item['uptime']>strtotime(date('Y-m-d 00:00:00'))) { ?>/<font color="orange"><?php echo $item['count_topic_today'];?></font><?php } else { ?><?php } ?>)</span>
</li>
<?php }?>	
</ul>
</div>

<div class="clear"></div>

<?php if($TS_APP['options'][iscreate]==0 || $TS_USER['user'][isadmin]==1) { ?>
<p class="pl2">&gt; <a href="<?php echo SITE_URL;?><?php echo tsurl('group','create')?>"><?php echo $TS_HL['app'][1011];?></a></p>
<?php } ?>

<p class="pl2">&gt; <a href="<?php echo SITE_URL;?><?php echo tsurl('group','all')?>"><?php echo $TS_HL['app'][1008];?></a></p>


</div>
</div>
</div>

<script>
$(document).ready(function() {
	$.ajax({
		type: "GET",
		url:  "<?php echo SITE_URL;?>index.php?app=group&ac=task&ts=istask",
		success: function(msg){
			$('#cright').prepend(msg);
		}
	});
});
</script>
<?php include template('footer'); ?>