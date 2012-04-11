
	function AddFavorite()
    {
        try{
            window.external.addFavorite("http://www.linkchic.com", "LC风格网");
        }catch (e){
            try{
                window.sidebar.addPanel("LC风格网", "http://www.linkchic.com", "");
            }catch (e){
                alert("对不起，您的浏览器不支持此操作，\n 请使用菜单栏或CTRL+D添加收藏。");
            }
        }
    }

   	function SetHome(obj,vrl)
    {
        try{
            obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }catch(e){
            if(window.netscape){
                try{
                        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }catch(e){
                        alert(" 此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config“并回车\n然后将 [signed.applets.codebase_principal_support]设置为'true'");
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage',vrl);
             }
        }
    }

	$(document).ready(function(){
		//导航
		var top_menu_name =top_men;
		if(top_menu_name != "")
		{
			$("#"+top_menu_name).attr("class","headyellow");
		}

		$("input[name='keywords']").focus(function(){
			var _id = $(this).attr("id");
			if($(this).val() == "搜索搭配、单品")
			{
				$(this).val("");
			}
		});
		$("input[name='keywords']").blur(function(){
			if($.trim($(this).val()) == ""){
				var _id = $(this).attr("id");
				$(this).val("搜索搭配、单品");
			}
		});
		
		//登录信息
		

	});

	function getCutStr(v){
		var len = 0;
		for(i=0;i<v.length;i++)   {
		   if(v.charCodeAt(i)>256)   {
		      len   +=   2;
		   }else{
		      len++;
		   }
		   if(len > 14){
		   	  v = v.substring(0,len);
		   	  break;
		   }
		}
		return v;
	}

//jquery cookie
jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options = $.extend({}, options); // clone object since it's unexpected behavior if the expired property were changed
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // NOTE Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};


$(document).ready(function(){
	//返回顶部
	//window.onscroll=function(){
	
	$(document).scroll(function(){	
		var y = parseInt($(document).scrollTop());
		if(y<=0){
			$('.miss').hide();
		}else{
			$('.miss').show();
		}
	});

	window.onscroll=function(){	
		var y = parseInt($(document).scrollTop());
		if(y<=0){
			$('.miss').hide();
			$('.miss1').hide();//ie6
		}else{
			//ie6
			if( $.browser.msie && ($.browser.version =='6.0' || $.browser.version =='7.0')){
				if(parseInt($('#page').height())>y+570){
					$('.miss').removeClass('miss').addClass('miss1');
					$('.miss1').show().css('padding-top',390+y);
				}

			}else{
				$('.miss').show();
			}
		}
	}
	
	//订阅,收藏功能
	if($.cookie('close_top_sc')==1){
		$('.dysc').hide();
	}else{

		$('.dysc').fadeIn("slow");
	}
	$('.scopen').click(function(){
		$.cookie('close_top_sc',1, { path: '/', expires: 36500 });
		$('.dysc').fadeOut("slow");
	})
	//页面中订阅
	$('#sendEmail').click(function(){
		var rss_email = $('#getEmail').val();
		send_rss_email(rss_email);
	});
	//setCookie('close_top_sc',0); //注销cookie
})