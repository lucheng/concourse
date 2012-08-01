<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%
	String[] keys = new String[10];
	for(int i = 0; (i < 10) && request.getAttribute("key" + i) != null; i++){
		keys[i] = request.getAttribute("key" + i).toString();
		//System.out.println(key[i]);
	}
	
	//System.out.println(getkeys);
%>
<keys>
<%for(int i = 0; (i < 10) && keys[i] != null; i++){%>
	<key><%out.print(keys[i]);%></key>
<%}%>
</keys>