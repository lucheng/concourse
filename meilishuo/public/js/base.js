var FANWE = new Object();

(function($){
	/*=====================会员BEGIN=====================*/
	//检测会员是否登陆
	$.Check_Login = function()
	{
		if(USER_ID == 0)
		{
			$.Show_Login_Form();
			return false;
		}
		else
			return true;
	}
	
	$.Show_Login_Form = function()
	{
		$.weeboxs.close();
		$.weeboxs.open(SITE_PATH+"services/service.php?m=user&a=login", {contentType:'ajax',draggable:false,showButton:false,title:LANG.login,width:600});
	}
	
	//会员城市
	$.Bind_City = function(province,city,pid,cid)
	{
		var i = 0;
		var count = CITYS.province.length;
		var provinceID,cityID,selected;
		var html = "";
		for(i; i<count; i++)
		{
			provinceID = CITYS.province[i];
			if(pid == 0)
				pid = provinceID;

			if(pid == provinceID)
				selected = ' selected="selected"';
			else
				selected = '';

			html += '<option value="'+ provinceID +'"'+ selected +'>'+ CITYS.all[provinceID].name +'</option>';
		}
		
		$(province).html(html);

		$(province).change(function(){
			pid = this.value;
			i = 0;
			count = CITYS.city[pid].length;
			html = '';
			for(i; i<count; i++)
			{
				cityID = CITYS.city[pid][i];
				html += '<option value="'+ cityID +'">'+ CITYS.all[cityID].name +'</option>';
			}
			$(city).html(html);
		});
		html = '';
		i = 0;
		count = CITYS.city[pid].length;
		for(i; i<count; i++)
		{
			cityID = CITYS.city[pid][i];
			if(cid == cityID)
				selected = ' selected="selected"';
			else
				selected = '';

			html += '<option value="'+ cityID +'"'+ selected +'>'+ CITYS.all[cityID].name +'</option>';
		}

		$(city).html(html);
	}

	//关注会员，uid 要关注的会员编号，ojb 点击对像，fun 处理函数
	$.User_Follow=function(uid,obj,fun)
	{
		if(!$.Check_Login())
			return false;

		var query = new Object();
		query.uid = uid;

		$.ajax({
			url: SITE_PATH+"services/service.php?m=user&a=follow",
			type: "POST",
			data:query,
			dataType: "json",
			success: function(result){
				if(result.html != null && fun == null)
					$(obj).html(result.html);

				if(fun != null)
					fun.call(this,obj,result);
			}
		});
	}

	//删除粉丝，uid 要删除的会员编号，fun 处理函数
	$.Remove_Fans=function(uid,obj,fun)
	{
		if(!$.Check_Login())
			return false;

		var query = new Object();
		query.uid = uid;

		$.ajax({
			url: SITE_PATH+"services/service.php?m=user&a=removefans",
			type: "POST",
			data:query,
			dataType: "json",
			success: function(result){
				if(fun != null)
					fun.call(this,obj,result);
			}
		});
	}

	//关注主题，tid 要关注的主题编号，ojb 点击对像，fun 处理函数
	$.Topic_Follow=function(tid,obj,module,fun)
	{
		if(!$.Check_Login())
			return false;

		var query = new Object();
		query.tid = tid;
		
		if(module == null)
			module = 'topic';
		
		$.ajax({
			url: SITE_PATH+"services/service.php?m="+ module +"&a=follow",
			type: "POST",
			data:query,
			dataType: "json",
			success: function(result){
				if(result.html != null && fun == null)
					$(obj).html(result.html);

				if(fun != null)
					fun.call(this,obj,result);
			}
		});
	}
	/*=====================会员END  =====================*/
	
	/*=====================表情BEGIN=====================*/
	//显示表现窗口
	$.Show_Expression = function(obj,height)
	{
		var readyFun = function(weebox){
			FANWE.Expression_HTML = weebox.dc.html();
			$.Expression_Init(weebox);
		};
		if(FANWE.Expression_HTML == null)
			$.weeboxs.open(SITE_PATH+"services/service.php?m=share&a=expression",{boxid:'EXPRESSION_BOX',contentType:'ajax',position:{refele:obj},draggable:false,modal:false,showButton:false,showHeader:false,width:496,onready:readyFun,addtop:height});
		else
			$.weeboxs.open(FANWE.Expression_HTML,{boxid:'EXPRESSION_BOX',contentType:'text',position:{refele:obj},draggable:false,modal:false,showButton:false,showHeader:false,width:496,onready:readyFun,addtop:height});
	}
	
	//表情处理
	$.Expression_Init = function(weebox)
	{
		var refele = weebox.options.position.refele;
		var form = $(refele).parents("form");
		
		$("#expression_tabs li").click(function(){
			$("#expression_tabs li").removeClass("c");
			$(this).addClass("c");
			$.Get_Expression($(this).attr("f"),form);
		});
		
		$.Expression_Click(form);
	}
	
	//获取表情
	$.Get_Expression = function(type,form)
	{
		if(Expression_Items[type] != null)
		{
			$("#expression_items a").unbind();
			$("#expression_items").html(Expression_Items[type]);
			$.Expression_Click(form);
		}
	}
	
	//处理点击表情
	$.Expression_Click = function(form)
	{
		$("#expression_items a").bind("click",function(){
			var face = $.trim(this.getAttribute('rel'));
			if(face != '')
			{
				face = '['+ face +']';
				if($(".PUB_TXT",form).length == 0)
					return false;
					
				var txt = $(".PUB_TXT",form);
				var pos = parseInt(txt.attr("position"));
				var val = txt.val();
				
				if(txt.attr('length') != undefined)
				{
					var maxLength = parseInt(txt.attr('length'));
					if(val.length + face.length > maxLength)
						return false;
				}
				
				var begin = val.substr(0,pos);
				var end = val.substr(pos);
				txt.val(begin + face + end);
				txt.attr({"position":pos + face.length});
				$.Recount_Word(txt.get(0));
			}
		});
	}
	/*=====================表情END  =====================*/
	
	/*=====================宝贝BEGIN=====================*/
	//显示商品添加窗口
	$.Goods_Add = function(obj)
	{
		if(!$.Check_Login())
			return;
		
		var form = $(obj).parents("form");
		if($.Get_Goods_Count(form) >= SETTING.share_goods_count)
		{
			alert(LANG.goods_collect_3.replace('%d',SETTING.share_goods_count));
			return;
		}
		
		$.weeboxs.close();
		var closeFun = function(){
			$.Goods_Collect_Clear();
		};
		var readyFun = function(weebox){
			FANWE.Goods_Collect_HTML = weebox.dc.html();
			$.Goods_Init(weebox);
		};
		if(FANWE.Goods_Collect_HTML == null)
			$.weeboxs.open(SITE_PATH+"services/service.php?m=share&a=addgoods",{boxid:'ADD_GOODS_BOX',contentType:'ajax',position:{refele:obj},draggable:false,modal:false,showButton:false,width:496,onclose:closeFun,onready:readyFun});
		else
			$.weeboxs.open(FANWE.Goods_Collect_HTML,{boxid:'ADD_GOODS_BOX',contentType:'text',position:{refele:obj},draggable:false,modal:false,showButton:false,width:496,onclose:closeFun,onready:readyFun});
	}
	
	//采集商品初始化
	$.Goods_Init = function(weebox)
	{
		$('.GOODS_COLLECT',weebox.dc).click(function(){
			$.Goods_Collect(weebox);
		});
	}
	
	//采集商品
	$.Goods_Collect = function(weebox)
	{
		var refele = weebox.options.position.refele;
		var form = $(refele).parents("form");
		var query = form.serialize();
		var url = $.trim($('.GOODS_URL',weebox.dc).val());
		
		if(url == '')
		{
			alert(LANG.goods_collect_5);
			return;
		}

		$('.PUB_LOADING',weebox.dc).show();
		$('.GOODS_BOX',weebox.dc).hide();
		
		$.Goods_Collect_Clear();
		FANWE.Goods_Collect_Handler = new Object();
		FANWE.Goods_Collect_Handler.fun = function(result){
			$.Goods_Collect_Result(result,weebox,form);
		};
		
		FANWE.Goods_Collect_Handler.ajax = $.ajax({ 
			url: SITE_PATH+"services/service.php?m=share&a=collectgoods&url="+escape(url),
			type: "POST",
			data:query,
			cache:false,
			dataType: "json",
			success:function(result){
				if(FANWE.Goods_Collect_Handler.fun != null)
					FANWE.Goods_Collect_Handler.fun(result);
			},
			error:function(){
				alert(LANG.goods_collect_4);
				$.Goods_Close();
			}
		});
	}
	
	//处理采集返回的结果
	$.Goods_Collect_Result = function(result,weebox,form)
	{
		FANWE.Goods_Collect_Handler.fun = null;
		FANWE.Goods_Collect_Handler.ajax = null;
		FANWE.Goods_Collect_Handler = null;
		
		if(result.status == 1)
		{
			$('.PUB_IMG',form).append(result.item);
			weebox.setContent(result.html,true);
			$.Pub_Share_Tags(form);
			weebox.dc.ready(function(){
				if($('.TIME_OUT_CLOSE[time]',weebox.dc).length > 0)
					$.Goods_Close_Timer(weebox);
			});
			return;
		}
		else if(result.status == 0)
		{
			alert(LANG.goods_collect_4);
		}
		else if(result.status == -1)
		{
			alert(LANG.goods_collect_2);
		}
		else if(result.status == -2)
		{
			alert(LANG.goods_collect_3.replace('%d',SETTING.share_goods_count));
		}
		$.Goods_Close();
	}
	
	//timer关闭商品添加窗口
	$.Goods_Close_Timer = function(weebox)
	{
		var timeout = $('.TIME_OUT_CLOSE',weebox.dc);
		var time = parseInt(timeout.attr("time"));
		if(isNaN(time) || time <= 0)
		{
			FANWE.Goods_Collect_Close_Timer = null;
			delete FANWE.Goods_Collect_Close_Timer;
			$.Goods_Close();
			return;
		}
		timeout.val(LANG.goods_collect_1.replace('%d',time));
		time--;
		timeout.attr({"time":time});

		var timerFun = function(){
			$.Goods_Close_Timer(weebox);
		};
		FANWE.Goods_Collect_Close_Timer = setTimeout(timerFun,1000);
	}
	
	//关闭商品添加窗口
	$.Goods_Close = function()
	{
		$.Goods_Collect_Clear();
		$.weeboxs.close();
	}
	
	//清除商品的采集
	$.Goods_Collect_Clear = function()
	{
		if(FANWE.Goods_Collect_Handler != null)
		{
			FANWE.Goods_Collect_Handler.fun = null;
			FANWE.Goods_Collect_Handler.ajax.abort();
			FANWE.Goods_Collect_Handler.ajax = null;
			FANWE.Goods_Collect_Handler = null;
		}
	}
	
	//获取已发布商品的数量
	$.Get_Goods_Count = function(form)
	{
		return $('.PUB_IMG .PUB_SHARTE_GOODS',form).length;
	}
	/*=====================宝贝END  =====================*/
	
	/*=====================图片BEGIN=====================*/
	//显示商品添加窗口
	$.Pic_Add = function(obj)
	{
		if(!$.Check_Login())
			return;
		
		var form = $(obj).parents("form");
		if($.Get_Pic_Count(form) >= SETTING.share_pic_count)
		{
			alert(LANG.upload_pic_1.replace('%d',SETTING.share_pic_count));
			return;
		}
		
		$.weeboxs.close();
		var closeFun = function(){
			$.Pic_Upload_Clear();
		};
		var readyFun = function(weebox){
			FANWE.Pic_Upload_HTML = weebox.dc.html();
			$.Pic_Init(weebox);
		};
		if(FANWE.Pic_Upload_HTML == null)
			$.weeboxs.open(SITE_PATH+"services/service.php?m=share&a=addpic",{boxid:'ADD_PIC_BOX',contentType:'ajax',position:{refele:obj},draggable:false,modal:false,showButton:false,width:496,onclose:closeFun,onready:readyFun});
		else
			$.weeboxs.open(FANWE.Pic_Upload_HTML,{boxid:'ADD_PIC_BOX',contentType:'text',position:{refele:obj},draggable:false,modal:false,showButton:false,width:496,onclose:closeFun,onready:readyFun});
	}
	
	//上传图片初始化
	$.Pic_Init = function(weebox)
	{
		var refele = weebox.options.position.refele;
		var form = $(refele).parents("form");
		var file = $('.PUB_PIC_FILE',weebox.dc).get(0);
		file.onchange = function(){
			$('.PUB_LOADING',weebox.dc).show();
			$('.PIC_BOX',weebox.dc).hide();
			FANWE.Pic_Upload_Obj = $.ajaxFileUpload(
			{
				url:SITE_PATH+"services/service.php?m=share&a=uploadpic",
				secureuri:false,
				fileElementId:'Pub_Upload_Pic',
				fileElement:file,
				success:function(result,status){
					result = $('textarea',result).val();
					result = $.parseJSON(result);
					if(result.status == 1)
					{
						$('.PUB_IMG',form).append(result.html);
						$.Pub_Share_Tags(form);
					}
					else if(result.status == 0)
					{
						alert(LANG.upload_pic_2);
					}
					$.Pic_Close();
				},
				error:function(s, xml, status, e){
					$.Pic_Close();
				}
			});
		};
	}
	
	//关闭图片添加窗口
	$.Pic_Close = function()
	{
		$.Pic_Upload_Clear();
		$.weeboxs.close();
	}
	
	//清除正在上传的操作
	$.Pic_Upload_Clear = function()
	{
		if(FANWE.Pic_Upload_Obj != null)
		{
			FANWE.Pic_Upload_Obj.abort();
			FANWE.Pic_Upload_Obj = null;
		}
	}
	
	//获取已发布图片的数量
	$.Get_Pic_Count = function(form)
	{
		return $('.PUB_IMG .PUB_SHARTE_PIC',form).length;
	}
	/*=====================图片END  =====================*/
	
	/*=====================分享发布BEGIN=====================*/
	//发布时删除分享图片的处理
	$.Pub_Share_Img_Remove = function(obj)
	{
		var form = $(obj).parents("form");
		$(obj).parent().parent().remove();
		$.Pub_Share_Tags(form);
	}
	
	//发布时根据分享图片确定是否显示标签输入
	$.Pub_Share_Tags = function(form)
	{
		if($('.PUB_IMG li',form).length == 0)
			$('.PUB_SHARE_TAG_BOX',form).hide();
		else
		{
			$('.PUB_SHARE_TAG_BOX',form).show();
			var tags = new Array();
			$(".GOODS_ITEM_TAG",form).each(function(){
				tags.push(this.value.split(' ')); 
			});
			
			if(tags.length > 0)
			{
				var activeTags = $(".PUB_SHARE_TAG",form).val();
				if(activeTags != '')
				{
					activeTags = activeTags.replace('　',' ');
					activeTags = activeTags.replace(/ +/g,' ');
					activeTags = ' ' + $.trim(activeTags) + ' ';
				}
				
				var html = '';
				var tagCount = SETTING.share_tag_count;
				var tempObj = new Object();
				var tag = '';
				for(var i = 0; i < tagCount; i++)
				{
					for(var j=0; j < tags.length; j++)
					{
						if(tags[j].length > i)
						{
							tag = tags[j][i];
							if(tempObj[tag] == null)
							{
								tempObj[tag] = 1;
								if(activeTags.indexOf(' ' + tag + ' ') == -1)
									html += '<li>'+ tag +'</li>';
								else
									html += '<li class="active">'+ tag +'</li>';
							}
						}
					}
				}
				delete tempObj;
				$(".PUB_SHARE_TAG_BOX ul",form).html(html).show();
			}
			else
			{
				$(".PUB_SHARE_TAG_BOX ul",form).hide();
			}
		}
	}
	
	//分享图片排序操作
	$.Pub_Img_Sort = function(form)
	{
		$('.PUB_IMG li',form).each(function(i){
			$('.share_sort',this).val(i + 1);
		});
	}
	
	//分享重置
	$.Pub_Share_Reset = function(form)
	{
		form.reset();
		$('.PUB_IMG li',form).remove();
		$('.PUB_SHARE_TAG_BOX',form).hide();
	}
	
	$.Share_Save = function(obj)
	{
		if(!$.Check_Login())
			return false;
		
        var form = $(obj).parents("form").get(0);
		var module = $.trim(form.module.value);
		var action = $.trim(form.action.value);
		var url = SITE_PATH + 'services/service.php?m=' + module + '&a=' + action;
		var content = $.trim(form.content.value);
		if(content == '')
		{
			alert(LANG.share_content_require);
			return;	
		}
		
		$.Pub_Img_Sort(form);
		var butTxt = $(obj).val();
		
		$(obj).val('').addClass('pub_loading').attr("disabled",true);
		$.ajax({ 
			url: url,
			type: "POST",
			data:$(form).serialize(),
			cache:false,
			dataType: "json",
			success:function(result){
				$(obj).val(butTxt).removeClass('pub_loading').attr("disabled",false);
				if(result.status == 1)
				{
					$.Pub_Share_Reset(form);
					var share_item = $(result.html).css({"display":"none"});
					$("#SHARE_DETAIL_LiST").prepend(share_item);
					share_item.slideDown("slow");
				}
				else
					alert(LANG.pub_share_tip1);
			},
			error:function(){
				$(obj).val(butTxt).removeClass('pub_loading').attr("disabled",false);
				alert(LANG.pub_share_tip1);
			}
		});
    };
	
	$.Tweet_Delete = function(share_id,type)
	{
		var query = new Object();
		query.id = share_id;
		query.type = type;
		
		$.ajax({ 
			url:SITE_PATH+"manage/manage.php?m=share&a=delete",
			type: "POST",
			data:query,
			cache:false,
			dataType: "json",
			success:function(result){
				if(result.status == 1)
				{
					var share_item = $('#SHARE_LIST_'+share_id);
					share_item.slideUp("slow");
				}
			}
		});
	}
	/*=====================分享发布END  =====================*/
	
	/*=====================分享转发BEGIN=====================*/
	//显示分享转发
	$.Relay_Share = function(id)
	{
		if(!$.Check_Login())
			return false;

		$.weeboxs.close();
		$.weeboxs.open(SITE_PATH+"services/service.php?m=share&a=relay&id="+id, {boxid:'RELAY_BOX',contentType:'ajax',draggable:false,showButton:false,title:LANG.relay_share,width:480});
	}
	
	//提交分享转发
	$.Add_Share_Relay = function(obj)
	{
		var form = $(obj).parents("form");
		var formobj = form.get(0);
		if($.trim(formobj.content.value) == '')
		{
			alert(LANG.relay_content_require);
			return;
		}

		$.Show_Btn_Loading(obj);
		var query = form.serialize();
		$.ajax({
			url: SITE_PATH+"services/service.php?m=share&a=addrelay",
			data:query,
			type: "POST",
			dataType: "json",
			success: function(result){
				formobj.reset();
				$.weeboxs.close();
				$.Remove_Btn_Loading(obj);
			},
			error:function(){
				$.Remove_Btn_Loading(obj);
			}
		});
		return false;
	}
	/*=====================分享转发END  =====================*/
	
	/*=====================喜欢分享BEGIN=====================*/
	//喜欢分享
	$.Fav_Share = function(share_id,obj,size,parentKey)
	{
		if(!$.Check_Login())
			return false;

		var query = new Object();
		query.id = share_id;
		query.size = size;

		var parent;
		if(parentKey == null)
			parent = $(obj).parent();
		else
			parent = $(parentKey);

		$.ajax({
			url: SITE_PATH+"services/service.php?m=share&a=fav",
			type: "POST",
			data:query,
			dataType: "json",
			success:function(result){
				$.Close_Fav_Box();
				var mg = '<div class="fav_fanwe" id="fav_fanwe"></div>';
				$("body").append(mg);
				var left = $(obj).offset().left;
				var top = $(obj).offset().top;

				$("#fav_fanwe").css({"opacity":0,"left":left,"top":top-10});
				$("#fav_fanwe").animate({top:top-25,opacity:1},"fast",'swing',function(){
					if(result.status == 2)
						var box = "<div class='fav_tip' id='fav_tip'><div class='ffail'><span>"+ LANG.fav_share_yi +"</span><a onclick='$.Remove_Fav_Share("+share_id+",this,\""+ parentKey +"\");' href='javascript:;'>"+ LANG.remove +"</a></div></div>";
					if(result.status == 3)
						var box = "<div class='fav_tip' id='fav_tip'><div class='ffail'>"+ LANG.zhiji +"</div></div>";
					if(result.status == 4)
					{
						var box = "<div class='fav_tip' id='fav_tip'><div class='fok'><a onclick='$.Pop_Share_Comment("+share_id+");' href='javascript:;'>"+ LANG.fav_comment +"</a></div></div>";
						$(".SHARE_FAV_COUNT",parent).html(result.count);
						if(result.count > 0)
							$(".SHARE_FAV_BOX",parent).show();
						else
							$(".SHARE_FAV_BOX",parent).hide();
						$(".SHARE_FAV_LIST",parent).html(result.collects);
					}
					$("body").append(box);
					$("#fav_tip").css({"left":left-30,"top":top-90}).fadeIn();
					$("#fav_fanwe").hover(function(){
						clearTimeout(FANWE.Fav_Timer);
					},function(){
						var fun = function(){
							$.Close_Fav_Box();
						};
						FANWE.Fav_Timer = setTimeout(fun,3000);
					});

					$("#fav_tip").hover(function(){
						clearTimeout(FANWE.Fav_Timer);
					},function(){
						var fun = function(){
							$.Close_Fav_Box();
						};
						FANWE.Fav_Timer = setTimeout(fun,3000);
					});
				});
			}
		});
	}

	$.Remove_Fav_Share = function(share_id,obj,parentKey)
	{
		if(!$.Check_Login())
			return false;

		var query = new Object();
		query.id = share_id;

		var parent;
		if(parentKey == null)
			parent = $(obj).parent();
		else
			parent = $(parentKey);

		$.ajax({
			url: SITE_PATH+"services/service.php?m=share&a=removefav",
			type: "POST",
			data:query,
			dataType: "json",
			success: function(result){
				if(result.status == 1)
				{
					if(result.count > 0)
						$(".SHARE_FAV_BOX",parent).show();
					else
						$(".SHARE_FAV_BOX",parent).hide();
					$(".SHARE_FAV_COUNT",parent).html(result.count);
					$(".SHARE_FAV_LIST",parent).html(result.collects);
					$.Close_Fav_Box();
				}
			}
		});
	}

	$.Close_Fav_Box = function()
	{
		clearTimeout(FANWE.Fav_Timer);
		$("#fav_fanwe").remove();
		$("#fav_tip").remove();
	}
	/*=====================喜欢分享END  =====================*/

	/*=====================评论分享BEGIN=====================*/
	$.Pop_Share_Comment = function(share_id)
	{
		$.Close_Fav_Box();
		$.weeboxs.close();

		if(!$.Check_Login())
			return false;

		$.weeboxs.open(SITE_PATH+"services/service.php?m=share&a=comment&id="+share_id, {boxid:'COMMENT_BOX',contentType:'ajax',draggable:false,showButton:false,title:LANG.comment_share,width:480});
	}

	$.Add_Share_Comment = function(obj,parentID)
	{
		if(!$.Check_Login())
			return false;
		
		var form = $(obj).parents("form");
		var formobj = form.get(0);
		
		if($.trim(formobj.content.value)=='')
		{
			alert(LANG.comment_content_require);
			formobj.content.focus();
			return false;
		}
		
		var query = form.serialize();

		$.ajax({
			url: SITE_PATH+"services/service.php?m=share&a=addcomment",
			type: "POST",
			cache:false,
			data:query,
			dataType: "html",
			success: function(html){
				formobj.reset();
				if($(parentID).length > 0)
				{
					var item = $(html).css({"display":"none"});
					$(parentID).prepend(item);
					item.slideDown("slow");
				}
				$.weeboxs.close();
			}
		});
	}

	$.Get_Share_Comment = function(share_id,page,boxID,fun)
	{
		var query = new Object();
		query.page = page;
		query.share_id = share_id;

		$.ajax({
			url: SITE_PATH+"services/service.php?m=share&a=comments",
			type: "POST",
			cache:false,
			data:query,
			dataType: "html",
			success: function(html){
				$(boxID).html(html);
				if(fun != null)
					fun.call(this);
			}
		});
	}
	
	$.Get_Share_Comment_List = function(obj)
	{
		var parent = $(obj).parent();
		var cmtList = parent.siblings('.SHARE_COMMENT_LIST_BOX');
		if(cmtList.length > 0)
		{
			cmtList.remove();
			return false;
		}
		
		var shareID = $(obj).attr('shareID');
		var query = new Object();
		query.id = shareID;
		
		$.ajax({ 
			url: SITE_PATH+"services/service.php?m=share&a=listcomment",
			data:query,
			cache:false,
			type: "POST",
			success: function(html){
				parent.after(html);
				parent.siblings('.SHARE_COMMENT_LIST_BOX').show();
				$.Pub_Count_Bind($(".SHARE_COMMENT_LIST_BOX .PUB_TXT").get(0));
			}
		});
	}

	$.Reply_Comment = function(obj)
	{
		if(!$.Check_Login())
			return false;

		var userName = $(obj).attr('uname');
		var cid = $(obj).attr('cid');
		var form = $(obj).parents("form").get(0);
		form.content.value = "//@"+ userName +":" + form.content.value;
		form.parent_id.value = cid;
	}
	/*=====================评论分享END  =====================*/
	
	/*=====================分享标签BEGIN=====================*/
	$.ShareTagEdit = function(share_id,obj)
    {
        var parent = $(obj).parents("#SHARE_TAGS_"+share_id);
        $('.SHARE_TAG_EDIT_BOX',parent).show();
        $('.SHARE_TAG_SHOW_LIST',parent).hide();
    }

    $.ShareTagClose = function(share_id,obj)
    {
		$.Remove_Btn_Loading(obj);
        var parent = $(obj).parents("#SHARE_TAGS_"+share_id);
        $('.SHARE_TAG_EDIT_BOX',parent).hide();
        $('.SHARE_TAG_SHOW_LIST',parent).show();
    }

    $.ShareTagSave = function(share_id,obj)
    {
        var parent = $(obj).parents("#SHARE_TAGS_"+share_id);
        var tags = $.trim($('.SHARE_TAG',parent).val());
        var query = new Object();
		query.share_id = share_id;
        query.tags = tags;
		var btnTxt = $(obj).html();
		$(obj).html('');
		$.Show_Btn_Loading(obj);
		
		$.ajax({
			url: SITE_PATH+"services/service.php?m=share&a=savetag",
			type: "POST",
			cache:false,
			data:query,
			dataType: "json",
			success: function(result){
				$.Remove_Btn_Loading(obj);
				$(obj).html(btnTxt);
                $('.SHARE_TAG',parent).val(result.tags);
                $('.SHARE_TAG_LIST',parent).html(result.html);
                $('.SHARE_TAG_EDIT_BOX',parent).hide();
                $('.SHARE_TAG_SHOW_LIST',parent).show();
			}
		});
    }
	/*=====================分享标签END  =====================*/
	
	/*=====================主题BEGIN=====================*/
	$.Topic_Post_Save = function(obj)
	{
		if(!$.Check_Login())
			return false;
		
        var form = $(obj).parents("form").get(0);
		var module = $.trim(form.module.value);
		var action = $.trim(form.action.value);
		var url = SITE_PATH + 'services/service.php?m=' + module + '&a=' + action;
		var content = $.trim(form.content.value);
		if(content == '')
		{
			alert(LANG.post_content_require);
			return;	
		}
		
		$.Pub_Img_Sort(form);
		var butTxt = $(obj).val();
		
		$(obj).val('').addClass('pub_loading').attr("disabled",true);
		$.ajax({ 
			url: url,
			type: "POST",
			data:$(form).serialize(),
			cache:false,
			dataType: "json",
			success:function(result){
				$(obj).val(butTxt).removeClass('pub_loading').attr("disabled",false);
				if(result.status == 1)
				{
					$.Pub_Share_Reset(form);
					var share_item = $(result.html).css({"display":"none"});
					$("#SHARE_DETAIL_LiST").prepend(share_item);
					share_item.slideDown("slow");
				}
				else
					alert(LANG.pub_post_tip1);
			},
			error:function(){
				$(obj).val(butTxt).removeClass('pub_loading').attr("disabled",false);
				alert(LANG.pub_post_tip1);
			}
		});
    };
	/*=====================主题END  =====================*/
	
	/*=====================评论BEGIN=====================*/
	//删除评论
	$.Delete_Comment = function(comment_id,obj)
    {
        var query = new Object();
		query.comment_id = comment_id;

		$.ajax({
			url: SITE_PATH+"manage/manage.php?m=share&a=delcomment",
			type: "POST",
			cache:false,
			data:query,
			dataType: "json",
			success: function(result){
				if(result.status == 1)
					$("#COMMENT_" + comment_id).slideUp('slow');
			}
		});
    }
	/*=====================评论END  =====================*/
	
	//显示按钮loading
	$.Show_Btn_Loading = function(obj)
	{
		$(obj).attr("disabled",true);
		var html = '<img class="btn_loading_fanwe" src="'+ TPL_PATH +'images/btn_loading.gif" width="20" height="20" />';
		var width = $(obj).width();
		var height = $(obj).height();
		var top = $(obj).offset().top + (height - 20) / 2;
		var left = $(obj).offset().left + (width - 20) / 2;
		/*var zindex = parseInt($(obj).css('z-index'));
		if(isNaN(zindex))
			zindex = 0;
		zindex++;*/
		var zindex = 10000;
		$("body").append(html);
		$('.btn_loading_fanwe').css({"position":"absolute","left":left,"top":top,"z-index":zindex});
	}
	
	//删除按钮loading
	$.Remove_Btn_Loading = function(obj)
	{
		$(obj).attr("disabled",false);
		$('.btn_loading_fanwe').remove();
	}
	
	//字数统计
	$.Recount_Word = function(obj)
	{
		var form = obj.form;
		if(obj.getAttribute('length') == undefined)
			return false;
		
		var maxLength = obj.getAttribute('length');
		
		var cnt = $(obj).val();
		
		var length = cnt.length;
		if(length > maxLength)
		{
			cnt = cnt.substr(0,maxLength);
			$(obj).val(cnt);
			$(".WORD_COUNT",form).html(0);
		}
		else
		{
			var less = maxLength - length;
			$(".WORD_COUNT",form).html(less);
		}
	}
	
	//分享发布输入框绑定
	$.Pub_Count_Bind = function(obj)
	{
		var txt = $(obj);
		txt.attr({"position":txt.val().length});
		
		txt.bind('click', function(){
			txt.attr({"position":$(this).position()});
		});
		
		txt.bind('keyup', function(){
			txt.attr({"position":$(this).position()});
			if(this.getAttribute("cut") != 'false')
				$.Recount_Word(this);
		});
		
		if(txt.length > 0)
			$.Recount_Word(obj);
	}
	
	//获取光标位置
	$.fn.position = function(){
		var s,e,range,stored_range;
		if(this[0].selectionStart == undefined)
		{
			var selection=document.selection;
			if (this[0].tagName.toLowerCase() != "textarea")
			{
				var val = this.val();
				range = selection.createRange().duplicate();
				range.moveEnd("character", val.length);
				s = (range.text == "" ? val.length:val.lastIndexOf(range.text));
				range = selection.createRange().duplicate();
				range.moveStart("character", -val.length);
				e = range.text.length;
			}
			else
			{
				range = selection.createRange(),
				stored_range = range.duplicate();
				stored_range.moveToElementText(this[0]);
				stored_range.setEndPoint('EndToEnd', range);
				s = stored_range.text.length - range.text.length;
				e = s + range.text.length;
			}
		}
		else
		{
			s=this[0].selectionStart,
			e=this[0].selectionEnd;
		}
		var te=this[0].value.substring(s,e);
		return s;
	};
})(jQuery);

