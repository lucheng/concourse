<?php if (!defined('THINK_PATH')) exit();?><?xml version="1.0" encoding="utf-8"?>
<data page="<?php echo ($nowpage); ?>" P_Nums="<?php echo ($pages); ?>" A_Nums="<?php echo ($allnum); ?>" D_Nums="<?php echo ($lastnum); ?>" ID="<?php echo ($aid); ?>">
  <?php if(is_array($list)): $k = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$k;$mod = ($k % 2 )?><NoI><?php echo ($vo["num"]); ?></NoI> 
  <IP><?php echo ($vo["ip"]); ?></IP> 
<Author PostTime="<?php echo ($vo["ptime"]); ?>">
<![CDATA[<?php echo ($vo["author"]); ?>]]> 
  </Author>
<Content>
<![CDATA[<?php echo ($vo["content"]); ?>]]> 
  </Content>
<reContent>
<![CDATA[<?php echo ($vo["recontent"]); ?>]]> 
  </reContent><?php endforeach; endif; else: echo "" ;endif; ?>
  </data>