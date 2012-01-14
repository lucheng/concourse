var registerAction={
		email:'',password:'',nickname:'',taobaoID:'',gender:'',
		blurEmailInput:function(){
			var emailaddress=$("#emailaddress").val();
			var offset=$('#emailaddress').position();
			var posTop=offset['top']-10;
			var posLeft=offset['left']+200;
			if(emailaddress.length==0){
				showStatusIconOnRegForm('emailaddress','warning');
				showMsgOnRegForm('notice','请填写有效的电子邮箱，该邮箱将成为你在美丽说的登录帐号，同时用于找回密码。',posTop,posLeft);
				return false;
			}
			if(!isEmail(emailaddress)){
				showStatusIconOnRegForm('emailaddress','wrong');
				showMsgOnRegForm('warning','电子邮箱格式有误，请重输！',posTop,posLeft);
				return false;
			}
			var checkUserExist=checkIfEmailExist(emailaddress);
			
			if(checkUserExist!=0){
				showStatusIconOnRegForm('emailaddress','wrong');
				showMsgOnRegForm('warning','这个邮箱已经注册过美丽说了，请输入其他邮箱。',posTop,posLeft);
				return false;
			}
			showStatusIconOnRegForm('emailaddress','good');
			hideMsgWarningOnRegForm();
			hideMsgOnRegFrom();
			registerAction.email=emailaddress;
			return true;
		},
		focusEmailInput:function(){
			registerAction.blurEmailInput();
			return false;
		},
		checkNicknameSymbol:function(nickname){
			return new RegExp("[ |:|：|@|#|\.|,|\!|\$|\%|\|\/]{1,}",'gi').test(nickname);
		},
		blurNicknameInput:function(){
			var nickname=$('#nickname').val().replace(/(^\s*)|(\s*$)/g,"");
			var isAT=this.checkNicknameSymbol(nickname);
			var offset=$('#nickname').position();
			var posTop=offset['top']-10;
			var posLeft=offset['left']+200;
			if(isAT==true){
				showStatusIconOnRegForm('nickname','wrong');
				showMsgOnRegForm('warning','支持中英文、数字、下划线，限长10个汉字。',posTop,posLeft);
				return false;
			}
			if(nickname.length==0){
				showStatusIconOnRegForm('nickname','warning');
				showMsgOnRegForm('notice','你喜爱的称呼，中英文下划线都可以。',posTop,posLeft);
				return false;
			}
			var nickname_length=checkStringLength(nickname);
			if(nickname_length>20){
				showStatusIconOnRegForm('nickname','wrong');
				showMsgOnRegForm('warning','支持中英文、数字、下划线，限长10个汉字。',posTop,posLeft);
				return false;
			}
			var checkUserExist=checkIfNickExist(nickname);
			if(checkUserExist=="5"||checkUserExist=="2"){
				showStatusIconOnRegForm('nickname','wrong');
				showMsgOnRegForm('warning','哎呀，这个昵称太受欢迎了，已经有爱美丽使用了，起个新的美丽昵称吧！',posTop,posLeft);
				return false;
			}
if(checkUserExist=="4"||checkUserExist=="3"){showStatusIconOnRegForm('nickname','wrong');showMsgOnRegForm('warning','支持中英文、数字、下划线，限长10个汉字。',posTop,posLeft);return false;}
showStatusIconOnRegForm('nickname','good');hideMsgWarningOnRegForm();hideMsgOnRegFrom();registerAction.nickname=nickname;return true;},focusNicknameInput:function(){registerAction.blurNicknameInput();return false;},blurPasswordInput:function(){var offset=$('#password').position();var posTop=offset['top']-10;var posLeft=offset['left']+200;var password=$("#password").val().replace(/(^\s*)|(\s*$)/g,"");if(password.length==0){showStatusIconOnRegForm('password','warning');showMsgOnRegForm('notice','6位到32位，英文字母、数字或符号。',posTop,posLeft);return false;}
if(password.length<6||password.length>32){showStatusIconOnRegForm('password','wrong');showMsgOnRegForm('warning','输入密码需在6位到32位之间。',posTop,posLeft);return false;}
showStatusIconOnRegForm('password','good');hideMsgWarningOnRegForm();hideMsgOnRegFrom();registerAction.password=password;return true;},focusPasswordInput:function(){registerAction.blurPasswordInput();return false;},blurVPasswordInput:function(){var password=$("#password").val().replace(/(^\s*)|(\s*$)/g,"");var offset=$('#confirm_password').position();var posTop=offset['top']-10;var posLeft=offset['left']+200;var confirm_password=$("#confirm_password").val().replace(/(^\s*)|(\s*$)/g,"");if(confirm_password.length==0){showStatusIconOnRegForm('confirm_password','warning');showMsgOnRegForm('notice','再输入一次密码',posTop,posLeft);return false;}
if(confirm_password.length<6||confirm_password.length>32){showStatusIconOnRegForm('confirm_password','wrong');showMsgOnRegForm('warning','输入密码需在6位到32位之间。',posTop,posLeft);return false;}
if(confirm_password!=password){showStatusIconOnRegForm('confirm_password','wrong');showMsgOnRegForm('warning','两次密码输入不一致，请重新输入',posTop,posLeft);return false;}
showStatusIconOnRegForm('confirm_password','good');hideMsgWarningOnRegForm();hideMsgOnRegFrom();return true;},focusVPasswordInput:function(){registerAction.blurVPasswordInput();return false;},blurTaoBaoID:function(){var taobaoID=$("#taobao_id").val().replace(/(^\s*)|(\s*$)/g,"");var offset=$('#taobao_id').position();var posTop=offset['top']-10;var posLeft=offset['left']+200;if(taobaoID.length==0){showStatusIconOnRegForm('taobao_id','warning');showMsgOnRegForm('notice','请放心填写真实的淘宝用户名，用来领取你的美丽奖金。我们保护你的隐私。',posTop,posLeft);return false;}
var ifTaobaoIDExist=checkIfTaobaoIDExist(taobaoID);if(ifTaobaoIDExist==0){showStatusIconOnRegForm('taobao_id','wrong');showMsgOnRegForm('warning','请填写你真实的淘宝用户名! 用来领取你的美丽奖金。我们保护你的隐私。',posTop,posLeft);return false;}
showStatusIconOnRegForm('taobao_id','good');hideMsgWarningOnRegForm();hideMsgOnRegFrom();registerAction.taobaoID=taobaoID;return true;},focusTaoBaoID:function(){registerAction.blurTaoBaoID();return false;},blurCheckcodeInputForNewReg:function(){hideMsgOnRegFrom();var offset=$('#checkcode').position();var posTop=offset['top']+1;var posLeft=offset['left']+258;showMsgOnRegForm('notice','输入验证码。',posTop,posLeft);},focusCheckcodeInputForNewReg:function(){registerAction.blurCheckcodeInputForNewReg();$('.bottom-left-t').css('width','105px');return false;},blurGenderRadio:function(){var offset=$('#genderM').position();var posTop=offset['top']-17;var posLeft=offset['left']+146;var genderM=$('#genderM').val();var genderF=$('#genderF').val();var gender='';if($('#genderM').attr('checked')==true){gender=genderM;}
if($('#genderF').attr('checked')){gender=genderF}
registerAction.gender=gender;if(gender==undefined||gender==''){showStatusIconOnRegForm('genderM','warning');showMsgOnRegForm('warning','你的性别。以后不能更改。',posTop,posLeft);return false;}
showStatusIconOnRegForm('genderM','good');hideMsgWarningOnRegForm();hideMsgOnRegFrom();return true;},focusGenderRadio:function(){var offset=$('#genderM').position();var posTop=offset['top']-17;var posLeft=offset['left']+146;showMsgOnRegForm('notice','你的性别。以后不能更改。',posTop,posLeft);registerAction.blurGenderRadio();showStatusIconOnRegForm('genderM','good');hideMsgWarningOnRegForm();hideMsgOnRegFrom();return false;},checkRegisterForm:function(){var boolCheck=false;boolCheck=registerAction.blurEmailInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurPasswordInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurVPasswordInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurNicknameInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurGenderRadio();if(boolCheck==false){return false;}
var checkcode=$("#checkcode").val();
var checkCodeEquals=verifyCheckCode(checkcode,'reg');
if(checkCodeEquals=="0"){
	var offset=$('#checkcode').position();
	var posTop=offset['top']+1;
	var posLeft=offset['left']+244;
	changeCheckCode();
	showStatusIconOnRegForm('checkcode','wrong');
	showMsgOnRegForm('warning','验证码输入错误。',posTop,posLeft);
	return false;
	}else{
		showStatusIconOnRegForm('checkcode','good');
	}
	var agreement=$("#agreement").attr("checked");if(agreement==false){var offset=$('#agreement').position();var posTop=offset['top']-10;var posLeft=offset['left']+200;showStatusIconOnRegForm('checkcode','wrong');showMsgOnRegForm('warning','需要同意美丽说服务使用协议。',posTop,posLeft);return false;}else{showStatusIconOnRegForm('agreement','good');}
	var invite_code=$('#invite_code').val();var inviter_id=$('#inviter_id').val();var inviter_name=$('#inviter_name').val();
	var follow=0;follow=$('#follow-mls-reg').attr('checked')?1:0;var from=$('#register-from').val();
	var data={
			'userLoginId':registerAction.email,
			'password':registerAction.password,
			'passwordVerify':registerAction.password,
			'nickname':registerAction.nickname,
			'gender':registerAction.gender,
			'checkcode':checkcode,
			'invite_code':invite_code,
			'inviter_id':inviter_id,
			'inviter_name':inviter_name,
			'follow':follow,
			'from':from
		};
		var url=server_url+"estore/control/createCustomer";
		var callback=function(t){
			if(t.success==false){
				$('#user_name_show').show();
				return false;
			}else{
				window.location.href="/estore/html/index.html";
			//	window.location.href=t;
			}
		};
		$.ajax({async:false,type:"POST",url:url,data:data,success:callback});
		return false;
	},

checkQzoneRegisterForm:function(){var boolCheck=false;boolCheck=registerAction.blurNicknameInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurGenderRadio();if(boolCheck==false){return false;}
var gender='nv';if($('#genderM').attr('checked')==true){gender='man';}
if(gender=='man'){setTimeout(function(){location.href='http://www.meilishuo.com/connect/wbfail/qzone';},10);return false;}
return true;},WeibocheckRegisterForm:function(){var boolCheck=false;boolCheck=registerAction.blurEmailInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurPasswordInput();if(boolCheck==false){return false;}
boolCheck=registerAction.blurVPasswordInput();if(boolCheck==false){return false;}
var data={'email':registerAction.email,'password':registerAction.password};var url=server_url+"users/ajax_updateWeiboUser";var callback=function(t){if(t=='1'){window.location.href="/settings/setPersonal";return false;}else{$('#success').hide();$('#failed').show();return false;}};$.ajax({async:false,type:"POST",url:url,data:data,success:callback});return false;},blurRealname:function(){hideMsgOnRegFrom();var offset=$('#realname').position();var posTop=offset['top']-10;var posLeft=offset['left']+193;if($('#realname').val().length==0){showMsgOnRegForm('notice','是参加活动、领取奖金的凭证，他人不可见，美丽说保护你的隐私。',posTop,posLeft);showStatusIconOnRegForm('realname','warning');return false;}else{showStatusIconOnRegForm('realname','ok');return true;}},focusRealname:function(){registerAction.blurRealname();return false;},blurBirth:function(){hideMsgOnRegFrom();var offset=$('#birthday').position();var posTop=offset['top']-10;var posLeft=offset['left']+193;if($('#birthday').val().length==0){showMsgOnRegForm('notice','生日当天登录美丽说，会有惊喜哦！',posTop,posLeft);return false;}else{return true;}},focusBirth:function(){registerAction.blurBirth();return false;},singleCheckBoxChange:function(item){if(!item.attr('checked')){$('#select_all').removeAttr('checked');}
return false;},selectAll:function(selectAll){if(selectAll.attr('checked')){$('.register3 .groupBox .chk').attr('checked','checked');}
return false;},groupTabClick:function(tab){$('.register3 ul li').removeClass('active').eq(tab).addClass('active');if($('#group-'+tab).hasClass('loaded')){$('#group-'+tab).removeClass('none').siblings('div.grid_9').addClass('none');}
else{$.ajax({url:server_url+'users/ajax_get_groups_html',data:{'tab':tab},success:function(ret){$('#group-'+tab).html(ret).removeClass('none').addClass('loaded').siblings('div.grid_9').addClass('none');}});}},checkRegisterFormExtInfo:function(){var realname=$('#realname').val();var birthday=$('#birthday').val();var provinceid=$('#provinceid').val();var cityid=$('#cityid').val();var userId=$('#user_id').val();var boolCheck=false;boolCheck=registerAction.blurRealname();if(boolCheck==false){return false;}
boolCheck=registerAction.blurBirth();if(boolCheck==0){return false;}
if(provinceid==0){var offset=$('#cityid').position();var posTop=offset['top']-10;var posLeft=offset['left']+220;showMsgOnRegForm('warning','请选择所在的省',posTop,posLeft);return false;}
if(cityid=='所在城市'){var offset=$('#cityid').position();var posTop=offset['top']-10;var posLeft=offset['left']+220;showMsgOnRegForm('warning','请选择所在的城市',posTop,posLeft);return false;}
var data={'realname':realname,'birthday':birthday,'provinceid':provinceid,'cityid':cityid,'user_id':userId};var url=server_url+"users/ajax_createNewUserExtInfo";var callback=function(t){window.location=t;};$.post(url,data,callback);return false;}};function showMsgOnRegForm(msgType,msgContent,posTop,posLeft){hideMsgOnRegFrom();var msgID;if(msgType=='notice'){msgID='regNotice';}else{msgID='regWarning';}
$('#'+msgID+' .messageBox').html(msgContent);$('#'+msgID).css('left',posLeft);$('#'+msgID).css('top',posTop);$('#'+msgID).show();$('.bottom-left-t').css('width','158px');$('.bottom-left-w').css('width','158px');}
function hideMsgOnRegFrom(){$('#regNotice').hide();}
function hideMsgWarningOnRegForm(){$('#regWarning').hide();}
function showStatusIconOnRegForm(currentObj,iconType){var obj=$('#'+currentObj).parents('.inputBox').parents('.oneline').find('.hints');obj.css("width",'25px');obj.css("height",'25px');if(iconType=='wrong'){obj.css("background","url('"+pictureBaseUrl+"css/images/register/wrong.gif')");}else if(iconType=='warning'){obj.css("background","url('"+pictureBaseUrl+"css/images/register/warning.gif')");}else{obj.css("background","url('"+pictureBaseUrl+"css/images/register/good.gif')");}
return true;}
function keydown(){$('#emailaddress_hint').hide();var $input=$('#emailaddress');if($input.val()=="请输入注册时使用的邮箱"){$input.val('');$input.css('color','black')}
if($input.val()!="请输入注册时使用的邮箱"&&$input.val()!="")
{$input.css('color','black');}
return true;}
function dingti(){var $ti=$('#yincang_gzq');$ti.hide();}
function showHintInfo(section,info){$(section).html(info);$(section).show();}