(function($){
	$.getStringLength=function(str)
	{
		str = $.trim(str);
		
		if(str=="")
			return 0; 
			
		var length=0; 
		for(var i=0;i <str.length;i++) 
		{ 
			if(str.charCodeAt(i)>255)
				length+=2; 
			else
				length++; 
		}
		
		return length;
	}
	
	$.getLengthString=function(str,length,isSpace)
	{
		if(arguments.length < 3)
			var isSpace = true; 
		
		if($.trim(str)=="")
			return "";
		
		var tempStr="";
		var strLength = 0;
		
		for(var i=0;i <str.length;i++) 
		{
			if(str.charCodeAt(i)>255)
				strLength+=2;
			else
			{
				if(str.charAt(i) == " ")
				{
					if(	isSpace)
						strLength++;	
				}
				else
					strLength++;
			}
				
			if(length >= strLength)
				tempStr += str.charAt(i);
		}
		
		return tempStr;
	}
	
	$.checkRequire = function(value){
		var reg = /.+/;
        return reg.test($.trim(value));
	}
	
	$.minLength = function(value, length , isByte) {
		var strLength = $.trim(value).length;
		if(isByte)
			strLength = $.getStringLength(value);
			
		return strLength >= length;
	};
	
	$.maxLength = function(value, length , isByte) {
		var strLength = $.trim(value).length;
		if(isByte)
			strLength = $.getStringLength(value);
			
		return strLength <= length;
	};
	
	$.rangeLength = function(value, minLength,maxLength, isByte) {
		var strLength = $.trim(value).length;
		if(isByte)
			strLength = $.getStringLength(value);
			
		return strLength >= minLength && strLength <= maxLength;
	}
	
	$.checkMobilePhone = function(value){
		return /^(13\d{9}|18\d{9}|15\d{9})$/i.test($.trim(value));
	}
	
	$.checkPhone = function(val){
  		var flag = 0;
		val = $.trim(val);
  		var num = ".0123456789/-()";
  		for(var i = 0; i < (val.length); i++)
		{
    		tmp = val.substring(i, i + 1);
    		if(num.indexOf(tmp) < 0)
      			flag++;
 		}
  		if(flag > 0)
			return true;
		else
			return false;
	}
	
	$.checkEmail = function(val){
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
		return reg.test(val);
	};
	
	$.checkUrl = function(val){
		var reg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/; 
        return reg.test(val);
	};
	
	$.checkCurrency = function(val){
		var reg = /^\d+(\.\d+)?$/; 
        return reg.test(val);
	};
	
	$.checkNumber = function(val){
		var reg = /^\d+$/; 
        return reg.test(val);
	};
	
	$.checkInteger = function(val){
		var reg = /^[-\+]?\d+$/; 
        return reg.test(val);
	};
	
	$.checkDouble = function(val){
		var reg = /^[-\+]?\d+(\.\d+)?$/; 
        return reg.test(val);
	};
	
	$.checkEnglish = function(val){
		var reg = /^[A-Za-z]+$/; 
        return reg.test(val);
	};
	
	$.checkQQMsn = function(val){
		var reg = /^[1-9]*[1-9][0-9]*$|^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; 
        return reg.test(val);
	};
})(jQuery);

