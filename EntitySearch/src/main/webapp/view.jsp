<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <script type="text/javascript" src="Scripts/jquery-1.4.1-vsdoc.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="Scripts/result.js"></script>
    <script type="text/javascript" src="Scripts/edit.js"></script>
    <script type="text/javascript" src="Scripts/general.js"></script>
    <script type="text/javascript">
        $(function () {
            if ($(".container").height() + $(".footer-wrapper").height() < $(window).height()) {
                $(".container").css("min-height", $(window).height() - $(".footer-wrapper").height() + "px");
            }
        });

        $(window).resize(function () {
            if ($(".container").height() + $(".footer-wrapper").height() < $(window).height()) {
                $(".container").css("min-height", ($(window).height() - $(".footer-wrapper").height()) + "px");
            }
        });

        function saveCurrent() {
            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
            if (tokenStr == null
                || tokenStr == ""
                || tokenStr.length != 32) {
                window.location.href = "editing.aspx";
            }

            $("#SaveInFixedPanel").text("...");

            //post
            jQuery.post("handles/view.ashx", { func: 'view.save', token: tokenStr }, function (result) {
                if (result == "-1") {
                    alert("ERROR: 更新数据失败！");
                    $("#SaveInFixedPanel").text("保存");
                    return;
                } else if (result == "-2") {
                    window.location.href = "login.aspx?issave=1&token=" + tokenStr;
                } else {
                    window.location.href = "view.aspx?id=" + result;
                }
            });

            return false;
        }
        
    </script>
    
    <script type="text/javascript">
        var gGeneralLoadingDisplay = "<div><img alt='Loading' src='App_Themes/cn/images/Progress.gif' /> 正在加载... </div>";
        
        var jsReady = false;
        var swfReady = false;
        var entityname = "谷歌";
        var entityid = 5134492;
        var requestid = 5134492;

        var peoplePerPage = 5;
        var peopleTotalCount = 1;

        var webPerPage = 5;
        var webTotalCount = 0;

        var orgPerPage = 5;
        var orgTotalCount = 0;

        var tagPerPage = 5;
        var tagTotalCount = 0;

        var locPerPage = 5;
        var locTotalCount = 0;

        function isReady() {
            return jsReady;
        }

        function swfIsReady() {
            swfReady = true;
        }

        function shortenDisplayURL(url) {
            if (url.indexOf("http://") != -1) {
                url = url.substr(7);
            }

            if (url.length > 50) {
                url = url.substr(0, 50) + "...";
            }

            return url;
        }

        function recommendWebpage(){
            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
            if($("#recwebpage").is(':visible')){
                $("#recpage-ul").html(gGeneralLoadingDisplay);
                jQuery.post("handles/view.ashx",
                        { func: 'webpage.rec', query: requestid, token: tokenStr},
                        OnWebpageRecommendComplete, "json");
            }
        }

        function OnWebpageRecommendComplete(result) {
            var html = "";

            if (result != null && result.length > 0) {
                for (var i = 0; i < result.length; i++) {
                    html += RenderWebpageRec(result[i]);
                }
            }

            $("#recpage-ul").html(html);           
        }

        function saveClick() {
            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());

            //post
            jQuery.post("handles/view.ashx", { func: 'view.save', token: tokenStr, query: entityid }, function (result) {
                if(result == "-1") {
                    alert("ERROR: 更新数据失败！");
                    return;                   
                } else {
                    location.reload(true);
                }
            });
        }

        function addrec(hashid){
            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
            var ehash = hashid;

            //post
            jQuery.post("handles/view.ashx", { func: 'webpage.operation', token: tokenStr, cid: entityid, hid: ehash, op: "addrec" }, function (result) {
                if (null == result) {
                    alert("ERROR: 更新数据失败！");
                    return;
                }

                $(".viewSaveBtn").show();

                //append the prev one to selected
                if(result.Item2 != null) {
                    var maxSeqNumber = getMaxSeqNumber("selectedpage") + 1;
                    if(maxSeqNumber == 0) {
                        $("#selectedpage_header").show();
                        $("#webpage-panel").show();
                    }
                    
                    var url = result.Item2.Url;
                    var high = result.Item2.Snippet;
                    var highTitle = result.Item2.Title;

                    //render & append
                    var html = "";
                    html += "<div class=\"selectedpage view-clip\" seq=\"" + maxSeqNumber + "\">";
                    html += "<div class=\"view-title\">";
                    html += "<a href=\"" + url + "\" target=\"_blank\">";
                    html += "" + highTitle + "</a></div>";
                    html += "<div class=\"view-desp\">" + high + "</div>";
                    html += "<div class=\"view-url\">" + url + "</div>";
                    html += "</div>";

                    $("#webpage-panel").append(html);
                    webTotalCount ++;
                    changePage("selectedpage",1,webPerPage,webTotalCount);
                }

                //remove the old item
                $(".webpagerec[hashid='" + hashid + "']").remove();

                //add new item to recommend
                if(result.Item1 != null){
                    var html = RenderWebpageRec(result.Item1);
                    $("#recpage-ul").append(html);
                }

                refreshCurrentEdition();
            }, "json");
            return false;
        }

        function getMaxSeqNumber(clsName){
            var currMax = -1;
            $("." + clsName).each(function(){
                if($(this).attr("seq")) {
                    var seq = parseInt($(this).attr("seq"),10);
                    if(seq > currMax){
                        currMax = seq;
                    }
                }
            });

            return currMax;
        }

        function toggleBio() {
            var txt = $(".bio-control").text();
            if(txt.indexOf("收起") != -1) {
                $(".bio-person-singleitem-wrapper").hide();
                $(".bio-person-singleitem-wrapper").first().show();
                $(".bio-control").text("更多");
            } else {
                $(".bio-person-singleitem-wrapper").show();
                $(".bio-control").text("收起");
            }
        }

        function addpeople(id,name,hash) {
            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
            var ehash = hash;

            //post
            jQuery.post("handles/view.ashx", { func: 'recommend.people.select', token: tokenStr, cid: entityid, hash: ehash, type: "1" }, function (result) {
                if (null == result) {
                    alert("ERROR: 更新数据失败！");
                    return;
                }

                $(".viewSaveBtn").show();

                //append the prev one to selected
                if(result.Item2 != null ) {
                    var rl = result.Item2;
                    var rlname = rl.Name;
                    var rllabel = rl.Label;
                    var key = rlname;
                    if (rl.Tags.length != 0)
                        key += "+" + rl.Tags[0].Tag;

                    var seqNumber = getMaxSeqNumber("profile-related-people-item") + 1;
                    if(seqNumber == 0) {
                        $("#relation_panel_header").show();
                        $("#relation_panel").show();
                    }

                    var html = "<li class=\"profile-related-people-item\" seq=\"" + seqNumber + "\">";
                    html += "<a href=\"view.aspx?id=" + rl.Id + "\" class=\"profile-related-image\">";
                    html += "<img width=\"48px\" height=\"48px\" src=\"./App_Themes/cn/images/people.png\"/>";
                    html += "</a>";

                    html += "<div class=\"related-people-info\"><span class=\"related-people-info-name\">";
                
                    if(rl.Id != "-1") {
                        html += "<a href=\"view.aspx?id=" + rl.Id + "\">";
                    }
                    html += rl.Name;
                    if(rl.Id != "-1") {
                        html += "</a>";
                    }

                    html += "</span>";
                    html += "<span class=\"related-people-info-label\">" + rl.Label + "</span>";
                    html += "<div class=\"related-people-info-rel\">";

                    if (rl.Tags.length != 0)
                    {
                        for (var j = 0; j < rl.Tags.length && j < 3; j++)
                        {
                            html += ("<a class=\"info-rel-tag\">" + rl.Tags[j].Tag + "</a>");
                        }
                    }

                    html += "</div>";
                    html += "<div class=\"related-block-info\" kw=\"" + key + "\"></div>";

                    html += "</div>";
                    html += "<div class=\"view-splitter\"></div>";
                    html += "</li>";

                    $("#select-per").append(html);
                    peopleTotalCount++;
                    changePage("profile-related-people-item",1,peoplePerPage,peopleTotalCount,"FindRelatedBlockForAll()");
                    FindRelatedBlock(key,"related-block-info");
                }

                //remove the old item
                $(".profile-recommend-people-item[hashcode='" + hash + "']").remove();
                
                //add new item to recommend
                if (result.Item1 != null) {
                    var rl = result.Item1;

                    var html = "<li class=\"profile-recommend-people-item\" seq=\"0\" hashcode=\"" + rl.Hash + "\">";
                    html += "<div style=\"min-height:30px\">";
                    html += "<img width=\"25px\" height=\"25px\" src=\"./App_Themes/cn/images/people_small.png\" style=\"float:left\"/>";
                    html += "<div class=\"recommend-people-info\">";
                    html += "<span class=\"related-people-info-name\">";
                    
                    if(rl.Id != "-1") {
                        html += "<a href=\"view.aspx?id=" + rl.Id + "\">";
                    }
                    html += rl.Name;
                    if(rl.Id != "-1") {
                        html += "</a>";
                    }

                    html += "</span><span class=\"related-people-info-label\">" + rl.Label + "</span><div class=\"related-people-info-rel\"></div></div>";
                    html += "<div class=\"recommend-tool\"><a href=\"#\" onclick=\"return addpeople(" + rl.Id +",'" + rl.Name + "'," + rl.Hash + ");\"><span class=\"addpeopleBtnSpan\"></span></a></div>";
                    html += "</div>";
                    html += "<div class=\"related-block-info\" kw=\"" + rl.Name + "\"></div>";
                    html += "";
                    html += "</li>";

                    $("#rec-ul").append(html);

                    FindRelatedBlock(rl.Name,"related-block-info","2","60");
                }

                refreshCurrentEdition();
            }, "json");

            return false;
        }

        function RenderWebpageRec(wikiWebpage) {
            var html = "<div class=\"webpagerec view-clip\" hashid=\"" + wikiWebpage.HashID + "\">";

            html += "<div class=\"web-add\">";
            html += "<a href=\"#\" onclick=\"return addrec(\'" + wikiWebpage.HashID + "\');\"><span class=\"addpeopleBtnSpan\"></span></a>";
            html += "</div>";

            html += "<div class=\"view-title\">";
            html += "<a target=\"_blank\" href=\"" + wikiWebpage.Url + "\">" + wikiWebpage.Title + "</a>";
            html += "</div>";
            html += "<div class=\"view-desp\">" + wikiWebpage.Snippet + "</div>";
            html += "<div class=\"view-url\">";
            html += "" + shortenDisplayURL(wikiWebpage.Url) + "";
            html += "<span class=\"web-opr\">";
            html += "</span>";
            html += "</div>";
            html += "</div>";
            return html;           
        }



        $(document).ready(function () {
            jsReady = true;

            recommendWebpage();
            //$(".twLineEditIcon").hide();
            
            changePage("profile-related-people-item",1,peoplePerPage,peopleTotalCount,"FindRelatedBlockForAll()");
            changePage("profile-related-org-item",1,orgPerPage,orgTotalCount,"FindRelatedBlockForAllOrg()");
            changePage("profile-related-loc-item",1,locPerPage,locTotalCount,"FindRelatedBlockForAllLoc()");
            changePage("selectedpage",1,webPerPage,webTotalCount);
            changePage("view-tag-item",1,tagPerPage,tagTotalCount);

            $(".twoLineDescPerLine").hover(function() {
                //$(this).children(".twLineEditIcon").show();
            },function(){
                //$(this).children(".twLineEditIcon").hide();
            });

            $(".twLineEditIcon").live('click',function() {
                return editLabel('谷歌','');
            });
            $(".twoLineDescPerLine").live('click',function() {
                return editLabel('谷歌','');
            });

            $(".bio-control").click(function(){
                toggleBio();
            });
            
            shortenDesc();

            toggleBio();
        });

        function FindRelatedBlockForAll() {
            $(".related-block-info:visible").each(function () {
                if ($.trim($(this).html()) == "") {
                    FindRelatedBlock($(this).attr("kw"),"related-block-info",$(this).attr("ul"),$(this).attr("ss"));
                }
            });
        }

        function FindRelatedBlockForAllOrg() {
            $(".related-block-info-org:visible").each(function () {
                if ($.trim($(this).html()) == "") {
                    FindRelatedBlock($(this).attr("kw"),"related-block-info-org",$(this).attr("ul"),$(this).attr("ss"));
                }
            });
        }

        function FindRelatedBlockForAllLoc() {
             $(".related-block-info-loc:visible").each(function () {
                if ($.trim($(this).html()) == "") {
                    FindRelatedBlock($(this).attr("kw"),"related-block-info-loc",$(this).attr("ul"),$(this).attr("ss"));
                }
            });  
        }

        function FindRelatedBlock(relatedname,cls,sul,sss) {
            if(sul == null) sul = "1";
            if(sss == null) sss = "";

            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
            var blockquery = "\"" + entityname + "\"+\"" + relatedname.replace(/\+/g,'"+"') + "\"";
            jQuery.post("handles/view.ashx", { func: 'related.block', count: "1", query: blockquery, id: requestid, tk: tokenStr, ul: sul, ss: sss }, function (result) {
                if (null == result) return;
                if(result == "")
                    result = "&nbsp;";
                $("." + cls + "[kw='" + relatedname + "']").html(result);
            }, "text");
        }

        function pageString(currPage,cnt,perpage,itemclass,callback) {
            var html = "";
            if(cnt == 0)
                return html;
            var totalPage = Math.ceil(cnt / perpage);
            
            var showStart = currPage>3?(currPage-2):1;
            var showEnd = (currPage + 2)>totalPage?totalPage:(currPage + 2) //showStart + showPageCount;
            
            if(showStart == 1 && showEnd != totalPage)
            {
                showEnd = (showStart + 4) > totalPage ? totalPage : (showStart + 4);
            } else if(showEnd == totalPage && showStart != 1)
            {
                showStart = (showEnd - 4) > 1 ? (showEnd - 4) : 1;
            }

            if(currPage != 1 ) {
                //html += "<a href=\"#\" onclick=\"return changePage('" + itemclass + "'," + "1" + "," + perpage + "," + cnt + ",'" + callback + "');\">" + "<span class=''></span>" + "</a>";
                html += "<a href=\"#\" onclick=\"return changePage('" + itemclass + "'," + (currPage - 1) + "," + perpage + "," + cnt + ",'" + callback + "');\">" + "<span class='view-prepage' style='width:6px;'>&nbsp;</span>" + "</a>";
            }

            for(var i=showStart;i<=showEnd;i++) {
                if(i == currPage) {
                    if(showEnd == i && i == 1)
                        html += "<span class=\"current pagehide\">" + i + "</span>";
                    else    
                        html += "<span class=\"current\">" + i + "</span>";
                } else {
                    html += "<a href=\"#\" onclick=\"return changePage('" + itemclass + "'," + i + "," + perpage + "," + cnt + ",'" + callback + "');\">" + i + "</a>";
                }
            }

            if(currPage != totalPage) {
                html += "<a href=\"#\" onclick=\"return changePage('" + itemclass + "'," + (currPage + 1) + "," + perpage + "," + cnt + ",'" + callback + "');\">" + "<span class='view-nextpage' style='width:6px;'>&nbsp;</span>" + "</a>";               
                //html += "<a href=\"#\" onclick=\"return changePage('" + itemclass + "'," + totalPage + "," + perpage + "," + cnt + ",'" + callback + "');\">" + "末" + "</a>";
            }

            return html;
        }

        function changePage(itemclass,topage,perpage,cnt,callback) {
            $("." + itemclass).each(function(){
                var seqstr = $(this).attr("seq");
                var seqnum = parseInt(seqstr);
                if(seqnum >= ((topage-1) * perpage) && seqnum < ((topage) * perpage)) {
                    $(this).show();
                    if(seqnum == (((topage) * perpage) -1)){
                        //$(this).children(".view-splitter").addClass("pagehide");
                    }
                } else {
                    $(this).hide();
                }
            });

            //$("." + itemclass + ":last").children(".view-splitter").addClass("pagehide");

            //handle page str
            $("." + itemclass + "-page").html(pageString(topage,cnt,perpage,itemclass,callback));
            
            if(callback != null) {
                eval(callback);    
            }

            return false;
        }

        function bigGraph() {
            //Redirect
            if(entityid != -1) {
                window.location.href = "GuanxiMap.aspx?query=" + entityid;
                return;
            }else{
                var fullQueryString = 5134492 + ":" + $.trim($('#editTokenInvisibleContainer').text());
                var w = 500, h = 500, xh = 500;
                var x = $(window).width() / 2 - w / 2;
                var y = $(window).height() / 2 - xh / 2;
                //show dialog
                graphDialog(w + 'px', h + 'px', xh + 'px', x + 'px', y + 'px');

                $(gGraphDialogTitleSelector).html("&nbsp;");

                var initHTML = ['<object width="' + w +'px" height="' + h + 'px" bgcolor="#000000" id="visualizedSearch" data="asset/visualizedSearch.swf" type="application/x-shockwave-flash" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">',
                                '<param value="asset/visualizedSearch.swf" name="movie">',
                                '<param name="quality" value="high" />',
                                '<param name="bgcolor" value="#000000" />',
                                '<param value="sameDomain" name="allowScriptAccess">',
                                '<param value="false" name="allowFullScreen">',
                                '<param name="wmode" value="Opaque">',
                                '<param value="asset/visualizeSearchViewBigConfig.xml" name="configUrl" />',
                                '<param value="isSearch=true&amp;configUrl=asset/visualizeSearchViewBigConfig.xml&amp;query=' + fullQueryString + '" name="FlashVars">',
                                '<embed src="asset/visualizedSearch.swf" quality="high" bgcolor="#000000" width="' + w + 'px" height="' + h + 'px" name="visualizedSearch" align="middle" play="true" loop="false" vmode="Opaque" quality="high" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" ',
                                'flashvars="isSearch=true&amp;configUrl=asset/visualizeSearchViewBigConfig.xml&amp;query=' + fullQueryString + '" pluginspage="http://www.macromedia.com/go/getflashplayer">',
                                '</embed>',
                                '</object>'].join('');

                $(gGraphDialogContentSelector).html(initHTML);
            }
        }

        function previewSave() {
            saveCurrent();
            return false;
        }

        function previewReturn() {
            window.location.href = "/editper.aspx?token=ac9a4228902de26a113a2462ac7f1c3d&type=3&id=5134492";
            return false;
        }

    </script>
    <style type="text/css">
        *
        {
            font-family: 微软雅黑,黑体,宋体;
        }
        .previewSection
        {
            background-color: #FEE37A;
            border: 1px solid #C6E4F2;
            border-radius: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border: 0px solid #ffbf00;
            margin-bottom: 30px;
            width: 1000px;
            -moz-box-shadow: 0px 0px 4px rgba(170,170,170,1);
            -webkit-box-shadow: 0px 0px 4px rgba(170,170,170,1);
            padding: 10px 0 6px 0;
        }
        .previewSave
        {
            display: inline-block;
            width: 132px;
            height: 38px;
            background: url("<%=path%>/web/images/preview_save.png") no-repeat scroll 0 0 transparent;
            cursor: pointer;
            cursor: hand;
        }
        .previewSave:hover
        {
            background: url("<%=path%>/web/images/preview_save_hover.png") no-repeat scroll 0 0 transparent;
        }
        .previewReturn
        {
            display: inline-block;
            width: 132px;
            height: 38px;
            background: url("<%=path%>/web/images/preview_edit.png") no-repeat scroll 0 0 transparent;
            cursor: pointer;
            cursor: hand;
        }
        .previewReturn:hover
        {
            background: url("<%=path%>/web/images/preview_edit_hover.png") no-repeat scroll 0 0 transparent;
        }
    </style>
