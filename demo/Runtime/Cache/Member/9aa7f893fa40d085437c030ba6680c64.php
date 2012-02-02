<?php if (!defined('THINK_PATH')) exit();?> <div id="pagebody">
      <div class="col1">
        <div class="menu">
          <div class="menu_title">Categories</div>
          <div class="menu_content">
           <ul id="listMenu" >
  <?php if(is_array($catetree)): $i = 0; $__LIST__ = $catetree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><?php if(($vo['subcount'])  >  "0"): ?><li> <a href="<?php echo build_url($vo,'cate_url');?>"><?php echo build_url($vo,'cate_name');?> </a>
        <ul>
          <?php if(is_array($vo['sub'])): $i = 0; $__LIST__ = $vo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subvo): ++$i;$mod = ($i % 2 )?><?php if(($subvo['subcount'])  ==  "0"): ?><li> <a href="<?php echo build_url($subvo,'cate_url');?>"><?php echo build_url($subvo,'cate_name');?></a> </li><?php endif; ?>
            <?php if(($subvo['subcount'])  >  "0"): ?><li> <a href="<?php echo build_url($subvo,'cate_url');?>"><?php echo build_url($subvo,'cate_name');?> </a>
                <ul>
                  <?php if(is_array($subvo['sub'])): $i = 0; $__LIST__ = $subvo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subvo2): ++$i;$mod = ($i % 2 )?><li><a href="<?php echo build_url($subvo2,'cate_url');?>"><?php echo build_url($subvo2,'cate_name');?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
              </li><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
      </li><?php endif; ?>
    <?php if(($vo['subcount'])  ==  "0"): ?><li> <a href="<?php echo build_url($vo,'cate_url');?>"><?php echo build_url($vo,'cate_name');?></a> </li><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>


<script type="text/javascript">
//<![CDATA[

var listMenu = new FSMenu('listMenu', true, 'display', 'block', 'none');

listMenu.showDelay = 0;
listMenu.switchDelay = 0;
listMenu.hideDelay = 0;
//listMenu.cssLitClass = 'highlighted';
//listMenu.showOnClick = 0;
//listMenu.hideOnClick = true;
listMenu.animInSpeed = 0.2;
listMenu.animOutSpeed = 0.2;

//listMenu.animations[listMenu.animations.length] = FSMenu.animFade;
//listMenu.animations[listMenu.animations.length] = FSMenu.animSwipeDown;
//listMenu.animations[listMenu.animations.length] = FSMenu.animClipDown;


var arrow = null;
if (document.createElement && document.documentElement)
{
 arrow = document.createElement('span');
 arrow.appendChild(document.createTextNode('>'));
 // Feel free to replace the above two lines with these for a small arrow image...
 //arrow = document.createElement('img');
 //arrow.src = 'arrow.gif';
 //arrow.style.borderWidth = '0';
 arrow.className = 'subind'; 
}
addReadyEvent(new Function('listMenu.activateMenu("listMenu", arrow)'));


//]]>
</script>
          </div>
        </div>
        <div class="menu1">
          <div class="menu1_title">Bestsellers</div>
          <div class="menu1_content">
          <?php if(is_array($HotProducts)): $i = 0; $__LIST__ = $HotProducts;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><div class="m_pro"> 
              <div class="m_pro_img"><a href="<?php echo build_url($vo,'pro_url');?>" altimg="<?php echo build_url($vo,'altimg');?>" title="<?php echo build_url($vo,'pro_name');?>" ><img src="<?php echo build_url($vo,'pro_smallimage');?>" alt="<?php echo build_url($vo,'pro_name');?>" border="0" width="45" height="45" /></a></div>
              <div class="m_pro_name">
                <a href="<?php echo build_url($vo,'pro_url');?>"><?php echo build_url($vo,'pro_name');?></a>
              </div>
              <div class="m_pro_pri">
                <?php echo build_url($vo,'pro_price');?>
              </div>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
            
            
          </div>
        </div>
      </div>