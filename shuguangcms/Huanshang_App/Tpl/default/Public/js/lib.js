/*浮动效果*/
$(function(){
	//符合web标准且可关闭的多幅对联广告
	lastScrollY = 0;
	function heartBeat(){
	 var diffY;
	 if (document.documentElement && document.documentElement.scrollTop)
	  diffY = document.documentElement.scrollTop;
	 else if (document.body)
	  diffY = document.body.scrollTop
	 percent=.1*(diffY-lastScrollY);
	 if(percent>0){
	  percent=Math.ceil(percent);
	 }
	 else{
	  percent=Math.floor(percent);
	 }
	 
	 if (document.getElementById("rightDiv")) document.getElementById("rightDiv").style.top = parseInt(document.getElementById("rightDiv").style.top)+percent+"px";
	 lastScrollY=lastScrollY+percent;
	}
	//下面这段删除后，对联将不跟随屏幕而移动。
	window.setInterval("heartBeat()",1);
	//关闭按钮
	function close_left(){
	    document.getElementById('left1').style.visibility='hidden';
	}
	function close_right(){
	    document.getElementById('right1').style.visibility='hidden';
	}
	//设置样式
	document.writeln("<style type=\"text\/css\">");
	document.writeln("#leftDiv,#rightDiv{position:absolute;z-index:1000;}");
	document.writeln("<\/style>");
	//------左侧开始
	//document.writeln("<div style=\"display:none\" id=\"leftDiv\" style=\"top:100px;left:5px\">");
	//document.writeln("<div id=\"left1\">");
	//document.writeln("<a href=\"javascript:close_left();\">点击我关闭<\/a>");
	//document.writeln("<\/div>");
	//document.writeln("<\/div>");
	//------左侧结束，右侧开始
	//计算时间，凌晨1点到8点不显示
	var dd = new Date();
	var hour = dd.getHours();
	 
	if(hour>=8||hour<1){
	document.writeln("<div id=\"rightDiv\" style=\"top:215px;right:5px\">");
	document.writeln("<div id=\"right1\">");
	document.writeln("<a href='/Help12.php' target=\'_blank\'><img src=\"/img/zxfd.jpg\" border=0 height=150 width=33><\/a>");
	document.writeln("<\/div>");
	document.writeln("<\/div>");
	}
});