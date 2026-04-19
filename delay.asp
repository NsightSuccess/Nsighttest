<%@ LANGUAGE="VBSCRIPT" %>
<%
If Request("orderid") = "" Then ord = "" Else ord = "&orderid=" & Request("orderid")
If Request("from") = "" Then from = "" Else from = "&from=" & Request("from")
DELAY_TIME = Request("DELAY_TIME")
REDIRECT_URL = Request("REDIRECT_URL")
url = Request("REDIRECT_URL")
DELAY_MESSAGE = Request("DELAY_MESSAGE")
%>
<html>
<head>
<meta http-equiv="Refresh" content="<% =DELAY_TIME %>; URL=<%=REDIRECT_URL%><%=from%><%=ord%><%=prof%>">
<title>Delay</title>
</head>
<body color="#FFFFFF">
<P>&nbsp;</P>
<font face="Arial"><p align = "center"><strong><% =DELAY_MESSAGE %></strong></p></font>
</body>
</html>
