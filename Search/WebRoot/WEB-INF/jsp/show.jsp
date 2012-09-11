<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head>
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
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
    
<link href="App_Themes/cn/basic.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/default.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/dialog.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/editPage.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/jquery.Jcrop.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/map.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/search.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/searchresult.css" type="text/css" rel="stylesheet"><link href="App_Themes/cn/view.css" type="text/css" rel="stylesheet"><title>
	人立方关系搜索 - 张磊
</title></head>
<body>
    <form method="post" action="selector.aspx?q=%u5f20%u78ca&amp;type=1" id="ctl01">
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTk0Nzc3MjQxNA9kFgJmD2QWAgIDD2QWBgIBDxYCHgRUZXh0BTs8YSBocmVmPSIvbG9naW4uYXNweCIgc3R5bGU9Im1hcmdpbi1sZWZ0OiAxM3B4OyI+55m75b2VPC9hPmQCBQ9kFgQCAQ8WAh8ABX88c3BhbiBjbGFzcz0ncGFyZW50Jz7igJzlvKDno4rigJ3nmoTlkIzlkI3kurrkv7HkuZDpg6g8L3NwYW4+PHNwYW4+ICZndDsg5Lq656uL5pa55Lit5bey5a2Y5Zyo55qE4oCc5byg56OK4oCd6K+N5p2hICgxMCk8L3NwYW4+ZAIDDxYCHwAFhlA8ZGl2IGNsYXNzPSJiYXNpY0luZm9XcmFwcGVyIj48ZGl2IGNsYXNzPSJiYXNpY0luZm8iIGlkID0gInJlc3VsdC1iYXNpY0luZm8iPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0hlYWRlciI+IDwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0ltYWdlIj48YSBocmVmPSIvdmlldy5hc3B4P2lkPTU3NTM0ODMiPjxpbWcgd2lkdGg9IjY1cHgiIGhlaWdodD0iNjVweCIgc3JjPSIuL3BvcnRyYWl0LmFzcHg/aWQ9NTc1MzQ4MyZ0eXBlPTEiIHRpdGxlPSJodHRwOi8vcmVzZWFyY2gubWljcm9zb2Z0LmNvbS9lbi11cy9wZW9wbGUvbGVpemhhbmcvaW1nXzQ3MzAtcG9ydHJhaXQuanBnIiBjbGFzcz0idXNlci1wcm9maWxlLWxpbmsiPjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudF9OYW1lIj48YSAgaHJlZiA9ICJ2aWV3LmFzcHg/aWQ9NTc1MzQ4MyI+5byg56OKPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudF9MYWJlbCI+PGRpdiBjbGFzcz0ndHdvTGluZURlc2NQZXJMaW5lTm90U2hvd24nPuacuuaehDrlvq7ova/kuprmtLLnoJTnqbbpmaI8L2Rpdj48ZGl2IGNsYXNzPSd0d29MaW5lRGVzY1BlckxpbmVOb3RTaG93bic+5qCH562+OuWNmuWjqzwvZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnRfd2ViIj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnRfZWRpdCI+PGEgaWQ9Ik1haW5Db250ZW50X2xua0VkaXRFbnRpdHkiIGhyZWY9ImVkaXRwZXIuYXNweD9pZD01NzUzNDgzJnE95byg56OKJnRva2VuPWE2YTE5YWUyYzVmNzk5MzNhYjlkYjQ4MmJhMzAxOTI2JnR5cGU9MSI+57yW6L6R6K+N5p2hPC9hPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Zvb3RlciI+IDwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb1dyYXBwZXIiPjxkaXYgY2xhc3M9ImJhc2ljSW5mbyIgaWQgPSAicmVzdWx0LWJhc2ljSW5mbyI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvSGVhZGVyIj4gPC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvSW1hZ2UiPjxhIGhyZWY9Ii92aWV3LmFzcHg/aWQ9MzE5MTMiPjxpbWcgd2lkdGg9IjY1cHgiIGhlaWdodD0iNjVweCIgc3JjPSIuL3BvcnRyYWl0LmFzcHg/aWQ9MzE5MTMmdHlwZT0xIiB0aXRsZT0iaHR0cDovL2ltZzMuZG91YmFuLmNvbS9pbWcvY2VsZWJyaXR5L2xhcmdlLzE3MzA2LmpwZyIgY2xhc3M9InVzZXItcHJvZmlsZS1saW5rIj48L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTmFtZSI+PGEgIGhyZWYgPSAidmlldy5hc3B4P2lkPTMxOTEzIj7lvKDno4o8L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X0xhYmVsIj48ZGl2IGNsYXNzPSd0d29MaW5lRGVzY1BlckxpbmVOb3RTaG93bic+5qCH562+Oua8lOWRmDwvZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnRfd2ViIj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnRfZWRpdCI+PGEgaWQ9Ik1haW5Db250ZW50X2xua0VkaXRFbnRpdHkiIGhyZWY9ImVkaXRwZXIuYXNweD9pZD0zMTkxMyZxPeW8oOejiiZ0b2tlbj05N2U3MGM2ZDAxYmU2MGJiNmY1OTNkMGExMGQ5N2RlNiZ0eXBlPTEiPue8lui+keivjeadoTwvYT48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Gb290ZXIiPiA8L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9XcmFwcGVyIj48ZGl2IGNsYXNzPSJiYXNpY0luZm8iIGlkID0gInJlc3VsdC1iYXNpY0luZm8iPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0hlYWRlciI+IDwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0ltYWdlIj48YSBocmVmPSIvdmlldy5hc3B4P2lkPTU3NjYyMTEiPjxpbWcgd2lkdGg9IjY1cHgiIGhlaWdodD0iNjVweCIgc3JjPSIuL3BvcnRyYWl0LmFzcHg/aWQ9NTc2NjIxMSZ0eXBlPTEiIHRpdGxlPSJodHRwOi8vaW1nc3JjLmJhaWR1LmNvbS9iYWlrZS9hYnBpYy9pdGVtL2E2YWVkMDFiYjAzMGIxOTlhZjUxMzNhZS5qcGciIGNsYXNzPSJ1c2VyLXByb2ZpbGUtbGluayI+PC9hPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X05hbWUiPjxhICBocmVmID0gInZpZXcuYXNweD9pZD01NzY2MjExIj7lvKDno4o8L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X0xhYmVsIj48ZGl2IGNsYXNzPSd0d29MaW5lRGVzY1BlckxpbmVOb3RTaG93bic+5py65p6EOuW+t+S6keekvjwvZGl2PjxkaXYgY2xhc3M9J3R3b0xpbmVEZXNjUGVyTGluZU5vdFNob3duJz7moIfnrb4655u45aOw5ryU5ZGYPC9kaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF93ZWIiPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF9lZGl0Ij48YSBpZD0iTWFpbkNvbnRlbnRfbG5rRWRpdEVudGl0eSIgaHJlZj0iZWRpdHBlci5hc3B4P2lkPTU3NjYyMTEmcT3lvKDno4omdG9rZW49NzNkOGUwNTlkNWQ3YTRiZGRlYTljNDE0YjVhMmIwZTQmdHlwZT0xIj7nvJbovpHor43mnaE8L2E+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRm9vdGVyIj4gPC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvV3JhcHBlciI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvIiBpZCA9ICJyZXN1bHQtYmFzaWNJbmZvIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9IZWFkZXIiPiA8L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Db250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9JbWFnZSI+PGEgaHJlZj0iL3ZpZXcuYXNweD9pZD01ODIwMDkxIj48aW1nIHdpZHRoPSI2NXB4IiBoZWlnaHQ9IjY1cHgiIHNyYz0iLi9wb3J0cmFpdC5hc3B4P2lkPTU4MjAwOTEmdHlwZT0xIiB0aXRsZT0iaHR0cDovL3d3dy4zczguY24vdXBsb2Fkcy9hbGxpbWcvMTAwMTA5LzIzMDEwMTM1MDItMC5qcGciIGNsYXNzPSJ1c2VyLXByb2ZpbGUtbGluayI+PC9hPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X05hbWUiPjxhICBocmVmID0gInZpZXcuYXNweD9pZD01ODIwMDkxIj7lvKDno4o8L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X0xhYmVsIj48ZGl2IGNsYXNzPSd0d29MaW5lRGVzY1BlckxpbmVOb3RTaG93bic+5py65p6EOumrmOeTtOi1hOacrOeuoeeQhuaciemZkOWFrOWPuDwvZGl2PjxkaXYgY2xhc3M9J3R3b0xpbmVEZXNjUGVyTGluZU5vdFNob3duJz7moIfnrb465o2Q5qy+6IC26bKBPC9kaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF93ZWIiPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF9lZGl0Ij48YSBpZD0iTWFpbkNvbnRlbnRfbG5rRWRpdEVudGl0eSIgaHJlZj0iZWRpdHBlci5hc3B4P2lkPTU4MjAwOTEmcT3lvKDno4omdG9rZW49MDUxZmEwYWY1Yzk4NDI1ZDc4MjJiOTMxMTU3NjM2M2MmdHlwZT0xIj7nvJbovpHor43mnaE8L2E+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRm9vdGVyIj4gPC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvV3JhcHBlciI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvIiBpZCA9ICJyZXN1bHQtYmFzaWNJbmZvIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9IZWFkZXIiPiA8L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Db250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9JbWFnZSI+PGEgaHJlZj0iL3ZpZXcuYXNweD9pZD02MzkxMDMwIj48aW1nIHdpZHRoPSI2NXB4IiBoZWlnaHQ9IjY1cHgiIHNyYz0iLi9wb3J0cmFpdC5hc3B4P2lkPTYzOTEwMzAmdHlwZT0xIiB0aXRsZT0iIiBjbGFzcz0idXNlci1wcm9maWxlLWxpbmsiPjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudF9OYW1lIj48YSAgaHJlZiA9ICJ2aWV3LmFzcHg/aWQ9NjM5MTAzMCI+5byg56OKPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudF9MYWJlbCI+PGRpdiBjbGFzcz0ndHdvTGluZURlc2NQZXJMaW5lTm90U2hvd24nPuS6uueJqTrnjovpgZPog5w8L2Rpdj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2wiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50X3dlYiI+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50X2VkaXQiPjxhIGlkPSJNYWluQ29udGVudF9sbmtFZGl0RW50aXR5IiBocmVmPSJlZGl0cGVyLmFzcHg/aWQ9NjM5MTAzMCZxPeW8oOejiiZ0b2tlbj0zNjVkZWU2YTFlNmU5MDgwZTJiNTU1ZWUzZmE3MWI0OCZ0eXBlPTEiPue8lui+keivjeadoTwvYT48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Gb290ZXIiPiA8L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9XcmFwcGVyIj48ZGl2IGNsYXNzPSJiYXNpY0luZm8iIGlkID0gInJlc3VsdC1iYXNpY0luZm8iPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0hlYWRlciI+IDwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0ltYWdlIj48YSBocmVmPSIvdmlldy5hc3B4P2lkPTU5ODMwNDEiPjxpbWcgd2lkdGg9IjY1cHgiIGhlaWdodD0iNjVweCIgc3JjPSIuL3BvcnRyYWl0LmFzcHg/aWQ9NTk4MzA0MSZ0eXBlPTEiIHRpdGxlPSJodHRwOi8vaTIuc2luYWltZy5jbi8yMDA4L3N0YXIvemhhbmdfbGVpX2IvaWR4LzIwMDgvMDcyNi9VMTg2MFA0NjFUMTA2RDIyNDJGMjMyNkRUMjAwODA3MjYxODU2NTkuanBnIiBjbGFzcz0idXNlci1wcm9maWxlLWxpbmsiPjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudF9OYW1lIj48YSAgaHJlZiA9ICJ2aWV3LmFzcHg/aWQ9NTk4MzA0MSI+5byg56OKPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudF9MYWJlbCI+PGRpdiBjbGFzcz0ndHdvTGluZURlc2NQZXJMaW5lTm90U2hvd24nPuagh+etvu+8muiHquihjOi9pjwvZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnRfd2ViIj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnRfZWRpdCI+PGEgaWQ9Ik1haW5Db250ZW50X2xua0VkaXRFbnRpdHkiIGhyZWY9ImVkaXRwZXIuYXNweD9pZD01OTgzMDQxJnE95byg56OKJnRva2VuPTJmODdmY2E5ZmQ3YTgxNGU2NjNiMDE5MmFiMmNjZDUzJnR5cGU9MSI+57yW6L6R6K+N5p2hPC9hPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Zvb3RlciI+IDwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb1dyYXBwZXIiPjxkaXYgY2xhc3M9ImJhc2ljSW5mbyIgaWQgPSAicmVzdWx0LWJhc2ljSW5mbyI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvSGVhZGVyIj4gPC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvSW1hZ2UiPjxhIGhyZWY9Ii92aWV3LmFzcHg/aWQ9NTgyNjA3NSI+PGltZyB3aWR0aD0iNjVweCIgaGVpZ2h0PSI2NXB4IiBzcmM9Ii4vcG9ydHJhaXQuYXNweD9pZD01ODI2MDc1JnR5cGU9MSIgdGl0bGU9Imh0dHA6Ly9pbWcxLmd0aW1nLmNvbS9zcG9ydHMvcGljcy9odjEvMy8xMzYvNTg4LzM4MjY5MzgzLmpwZyIgY2xhc3M9InVzZXItcHJvZmlsZS1saW5rIj48L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTmFtZSI+PGEgIGhyZWYgPSAidmlldy5hc3B4P2lkPTU4MjYwNzUiPuW8oOejijwvYT48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTGFiZWwiPjxkaXYgY2xhc3M9J3R3b0xpbmVEZXNjUGVyTGluZU5vdFNob3duJz7mnLrmnoQ65Lit5Zu95aWz5o6SPC9kaXY+PGRpdiBjbGFzcz0ndHdvTGluZURlc2NQZXJMaW5lTm90U2hvd24nPuagh+etvjrlpbPmjpLov5DliqjlkZg8L2Rpdj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2wiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50X3dlYiI+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRGVzY1Rvb2xDb250ZW50X2VkaXQiPjxhIGlkPSJNYWluQ29udGVudF9sbmtFZGl0RW50aXR5IiBocmVmPSJlZGl0cGVyLmFzcHg/aWQ9NTgyNjA3NSZxPeW8oOejiiZ0b2tlbj1hNTA2M2IwMDAxOWYyYzk5ODY0Nzk1ZTU0NWMzZTgwOCZ0eXBlPTEiPue8lui+keivjeadoTwvYT48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Gb290ZXIiPiA8L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9XcmFwcGVyIj48ZGl2IGNsYXNzPSJiYXNpY0luZm8iIGlkID0gInJlc3VsdC1iYXNpY0luZm8iPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0hlYWRlciI+IDwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0NvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0ltYWdlIj48YSBocmVmPSIvdmlldy5hc3B4P2lkPTU4MzMxODEiPjxpbWcgd2lkdGg9IjY1cHgiIGhlaWdodD0iNjVweCIgc3JjPSIuL3BvcnRyYWl0LmFzcHg/aWQ9NTgzMzE4MSZ0eXBlPTEiIHRpdGxlPSIiIGNsYXNzPSJ1c2VyLXByb2ZpbGUtbGluayI+PC9hPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Jhc2ljQ29udGVudCI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X05hbWUiPjxhICBocmVmID0gInZpZXcuYXNweD9pZD01ODMzMTgxIj7lvKDno4o8L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50X0xhYmVsIj48ZGl2IGNsYXNzPSd0d29MaW5lRGVzY1BlckxpbmVOb3RTaG93bic+5py65p6EOuWGheiSmeWPpOS6pOmAmuiBjOS4muaKgOacr+WtpumZojwvZGl2PjxkaXYgY2xhc3M9J3R3b0xpbmVEZXNjUGVyTGluZU5vdFNob3duJz7moIfnrb4655Sw56aP5Yab5Yqz5Yqh57qg57q35qGIPC9kaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF93ZWIiPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF9lZGl0Ij48YSBpZD0iTWFpbkNvbnRlbnRfbG5rRWRpdEVudGl0eSIgaHJlZj0iZWRpdHBlci5hc3B4P2lkPTU4MzMxODEmcT3lvKDno4omdG9rZW49NzhjYjUzYjYxMjVjZTIyYzA4ZmI2YzhmZTcxOTFlZWYmdHlwZT0xIj7nvJbovpHor43mnaE8L2E+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRm9vdGVyIj4gPC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvV3JhcHBlciI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvIiBpZCA9ICJyZXN1bHQtYmFzaWNJbmZvIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9IZWFkZXIiPiA8L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Db250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9JbWFnZSI+PGEgaHJlZj0iL3ZpZXcuYXNweD9pZD01ODI4OTU3Ij48aW1nIHdpZHRoPSI2NXB4IiBoZWlnaHQ9IjY1cHgiIHNyYz0iLi9wb3J0cmFpdC5hc3B4P2lkPTU4Mjg5NTcmdHlwZT0xIiB0aXRsZT0iaHR0cDovL3RwMi5zaW5haW1nLmNuLzE0OTY5MzAzMjEvMTgwLzU1OTg2NjIwMjcvMSIgY2xhc3M9InVzZXItcHJvZmlsZS1saW5rIj48L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTmFtZSI+PGEgIGhyZWYgPSAidmlldy5hc3B4P2lkPTU4Mjg5NTciPuW8oOejijwvYT48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTGFiZWwiPjxkaXYgY2xhc3M9J3R3b0xpbmVEZXNjUGVyTGluZU5vdFNob3duJz7moIfnrb465LqR5Yqo5Yqb56eR5oqA6JGj5LqL6ZW/PC9kaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF93ZWIiPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF9lZGl0Ij48YSBpZD0iTWFpbkNvbnRlbnRfbG5rRWRpdEVudGl0eSIgaHJlZj0iZWRpdHBlci5hc3B4P2lkPTU4Mjg5NTcmcT3lvKDno4omdG9rZW49OGI2Y2NjYzBmMjQ0ODRmNjMwOTRmOWE5ZDJkYzBjMGImdHlwZT0xIj7nvJbovpHor43mnaE8L2E+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRm9vdGVyIj4gPC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvV3JhcHBlciI+PGRpdiBjbGFzcz0iYmFzaWNJbmZvIiBpZCA9ICJyZXN1bHQtYmFzaWNJbmZvIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9IZWFkZXIiPiA8L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9Db250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9JbWFnZSI+PGEgaHJlZj0iL3ZpZXcuYXNweD9pZD01ODM3MDQ0Ij48aW1nIHdpZHRoPSI2NXB4IiBoZWlnaHQ9IjY1cHgiIHNyYz0iLi9wb3J0cmFpdC5hc3B4P2lkPTU4MzcwNDQmdHlwZT0xIiB0aXRsZT0iaHR0cDovL3RwNC5zaW5haW1nLmNuLzE2NDc2Mzg4NTUvMTgwLzU2MTQxNTc3MDkvMSIgY2xhc3M9InVzZXItcHJvZmlsZS1saW5rIj48L2E+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvQmFzaWNDb250ZW50Ij48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTmFtZSI+PGEgIGhyZWYgPSAidmlldy5hc3B4P2lkPTU4MzcwNDQiPuW8oOejijwvYT48L2Rpdj48ZGl2IGNsYXNzPSJiYXNpY0luZm9CYXNpY0NvbnRlbnRfTGFiZWwiPjxkaXYgY2xhc3M9J3R3b0xpbmVEZXNjUGVyTGluZU5vdFNob3duJz7moIfnrb466Z2S5bKb5Yib5paw572u5Lia6JGj5LqL6ZW/PC9kaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sIj48ZGl2IGNsYXNzPSJiYXNpY0luZm9EZXNjVG9vbENvbnRlbnQiPjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF93ZWIiPjwvZGl2PjxkaXYgY2xhc3M9ImJhc2ljSW5mb0Rlc2NUb29sQ29udGVudF9lZGl0Ij48YSBpZD0iTWFpbkNvbnRlbnRfbG5rRWRpdEVudGl0eSIgaHJlZj0iZWRpdHBlci5hc3B4P2lkPTU4MzcwNDQmcT3lvKDno4omdG9rZW49OWY0YmI4YTMwMDFmNGRlOWU2YTYyOWExMTczZjY0NTUmdHlwZT0xIj7nvJbovpHor43mnaE8L2E+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iYmFzaWNJbmZvRm9vdGVyIj4gPC9kaXY+PC9kaXY+PC9kaXY+ZAIHD2QWBAIBDxYCHwAFBG5vbmVkAgMPFgIfAAUBMGRkAgxU4GYNbnVekg5Z06wnYoRUft9fOnu2xz1N6hZNK08=">
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

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBQLJ/8ejCQKL2ZzLDgKSt8/nDwLKwojPCALk3/eUB6VQkp2VS8am0fsKDT3JFTj/McXI4/X3mDs595yokjqC">
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
                            <input name="ctl00$GeneralSearchBox" type="text" value="张磊" id="GeneralSearchBox" class="search-input" title="输入中文关键词，如：张亚勤，比尔-盖茨，兵乓球，微软亚洲研究院">
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
            
    <div class="generalDisplayTitleLine">
        <span class="parent">“张磊”的同名人俱乐部</span><span> &gt; 人立方中已存在的“张磊”词条 (10)</span>
    </div>
    <div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5753483"><img width="65px" height="65px" src="./portrait.aspx?id=5753483&amp;type=1" title="http://research.microsoft.com/en-us/people/leizhang/img_4730-portrait.jpg" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5753483">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">机构:微软亚洲研究院</div><div class="twoLineDescPerLineNotShown">标签:博士</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5753483&amp;q=张磊&amp;token=a6a19ae2c5f79933ab9db482ba301926&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=31913"><img width="65px" height="65px" src="./portrait.aspx?id=31913&amp;type=1" title="http://img3.douban.com/img/celebrity/large/17306.jpg" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=31913">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">标签:演员</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=31913&amp;q=张磊&amp;token=97e70c6d01be60bb6f593d0a10d97de6&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5766211"><img width="65px" height="65px" src="./portrait.aspx?id=5766211&amp;type=1" title="http://imgsrc.baidu.com/baike/abpic/item/a6aed01bb030b199af5133ae.jpg" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5766211">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">机构:德云社</div><div class="twoLineDescPerLineNotShown">标签:相声演员</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5766211&amp;q=张磊&amp;token=73d8e059d5d7a4bddea9c414b5a2b0e4&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5820091"><img width="65px" height="65px" src="./portrait.aspx?id=5820091&amp;type=1" title="http://www.3s8.cn/uploads/allimg/100109/2301013502-0.jpg" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5820091">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">机构:高瓴资本管理有限公司</div><div class="twoLineDescPerLineNotShown">标签:捐款耶鲁</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5820091&amp;q=张磊&amp;token=051fa0af5c98425d7822b9311576363c&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=6391030"><img width="65px" height="65px" src="./portrait.aspx?id=6391030&amp;type=1" title="" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=6391030">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">人物:王道胜</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=6391030&amp;q=张磊&amp;token=365dee6a1e6e9080e2b555ee3fa71b48&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5983041"><img width="65px" height="65px" src="./portrait.aspx?id=5983041&amp;type=1" title="http://i2.sinaimg.cn/2008/star/zhang_lei_b/idx/2008/0726/U1860P461T106D2242F2326DT20080726185659.jpg" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5983041">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">标签：自行车</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5983041&amp;q=张磊&amp;token=2f87fca9fd7a814e663b0192ab2ccd53&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5826075"><img width="65px" height="65px" src="./portrait.aspx?id=5826075&amp;type=1" title="http://img1.gtimg.com/sports/pics/hv1/3/136/588/38269383.jpg" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5826075">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">机构:中国女排</div><div class="twoLineDescPerLineNotShown">标签:女排运动员</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5826075&amp;q=张磊&amp;token=a5063b00019f2c99864795e545c3e808&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5833181"><img width="65px" height="65px" src="./portrait.aspx?id=5833181&amp;type=1" title="" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5833181">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">机构:内蒙古交通职业技术学院</div><div class="twoLineDescPerLineNotShown">标签:田福军劳务纠纷案</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5833181&amp;q=张磊&amp;token=78cb53b6125ce22c08fb6c8fe7191eef&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5828957"><img width="65px" height="65px" src="./portrait.aspx?id=5828957&amp;type=1" title="http://tp2.sinaimg.cn/1496930321/180/5598662027/1" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5828957">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">标签:云动力科技董事长</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5828957&amp;q=张磊&amp;token=8b6cccc0f24484f63094f9a9d2dc0c0b&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div><div class="basicInfoWrapper"><div class="basicInfo" id="result-basicInfo"><div class="basicInfoHeader"> </div><div class="basicInfoContent"><div class="basicInfoImage"><a href="/view.aspx?id=5837044"><img width="65px" height="65px" src="./portrait.aspx?id=5837044&amp;type=1" title="http://tp4.sinaimg.cn/1647638855/180/5614157709/1" class="user-profile-link"></a></div><div class="basicInfoBasicContent"><div class="basicInfoBasicContent_Name"><a href="view.aspx?id=5837044">张磊</a></div><div class="basicInfoBasicContent_Label"><div class="twoLineDescPerLineNotShown">标签:青岛创新置业董事长</div><br></div></div></div><div class="basicInfoDescTool"><div class="basicInfoDescToolContent"><div class="basicInfoDescToolContent_web"></div><div class="basicInfoDescToolContent_edit"><a id="MainContent_lnkEditEntity" href="editper.aspx?id=5837044&amp;q=张磊&amp;token=9f4bb8a3001f4de9e6a629a1173f6455&amp;type=1">编辑词条</a></div></div></div><div class="basicInfoFooter"> </div></div></div>
    <div class="basicInfoWrapper">
        <a id="MainContent_CreateNewWiki" class="basicInfoCreateNew" href="javascript:__doPostBack('ctl00$MainContent$CreateNewWiki','')"><img src="App_Themes/cn/images/create_new_card.png" alt="创建新词条"></a></div>

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
                © 2012 Microsoft 版权所有 | <a target="_blank" href="readme.aspx#contactus">联系我们</a>
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
    
<script src="/WebResource.axd?d=Fofhpa4wDyqOeM7x0PGpLRlAmprWf_dQpUCSJXmJPEsh8GbW6r9xzYCBodceiMwdrj6bgxBg2IbZtP_tRtlpUY7IRACu9G92ixRKbLTd7tE1&amp;t=634649224901817063" type="text/javascript"></script>
</form>


</body></html>