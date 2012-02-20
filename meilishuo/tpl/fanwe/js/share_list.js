jQuery(function($){
	$('.t_l .pic div').live('click',function(){
		var parent = $(this).parent();
		var index = $('div',parent).index(this);
		var picb = parent.next();
		parent.hide();
		$('li',picb).eq(index).show();
		return false;
	});
	
	$('.t_l .pic_b .pic_b_bd').live('click',function(){
		var parent = $(this).parent();
		parent.hide();
		parent.parent().prev().show();
	});
});