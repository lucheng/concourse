// JavaScript Document
var myul=document.getElementById("myul");
var lilist=myul.childNodes;
var alertstr="";
for(var str in lilist){
	if(lilist[str].id=="menu"+value){
		lilist[str].style.background="url(../images/index/bg.jpg) repeat-x";
	}
	if(lilist[str].nodeName=="LI" && lilist[str].id!="menu"+value){
		if(lilist[str].addEventListener){
			lilist[str].addEventListener("mouseover",mover,false);
			lilist[str].addEventListener("mouseout",mover,false);
		}else if(lilist[str].attachEvent){
			lilist[str].attachEvent("onmouseover",mover);
			lilist[str].attachEvent("onmouseout",mover);
		}else{
			lilist[str].onmouseover=mover;
			lilist[str].onmouseout=mover;
		}
	}
}
function mover(event){
	var target=(event.currentTarget || event.srcElement);
	if(target.nodeName=="A"){
		target=target.parentNode;
	}
	if(event.type=="mouseover"){
		target.style.background="url(../images/index/bg.jpg) repeat-x";
	}else{
		target.style.background="url(../images/index/2.jpg) repeat-y";
	}
}