jQuery(function($){
	$(".PUB_TXT[position]").each(function(){
		$.Pub_Count_Bind(this);
	});
	
	$("input[tooltip],textarea[tooltip]").each(function(){
		if($.trim(this.value) == '')
		{
			this.value = this.getAttribute('tooltip');
			$(this).addClass('tipcolor');
		}
	});
	
	$("input[tooltip],textarea[tooltip]").focus(function(){
		$(this).removeClass('tipcolor');
		var tooltip = this.getAttribute('tooltip');
		if(this.value == tooltip)
			this.value = '';
	}).blur(function(){
		$(this).removeClass('tipcolor');
		if($.trim(this.value) == '')
		{
			this.value = this.getAttribute('tooltip');
			$(this).addClass('tipcolor');
		}
	});
	
	$('.SHOW_BIG_PIC').live('mousemove', function(){
		$('.SHOW_BIG',this).show();
	}).live('mouseout', function(){
		$('.SHOW_BIG',this).hide();
	});
	
	$('.SHARE_MANAGE').live('mouseover', function(){
		clearTimeout(FANWE.SHARE_MANAGE);
		$(".SHARE_MANAGE_LIST_CLONE").remove();
		var list = $(this).parent().siblings(".SHARE_MANAGE_LIST");
		var clone = list.clone();
		var left = $(this).offset().left + 10;
		var top = $(this).offset().top + 20;
		var height = $('li',list).length * 20 + 4;
		$('body').append(clone);
		clone.addClass('t_m_l SHARE_MANAGE_LIST_CLONE').css({"left":left,"top":top,"height":height}).slideDown(100);
	}).live('mouseout', function(){
		clearTimeout(FANWE.SHARE_MANAGE);
		var fun = function(){
			$(".SHARE_MANAGE_LIST_CLONE").hide();	
		}
		FANWE.SHARE_MANAGE = setTimeout(fun,2000);
	});
	
	$(".SHARE_MANAGE_LIST_CLONE").live('mouseover', function(){
		clearTimeout(FANWE.SHARE_MANAGE);
		$(this).show();
	}).live('mouseout', function(){
		$(this).hide();
	});
	
	$(".PUB_SHARE_TAG_BOX li").live('click', function(){
		var form = $(this).parents("form");
		var tagInput = $('.PUB_SHARE_TAG',form);
		var tagValue = tagInput.val();
		tagValue = tagValue.replace('　',' ');
		tagValue = tagValue.replace(/ +/g,' ');
		tagValue = ' ' + $.trim(tagValue) + ' ';
		if($(this).hasClass('active'))
		{
			tagValue = tagValue.replace(' ' + $(this).html() + ' ',' ');
			$(this).removeClass('active');
		}
		else
		{
			tagValue += $(this).html();
			$(this).addClass('active');
		}
		
		tagValue = $.trim(tagValue);
		tagInput.val(tagValue);
	});
	
	if($("#back2top").length > 0)
	{
		var backtop = $("#back2top");
		var body_width = 960;
		body_width = $.browser.msie && $.browser.version == "6.0" ? 950 : 953;
		$("#back2top").css("left",Math.floor(($(window).width()-body_width)/2) + body_width + 5 + "px");
		$(window).scroll(function(){
			$(window).scrollTop()==0 ? backtop.fadeOut() : backtop.fadeIn()
		});
		
		$(window).resize(function(){
			var resize_width = Math.floor(($(window).width()-body_width)/2);
			if(resize_width > 10)
				backtop.css("left",resize_width + body_width + 5 + "px");
		});
	}
});