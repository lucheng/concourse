function copyLink(){var clip=new ZeroClipboard.Client();ZeroClipboard.setMoviePath(server_url+'css/ZeroClipboard.swf');var html=clip.getHTML(150,20);document.write(html);var link=$("#invite_link").val();clip.setText(link);clip.glue('d_clip_button','next_step_box');}
function checkRealnameForm(){var realname=$.trim($('#realname').val());if(realname.length==0){$('#realname_panel .hint').text('不能为空').show();return false;}
return true;}
function showBindPanel(type,obj){var getSettings=function(){$.ajax({async:false,type:"POST",url:'/settings/ajax_getSyncSettings',data:{'type':type},success:function(data){var settings=data.split(',');if(settings.length>=5){$('#syncForm :checkbox').attr('checked','');if(settings[0]==1){$('#chk_goods').attr('checked','checked');}
if(settings[1]==1){$('#chk_collect').attr('checked','checked');}
if(settings[2]==1){$('#chk_like').attr('checked','checked');}
if(settings[3]==1){$('#chk_ask').attr('checked','checked');}
if(settings[4]==1){$('#chk_answer').attr('checked','checked');}}
$('#setting_type').val(type);var o=$(obj);var offset=o.offset();$('#setting_panel').css({left:offset.left+o.width()+50,top:offset.top-110}).show();}});};if(type!='renren'||renren_allow_publish_feed){getSettings();}else{if(XN.Connect==null){setTimeout(function(){showBindPanel('renren',obj);},1000);return;}
XN.Connect.requireSession(function(){XN.Connect.showPermissionDialog('publish_feed',function(result){if(result){renren_allow_publish_feed=true;getSettings();}else{alert('允许授权后才可以使用同步新鲜事功能');}});});}}
function syncBind(type){if(type=='renren'&&renren_allow_publish_feed==false){XN.Connect.requireSession(function(){XN.Connect.showPermissionDialog('publish_feed',function(result){if(result){location.href='/settings/syncBind/renren';}else{alert('允许授权后才可以使用同步新鲜事功能');}});});}else if(type=='weibo'){var follow='';follow=$('#follow-mls').attr('checked')?1:0;location.href='/settings/syncBind/'+type+'?follow='+follow;}else{location.href='/settings/syncBind/'+type;}
return false;}
function syncUnBind(type){if(confirm('你确定要解除绑定吗？')){location.href='/settings/syncUnBind/'+type;}
return false;}
function checktradeid(){var trade_id=$('#trade_id').val().trim();var re=/^[0-9]+.?[0-9]*$/;if(trade_id==''||!re.test(trade_id)){alert('请填写正确的交易号！');return false;}
return true;}
function zhifubao(){var alipay=$('#alipay').val().trim();var taobaoid=$('#taobao_id').val().trim();if(alipay==''){$('#account-hint').html('支付宝账号不能为空！');return false;}
if(taobaoid==''){$('#account-hint').html('淘宝账户名不能为空！');return false;}
var url=server_url+'/settings/ajax_setBenefitAction';var data={'alipay':alipay,'taobao_id':taobaoid};var callback=function(r){if(r==1){$('#account-hint').html('修改成功！');}else{$('#account-hint').html('你已经保存成功了！');}}
$.post(url,data,callback);}
function getcash(){var alipay=$('#alipay').val().trim();var taobaoid=$('#taobao_id').val().trim();var realname=$('#realname').val().trim();if(alipay==''){$('#account-hint').html('支付宝账号不能为空！');return false;}
if(taobaoid==''){$('#account-hint').html('淘宝账户名不能为空！');return false;}
if(realname==''){$('#account-hint').html('真实姓名不能为空！');return false;}
return true;}
function syncSubmit(){$('#syncForm').ajaxSubmit({success:function(data){alert(data);}});return false;}
var $applyWindow=null;function showApplyWindow(tid,gid){if($applyWindow==null){$applyWindow=$.dialog({title:'填写交易信息',content:$('#pop_apply_content').show(),closeHandle:function(){$(this).closest('.dialog').hide();}});}
$('#twitter_id').val(tid);$('#goods_id').val(gid);$('#trade_id').val('');var $img=$('#t'+tid+' .goods_pic');var imgSrc=$img.attr('src');var goodsTitle=$img.attr('alt');var url='{/$BASE_URL/}person/showTwitterPage?t='+tid;$applyWindow.find('.pic').attr('href',url).find('img').attr('src',imgSrc);$applyWindow.find('.goods_title').attr('href',url).text(goodsTitle);$applyWindow.toCenter().show();$('#trade_id').focus();}
function postApplyForm(url,data,type){var trade_id=$.trim($('#trade_id').val());if(trade_id==''){alert('交易号不能为空');return false;}
data.trade_id=trade_id;$.post(url,data,function(data){if(data=='1'){if(type==1){$('.dialog').hide();var closeFunc=function(){location.href=location.href;};$('#pop_apply_finish .ok').click(closeFunc);$.dialog({title:'美丽提示',content:$('#pop_apply_finish').show(),closeHandle:closeFunc}).toCenter().show();showShadow();}else{location.href=location.href;}}else{alert(data);}});}
function addApply(tid,gid){showApplyWindow(tid,gid);$('#pop_apply_content').find('.submit').unbind('click').click(function(){postApplyForm('/commission/ajax_addApply',{'tid':tid,'gid':gid},1);});}
function updateApply(applyId,tid,gid){showApplyWindow(tid,gid);$('#pop_apply_content').find('.submit').unbind('click').click(function(){postApplyForm('/commission/ajax_updateApply',{'apply_id':applyId},2);});}
function reSubmitApply(applyId,tid,gid){showApplyWindow(tid,gid);$('#pop_apply_content').find('.submit').unbind('click').click(function(){postApplyForm('/commission/ajax_reSubmitApply',{'apply_id':applyId},3);});}
$(function(){$('#taobao_id_update').click(function(){$('#discount_stat').hide();$('#pay_info').show();$('#taobao_id').focus();});$('#alipay_update').click(function(){$('#discount_stat').hide();$('#pay_info').show();$('#alipay').focus();});$('#realname_update').click(function(){$('#discount_stat').hide();$('#pay_info').show();$('#alipay').focus();});$('#payme').click(function(){$(this).hide().after('...');$.post('/commission/ajax_payme',{},function(data){if(data==''){$.dialog({title:'美丽提示',content:$('#pop_payme').show(),closeHandle:function(){location.href=location.href;}}).toCenter().show();}else{alert(data);location.href=location.href;}});});});