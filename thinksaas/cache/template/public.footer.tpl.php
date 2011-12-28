<!--footer-->
<div class="footer">
<div><a href="<?php echo SITE_URL;?><?php echo tsurl('home','about')?>">关于我们</a> | <a href="<?php echo SITE_URL;?><?php echo tsurl('home','contact')?>">联系我们</a> | <a href="<?php echo SITE_URL;?><?php echo tsurl('home','agreement')?>">用户条款</a> | <a href="<?php echo SITE_URL;?><?php echo tsurl('home','privacy')?>">隐私申明</a></div>
Powered by <a class="softname" href="<?php echo $TS_SOFT['info'][url];?>"><?php echo $TS_SOFT['info'][name];?></a> <?php echo $TS_SOFT['info'][version];?> <?php echo $TS_SOFT['info'][year];?> <?php echo $TS_SITE['base'][site_icp];?><br /><span style="font-size:0.83em;">Processed in <?php echo $runTime;?> second(s)</span></div>

<script src="<?php echo SITE_URL;?>public/js/slide.js" type="text/javascript"></script>

<!--imbox-->
<?php if($TS_USER.user!='') { ?>
<script src="<?php echo SITE_URL;?>public/js/imbox/imbox.js" type="text/javascript"></script>
<script>
var userid=<?php echo intval($TS_USER['user'][userid])?>;

evdata(userid);

</script>
<?php } ?>
<!--imbox-->
<?php doAction('pub_footer')?>
</body>
</html>
<?php if($TS_SITE['base'][isgzip]==1) { ?><?php ob_end_flush();?><?php } ?>