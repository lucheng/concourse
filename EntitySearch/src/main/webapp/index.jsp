<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1">
	
    <meta property="wb:webmaster" content="1b9ed2cfa362de2e">
    <script type="text/javascript" src="<%=path%>/web/js/jquery-1.4.1-vsdoc.js"></script>
    <script type="text/javascript" src="<%=path%>/web/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/web/js/result.js"></script>
    <script type="text/javascript" src="<%=path%>/web/js/edit.js"></script>
    <script type="text/javascript" src="<%=path%>/web/js/general.js"></script>
    <script type="text/javascript">
        var textBoxNotEntered = true;

        $(function () {
            $("#MainContent_HomepageSearchTextBox").focus(function () {
                //first time enter?
                if (textBoxNotEntered) {
                    $(this).css('color', 'black');
                    $(this).val('');
                    //set flag
                    textBoxNotEntered = false;
                }
            }
            );

            $(".index-wiki-create .tip-right .tip-close IMG").mouseenter(function () {
                $(this).attr("src", "<%=path%>/web/images/create_tip_close_hover.png");
            }).mouseleave(function () {
                $(this).attr("src", "<%=path%>/web/images/create_tip_close.png");
            });

            if (getCookieVal('create.tip.closed') != 'yes') {
                $(".index-wiki-create .tip-left").show();
                $(".index-wiki-create .tip-middle").show();
                $(".index-wiki-create .tip-right").show();
            }
        });

        function CloseCreateTip() {
            //set cookie
            setCookieVal('create.tip.closed', 'yes');
            //close
            $(".index-wiki-create .tip-left").hide();
            $(".index-wiki-create .tip-middle").hide();
            $(".index-wiki-create .tip-right").hide();
        }
    </script>
	<link href="<%=path%>/web/css/basic.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/default.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/dialog.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/editPage.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/jquery.Jcrop.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/map.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/search.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/searchresult.css" type="text/css" rel="stylesheet">
	<link href="<%=path%>/web/css/view.css" type="text/css" rel="stylesheet">
	<title>人立方关系搜索</title>
	</head>
