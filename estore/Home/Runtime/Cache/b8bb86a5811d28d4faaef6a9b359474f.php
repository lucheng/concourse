<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title>页面提示</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv='Refresh' content='<?php echo ($waitSecond); ?>;URL=<?php echo ($jumpUrl); ?>'>
<link href="<?php echo ($publicCss); ?>" rel="stylesheet" type="text/css">
<base target="_self" /></head>
<body>
<table width="530" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td width="1231" bgcolor="#F5F5F5"><div class="message">
      <TABLE width="530" align="center"  cellpadding=0 cellspacing=0 class="message" >
        <tr>
          <td width="515" height='5'  class="topTd" ></td>
        </tr>
        <TR class="row" >
          <th height="22" align="center" class="tCenter space"><?php echo ($msgTitle); ?></th>
        </TR>
        <?php if(isset($message)): ?><TR class="row">
            <TD height="22" align="left" style="color:blue; padding-left:10px;"><?php echo ($message); ?></TD>
          </TR><?php endif; ?>
        <?php if(isset($error)): ?><TR class="row">
            <TD height="22" align="left" style="color:red; padding-left:10px;"><?php echo ($error); ?></TD>
          </TR><?php endif; ?>
        <?php if(isset($closeWin)): ?><TR class="row">
            <TD height="22" align="left" style="padding-left:10px;">系统将在 <span style="color:blue;font-weight:bold"><?php echo ($waitSecond); ?></span> 秒后自动关闭，如果不想等待,直接点击 <A HREF="<?php echo ($jumpUrl); ?>">这里</A> 关闭</TD>
          </TR><?php endif; ?>
        <?php if(!isset($closeWin)): ?><TR class="row">
            <TD height="22" align="left" style="padding-left:10px;">系统将在 <span style="color:blue;font-weight:bold"><?php echo ($waitSecond); ?></span> 秒后自动跳转,如果不想等待,直接点击 <A HREF="<?php echo ($jumpUrl); ?>">这里</A> 跳转</TD>
          </TR><?php endif; ?>
        <tr>
          <td height='5' class="bottomTd"></td>
        </tr>
      </TABLE>
    </div></td>
  </tr>
</table>
</body>
</html>