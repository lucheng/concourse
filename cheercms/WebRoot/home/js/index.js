/***
 *	SHOP++ Index JavaScript
 *
 *	http://www.shopxx.net
 *
 *	Copyright © 2010 shopxx.net All Rights Reserved.
 **/

$().ready( function() {

	var $customerServiceLayer = $("#customerServiceLayer");
	var $closeCustomerServiceLayer = $("#closeCustomerServiceLayer");
	var $sliderScrollable = $("#sliderScrollable");

	var lastScrollY = 60;
	
	$customerServiceLayer.show();

	function moveCustomerServiceLayer() {
		var diffY;
		if (document.documentElement && document.documentElement.scrollTop) {
			diffY = document.documentElement.scrollTop;
		} else if (document.body) {
			diffY = document.body.scrollTop;
		}
	
		percent = .1 * (diffY - lastScrollY);
		if(percent > 0) {
			percent = Math.ceil(percent);
		} else {
			percent = Math.floor(percent);
		}
		$customerServiceLayer.css("top", (isNaN(parseInt($customerServiceLayer.css("top"))) ? 0 : parseInt($customerServiceLayer.css("top"))) + percent);
		lastScrollY = lastScrollY + percent;
	}
	
	window.setInterval(moveCustomerServiceLayer, 20);
	
	$closeCustomerServiceLayer.click( function() {
		$customerServiceLayer.fadeOut();
	});

	$sliderScrollable.scrollable({
		circular: true,
		speed: 500
	}).autoscroll({
		autoplay: true,
		interval: 4000
	}).navigator();

});