<body>
    <form method="post" action="Default.aspx" id="Form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2MTA2MDQ1MjAPZBYCZg9kFgICAw9kFgQCAQ8WAh4EVGV4dAU7PGEgaHJlZj0iL2xvZ2luLmFzcHgiIHN0eWxlPSJtYXJnaW4tbGVmdDogMTNweDsiPueZu+W9lTwvYT5kAgMPZBYCAgMPFgIfAAWwRjxkaXYgY2xhc3M9ImNhdCI+PGRpdiBjbGFzcz0iY2F0LW5hbWUiPjxkaXYgY2xhc3M9ImNhdC1uYW1lLWEiPjxhIGhyZWY9IkhvdE5ld3MuYXNweD9jYXRlPTEmdGltbWVyPTAiPuS9k+iCsjwvYT48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJuZXdzIj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlNSU4OCU5OCVlNiViNCU4YiZGcm9tVmlldz0xIiB0aXRsZT0i5YiY5rSLIj7liJjmtIs8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vc2hpcGluLmxhbnpob3UuY24vc3lzdGVtLzIwMTIvMDYvMjcvMDEwMTc5MTU1LnNodG1sIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IuelnuS5neaXpeW/l++8muWImOa0i+WkquepuuS4reWxleekuuS4reWbveWKn+WkqyAiPuelnuS5neaXpeW/l++8muWImOa0i+WkquepuuS4reWxleekuuS4reWbveWKn+WkqyA8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZGF0ZS1saW5lIj4x5bCP5pe25YmNPC9kaXY+PGRpdiBjbGFzcz0iY2xlYXIiPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9Iml0ZW0iPjxkaXYgY2xhc3M9Im5hbWUiPjxhIGhyZWY9InJlc3VsdC5hc3B4P3E9JWU0JWI4JTgxJWU0JWJmJThhJWU2JTk5JTk2JkZyb21WaWV3PTEiIHRpdGxlPSLkuIHkv4rmmZYiPuS4geS/iuaZljwvYT48L2Rpdj48ZGl2IGNsYXNzPSJuZXdzLWxpbmUiPjxhIGhyZWY9Imh0dHA6Ly9uZXdzLmNxbmV3cy5uZXQvaHRtbC8yMDEyLTA2LzI3L2NvbnRlbnRfMTY5MDU3NzkuaHRtIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IuS4geS/iuaZluS6ruebuOaWr+ivuuWFi+eyvuiLsei1myDmlYXkuaHlkI7mj7Tlm6LpmLXlrrnlvLrlpKcgICI+5LiB5L+K5pmW5Lqu55u45pav6K+65YWL57K+6Iux6LWbIOaVheS5oeWQjuaPtOWboumYteWuueW8ui4uLjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjHlsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTklODMlOTElZTYlYjQlODEmRnJvbVZpZXc9MSIgdGl0bGU9IumDkea0gSI+6YOR5rSBPC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL25ld3MubGFuemhvdS5jbi9zeXN0ZW0vMjAxMi8wNi8yNy8wMTAxNzg4Njcuc2h0bWwiIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i5rip572R6YOR5rSB6Y+W5oiY6YCG6L2sTk8uMTA56L+b5qyh6L2u5bCG5oiY5rOV572R5Yak5a62ICI+5rip572R6YOR5rSB6Y+W5oiY6YCG6L2sTk8uMTA56L+b5qyh6L2u5bCG5oiY5rOVLi4uPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImRhdGUtbGluZSI+MeWwj+aXtuWJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlNiU4OCViNCVlNyViYiViNCVlNiU5NiVhZiZGcm9tVmlldz0xIiB0aXRsZT0i5oi057u05pavIj7miLTnu7Tmlq88L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vc3BvcnRzLmNxbmV3cy5uZXQvaHRtbC8yMDEyLTA2LzI3L2NvbnRlbnRfMTY5MTc0MzcuaHRtIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IuiAgeWwhuaItOe7tOaWr+iHquS/oeWwhuS8muW9kuadpSDogq/lrprmnpfkuabosarkuIrotZvlraPooajnjrAgICI+6ICB5bCG5oi057u05pav6Ieq5L+h5bCG5Lya5b2S5p2lIOiCr+Wumuael+S5puixquS4iui1m+Wtoy4uLjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjHlsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTUlYmUlYjclZTclYmQlOTclZTUlYjclYjQmRnJvbVZpZXc9MSIgdGl0bGU9IuW+t+e9l+W3tCI+5b63572X5be0PC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL3d3dy5oaW5ld3MuY24vbmV3cy9zeXN0ZW0vMjAxMi8wNi8yNy8wMTQ1NzA3MTkuc2h0bWwiIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i5b63572X5be05oiW5bCG5oqV5aWU5be06JCoIOmtlOWFveWjsOaYjjfmnIjlsLHljrvnlLPoirHmiqXliLAgIj7lvrfnvZflt7TmiJblsIbmipXlpZTlt7TokKgg6a2U5YW95aOw5piON+aciOWwseWOu+eUs+iKsS4uLjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjHlsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iY2F0IiBzdHlsZT0iZmxvYXQ6cmlnaHQ7Ij48ZGl2IGNsYXNzPSJjYXQtbmFtZSI+PGRpdiBjbGFzcz0iY2F0LW5hbWUtYSI+PGEgaHJlZj0iSG90TmV3cy5hc3B4P2NhdGU9MiZ0aW1tZXI9MCI+5aix5LmQPC9hPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MiPjxkaXYgY2xhc3M9Iml0ZW0iPjxkaXYgY2xhc3M9Im5hbWUiPjxhIGhyZWY9InJlc3VsdC5hc3B4P3E9JWU5JTk5JTg4JWU0JWJkJWE5JWU2JTk2JWFmJkZyb21WaWV3PTEiIHRpdGxlPSLpmYjkvanmlq8iPumZiOS9qeaWrzwvYT48L2Rpdj48ZGl2IGNsYXNzPSJuZXdzLWxpbmUiPjxhIGhyZWY9Imh0dHA6Ly9uZXdzLnhpYW5jbi5jb20vY29udGVudC8yMDEyLTA2LzI3L2NvbnRlbnRfMjYyNzQ2NC5odG0iIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i6ZmI5L2p5pav54i25Lqy6ZmI5by655eF6YCdIOe7j+WFuOinkuiJsuWkp+WbnumhviAiPumZiOS9qeaWr+eItuS6sumZiOW8uueXhemAnSDnu4/lhbjop5LoibLlpKflm57pob4gPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImRhdGUtbGluZSI+NTLliIbpkp/liY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTYlOWYlYjMlZTUlYjIlYTkmRnJvbVZpZXc9MSIgdGl0bGU9Iuafs+WyqSI+5p+z5bKpPC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL3lsLmNoaW5hd2VzdG5ld3MubmV0L3N5c3RlbS8yMDEyLzA2LzI3LzAxMDQ2MTExMy5zaHRtbCIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLmn7Plsqnml6DmhI/liqDnm5/muZbljZfljavop4bvvJrlt6XkvZzph43lv4Plt7LovazliLDnlLXlvbHkuIogIj7mn7Plsqnml6DmhI/liqDnm5/muZbljZfljavop4bvvJrlt6XkvZzph43lv4Plt7LovazliLDnlLXlvbHkuIogPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImRhdGUtbGluZSI+MeWwj+aXtuWJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlOCViMCVhMiVlNSVhOCU5YyZGcm9tVmlldz0xIiB0aXRsZT0i6LCi5aicIj7osKLlqJw8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vbmV3cy5jcW5ld3MubmV0L2h0bWwvMjAxMi0wNi8yNy9jb250ZW50XzE2OTE4OTgxLmh0bSIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLosKLlqJzlkKborqTpo57mnLrkuIrlvZPkvJfmkpLms7zvvJrliKvmnInorqHliJLnmoTor73osKTor6zpmbcgICI+6LCi5aic5ZCm6K6k6aOe5py65LiK5b2T5LyX5pKS5rO877ya5Yir5pyJ6K6h5YiS55qE6K+96LCk6K+sLi4uPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImRhdGUtbGluZSI+MeWwj+aXtuWJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlOSU4MyU5MSVlNSViOCU4YyVlNiU4MCVhMSZGcm9tVmlldz0xIiB0aXRsZT0i6YOR5biM5oChIj7pg5HluIzmgKE8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vZW50LmNxbmV3cy5uZXQvaHRtbC8yMDEyLTA2LzI3L2NvbnRlbnRfMTY5MTIxMjYuaHRtIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IumDkeW4jOaAoei3jOWAkuaRlOaIkOmHjeS8pCDlupTph4flhL/np7Dlhbblt7Lluqbov4fljbHpmanmnJ8gICI+6YOR5biM5oCh6LeM5YCS5pGU5oiQ6YeN5LykIOW6lOmHh+WEv+ensOWFtuW3suW6pui/h+WNsemZqS4uLjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjHlsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTYlOWIlYjklZTklYTIlOTYmRnJvbVZpZXc9MSIgdGl0bGU9IuabuemiliI+5pu56aKWPC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL3d3dy55Y2VuLmNvbS5jbi9jb250ZW50LzIwMTItMDYvMjcvY29udGVudF8xMTE0MzIzLmh0bSIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLmm7npopbljZbmiL/lkI7ov73orqjmi4bov4HmrL4g6KKr5Yik6LSl6K+JICI+5pu56aKW5Y2W5oi/5ZCO6L+96K6o5ouG6L+B5qy+IOiiq+WIpOi0peiviSA8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZGF0ZS1saW5lIj4x5bCP5pe25YmNPC9kaXY+PGRpdiBjbGFzcz0iY2xlYXIiPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImNhdCI+PGRpdiBjbGFzcz0iY2F0LW5hbWUiPjxkaXYgY2xhc3M9ImNhdC1uYW1lLWEiPjxhIGhyZWY9IkhvdE5ld3MuYXNweD9jYXRlPTMmdGltbWVyPTAiPuaUv+ayuzwvYT48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJuZXdzIj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlNiU5OSVhZSVlNCViYSVhYyZGcm9tVmlldz0xIiB0aXRsZT0i5pmu5LqsIj7mma7kuqw8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vd3d3LmNzLmNvbS5jbi9ody9ocXp4LzIwMTIwNi90MjAxMjA2MjdfMzM4NTk1Ny5odG1sIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IuaZruS6rOS4u+W8oOmCgOivt+S8iuacl+WHuuW4reWPmeWIqeS6mumXrumimOWbvemZheS8muiuriAiPuaZruS6rOS4u+W8oOmCgOivt+S8iuacl+WHuuW4reWPmeWIqeS6mumXrumimOWbvemZheS8muiuriA8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZGF0ZS1saW5lIj41N+WIhumSn+WJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlNSVhNSVhNSVlNSViNyViNCVlOSVhOSVhYyZGcm9tVmlldz0xIiB0aXRsZT0i5aWl5be06amsIj7lpaXlt7Tpqaw8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vd3d3LmNzLmNvbS5jbi9ody9ocXp4LzIwMTIwNi90MjAxMjA2MjdfMzM4NTk1Ni5odG1sIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IuWlpeW3tOmprOaVpuS/g+W4jOiFiuaOqOi/m+e7j+a1juaUuemdqSAiPuWlpeW3tOmprOaVpuS/g+W4jOiFiuaOqOi/m+e7j+a1juaUuemdqSA8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZGF0ZS1saW5lIj41MOWIhumSn+WJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlOSViYiU5OCVlNSU4NSU4YiVlNSViMCU5NCZGcm9tVmlldz0xIiB0aXRsZT0i6buY5YWL5bCUIj7pu5jlhYvlsJQ8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vbmV3cy5jcW5ld3MubmV0L2h0bWwvMjAxMi0wNi8yNy9jb250ZW50XzE2OTE4NjcyLmh0bSIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLlvrflm73orq7lkZjnp7Dpu5jlhYvlsJTlhrPkuI3lkIzmhI/mrKfmtLLlhbHlkIzliIbmi4XlgLrliqEgICI+5b635Zu96K6u5ZGY56ew6buY5YWL5bCU5Yaz5LiN5ZCM5oSP5qyn5rSy5YWx5ZCM5YiG5ouF5YC65YqhICA8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZGF0ZS1saW5lIj41MuWIhumSn+WJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJpdGVtIj48ZGl2IGNsYXNzPSJuYW1lIj48YSBocmVmPSJyZXN1bHQuYXNweD9xPSVlNSVhZSU4OSVlNSU4ZCU5NyZGcm9tVmlldz0xIiB0aXRsZT0i5a6J5Y2XIj7lronljZc8L2E+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cy1saW5lIj48YSBocmVmPSJodHRwOi8vd3d3LmNzLmNvbS5jbi9ody9ocXp4LzIwMTIwNi90MjAxMjA2MjdfMzM4NTk1Ny5odG1sIiB0YXJnZXQ9Il9ibGFuayIgdGl0bGU9IuaZruS6rOS4u+W8oOmCgOivt+S8iuacl+WHuuW4reWPmeWIqeS6mumXrumimOWbvemZheS8muiuriAiPuaZruS6rOS4u+W8oOmCgOivt+S8iuacl+WHuuW4reWPmeWIqeS6mumXrumimOWbvemZheS8muiuriA8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZGF0ZS1saW5lIj4x5bCP5pe25YmNPC9kaXY+PGRpdiBjbGFzcz0iY2xlYXIiPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9Iml0ZW0iPjxkaXYgY2xhc3M9Im5hbWUiPjxhIGhyZWY9InJlc3VsdC5hc3B4P3E9JWU1JWFkJTlmJWU1JWJiJWJhJWU2JTlmJWIxJkZyb21WaWV3PTEiIHRpdGxlPSLlrZ/lu7rmn7EiPuWtn+W7uuafsTwvYT48L2Rpdj48ZGl2IGNsYXNzPSJuZXdzLWxpbmUiPjxhIGhyZWY9Imh0dHA6Ly93d3cuY2UuY24veHd6eC9nbnN6L2dkeHcvMjAxMjA2LzI3L3QyMDEyMDYyN18yMzQ0MDc2Mi5zaHRtbCIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLlrZ/lu7rmn7Hlu7rorq7liJHms5Xlop7orr7igJzmr5Lpqb7nvarigJ0gIj7lrZ/lu7rmn7Hlu7rorq7liJHms5Xlop7orr7igJzmr5Lpqb7nvarigJ0gPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImRhdGUtbGluZSI+MeWwj+aXtuWJjTwvZGl2PjxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJjYXQiIHN0eWxlPSJmbG9hdDpyaWdodDsiPjxkaXYgY2xhc3M9ImNhdC1uYW1lIj48ZGl2IGNsYXNzPSJjYXQtbmFtZS1hIj48YSBocmVmPSJIb3ROZXdzLmFzcHg/Y2F0ZT00JnRpbW1lcj0wIj7llYbnlYw8L2E+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0ibmV3cyI+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTklOWIlYjclZTUlODYlOWImRnJvbVZpZXc9MSIgdGl0bGU9Iumbt+WGmyI+6Zu35YabPC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL25ld3MuY3FuZXdzLm5ldC9odG1sLzIwMTItMDYvMjYvY29udGVudF8xNjkwNzcyMC5odG0iIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i6Zu35Yab56ew5bCP57Gz5omL5py65bCG5YW85a65V1Dns7vnu58g5oiW6Zq+5bu257ut5L2O5Lu35LyY5Yq/ICAiPumbt+WGm+ensOWwj+exs+aJi+acuuWwhuWFvOWuuVdQ57O757ufIOaIlumavuW7tue7reS9ji4uLjwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjHlsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTUlOTElYTglZTklYjglYmYlZTclYTUlOGUmRnJvbVZpZXc9MSIgdGl0bGU9IuWRqOm4v+eljiI+5ZGo6bi/56WOPC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL2RpZ2kuY3lvbC5jb20vY29udGVudC8yMDEyLTA2LzI3L2NvbnRlbnRfNjQ4MzQzMS5odG0iIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i6Zu35Yab5ZCm6K6k5bCP57Gz5pq05YipIOWRqOm4v+eljuWdmuensOavm+WIqemrmCjlm74pICI+6Zu35Yab5ZCm6K6k5bCP57Gz5pq05YipIOWRqOm4v+eljuWdmuensOavm+WIqemrmCjlm74pIDwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjHlsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTklYmIlOTglZTUlYTQlOWElZTUlODUlOGImRnJvbVZpZXc9MSIgdGl0bGU9Ium7mOWkmuWFiyI+6buY5aSa5YWLPC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL25ld3MuY3FuZXdzLm5ldC9odG1sLzIwMTItMDYvMjcvY29udGVudF8xNjkxNjc2Ny5odG0iIHRhcmdldD0iX2JsYW5rIiB0aXRsZT0i6buY5aSa5YWL5paw6Ze76ZuG5Zui5ouf5ouG5YiG5oiQ5Lik5Liq5YWs5Y+4IOacgOW/q+S4pOWkqeWGheWuo+W4gyAgIj7pu5jlpJrlhYvmlrDpl7vpm4blm6Lmi5/mi4bliIbmiJDkuKTkuKrlhazlj7gg5pyA5b+r5Lik5aSpLi4uPC9hPjwvZGl2PjxkaXYgY2xhc3M9ImRhdGUtbGluZSI+NTLliIbpkp/liY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaXRlbSI+PGRpdiBjbGFzcz0ibmFtZSI+PGEgaHJlZj0icmVzdWx0LmFzcHg/cT0lZTglYjQlYmUlZTUlYmElYjcmRnJvbVZpZXc9MSIgdGl0bGU9Iui0vuW6tyI+6LS+5bq3PC9hPjwvZGl2PjxkaXYgY2xhc3M9Im5ld3MtbGluZSI+PGEgaHJlZj0iaHR0cDovL25ld3MuaW5ld3N3ZWVrLmNuL25ld3MtMjcxNzcuaHRtbCIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSLojYnmoYjop4TlrprlnLDmlrnmlL/lupzkuI3og73kuL7lgLog5aSa5pWw572R5rCR5pSv5oyBICAiPuiNieahiOinhOWumuWcsOaWueaUv+W6nOS4jeiDveS4vuWAuiDlpJrmlbDnvZHmsJHmlK/mjIEgIDwvYT48L2Rpdj48ZGl2IGNsYXNzPSJkYXRlLWxpbmUiPjflsI/ml7bliY08L2Rpdj48ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+ZGQgQZYbBwdzLHyBo3ZbypvW+PfF/zfWQuTbMC+NtRyM4g==">
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
	<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBALBlcb3BAKUi9OTAwLzrby4DQLY+rfwC1XzNBvBBeTI85PiVBCW/Bjjw7uv4kRVoj+eYn+Voeuo">
