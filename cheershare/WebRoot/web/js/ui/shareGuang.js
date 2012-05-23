$(function(){
function addToFav(o){
		var url = "http://guang.com";
		var title = "逛，发现喜欢";		
		if (window.sidebar) { // Mozilla Firefox Bookmark
				window.sidebar.addPanel(title, url,"");
		} else if( window.external&&document.all) { // IE Favorite
			window.external.AddFavorite( url, title);
		} else if(window.opera) { // Opera 7+
				return false; // do nothing
		} else { 
				jQuery.guang.tip.conf.tipClass = "tipmodal tipmodal-error2";
				jQuery.guang.tip.show($(o),"您的浏览器不支持自动加收藏，请按 ctrl+d 加入收藏。");
		}
}
/*
$(window).bind("scroll",function(){
	var showguide = function(c){
		if(c.getStorage("showguide")!=="no"&&GUANGER.userId.length==0){
			if($(".guide").length!==1){
				var HTML = '<div class="guide">'
							+'<div class="guide_boby">'
								+'<p>如果你喜欢逛，就把Guang.com加入收藏夹吧，或者分享给你的朋友~</p>'
								+'<div class="guide_add">'
									+'<div class="favorites" id="J_Favorites"><a href="javascript:void(0);">加入收藏夹</a></div>'
									+'<div class="weibo"><a href="javascript:void((function(){var title=encodeURIComponent(\'推荐个不错的网站，能找到好多喜欢的东西。逛：http://guang.com\');var link=encodeURIComponent(window.location.href);var pic=\'http://static.guang.com/img/index/topic/banner-index.jpg\';window.open(\'http://service.t.sina.com.cn/share/share.php?appkey=2610725727&title=\'+title+\'&pic=\'+pic);})())" alt="分享到新浪微博">分享到新浪微博</a><a style="margin-left:6px; width:130px" href="javascript:void((function(){var title=encodeURIComponent(\'推荐个不错的网站，能找到好多喜欢的东西。逛：http://guang.com\');var link=encodeURIComponent(window.location.href);var pic=\'http://static.guang.com/img/index/topic/banner-index.jpg\';window.open(\'http://v.t.qq.com/share/share.php?appkey=db0de5e94b314972b3e7efd23fa7ce1e&title=\'+title+\'&pic=\'+pic+\'&site=\'+link);})())" alt="分享到腾讯微博"></a></div>'
								+'</div>'
								+'<div class="del" id="J_CloseGuide">'
									+'<a href="javascript:void(0);">关闭引导</a>'
								+'</div>'
							+'</div>'
						  +'</div>';
				$("body").append(HTML);
				$("#J_Favorites").click(function(){
					c.setStorage("showguide","no");
					addToFav(this);
				})
				$("#J_CloseGuide").click(function(){
					c.setStorage("showguide","no");
					$(".guide").hide();
				})
			}
			if(jQuery.guang.util.isIE6()){
				$(".guide").css({
					position:"absolute",
					top:$(window).scrollTop()+$(window).height()-90
				})
				if($(window).scrollTop()>800){
					$(".guide").show();
				}
			}else{
				if($(window).scrollTop()>800){
					$(".guide").show().animate({
						bottom:0
					},500);
				}
			}
		}
	}
	//本地存储调用
	var callStorage = function(fun){
		if(LocalStorage.client == null){
			new LocalStorage.Client(fun);
		}else{
			fun(LocalStorage.client);
		}
	}
	callStorage(showguide);
})
*/
//第三方登录优先级
var loginNavArr = [
	{"referer":"qq", "snsType":"4"},
	{"referer":"weibo", "snsType":"3"},
	{"referer":"taobao", "snsType":"8"},
	{"referer":"alipay", "snsType":"9"}
]
var showguide = function(curReferer, snsType){
	if(!$(".guide")[0]){
		var otherLoginArr = $.grep(loginNavArr, function(value, index){
			return (value.referer != curReferer);
		});
		//console.log(otherLoginArr);
		var otherLoginHtml = "";
		$.map(otherLoginArr, function(value, index){
			otherLoginHtml += '<li><a class="shortcut-login-' + value.referer + '" href="http://guang.com/snsLogin?snsType=' + value.snsType + '">' + value.referer + '</a></li>';
		});
		
		//var snsLoginHref = snsType ? 'http://guang.com/snsLogin?snsType=' + snsType : "http://guang.com/login";
		//modify by heiniu@guang.com 2012-05-19 14:30 将分享全部改成用户登录
		var HTML = '<div class="guide guide-' + curReferer + '">'
					+'<div class="guide_boby">'
						+'<p><i></i>登录 Guang.com ，发现你的喜欢！<span><a href="/signup">注册逛帐号 ></a></span></p>'
						+'<div class="guide_add">'
							+'<a id="J_RefererLogin" class="referer-login" href="http://guang.com/snsLogin?snsType=' + snsType + '">' + curReferer + '</a>'
							+'<div class="favorites" id="J_Favorites"><a href="javascript:void(0);">加入收藏夹</a></div>'
							+'<ul class="other-login">' + otherLoginHtml + '</ul>'
							//+'<div class="weibo">'
							//+'<a href="javascript:void((function(){var title=encodeURIComponent(\'推荐个不错的网站，能找到好多喜欢的东西。逛：http://guang.com\');var link=encodeURIComponent(window.location.href);var pic=\'http://static.guang.com/img/index/topic/banner-index.jpg\';window.open(\'http://service.t.sina.com.cn/share/share.php?appkey=2610725727&title=\'+title+\'&pic=\'+pic);})())" alt="分享到新浪微博">分享到新浪微博</a>'
							//+'<a style="margin-left:6px; width:130px" href="javascript:void((function(){var title=encodeURIComponent(\'推荐个不错的网站，能找到好多喜欢的东西。逛：http://guang.com\');var link=encodeURIComponent(window.location.href);var pic=\'http://static.guang.com/img/index/topic/banner-index.jpg\';window.open(\'http://v.t.qq.com/share/share.php?appkey=db0de5e94b314972b3e7efd23fa7ce1e&title=\'+title+\'&pic=\'+pic+\'&site=\'+link);})())" alt="分享到腾讯微博"></a>'
							//+'<a style="margin-left:6px; width:122px" href="javascript:void((function(){var title=encodeURIComponent(\'推荐个不错的网站，能找到好多喜欢的东西。逛：http://guang.com\');var link=encodeURIComponent(window.location.href);var pic=\'http://static.guang.com/img/index/topic/banner-index.jpg\';window.open(\'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=\' + link);})())" alt="分享到QQ空间"></a>'
							//+'</div>'
						+'</div>'
						+'<div class="del" id="J_CloseGuide">'
							+'<a href="javascript:void(0);">关闭引导</a>'
						+'</div>'
					+'</div>'
				  +'</div>';
	//	$("body").append(HTML);
		$("#J_Favorites").click(function(){
			addToFav(this);
		})
		$("#J_CloseGuide").click(function(){
			$(".guide").hide();
		})
	}
	var posGuide = function(){
		if(jQuery.guang.util.isIE6()){
			var windowtop = $(window).height()-90;
			$(".guide").css({
				position:"absolute",
				top:windowtop
			}).show();
			$(window).bind("scroll",function(){
				var docScrollTop = $(document).scrollTop();
				if ($.guang.util.isIE6()) {
					$(".guide").css("top", (docScrollTop+windowtop)+"px")
				}
			});
		}else{
			$(".guide").show().animate({
				bottom:0
			},500);
		}
	}
	var href = window.location.href;
	if(href.indexOf("/login")==-1 && href.indexOf("/doEmailLogin")==-1 && href.indexOf("/signup")==-1){
		posGuide();
	}
	//$(window).bind("scroll", posGuide);
}

//不登陆的用户会出现分享条
if(GUANGER.userId == "" && typeof GUANGER.referer != 'undefined'){
	switch(GUANGER.referer){
		case "taobao" : {
			showguide("taobao", 8);
		}break;
		case "alipay" : {
			showguide("alipay", 9);
		}break;
		case "weibo" : {
			showguide("weibo", 3);
		}break;
		default : {
			showguide("qq", 4);
		}
	}
}
});