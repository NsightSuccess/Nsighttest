<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=windows-1252">
<META NAME="DESCRIPTION" CONTENT="This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs.">
<META NAME="KEYWORDS" CONTENT="on-line assessment,Nsight,Insight,Directional Insight International,Aptitude,Aptitude Testing,Personality,Personality Testing,Management,Coaching,Teambuilding needs.">
<TITLE>Pricing</TITLE>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="dsn.txt" -->
<%
    sql = "SELECT * FROM [Products]"
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
    If rs2.eof Then
    End If
%>
<%
On Error Resume Next
rs2.MoveFirst
do while Not rs2.eof
prodid = rs2("ProductID")
%>
<%
    sql = "SELECT * FROM Prod_Prices  WHERE ((([Prod_Prices].[ProductID])= " & prodid & "))  ORDER BY [Prod_Prices].[Qty]   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
%>
<center>
<TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0 width="240"><FONT FACE="Arial" COLOR=#000000></FONT>
<THEAD>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 colspan="2" ><b><font face="Verdana" size="2" color="#000080"><i><%=rs2("PDesc")%></i></font></b>&nbsp;</TH>
</TR>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Quantity</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Price Each</font></TH>
</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
qty1 = rs("Qty")
If IsNull(rs("Qty2")) Then qty2 = "+" Else qty2 = " to " & rs("Qty2")
price = FormatCurrency(rs("UnitPrice"))
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0  ALIGN=center width="50%"><font face="Arial" size="1" color="#000000"><b><%=qty1%><%=qty2%><BR></b></font></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=center width="50%"><font face="Arial" size="1" color="#000000"><b><%=price%><BR></b></font></TD>
</TR>
<%
rs.MoveNext
loop
%>
</TBODY>
<TFOOT></TFOOT>
</TABLE>
<img border="0" src="images/clear.GIF" height=7><br>
<%
rs2.MoveNext
loop
%>
</center>
</BODY>
</HTML>