<link href="<%=path%>/web/css/basic.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/default.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/dialog.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/editPage.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/jquery.Jcrop.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/map.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/search.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/searchresult.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/web/css/view.css" type="text/css" rel="stylesheet">
<title>
	人立方关系搜索 - 谷歌
</title></head>
<body>
    <form method="post" action="view.aspx?id=5134492" id="ctl01">
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJLTQ5MjEzMzUyD2QWAmYPZBYCAgMPZBYGAgEPFgIeBFRleHQFOzxhIGhyZWY9Ii9sb2dpbi5hc3B4IiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDEzcHg7Ij7nmbvlvZU8L2E+ZAIFD2QWAmYPFgIfAAUgYWM5YTQyMjg5MDJkZTI2YTExM2EyNDYyYWM3ZjFjM2RkAgcPZBYEAgEPFgIfAAUEbm9uZWQCAw8WAh8ABQEwZGTEGl6jJS47lCJXLK24LSzIENVJn8mbsuV4u3uywJE1FA==">
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['ctl01'];
if (!theForm) {
    theForm = document.ctl01;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBALBg+SZAwKL2ZzLDgKSt8/nDwLKwojPCCXzz+L7lsKJaFwvo9yzk1uGhfE87ah16EvtqPEM2VoR">
</div>
    <div class="container">
        <div class="header-wrapper">
            <div class="header-top">
                <div class="top-right">
                    <a href="/login.aspx" style="margin-left: 13px;">登录</a>
                </div>
            </div>
            <div class="header-middle">
                <a href="Default.aspx" class="header-top-home"></a>
                <div id="Panel1" onkeypress="javascript:return WebForm_FireDefaultButton(event, 'GeneralSearchButton')">
	

                    <div class="search-bar-wrapper">
                        <div class="search-column-wrapper">
                            <span class="search-column"><a href="/">首页</a></span>
                            <span class="search-column-sel"><a href="baike.aspx">关系百科</a></span> <span class="search-column">
                                <a href="/Q20/Index.aspx">Q20读心机器人</a></span> <span class="search-column"><a href="/t/Index.aspx">微博关系图</a></span>
                            <span class="search-column"><a href="6duMap.aspx">六度搜索</a></span>
                        </div>
                        <div class="search-bar">
                            <input name="ctl00$GeneralSearchBox" type="text" id="GeneralSearchBox" class="search-input" title="输入中文关键词，如：张亚勤，比尔-盖茨，兵乓球，微软亚洲研究院">
                            <input type="button" name="ctl00$GeneralSearchButton" value="" onclick="javascript:__doPostBack('ctl00$GeneralSearchButton','')" id="GeneralSearchButton" class="search-btn" alt="搜索" title="搜索">
                            <input type="button" name="ctl00$GeneralCreateButton" value="" onclick="javascript:__doPostBack('ctl00$GeneralCreateButton','')" id="GeneralCreateButton" class="create-btn" alt="创建词条" title="创建词条">
                        </div>
                    </div>
                
</div>
                <div class="clear">
                </div>
            </div>
            <div class="search-down">
            </div>
        </div>
        <div class="content-wrapper">
            
    <div class="view-content">
    
        <div class="nav-panel">
            <a href="result.aspx?q=%e8%b0%b7%e6%ad%8c&amp;FromView=1" style="font-weight: bold">
                去找其他的谷歌<img src="/App_Themes/cn/images/find_all_name.jpg" style="width:15px;height:16px;vertical-align:top;margin-left:3px;margin-top:2px;">
            </a>
        </div>

        <div class="view-left-wrapper">
            
            <div class="basicInfo">
                <div class="basicInfoHeader">
                </div>
                <div class="basicInfoContent">
                    <div class="basicInfoNewTool">
                    
                        <a href="#" class="twLineEditIcon" title="设置名片"></a>
                        
                    </div>
                    <div class="basicInfoImage">
                        <img width="65px" height="65px" class="user-profile-link" alt="谷歌" src="/App_Themes/cn/images/oicon65.png" title="">
                    </div>
                    <div class="basicInfoBasicContent">
                        <div class="basicInfoBasicContent_Name">
                            谷歌</div>
                        <div class="basicInfoBasicContent_Label">
                            </div>
                    </div>
                    
                </div>
                <div class="basicInfoDescTool">
                    <div class="basicInfoDescToolContent">
                        <div class="basicInfoDescToolContent_web">
                            
                        </div>
                        <div class="basicInfoDescToolContent_edit">
                            <a href="editper.aspx?id=5134492&amp;q=%e8%b0%b7%e6%ad%8c&amp;token=ac9a4228902de26a113a2462ac7f1c3d&amp;type=3" id="MainContent_lnkEditEntity" style="display: block;">编辑词条</a>
                        </div>
                    </div>
                </div>
                <div class="basicInfoFooter">
                </div>
            </div>

            
            <div class="leftPanelHeader">
                <div class="leftPanelHeaderText">
                    人物关系图</div>
                <div class="leftPanelHeaderTool">
                    
                    <a href="#" onclick="return bigGraph();"><span class="leftPanelMoreTool"></span></a>
                </div>
            </div>
            <div class="leftPanelContent">
                <div class="selected-map-view-small" id="selectedMapView" style="display: visible;">
                    <object width="312px" height="312px" bgcolor="#000000" id="visualizedSearch" data="asset/visualizedSearch.swf" type="application/x-shockwave-flash" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
                        <param value="asset/visualizedSearch.swf" name="movie">
                        <param name="quality" value="high">
                        <param name="bgcolor" value="#000000">
                        <param value="sameDomain" name="allowScriptAccess">
                        <param value="false" name="allowFullScreen">
                        <param name="wmode" value="Opaque">
                        <param value="asset/visualizeSearchViewConfig.xml" name="configUrl">
                        <param value="isSearch=true&amp;configUrl=asset/visualizeSearchViewConfig.xml&amp;query=5134492:ac9a4228902de26a113a2462ac7f1c3d" name="FlashVars">
                        <embed src="asset/visualizedSearch.swf" quality="high" bgcolor="#000000" width="312px" height="312px" name="visualizedSearch" align="middle" play="true" loop="false" vmode="Opaque" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" flashvars="isSearch=true&amp;configUrl=asset/visualizeSearchViewConfig.xml&amp;query=5134492:ac9a4228902de26a113a2462ac7f1c3d" pluginspage="http://www.macromedia.com/go/getflashplayer">
                         
                    </object>
                </div>
            </div>
            
            <div class="leftPanelHeader" id="rec-person-header" style="display: block;">
                <div class="leftPanelHeaderText" id="rec-person-headertext">
                    可能的人物关系</div>
               
                <div class="leftPanelHeaderTip" id="recperson-tip">
                    众人拾柴火焰高，进入<a href="editper.aspx?id=5134492&amp;q=%e8%b0%b7%e6%ad%8c&amp;token=ac9a4228902de26a113a2462ac7f1c3d&amp;type=3">关系百科</a>进行编辑
                </div>
            </div>
            <div class="leftPanelContent" style="display: block">
                <div class="rec-person-view">
                    <ul class="profile-related-people borderul" id="rec-ul">
                        
                        <li class="profile-recommend-people-item" seq="0" hashcode="29532456">
                            <div style="min-height:30px">
                                <img width="25px" height="25px" src="./App_Themes/cn/images/people_small.png" style="float: left">
                                <div class="recommend-people-info">
                                    <span class="related-people-info-name">
                                        李开复
                                        
                                    </span><span class="related-people-info-label">
                                        </span>
                                    <div class="related-people-info-rel">
                                    </div>
                                </div>
                                <div class="recommend-tool">
                                    <a href="#" onclick="return addpeople(-1,'李开复',29532456);">
                                        <span class="addpeopleBtnSpan"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="related-block-info" kw="李开复" ul="2" ss="60" style="clear:both"><div class="blk">...机游戏/,/<span class="highlight">李开复</span>/Posted in/游戏/
/网传<span class="highlight">李开复</span><span class="highlight"><span class="highlight">谷</span><span class="highlight">歌</span></span>月薪280万 <span class="highlight">李开复</span>辟谣/
在2010年最后一天，创新...</div><div class="url">www.perday.tv</div></div>
                        </li>
                        
                        <li class="profile-recommend-people-item" seq="1" hashcode="21237102">
                            <div style="min-height:30px">
                                <img width="25px" height="25px" src="./App_Themes/cn/images/people_small.png" style="float: left">
                                <div class="recommend-people-info">
                                    <span class="related-people-info-name">
                                        谢尔盖-布林
                                        
                                    </span><span class="related-people-info-label">
                                        </span>
                                    <div class="related-people-info-rel">
                                    </div>
                                </div>
                                <div class="recommend-tool">
                                    <a href="#" onclick="return addpeople(-1,'谢尔盖-布林',21237102);">
                                        <span class="addpeopleBtnSpan"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="related-block-info" kw="谢尔盖-布林" ul="2" ss="60" style="clear:both"><div class="blk">...最向往的地方，<span class="highlight">谷歌</span>也已经成为搜索的代名词，那么/<span class="highlight">谷歌</span>/创始人<span class="highlight">谢尔盖-布林</span>（Sergey Brin）和拉里-佩奇（Larr...</div><div class="url">seo56.com</div></div>
                        </li>
                        
                        <li class="profile-recommend-people-item" seq="2" hashcode="62925900">
                            <div style="min-height:30px">
                                <img width="25px" height="25px" src="./App_Themes/cn/images/people_small.png" style="float: left">
                                <div class="recommend-people-info">
                                    <span class="related-people-info-name">
                                        拉里-佩奇
                                        
                                    </span><span class="related-people-info-label">
                                        </span>
                                    <div class="related-people-info-rel">
                                    </div>
                                </div>
                                <div class="recommend-tool">
                                    <a href="#" onclick="return addpeople(-1,'拉里-佩奇',62925900);">
                                        <span class="addpeopleBtnSpan"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="related-block-info" kw="拉里-佩奇" ul="2" ss="60" style="clear:both"><div class="blk">...任者<span class="highlight">拉里-佩奇</span>将如何发展在中国的业务。他还说，在他、<span class="highlight">拉里-佩奇</span>和<span class="highlight"><span class="highlight">谷</span><span class="highlight">歌</span></span>另一位联合创始人谢尔盖·赛吉之中，他一直是那个“最深...</div><div class="url">news.itxinwen.com</div></div>
                        </li>
                        
                        <li class="profile-recommend-people-item" seq="3" hashcode="35450060">
                            <div style="min-height:30px">
                                <img width="25px" height="25px" src="./App_Themes/cn/images/people_small.png" style="float: left">
                                <div class="recommend-people-info">
                                    <span class="related-people-info-name">
                                        李东硕
                                        
                                    </span><span class="related-people-info-label">
                                        </span>
                                    <div class="related-people-info-rel">
                                    </div>
                                </div>
                                <div class="recommend-tool">
                                    <a href="#" onclick="return addpeople(-1,'李东硕',35450060);">
                                        <span class="addpeopleBtnSpan"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="related-block-info" kw="李东硕" ul="2" ss="60" style="clear:both"><div class="blk">...日 17:56 来自网页
/手机用户6632/: 请问<span class="highlight">谷歌</span><span class="highlight">李东硕</span>先生，adsense和admob将来在中国市场是否相遇...</div><div class="url">tech.qq.com</div></div>
                        </li>
                        
                        <li class="profile-recommend-people-item" seq="4" hashcode="44873934">
                            <div style="min-height:30px">
                                <img width="25px" height="25px" src="./App_Themes/cn/images/people_small.png" style="float: left">
                                <div class="recommend-people-info">
                                    <span class="related-people-info-name">
                                        王肇辉
                                        
                                    </span><span class="related-people-info-label">
                                        </span>
                                    <div class="related-people-info-rel">
                                    </div>
                                </div>
                                <div class="recommend-tool">
                                    <a href="#" onclick="return addpeople(-1,'王肇辉',44873934);">
                                        <span class="addpeopleBtnSpan"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="related-block-info" kw="王肇辉" ul="2" ss="60" style="clear:both"><div class="blk">...<span class="highlight">王肇辉</span>和汪华是1978年出生的，王晔是1982年的。李开复的资历模后，他又厌倦了，退出了管理，去斯坦福读MBA，后去了美国<span class="highlight">谷歌</span>...</div><div class="url">money.163.com</div></div>
                        </li>
                        
                    </ul>
                </div>
                <div class="rec-person-view-fw">
                    <a href="editper.aspx?id=5134492&amp;q=%e8%b0%b7%e6%ad%8c&amp;token=ac9a4228902de26a113a2462ac7f1c3d&amp;type=3">更多...</a>
                </div>
                <div class="rec-person-view-btn">
                </div>
            </div>
        </div>
        <div class="view-right-wrapper">
            
            

            
            <div class="view-panel" id="profileInfo_panel" style="display: none">
                <div class="kvp-person-view">
                    <ul class="kvp-person-itemset">
                        
                    </ul>
                </div>
                
                <div class="bio-person-view" style="display: none">
                    <ul class="bio-person-itemset">
                        
                    </ul>
                    
                </div>
                <div class="just-for-margin"></div>
            </div>

            
            <div class="view-title-bar" style="display: none">
                <div class="view-title-bar-text">
                    资&nbsp;讯</div>
                <div class="view-title-bar-tool">
                    <a href="ResultNews.aspx?q=%e8%b0%b7%e6%ad%8c"><span class="rightPanelMoreTool"></span></a>
                </div>
                <div class="view-title-bar-tip">
                </div>
            </div>
            <div class="view-panel" id="new_panel" style="display: none">
                
            </div>
            
            
            <div class="view-title-bar" style="display: none">
                <div class="view-title-bar-text">
                    标签</div>
                <div class="view-title-bar-tool">
                    <div class="view-tag-item-page view-page-navigator"></div>
                </div>
                <div class="view-title-bar-tip">
                </div>
            </div>
            <div class="view-panel" id="basicInfo_panel" style="display: none">
                <div class="profile-person-view">
                    <ul class="profile-related-people">
                        
                    </ul>
                </div>
            </div>
            <div class="view-title-bar" style="display: none;margin-bottom:12px;">
                <div class="view-title-bar-tool">
                    <div class="view-tag-item-page view-page-navigator"></div>
                </div>
            </div> 

            
            <div class="view-title-bar" style="display: none">
                <div class="view-title-bar-text">
                    机构关系</div>
                <div class="view-title-bar-tip">
                </div>
            </div>
            <div class="view-panel" id="orgrelation-view" style="display: none">
                <div class="profile-person-view">
                    <ul class="profile-related-people">
                        
                    </ul>
                </div>
            </div>
            <div class="view-title-bar" style="display: none;margin-bottom:12px;">
                <div class="view-title-bar-tool">
                    <div class="profile-related-org-item-page view-page-navigator"></div>
                </div>
            </div>

            
            <div class="view-title-bar" id="relation_panel_header" style="display: block">
                <div class="view-title-bar-text">
                    人物关系</div>
                <div class="view-title-bar-tip">
                </div>
            </div>
            <div class="view-panel" id="relation_panel" style="display: block">
                <div class="profile-person-view">
                    <ul class="profile-related-people" id="select-per">
                        
                        <li class="profile-related-people-item" seq="0">
                            <a href="view.aspx?id=5829308" class="profile-related-image">
                                <img width="48px" height="48px" src="portrait.aspx?id=5829308" alt="汪华" title="http://tp4.sinaimg.cn/1742864695/180/1292417880/1">
                            </a>
                            <div class="related-people-info">
                                <span class="related-people-info-name">
                                    <a href="view.aspx?id=5829308">汪华
                                    </a>
                                </span><span class="related-people-info-label">
                                    标签:优质广告网络,创始合伙人;</span>
                                <div class="related-people-info-rel">
                                    
                                </div>
                                <div class="related-block-info" kw="汪华">
<div class="blk">...很多。创新工场最先就是一个中年创业者带着三个年轻人一起做起来的。
<span class="highlight">汪华</span>曾创办过一家与电信相关的公司，当公司上了规模后，他又厌倦了，退出了管理，去斯坦福读MBA，后去了美国<span class="highlight">谷歌</span>工作。回国后加入<span class="highlight">谷歌</span>中国商务发展部，将<span class="highlight">谷歌</span>网络广告从零做到8000...</div><div class="url">http://finance.qq.com/a/20101008/004495.htm</div>
                                </div>
                            </div>
                            
                            <div class="view-splitter">
                            </div>
                        </li>
                        
                    </ul>
                </div>
            </div>
            <div class="view-title-bar" id="relation_panel_tailer" style="display: block;margin-bottom:12px;">
                <div class="view-title-bar-tool">
                    <div class="profile-related-people-item-page view-page-navigator"><span class="current pagehide">1</span></div>
                </div>
            </div>

            
            <div class="view-title-bar" style="display: none">
                <div class="view-title-bar-text">
                    地点关系</div>
                <div class="view-title-bar-tool">
                </div>
                <div class="view-title-bar-tip">
                </div>
            </div>
            <div class="view-panel" style="display: none">
                <div class="profile-person-view">
                    <ul class="profile-related-loc">
                        
                    </ul>
                </div>
            </div>
            <div class="view-title-bar" style="display: none;margin-bottom:12px;">
                <div class="view-title-bar-tool">
                    <div class="profile-related-loc-item-page view-page-navigator"></div>
                </div>
            </div>            


            
            <div class="view-title-bar" id="selectedpage_header" style="display: none">
                <div class="view-title-bar-text">
                    网&nbsp;页</div>
                <div class="view-title-bar-tool">
                </div>
                <div class="view-title-bar-tip">
                </div>
            </div>
            <div class="view-panel" id="webpage-panel" style="display: none">
                
            </div>
            <div class="view-title-bar" id="selectedpage_tailer" style="display: none;margin-bottom:12px;">
                <div class="view-title-bar-tool">
                    <div class="selectedpage-page view-page-navigator"></div>
                </div>
            </div>

            
            <div class="view-title-bar" style="display: block" id="recwebpage">
                <div class="view-title-bar-text" id="rec-webpage-headertext">
                    可能的相关网页</div>
                <div class="view-title-bar-tool" style="margin-right:20px;margin-top:4px">
                </div>
                <div class="view-title-bar-tip" id="rec-webpage-tip">
                    众人拾柴火焰高，进入<a href="editper.aspx?id=5134492&amp;q=%e8%b0%b7%e6%ad%8c&amp;token=ac9a4228902de26a113a2462ac7f1c3d&amp;type=3">关系百科</a>进行编辑
                </div>
            </div>
            <div class="view-panel" id="rec-webpage-panel" style="display: block">
                <div class="profile-person-view" id="rec-webpage-panel-content">
                    <ul class="profile-related-people borderul" id="recpage-ul"><div class="webpagerec view-clip" hashid="6e30ff12f8dee0e36843bb500188397e"><div class="web-add"><a href="#" onclick="return addrec('6e30ff12f8dee0e36843bb500188397e');"><span class="addpeopleBtnSpan"></span></a></div><div class="view-title"><a target="_blank" href="http://finance.qq.com/a/20101008/004495.htm">东方企业家：李开复创业记_财经_腾讯网</a></div><div class="view-desp">...。我在走廊上碰见过好几次拖着箱子一脸迷茫找不到路的人，因为告示太小了。”
李开复就是在这里开始重新闯荡，去年8月辞去/<span class="highlight">谷歌</span>/中国区总裁职位后，李开复创办了创新工场，他从一名高薪职业经理人成为了老板——目前，创新工场募集资金达10亿元，现有1...</div><div class="view-url">finance.qq.com/a/20101008/004495.htm<span class="web-opr"></span></div></div><div class="webpagerec view-clip" hashid="dac623e0b7475507b8d9e1ae490f78c5"><div class="web-add"><a href="#" onclick="return addrec('dac623e0b7475507b8d9e1ae490f78c5');"><span class="addpeopleBtnSpan"></span></a></div><div class="view-title"><a target="_blank" href="http://money.163.com/10/1012/10/6IPP0R4B00253DC8.html">李开复创业记：投资、包装一站式批量孵化企业_网易财经</a></div><div class="view-desp">...。我在走廊上碰见过好几次拖着箱子一脸迷茫找不到路的人，因为告示太小了。”
李开复就是在这里开始重新闯荡，去年8月辞去/<span class="highlight">谷歌</span>/中国区总裁职位后，李开复创办了创新工场，他从一名高薪职业经理人成为了老板——目前，创新工场募集资金达10亿元，现有1...</div><div class="view-url">money.163.com/10/1012/10/6IPP0R4B00253DC8.html<span class="web-opr"></span></div></div><div class="webpagerec view-clip" hashid="68330e8e62a1d0d640961177f8ec3714"><div class="web-add"><a href="#" onclick="return addrec('68330e8e62a1d0d640961177f8ec3714');"><span class="addpeopleBtnSpan"></span></a></div><div class="view-title"><a target="_blank" href="http://news.iresearch.cn/0200/20100908/123495.shtml">创新工场开办一周年 李开复透露投资四方向_分析·观点_艾瑞网</a></div><div class="view-desp">...周年庆典上表示，创新工场已投资项目12个，未来投资方向为移动互联网、消费互联网、电子商务和云计算四方面。
创新工场由/<span class="highlight">谷歌</span>/前<span class="highlight">谷歌</span>中国CEO李开复于2009年9月在京成立，致力于早期阶段投资并提供全方位创业培育的投资机构。该公司于开办初期获...</div><div class="view-url">news.iresearch.cn/0200/20100908/123495.shtml<span class="web-opr"></span></div></div><div class="webpagerec view-clip" hashid="a574cb622439919112588c33c64cd7c0"><div class="web-add"><a href="#" onclick="return addrec('a574cb622439919112588c33c64cd7c0');"><span class="addpeopleBtnSpan"></span></a></div><div class="view-title"><a target="_blank" href="http://www.perday.tv/news/archives/tag/%e6%9d%8e%e5%bc%80%e5%a4%8d">李开复 «  每日IT新闻，最新IT资讯，聚合多站点消息，保证你与世界同步</a></div><div class="view-desp">...西，别人没有办法发明，就像爱迪生发明了灯泡，其
Tags:/招聘/,/李开复/Posted in/互联网/
/李开复：<span class="highlight">谷歌</span>创始人佩奇适合做CEO的理由/
来自新浪科技的消息，<span class="highlight">谷歌</span>联合创始人拉里・佩奇(Larry Page)今天正式成为<span class="highlight">谷歌</span>新...</div><div class="view-url">www.perday.tv/news/archives/tag/%e6%9d%8e%e5%bc%80...<span class="web-opr"></span></div></div><div class="webpagerec view-clip" hashid="baf0c04beb24cf5287792c43fe6817a2"><div class="web-add"><a href="#" onclick="return addrec('baf0c04beb24cf5287792c43fe6817a2');"><span class="addpeopleBtnSpan"></span></a></div><div class="view-title"><a target="_blank" href="http://www.hudong.com/wiki/%E5%88%9B%E6%96%B0%E5%B7%A5%E5%8E%82">创新工场_互动百科</a></div><div class="view-desp">...场 - 概述
2009年9月，“/创新工场/”一跃成为中国产业界和投资界的一大热词。“创新工场”其实是曾在/微软/、/<span class="highlight">谷歌</span>/担任高管的/李开复//博士/创办的一个公司，用他们自己的定义就是“一个全方位的创业平台，旨在培育创新人才和新一代高科...</div><div class="view-url">www.hudong.com/wiki/%E5%88%9B%E6%96%B0%E5%B7%A5%E5...<span class="web-opr"></span></div></div></ul>
                </div>
                <div class="rec-webpage-view-fw">
                    <a href="editper.aspx?id=3461&amp;q=%e5%a7%9a%e6%99%a8&amp;token=f3bdf34a5ef3ca18d8d454292fb81200&amp;type=1">更多...</a>
                </div>
                <div class="rec-webpage-view-btn"></div>
            </div>

        </div>
        <div class="clear"></div>
    </div>

    <span id="editTokenInvisibleContainer" style="display:none;">
        ac9a4228902de26a113a2462ac7f1c3d</span>

        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer-wrapper">
        <div class="footer-middle">
            <div class="embed">
            </div>
            <div class="links">
                <a href="http://www.msra.cn/">微软亚洲研究院</a> | <a href="readme.aspx#contactus">反馈</a>
                <br>
                © 2011 Microsoft 版权所有 | <a target="_blank" href="readme.aspx#contactus">联系我们</a>
                | <a target="_blank" href="http://privacy.microsoft.com/ZH-CN/fullnotice.aspx">隐私声明</a>
                | <a target="_blank" href="http://www.microsoft.com/library/toolbar/3.0/trademarks/en-us.mspx">
                    商标</a> | <a target="_blank" id="statmentLInk" href="http://www.msra.cn/Articles/ArticleItem.aspx?Guid=6fcea8fe-1b65-4df8-9837-69a88e9c5884">
                        使用条款</a> | <a target="_blank" href="http://www.miibeian.gov.cn">京ICP备09042378号</a></div>
        </div>
    </div>
    <div id="FloatFixedPanel">
	
        <div class="footer-fixed" style="display: none">
            <div class="footer-fixed-t">
                <a href="/editing.aspx" title="查看正在编辑的词条">正在编辑词条</a></div>
            <div class="footer-fixed-n">
                <a href="/editing.aspx" title="查看正在编辑的词条">
                    0</a>
            </div>
            <div class="footer-fixed-t">
                <a href="/editing.aspx" title="查看正在编辑的词条">个</a></div>
            <div class="footer-fixed-t">
                |</div>
            <a class="footer-fixed-bn" id="SaveInFixedPanel" onclick="return saveCurrent();" href="#" title="保存我的编辑">保存</a>
        </div>
    
</div>
    
<script src="/WebResource.axd?d=Kl7DoXFA23fDE-cFQRFTXC5AKauTUFFfQ1FJLWWA5qR66y8B5qqpsdV5JIGNBl4RWpr_KyoKT5LL84bwaalB86lGqR7V352cr3yO9JrANeA1&amp;t=634654408036283095" type="text/javascript"></script>
</form>
</body>
</html>