</div>
    <div class="container">
        <div class="index-header-wrapper">
            <div class="header-top">
                <a href="GuanxiMap.aspx" class="right-top">
                    <img src="<%=path%>/web/images/guanxiquan.png" alt="关系圈"></a>
            </div>
            <div class="index-header-middle">
                <div class="index-logo-up">
                </div>
            </div>
            <div class="index-header-bottom">
                <div class="top-right">
                    <a href="/login.aspx" style="margin-left: 13px;">登录</a>
                </div>
            </div>
        </div>
        <div class="index-search-down">
        </div>
        <div>
            
    <div class="index-search-bar">
        <div id="MainContent_Panel1" onkeypress="javascript:return WebForm_FireDefaultButton(event, 'MainContent_HomepageSearchButton')">
	
            <div class="index-search-panel">
                <div class="index-search-input-wrapper">
                    <div class="index-search-input-box-wrapper">
                        <input name="ctl00$MainContent$HomepageSearchTextBox" type="text" value="张磊" id="MainContent_HomepageSearchTextBox" class="index-search-input" title="输入中文关键词，如：张亚勤，比尔-盖茨，兵乓球，微软亚洲研究院">
                    </div>
                    <input type="submit" name="ctl00$MainContent$HomepageSearchButton" value="" id="MainContent_HomepageSearchButton" class="index-search-btn" alt="搜索" title="搜索">
                    <input type="submit" name="ctl00$MainContent$HomepageCreateButton" value="" id="MainContent_HomepageCreateButton" class="index-create-btn" alt="创建词条" title="创建词条">
                </div>
                <div class="index-search-readme">
                    <a href="readme.aspx">使用须知</a></div>
            </div>
        
