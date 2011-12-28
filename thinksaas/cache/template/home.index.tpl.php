<?php include template('header'); ?>
<div class="midder">

<div class="anony-nav">
<div class="bd">
<div class="reg">

<strong><?php echo $TS_HL['app'][1000];?></strong>
<div>
<?php echo $TS_HL['app'][1001];?>
</div>
<a class="submit" href="<?php echo SITE_URL;?><?php echo tsurl('user','register')?>"><?php echo $TS_HL['app'][1002];?></a>
</div>

<div class="login">
<form action="<?php echo SITE_URL;?>index.php?app=user&ac=login&ts=do" method="post" name="lzform" id="lzform">
<fieldset>
<legend><?php echo $TS_HL['app'][1003];?></legend>
<div class="item">
<label><?php echo $TS_HL['app'][1004];?></label>
<br />
<input type="email" tabindex="1" value="" name="email">
</div>
<div class="item">
<label><?php echo $TS_HL['app'][1005];?></label>
<br />
<input type="password" tabindex="2" class="text" name="pwd">
<br /><a href="<?php echo SITE_URL;?>index.php?app=user&ac=forgetpwd"><?php echo $TS_HL['app'][1006];?></a>
</div>

<div class="item1">
<input type="hidden" name="cktime" value="2592000" />
<input type="submit" tabindex="4" class="submit" value="<?php echo $TS_HL['app'][1003];?>">
<?php doAction('pub_header_login')?>
</div>
</fieldset>
</form>
</div>

</div>
</div>

<div class="mc">
<div class="cleft">

<h2><?php echo $TS_HL['app'][1007];?> <span class="pl">&nbsp;(<a href="<?php echo SITE_URL;?><?php echo tsurl('group','all')?>"><?php echo $TS_HL['app'][1008];?></a>) </span></h2>

<div style="overflow:hidden;">
<?php if($arrRecommendGroup) { ?>
<?php foreach((array)$arrRecommendGroup as $key=>$item) {?>
<div class="sub-item">
<div class="pic">
<a href="<?php echo SITE_URL;?><?php echo tsurl('group','group',array(groupid=>$item['groupid']))?>">
<img data-defer-src="<?php echo $item['icon_48'];?>" src="<?php echo $item['icon_48'];?>" alt="<?php echo $item['groupname'];?>">
</a>
</div>
<div class="info">
<a href="<?php echo SITE_URL;?><?php echo tsurl('group','group',array(groupid=>$item['groupid']))?>"><?php echo $item['groupname'];?></a> (<?php echo $item['count_user'];?>/<font color="orange"><?php echo $item['count_topic'];?></font>)             
<p><?php echo $item['groupdesc'];?></p>
</div>
</div>
<?php }?>
<?php } ?>
</div>

<div class="clear"></div>

</div>

<div class="cright">
<?php doAction('index_right')?>
<div>
<form method="GET" action="index.php">
<input type="hidden" name="app" value="search" />
<input type="hidden" name="ac" value="s" />
<span class="inp"><input type="text" autocomplete="off" name="kw" title="" size="22" maxlength="60" value="" style="color: rgb(212, 212, 212); width: 206px;"></span>
<span>
<input type="submit" class="submit" value="<?php echo $TS_HL['app'][1013];?>" />
</span>
</form>
</div>

<h2><?php echo $TS_HL['app'][1012];?></h2>

<div class="line23">
<?php if($arrNewGroup) { ?>
<?php foreach((array)$arrNewGroup as $key=>$item) {?>
<a href="<?php echo SITE_URL;?><?php echo tsurl('group','group',array(groupid=>$item['groupid']))?>"><?php echo $item['groupname'];?></a> (<?php echo $item['count_user'];?><?php if($item['uptime']>strtotime(date('Y-m-d 00:00:00'))) { ?>/<font color="orange"><?php echo $item['count_topic_today'];?></font><?php } else { ?><?php } ?>)<br>
<?php }?>
<?php } ?>
</div>

<div class="clear"></div>
<?php doAction('home_index_right_footer')?>
</div>
<?php doAction('index_footer')?>
</div>
</div>
<?php include template('footer'); ?>