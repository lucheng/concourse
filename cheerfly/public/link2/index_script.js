	//��Ʒ����
	var _n = 1;
	var _item_obj;
	function item_lun(m){
		var _len = m*714;
		$(".main_lookitmecopy").find("ul").animate({left:"-"+_len+"px"},"normal",function(){});
		for(var i=0;i < 5;i++){
			if(m == i){
				$(".main_lookitmenew").find("a").eq(i).html('<img src="http://s1.linkchic.com/lc0301/images/redmenu.gif">');
			}else{
				$(".main_lookitmenew").find("a").eq(i).html('');
			}
		}
		if(m < 4){
			_n++;
		}else{
			_n = 0;
		}
		_item_obj = setTimeout('item_lun('+_n+');',2000);
	}

	//�������//
	var _set_obj;
	$(".main_leftimg").find("ul").find("li").eq(0).before($(".main_leftimg").find("ul").find("li").last());
	function set_lun(){
		$(".main_leftimg").find("ul").animate({left:"-808px"},"normal",function(){
			$(this).find("li").eq(0).appendTo($(this));
			$(this).css({left:"0px"});
		});
		_set_obj = setTimeout('set_lun();',5000);
	}

	$(function(){
		//ҳ���ж���
		$('#rss_img_index').click(function(){
			var rss_email = $('input[name=rss_email_index]').val();
			send_rss_email(rss_email);
		});

		//ҳ�����û�����
		$("#feedback_index_center").click(function(){
			$('#dialog').dialog({autoOpen: true});
		});

		//���µ�Ʒ
		$(".main_lookitmenew a").click(function(){
			clearTimeout(_item_obj);
			var _i = $(this).index();
			var _len = _i*714;
			$(".main_lookitmecopy").find("ul").animate({left:"-"+_len+"px"},"normal",function(){});

			for(var i=0;i < 5;i++){
				if(_i == i){
					$(this).html('<img src="http://s1.linkchic.com/lc0301/images/redmenu.gif">');
				}else{
					$(".main_lookitmenew").find("a").eq(i).html('');
				}
			}
			_n = _i;
			_item_obj = setTimeout('item_lun('+_n+');',2000);
		});
		//��Ʒ�ֻ�
		_item_obj = setTimeout('item_lun(1);',3000);

		//�����ͼ
		//��ҳ
		$(".main_leftmenu").click(function(){
			clearTimeout(_set_obj);
			$(".main_leftimg").find("ul").find("li").eq(0).before($(".main_leftimg").find("ul").find("li").last());
			$(".main_leftimg").find("ul").css({left:"-808px"});
			$(".main_leftimg").find("ul").animate({left:"0px"},"normal",function(){
				//$(this).find("li").eq(0).before($(this).find("li").last());
				$(this).css({left:"0px"});
			});
		});
		//�ҷ�ҳ
		$(".main_rightmenu").click(function(){
			clearTimeout(_set_obj);
			
			$(".main_leftimg").find("ul").animate({left:"-808px"},"normal",function(){
				$(this).find("li").eq(0).appendTo($(this));
				$(this).css({left:"0px"});
			});
		});

		$(".main_leftimg").hover(function(){
			clearTimeout(_set_obj);
		},function(){
			_set_obj = setTimeout('set_lun();',5000);
		});
		//�����ֻ�
		_set_obj = setTimeout('set_lun();',5000);

		//��Ʒ����
		$(".main_lookitme li").hover(function(){
			clearTimeout(_item_obj);
			if(($.browser.version == "6.0" || $.browser.version == "7.0") && $.browser.msie == true){
				$(this).find(".main_lookitmetextie").show();
			}else{
				$(this).find(".main_lookitmetext").show();
			}
		},function(){
			if(($.browser.version == "6.0" || $.browser.version == "7.0") && $.browser.msie == true){
				$(this).find(".main_lookitmetextie").hide();
			}else{
				$(this).find(".main_lookitmetext").hide();
			}
			_item_obj = setTimeout('item_lun('+_n+');',2000);
		});
	});	
	
