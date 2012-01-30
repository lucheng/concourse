var moodzt = "0";
var http_request = false;
function makeRequest(url, functionName, httpType, sendData) {

	http_request = false;
	if (!httpType) httpType = "GET";

	if (window.XMLHttpRequest) { // Non-IE...
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType('text/plain');
		}
	} else if (window.ActiveXObject) { // IE
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {}
		}
	}

	if (!http_request) {
		alert('Cannot send an XMLHTTP request');
		return false;
	}

	var changefunc="http_request.onreadystatechange = "+functionName;
	eval (changefunc);
	//http_request.onreadystatechange = alertContents;
	http_request.open(httpType, url, true);
	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	http_request.send(sendData);
}
function $() {
  var elements = new Array();

  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string')
      element = document.getElementById(element);

    if (arguments.length == 1)
      return element;

    elements.push(element);
  }

  return elements;
}
function get_cookie(Name) {
  var search = Name + "="
  var returnvalue = "";
  if (document.cookie.length > 0) {
    offset = document.cookie.indexOf(search)
    if (offset != -1) {
      offset += search.length
      end = document.cookie.indexOf(";", offset);
      if (end == -1)
      end = document.cookie.length;
      returnvalue=unescape(document.cookie.substring(offset, end))
    }
  }
  return returnvalue;
}
function get_mood(mood_id)
{
	//if(moodzt == "1") 
	if (get_cookie('wkmood'+infoid+'')==''+infoid+'')
	{
		alert("-_-|||，你不是表过态了嘛！？");
	}
	else {
		url ="http://"+window.location.host+root+"/index.php/Mood/update/aid/"+infoid+"/type/"+mood_id+"/random/" + Math.random();
		makeRequest(url,'return_review1','GET','');
		//moodzt = "1";
		document.cookie='wkmood'+infoid+'='+infoid+'';
	}
}
function remood()
{
	url ="http://"+window.location.host+root+"/index.php/Mood/index/aid/"+infoid+"/random/" + Math.random();
	makeRequest(url,'return_review1','GET','');
}
function return_review1(ajax)
{
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			var str_error_num = http_request.responseText;
			if(str_error_num=="error")
			{
				alert("信息不存在！");
			}
			else if(str_error_num==0)
			{
				alert("-_-|||，你不是表过态了嘛？!");
			}
			else
			{
				moodinner(str_error_num);
				//alert(str_error_num);
			}
		} else {
			alert('发生了未知错误!!');
		}
	}
}
function moodinner(moodtext)
{
	var imga = root+"/Public/Web/images/mood/pre_02.gif";
	var imgb = root+"/Public/Web/images/mood/pre_01.gif";
	var color1 = "#666666";
	var color2 = "#EB610E";
	var heightz = "80";	//图片100%时的高
	var hmax = 0;
	var hmaxpx = 0;
	var heightarr = new Array();
	var moodarr = moodtext.split(",");
	var moodzs = 0;
	for(k=0;k<8;k++) {
		moodarr[k] = parseInt(moodarr[k]);
		moodzs += moodarr[k];
	}
	for(i=0;i<8;i++) {
		heightarr[i]= Math.round(moodarr[i]/moodzs*heightz);
		if(heightarr[i]<1) heightarr[i]=1;
		if(moodarr[i]>hmaxpx) {
		hmaxpx = moodarr[i];
		}
	}
	$("moodtitle").innerHTML = "<span style='color: #555555;padding-left: 20px;'>请选择您看到这篇文章时的心情 已有<font color='#FF0000'>"+moodzs+"</font>人表态：</span>";
	for(j=0;j<8;j++)
	{
		if(moodarr[j]==hmaxpx && moodarr[j]!=0) {
			$("moodinfo"+j).innerHTML = "<span style='color: "+color2+";'>"+moodarr[j]+"</span><br><img src='"+imgb+"' width='20' height='"+heightarr[j]+"'>";
		} else {
			$("moodinfo"+j).innerHTML = "<span style='color: "+color1+";'>"+moodarr[j]+"</span><br><img src='"+imga+"' width='20' height='"+heightarr[j]+"'>";
		}
	}
}
document.writeln("<table width=\"528\" border=\"0\" cellpadding=\"0\" cellspacing=\"2\" style=\"font-size:12px;margin-top: 20px;margin-bottom: 20px;\">");
document.writeln("<tr>");
document.writeln("<td colspan=\"8\" id=\"moodtitle\"  class=\"left\"><\/td>");
document.writeln("<\/tr>");
document.writeln("<tr align=\"center\" valign=\"bottom\">");
document.writeln("<td height=\"60\" id=\"moodinfo0\"><\/td><td height=\"30\" id=\"moodinfo1\">");
document.writeln("<\/td><td height=\"30\" id=\"moodinfo2\">");
document.writeln("<\/td><td height=\"30\" id=\"moodinfo3\">");
document.writeln("<\/td><td height=\"30\" id=\"moodinfo4\">");
document.writeln("<\/td><td height=\"30\" id=\"moodinfo5\">");
document.writeln("<\/td><td height=\"30\" id=\"moodinfo6\">");
document.writeln("<\/td><td height=\"30\" id=\"moodinfo7\">");
document.writeln("<\/td><\/tr>");
document.writeln("<tr align=\"center\" valign=\"middle\">");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/0.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/1.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/2.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/3.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/4.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/5.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/6.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<td><img src='"+root+"/Public/Web/images/mood/7.gif' width=\"40\" height=\"40\"><\/td>");
document.writeln("<\/tr>");
document.writeln("<tr>");
document.writeln("<td align=\"center\" class=\"hui\">惊呀<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">欠揍<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">支持<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">很棒<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">愤怒<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">搞笑<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">恶心<\/td>");
document.writeln("<td align=\"center\" class=\"hui\">不解<\/td>");
document.writeln("<\/tr>");
document.writeln("<tr align=\"center\">");
document.writeln("<td><input onClick=\"get_mood(\'mood1\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood2\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood3\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood4\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood5\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood6\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood7\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<td><input onClick=\"get_mood(\'mood8\')\" type=\"radio\" name=\"radiobutton\" value=\"radiobutton\"><\/td>");
document.writeln("<\/tr>");
document.writeln("<\/table>")
remood();