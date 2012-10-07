 <?php if ($error_warning) { ?>
  <div class="alert alert-error"><?php echo $error_warning; ?><a class="close" data-dismiss="alert">×</a></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><?php echo $success; ?><a class="close" data-dismiss="alert">×</a></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h2><?php echo $heading_title; ?></h2>
      <div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="btn btn-primary"><span><?php echo $button_insert; ?></span></a>	<a onclick="$('form').submit();" class="btn"><span><?php echo $button_delete; ?></span></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'title') { ?>
                <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'unit') { ?>
                <a href="<?php echo $sort_unit; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_unit; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_unit; ?>"><?php echo $column_unit; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($measurement_classes) { ?>
            <?php foreach ($measurement_classes as $measurement_class) { ?>
            <tr>
              <td style="align: center;"><?php if ($measurement_class['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $measurement_class['measurement_class_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $measurement_class['measurement_class_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $measurement_class['title']; ?></td>
              <td class="left"><?php echo $measurement_class['unit']; ?></td>
              <td class="right"><?php foreach ($measurement_class['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
