var darenIndex = 1;
var shareTimer;

jQuery(function($){
	$(".topic_list_new li").hover(function(){
		$(this).addClass('h');
	},function(){
		$(this).removeClass('h');
	});
	
	$(".s_g_next").click(function(){
		getDarenList();
	});
	
	$('.cate_tag_item').hover(function(){
		$('.sk',this).show();
	},function(){
		$('.sk',this).hide();
	});
	
	$('.mogu_talk li').css({"position":"absolute","top":0,"left":3 * 341,"z-index":1});
	$('.mogu_talk li').eq(0).css({"left":0});
	$('.mogu_talk li').eq(1).css({"left":341});
	$('.mogu_talk li').eq(2).css({"left":2 * 341});
	
	shareTimer = setTimeout('newShareTimer()',3000);
});

function newShareTimer()
{
	$('.mogu_talk li').eq(1).css({"z-index":2});
	$('.mogu_talk li').eq(2).css({"z-index":2});
	scrollNewShare();
}

function scrollNewShare()
{
	var left = parseInt($('.mogu_talk li').eq(1).css("left"));
	if(left > 0)
	{
		left-=50;
		if(left < 0)
		{
			left = 0;
		}
		$('.mogu_talk li').eq(1).css({"left":left});
		$('.mogu_talk li').eq(2).css({"left":left + 341});
		setTimeout('scrollNewShare()',1);
	}
	else
	{
		$('.mogu_talk ul').append($('.mogu_talk li').eq(0));
		$('.mogu_talk li').css({"position":"absolute","top":0,"left":3 * 341,"z-index":1});
		$('.mogu_talk li').eq(0).css({"left":0});
		$('.mogu_talk li').eq(1).css({"left":341});
		$('.mogu_talk li').eq(2).css({"left":2 * 341});
		shareTimer = setTimeout('newShareTimer()',3000);
	}
}

function getDarenList()
{
	$.ajax({ 
		url: SITE_PATH+"services/service.php?m=index&a=daren",
		type: "POST",
		data:{"page":darenIndex,"size":15},
		dataType: "json",
		success: function(result){
			if(result.status == 1)
			{
				$("#daren_list").html(result.html);
				darenIndex = result.page;
			}
		}
	});
}

function addUserFollows()
{
	if(!$.Check_Login())
		return false;
	
	var uids = new Array();
	$("#daren_list .s_g_l_l").each(function(){
		var uid = this.getAttribute('uid');
		if(uid > 0)
			uids.push(uid);
	});
	
	if(uids.length == 0)
		return false;

	$.ajax({ 
		url: SITE_PATH+"services/service.php?m=user&a=follows",
		type: "POST",
		data:{"uids":uids.join(',')},
		dataType: "json",
		success: function(result){
			if(result.status == 1)
			{
				$("#daren_list .index_daren_handler").each(function(){
					$(this).before('<img class="fo_ok" src="'+ TPL_PATH +'images/add_fo_ok.png">');
					$(this).remove();
				});
			}
		}
	});
}

function UpdateUserFollow(obj,result)
{
	if(result.status == 1)
	{
		$(obj).before('<img class="fo_ok" src="'+ TPL_PATH +'images/add_fo_ok.png">');
		$(obj).remove();
	}
}