<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<script type="text/javascript">
var USER_ID = <?=$_FANWE['uid']?>;
<?php 
if(!empty($_FANWE['authoritys']))
{
$manages = array_keys($_FANWE['authoritys']);
$manages = implode(',',$manages);
}
 ?>
var MANAGES = "<?=$manages?>";
</script>