</div>
    </div>
    <div class="index-content-wrapper">
        <div class="index-wiki-create">
            <div class="tip-left" style="">
                &nbsp;</div>
            <div class="tip-middle" style="">
                <div class="tip-icon">
                </div>
                <div class="tip-content">
                    人立方可以编辑啦！你可以<a href="readme_baike.aspx">创建人立方词条</a>，并且把它加入到人立方关系脉络中哦！</div>
            </div>
            <div class="tip-right" style="">
                <div class="tip-close">
                    <a href="javascript:" onclick="CloseCreateTip();">
                        <img src="<%=path%>/web/images/create_tip_close.png" alt="下次不再显示"></a>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="feature">
            <div class="item">
                <div class="icon">
                    <a href="baike.aspx">
                        <img alt="关系百科" src="<%=path%>/web/images/app_guanxibaike.png"></a>
                </div>
                <div class="name">
                    <a href="baike.aspx">关系百科</a>
                </div>
                <div class="desp">
                    人物关系大百科
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <a href="Q20/index.aspx">
                        <img alt="Q20读心机器人" src="<%=path%>/web/images/app_q20.png"></a>
                </div>
                <div class="name">
                    <a href="Q20/index.aspx"><span class="special-font-for-Q20">Q20</span>读心机器人</a>
                </div>
                <div class="desp">
                    我能猜出你心中的TA
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <a href="t/index.aspx">
                        <img alt="微博关系图" src="<%=path%>/web/images/app_weibo.png"></a>
                </div>
                <div class="name">
                    <a href="t/index.aspx">微博关系图</a>
                </div>
                <div class="desp">
                    微博关系连连看
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <a href="6dumap.aspx">
                        <img alt="六度搜索" src="<%=path%>/web/images/app_6du.png"></a>
                </div>
                <div class="name">
                    <a href="6dumap.aspx">六度搜索</a>
                </div>
                <div class="desp">
                    验证六度空间理论
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="index-news-wrapper">
            <div class="title">
                <div class="more">
                    <a href="HotNews.aspx?cate=0&amp;timmer=0" title="更多" class="more-arrow-img"></a>
                </div>
                <div class="desp">
                    人气榜 · <a href="namelist.aspx" class="nameListAnchor">人名大全</a></div>
            </div>
            <div class="content">
                <div class="cat"><div class="cat-name"><div class="cat-name-a"><a href="HotNews.aspx?cate=1&amp;timmer=0">体育</a></div></div><div class="news"><div class="item"><div class="name"><a href="result.aspx?q=%e5%88%98%e6%b4%8b&amp;FromView=1" title="刘洋">刘洋</a></div><div class="news-line"><a href="http://shipin.lanzhou.cn/system/2012/06/27/010179155.shtml" target="_blank" title="神九日志：刘洋太空中展示中国功夫 ">神九日志：刘洋太空中展示中国功夫 </a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e4%b8%81%e4%bf%8a%e6%99%96&amp;FromView=1" title="丁俊晖">丁俊晖</a></div><div class="news-line"><a href="http://news.cqnews.net/html/2012-06/27/content_16905779.htm" target="_blank" title="丁俊晖亮相斯诺克精英赛 故乡后援团阵容强大  ">丁俊晖亮相斯诺克精英赛 故乡后援团阵容强...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e9%83%91%e6%b4%81&amp;FromView=1" title="郑洁">郑洁</a></div><div class="news-line"><a href="http://news.lanzhou.cn/system/2012/06/27/010178867.shtml" target="_blank" title="温网郑洁鏖战逆转NO.109进次轮将战法网冤家 ">温网郑洁鏖战逆转NO.109进次轮将战法...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e6%88%b4%e7%bb%b4%e6%96%af&amp;FromView=1" title="戴维斯">戴维斯</a></div><div class="news-line"><a href="http://sports.cqnews.net/html/2012-06/27/content_16917437.htm" target="_blank" title="老将戴维斯自信将会归来 肯定林书豪上赛季表现  ">老将戴维斯自信将会归来 肯定林书豪上赛季...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e5%be%b7%e7%bd%97%e5%b7%b4&amp;FromView=1" title="德罗巴">德罗巴</a></div><div class="news-line"><a href="http://www.hinews.cn/news/system/2012/06/27/014570719.shtml" target="_blank" title="德罗巴或将投奔巴萨 魔兽声明7月就去申花报到 ">德罗巴或将投奔巴萨 魔兽声明7月就去申花...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div></div></div><div class="cat" style="float:right;"><div class="cat-name"><div class="cat-name-a"><a href="HotNews.aspx?cate=2&amp;timmer=0">娱乐</a></div></div><div class="news"><div class="item"><div class="name"><a href="result.aspx?q=%e9%99%88%e4%bd%a9%e6%96%af&amp;FromView=1" title="陈佩斯">陈佩斯</a></div><div class="news-line"><a href="http://news.xiancn.com/content/2012-06/27/content_2627464.htm" target="_blank" title="陈佩斯父亲陈强病逝 经典角色大回顾 ">陈佩斯父亲陈强病逝 经典角色大回顾 </a></div><div class="date-line">52分钟前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e6%9f%b3%e5%b2%a9&amp;FromView=1" title="柳岩">柳岩</a></div><div class="news-line"><a href="http://yl.chinawestnews.net/system/2012/06/27/010461113.shtml" target="_blank" title="柳岩无意加盟湖南卫视：工作重心已转到电影上 ">柳岩无意加盟湖南卫视：工作重心已转到电影上 </a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e8%b0%a2%e5%a8%9c&amp;FromView=1" title="谢娜">谢娜</a></div><div class="news-line"><a href="http://news.cqnews.net/html/2012-06/27/content_16918981.htm" target="_blank" title="谢娜否认飞机上当众撒泼：别有计划的诽谤诬陷  ">谢娜否认飞机上当众撒泼：别有计划的诽谤诬...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e9%83%91%e5%b8%8c%e6%80%a1&amp;FromView=1" title="郑希怡">郑希怡</a></div><div class="news-line"><a href="http://ent.cqnews.net/html/2012-06/27/content_16912126.htm" target="_blank" title="郑希怡跌倒摔成重伤 应采儿称其已度过危险期  ">郑希怡跌倒摔成重伤 应采儿称其已度过危险...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e6%9b%b9%e9%a2%96&amp;FromView=1" title="曹颖">曹颖</a></div><div class="news-line"><a href="http://www.ycen.com.cn/content/2012-06/27/content_1114323.htm" target="_blank" title="曹颖卖房后追讨拆迁款 被判败诉 ">曹颖卖房后追讨拆迁款 被判败诉 </a></div><div class="date-line">1小时前</div><div class="clear"></div></div></div></div><div class="cat"><div class="cat-name"><div class="cat-name-a"><a href="HotNews.aspx?cate=3&amp;timmer=0">政治</a></div></div><div class="news"><div class="item"><div class="name"><a href="result.aspx?q=%e6%99%ae%e4%ba%ac&amp;FromView=1" title="普京">普京</a></div><div class="news-line"><a href="http://www.cs.com.cn/hw/hqzx/201206/t20120627_3385957.html" target="_blank" title="普京主张邀请伊朗出席叙利亚问题国际会议 ">普京主张邀请伊朗出席叙利亚问题国际会议 </a></div><div class="date-line">57分钟前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e5%a5%a5%e5%b7%b4%e9%a9%ac&amp;FromView=1" title="奥巴马">奥巴马</a></div><div class="news-line"><a href="http://www.cs.com.cn/hw/hqzx/201206/t20120627_3385956.html" target="_blank" title="奥巴马敦促希腊推进经济改革 ">奥巴马敦促希腊推进经济改革 </a></div><div class="date-line">50分钟前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e9%bb%98%e5%85%8b%e5%b0%94&amp;FromView=1" title="默克尔">默克尔</a></div><div class="news-line"><a href="http://news.cqnews.net/html/2012-06/27/content_16918672.htm" target="_blank" title="德国议员称默克尔决不同意欧洲共同分担债务  ">德国议员称默克尔决不同意欧洲共同分担债务  </a></div><div class="date-line">52分钟前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e5%ae%89%e5%8d%97&amp;FromView=1" title="安南">安南</a></div><div class="news-line"><a href="http://www.cs.com.cn/hw/hqzx/201206/t20120627_3385957.html" target="_blank" title="普京主张邀请伊朗出席叙利亚问题国际会议 ">普京主张邀请伊朗出席叙利亚问题国际会议 </a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e5%ad%9f%e5%bb%ba%e6%9f%b1&amp;FromView=1" title="孟建柱">孟建柱</a></div><div class="news-line"><a href="http://www.ce.cn/xwzx/gnsz/gdxw/201206/27/t20120627_23440762.shtml" target="_blank" title="孟建柱建议刑法增设“毒驾罪” ">孟建柱建议刑法增设“毒驾罪” </a></div><div class="date-line">1小时前</div><div class="clear"></div></div></div></div><div class="cat" style="float:right;"><div class="cat-name"><div class="cat-name-a"><a href="HotNews.aspx?cate=4&amp;timmer=0">商界</a></div></div><div class="news"><div class="item"><div class="name"><a href="result.aspx?q=%e9%9b%b7%e5%86%9b&amp;FromView=1" title="雷军">雷军</a></div><div class="news-line"><a href="http://news.cqnews.net/html/2012-06/26/content_16907720.htm" target="_blank" title="雷军称小米手机将兼容WP系统 或难延续低价优势  ">雷军称小米手机将兼容WP系统 或难延续低...</a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e5%91%a8%e9%b8%bf%e7%a5%8e&amp;FromView=1" title="周鸿祎">周鸿祎</a></div><div class="news-line"><a href="http://digi.cyol.com/content/2012-06/27/content_6483431.htm" target="_blank" title="雷军否认小米暴利 周鸿祎坚称毛利高(图) ">雷军否认小米暴利 周鸿祎坚称毛利高(图) </a></div><div class="date-line">1小时前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e9%bb%98%e5%a4%9a%e5%85%8b&amp;FromView=1" title="默多克">默多克</a></div><div class="news-line"><a href="http://news.cqnews.net/html/2012-06/27/content_16916767.htm" target="_blank" title="默多克新闻集团拟拆分成两个公司 最快两天内宣布  ">默多克新闻集团拟拆分成两个公司 最快两天...</a></div><div class="date-line">52分钟前</div><div class="clear"></div></div><div class="item"><div class="name"><a href="result.aspx?q=%e8%b4%be%e5%ba%b7&amp;FromView=1" title="贾康">贾康</a></div><div class="news-line"><a href="http://news.inewsweek.cn/news-27177.html" target="_blank" title="草案规定地方政府不能举债 多数网民支持  ">草案规定地方政府不能举债 多数网民支持  </a></div><div class="date-line">7小时前</div><div class="clear"></div></div></div></div>
            </div>
        </div>
    </div>

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
    
<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['Form1'];
if (!theForm) {
    theForm = document.Form1;
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


<script src="/WebResource.axd?d=jXKwFGCSaSU8qmE-SRDGaRok9ERJG8uVHo24OkdZKUqqYQGDjW_fOsqTvYd5dYzeEWlp_XuoKC1PzYvbjDVB3Qjul7A225kR5GCI2OuejwY1&amp;t=634654410482122410" type="text/javascript"></script>
</form>


</body></html>