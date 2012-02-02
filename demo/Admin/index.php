<?php 
$root=str_replace("\\","/",$_SERVER['DOCUMENT_ROOT']);
$file=str_replace("\\","/",__FILE__);
$url=str_replace($root,'',str_replace(basename(dirname(__FILE__)).'/'.basename(__FILE__),'',$file))."index.php/AdminPublic-adminlogin"; 
$url='http://'.$_SERVER['HTTP_HOST'].$url;
?>
<meta http-equiv="Refresh" content="0;URL=<?php echo $url;?>" />
<?php die("please wait..."); ?>