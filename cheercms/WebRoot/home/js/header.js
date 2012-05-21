/***
 *	SHOP++ Header JavaScript
 *
 *	http://www.shopxx.net
 *
 *	Copyright © 2010 shopxx.net All Rights Reserved.
 **/

$().ready( function() {
	
	var $headerSearchForm = $("#headerSearchForm");
	var $headerSearchKeyword = $("#headerSearchKeyword");
	
	// 文章搜索
	headerSearchKeywordDefaultValue = $headerSearchKeyword.val();
	$headerSearchKeyword.focus( function() {
		if ($headerSearchKeyword.val() == headerSearchKeywordDefaultValue) {
			$headerSearchKeyword.val("");
		}
	});
	
	$headerSearchKeyword.blur( function() {
		if ($headerSearchKeyword.val() == "") {
			$headerSearchKeyword.val(headerSearchKeywordDefaultValue);
		}
	});
	
	$headerSearchForm.submit( function() {
		if ($.trim($headerSearchKeyword.val()) == "" || $.trim($headerSearchKeyword.val()) == headerSearchKeywordDefaultValue) {
			return false;
		}
	});

});