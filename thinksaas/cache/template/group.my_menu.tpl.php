<div class="tabnav">
<ul>
<li <?php if($ac=='index') { ?>class="select"<?php } ?>><a href="<?php echo SITE_URL;?>index.php"><?php echo $TS_HL['app'][1020];?></a></li>
<li <?php if($ac=='my_topic') { ?>class="select"<?php } ?>><a href="<?php echo SITE_URL;?><?php echo tsurl('group','my_topic')?>"><?php echo $TS_HL['app'][1021];?></a></li>
<li <?php if($ac=='my_reply') { ?>class="select"<?php } ?>><a href="<?php echo SITE_URL;?><?php echo tsurl('group','my_reply')?>"><?php echo $TS_HL['app'][1022];?></a></li>
<li <?php if($ac=='my_collect') { ?>class="select"<?php } ?>><a href="<?php echo SITE_URL;?><?php echo tsurl('group','my_collect')?>"><?php echo $TS_HL['app'][1023];?></a></li>
</ul>
</div>
<div class="clear"></div>