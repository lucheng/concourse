/***
 *	SHOP++ Friend Link JavaScript
 *
 *	http://www.shopxx.net
 *
 *	Copyright © 2010 shopxx.net All Rights Reserved.
 **/

$().ready( function() {

	var $pictureFriendLinkScrollable = $("#pictureFriendLinkScrollable");
	
	// 友情链接滚动
	$pictureFriendLinkScrollable.scrollable({
		loop: true,
		speed: 1000
	});
	
	$pictureFriendLinkScrollable.find("a").hover(
		function() {
			$(this).stop().animate({"opacity": 1});
		}, function() {
			$(this).stop().animate({"opacity": 0.5});
		}
	).animate({"opacity": 0.5 });

});