<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" NAME="CDO for Windows Library"-->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library"-->
<!-- #INCLUDE FILE="dsn.txt" -->
<html>
    <head>
        <meta name="DESCRIPTION" content="This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs."/>
        <meta name="KEYWORDS" content="on-line assessment,Nsight,Insight,Directional Insight International,Aptitude,Aptitude Testing,Personality,Personality Testing,Management,Coaching,Teambuilding needs."/>
    </head>
    <body>
        <%
            profileid = request("profileid")
                sql = "SELECT [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Cust_Profiles].[Position], [Cust_Profiles].[DateTaken], [Cust_Profiles].[pwUsed],[Cust_Profiles].[Salutation], [Cust_Profiles].[First], [Cust_Profiles].[Last], [Products].[PDesc]  FROM Products INNER JOIN (Customers INNER JOIN Cust_Profiles ON [Customers].[CustomerID]=[Cust_Profiles].[CustomerID]) ON [Products].[ProductID]=[Cust_Profiles].[ProductID]  WHERE ((([Cust_Profiles].[ProfileID])= " & profileid & "))   "
                Set rs = Server.CreateObject("ADODB.Recordset")
                rs.Open sql, conn, 3, 3
            ccompany = replace(rs("Company"),"_","-no company-")
            ccompany2 = rs("Company")
            cname = rs("FirstName") & " " & rs("LastName")
            pname = rs("First") & " " & rs("Last")
            pdate = rs("DateTaken")
            product = rs("PDesc")
            sal = rs("Salutation")
            If (rs("Position") = "") OR (IsNull(rs("Position"))) Then pos = "" Else pos = ", " & rs("Position")
            pos1=rs("Position")
            pwused = rs("pwUsed")
        %>
        <table border="1" width="450" cellspacing="0" align="center">
          <tr>
            <td colspan="2" align="center" width="398"><font face="Verdana" size="2" color="#000080"><b><i>Profile Results for <%=pname%></i></b></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Customer: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=cname%></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Company: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=ccompany%></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Assessment Profile: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=sal%>&nbsp;<%=pname%></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Position: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=pos1%></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Assessment Taken: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><i><%=product%></i></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Date Taken: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=pdate%></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>Auth Code Used: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=pwused%></font></td>
          </tr>
          <tr>
            <td><font face="Verdana" size="2" color="#000080"><b>ProfileID: </b></font></td>
            <td><font face="Verdana" size="2" color="#000080"><%=profileid%></font></td>
          </tr>
        </table>
        <br />
        <br />
        <%
            sql = "SELECT [Prod_Tests].[TestID], [Prod_Tests].[PDesc]  FROM (Products INNER JOIN Cust_Profiles ON [Products].[ProductID]=[Cust_Profiles].[ProductID]) INNER JOIN (Prod_Tests INNER JOIN Prod_Detail ON [Prod_Tests].[TestID]=[Prod_Detail].[TestID]) ON [Products].[ProductID]=[Prod_Detail].[ProductID]  WHERE ((([Cust_Profiles].[ProfileID])= " & profileid & ")) ORDER BY sorder  "
            Set rs3 = Server.CreateObject("ADODB.Recordset")
            rs3.Open sql, conn, 3, 3
        %>
        <%
            rs3.MoveFirst
            do while Not rs3.eof
            testid = rs3("TestID")
            x=0
        %>
        <%
            sql = "SELECT [Prod_TestQuestions].[TestQOrder], [Cust_TestResults].[TestAnswer]  FROM Prod_TestQuestions INNER JOIN Cust_TestResults ON [Prod_TestQuestions].[QuestionID]=[Cust_TestResults].[QuestionID]  WHERE ((([Cust_TestResults].[ProfileID])= " & profileid & ") And (([Prod_TestQuestions].[TestID])= " & testid & "))  ORDER BY [Prod_TestQuestions].[TestQOrder]   "
            Set rs2 = Server.CreateObject("ADODB.Recordset")
            rs2.Open sql, conn, 3, 3
            If rs2.eof Then
            End If
        %>
        <table border="1" BGCOLOR=#ffffff CELLSPACING=0 width="450" align="center">
        <THEAD><tr>
        <TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 valign="middle" align="center" colspan=10><font face="Verdana" size="2" color="#000080"><%=rs3("PDesc")%></font></TH>
        </THEAD>
        <TBODY>
        <%
            On Error Resume Next
            rs2.MoveFirst
            do while Not rs2.eof
            x = x + 1
            If x = 10 Then row = "</tr>" Else row = ""
            If x = 10 Then x = 0 Else x = x
        %>
        <%
        if cInt(rs2("TestQOrder")) < 10 then num="0"&rs2("TestQOrder")
        %>
            <TD BORDERCOLOR=#c0c0c0  align=center valign="middle" nowrap>
                <FONT SIZE=2 FACE="Arial" COLOR=#000000><%=(num)%>)<%=rs2("TestAnswer")%><br />
                </FONT></TD><%=row%>
        <%else%>
        <TD BORDERCOLOR=#c0c0c0  align=center valign="middle" nowrap>
            <FONT SIZE=2 FACE="Arial" COLOR=#000000><%=rs2("TestQOrder")%>)<%=rs2("TestAnswer")%><br />
            </FONT></TD><%=row%>
        <%end if%>
        <%
            rs2.MoveNext
            loop
        %>
        </TBODY>
        </TABLE>
            <div class="style1" align="center">
        <%
            rs3.MoveNext
            loop
        %>
	        <br />
	        To Score Tests from this Site:<br />
            Save Screen as c:\nsight\NSight Management.txt<br />
	        <a href="programs/ServerNsight/LocalNsightAuto.doc"> Score this Test</a>
            </div>
    </body>
</html>
