<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Nsight Preliminary Info</TITLE>
<style type="text/css">
.style1 {
	text-align: center;
}
    .auto-style1 {
        height: 21px;
    }
</style>

<script type="text/javascript">
    var appInsights = window.appInsights || function (config) {
        function i(config) { t[config] = function () { var i = arguments; t.queue.push(function () { t[config].apply(t, i) }) } } var t = { config: config }, u = document, e = window, o = "script", s = "AuthenticatedUserContext", h = "start", c = "stop", l = "Track", a = l + "Event", v = l + "Page", y = u.createElement(o), r, f; y.src = config.url ||
    "https://az416426.vo.msecnd.net/scripts/a/ai.0.js"; u.getElementsByTagName(o)[0].parentNode.appendChild(y); try { t.cookie = u.cookie } catch (p) { } for (t.queue = [], t.version = "1.0", r = ["Event", "Exception", "Metric", "PageView", "Trace", "Dependency"]; r.length;) i("track" + r.pop()); return i("set" + s), i("clear" + s), i(h + a)
    , i(c + a), i(h + v), i(c + v), i("flush"), config.disableExceptionTracking || (r = "onerror", i("_" + r), f = e[r], e[r] = function (config, i, u, e, o) { var s = f && f(config, i, u, e, o); return s !== !0 && t["_" + r](config, i, u, e, o), s }), t
    }({
        instrumentationKey: "12f5d647-adb7-4b75-b37e-a54ed6081951"
    });
    window.appInsights = appInsights;
    appInsights.trackPageView();
</script>

</head>
<!-- #INCLUDE FILE="dsn.txt" -->
<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" NAME="CDO for Windows Library"-->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library"-->
<%
If request("action") = "" Then action = "next" Else action = request("action")
todaysdate = FormatDateTime(Date,2)
%>
<script type="text/javascript" language="JavaScript"><!--
function myopen(url,size) {
    window.open(url,'vrkey',size);
}
//--></script>
<!====================================== Body Starts =======================================>
<!=================================== Begin Starts =======================================>
<% select case action %>
<% case "begin" %>
<%
If request.cookies("profileid") = "" Then
response.redirect "insight_test.asp?action=next"
Else
profileid = request.cookies("profileid")
    sql = "SELECT [Prod_Detail].[TestID]  FROM (Products INNER JOIN Cust_Profiles ON [Products].[ProductID]=[Cust_Profiles].[ProductID]) INNER JOIN Prod_Detail ON [Products].[ProductID]=[Prod_Detail].[ProductID]  WHERE ((([Cust_Profiles].[ProfileID])= " & profileid & "))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
x = x + 1
If x = 1 Then test1 = rs("TestID") Else test1 = test1 '2 3
If x = 2 Then test2 = rs("TestID") Else test2 = test2 '7 2
If x = 3 Then test3 = rs("TestID") Else test3 = test3 '6 4
If x = 4 Then test4 = rs("TestID") Else test4 = test4 '5 5
If x = 5 Then test5 = rs("TestID") Else test5 = test5 '4 6
If x = 6 Then test6 = rs("TestID") Else test6 = test6 '  7
rs.MoveNext
loop

If x > 0 Then
response.cookies("test1") = test1
response.cookies("test2") = test2
response.cookies("test3") = test3
response.cookies("test4") = test4
response.cookies("test5") = test5
response.cookies("test6") = test6
response.redirect "insight_test.asp?action=multiple"
Else
response.cookies("test1") = test1
'response.redirect "insight_test.asp?action=single"
testid = request.cookies("test1")
profileid = request.cookies("profileid")
response.redirect "general_assessment_instructions_s.html"

End If
End If
%>
<!=================================== Begin Ends =========================================>
<!================================ Single4 Starts ====================================>
<% case "single4" %>
<%
profileid = request.cookies("profileid")

url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3=request.servervariables("QUERY_STRING")
url="http://" & url1 & url2 & "?action=results2&profileid=" & profileid
url = replace(url,"_test","_mgmt")
url4 = replace(url,"_test","_mgmt3")

'get profile info
    sql = "SELECT Cust_Profiles.CustomerID, Cust_Profiles.First, Cust_Profiles.Last, Cust_Profiles.pwUsed, Cust_Profiles.Email, Products.DoneText, Products.PDesc FROM Products INNER JOIN Cust_Profiles ON Products.ProductID = Cust_Profiles.ProductID  WHERE ProfileID = " & profileid & "  "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
password = rs("pwUsed")
message = rs("DoneText")
hismail = rs("Email")
product = rs("PDesc")
pname = rs("First") & " " & rs("Last")
cust = rs("CustomerID")

'get vendor info
    sql = "SELECT * FROM Customers WHERE CustomerID = 1"
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
toaddr = rs2("ccName")
toaddr2 = rs2("ccNumber")

'get customer email
    sql = "SELECT * FROM Customers WHERE CustomerID = " & cust & ""
    Set rs6 = Server.CreateObject("ADODB.Recordset")
    rs6.Open sql, conn, 3, 3
ccaddr = rs6("email")

strSQL = "DELETE FROM Cust_Passwords WHERE Password='" & password & "'"
conn.execute(strSQL)

HTML1 = "<font face=Verdana size=2><b>A client, " & pname & ", ProfileID: " & profileid & ", has completed the " & product & ". Please go <a href='" & url & "'>here</a> to view the test results.</b></font>"
HTML2 = "<font face=Verdana size=2><b>Congratulations on completing the " & product & ". Assessments are processed Monday thru Friday. All assessments submitted before 3:00PM central time will be processed that day. Assessments received after 3:00PM central time, or on the weekend, will be processed the following business day.</b></font>"
HTML3 = "<font face=Verdana size=2><b>A client, " & pname & ",  has completed the " & product & ". Please go <a href='" & url4 & "'>here</a> to view the test results.</b></font>"

'---------------New Test email1 start---------------
fromWho = toaddr                         'From Penny   admin
toWho = toaddr                             'To Penny      x
''cc=""
Subject = "-New Assessment "& profileid &" to Evaluate-" 
HTMLBody = HTML1

'sendMail fromWho, toWho, Subject, HTMLBody 

'---------------Thank You email start---------------
fromWho=toaddr                         'From Penny
toWho=hismail                             'To Customer
Subject = "-Thank You-"
'cc="" 
HTMLBody = HTML2

If toWho <> "" THEN
'sendMail fromWho, toWho, Subject, HTMLBody 
end if
'---------------Thank You email end-----------------

'response.cookies("password") = ""
'response.cookies("profileid") = ""
'response.cookies("test1") = ""
'response.cookies("productid") = ""
'---------------New Test email1 end-----------------

%>
<img border=0 src='images/clear.GIF' height=15><br>
<blockquote><p align="justify">
<font color="#000080" face=Verdana size=3><b><%=message%>
</b></font></blockquote>
<!=================================== Single4 Ends =======================================>

<!================================== Multiple Starts =====================================>
<% case "multiple"%>
<%
profileid = request.cookies("profileid")
    sql = "SELECT [Prod_TestQuestions].[TestID], Count([Cust_TestResults].[QuestionID]) AS CountOfQuestionID  FROM Prod_TestQuestions INNER JOIN Cust_TestResults ON [Prod_TestQuestions].[QuestionID]=[Cust_TestResults].[QuestionID]  WHERE ((([Cust_TestResults].[ProfileID])= " & profileid  & "))  GROUP BY [Prod_TestQuestions].[TestID]   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
x = x + 1
count = rs("CountOfQuestionID")
rs.MoveNext
loop

If IsEmpty(x) Then status = "start" Else status = "resume"
If IsEmpty(x) Then nexttest = request.cookies("test1") Else nexttest = nexttest
If x = 1 Then nexttest = request.cookies("test2") Else nexttest = nexttest 
If x = 2 Then nexttest = request.cookies("test3") Else nexttest = nexttest 
If x = 3 Then nexttest = request.cookies("test4") Else nexttest = nexttest 
If x = 4 Then nexttest = request.cookies("test5") Else nexttest = nexttest 
If x = 5 Then nexttest = request.cookies("test6") Else nexttest = nexttest
If nexttest = "" Then status = "done" Else status = status
response.cookies("nexttest") = nexttest

'If status = "start" Then response.redirect "insight_test.asp?action=multbegin"
If status = "start" Then response.redirect "general_assessment_instructions_m.html"
If status = "resume" Then response.redirect "insight_test.asp?action=multtest"
If status = "done" Then response.redirect "insight_test.asp?action=single4"
%>
<%=profileid%>"<br>
<%=status%>"<br>
<%=nexttest%>"<br>
<!=================================== Multiple Ends ======================================>
<!============================= Multiple Instructions Start ================================>
<% case "multbegin" %>
<%
On Error Resume Next
profileid = request.cookies("profileid")
    sql = "SELECT [Products].[ProfileText]  FROM Products INNER JOIN Cust_Profiles ON [Products].[ProductID]=[Cust_Profiles].[ProductID]  WHERE ((([Cust_Profiles].[ProfileID])= " & profileid & "))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
message = rs("ProfileText")
%>
<img border="0" src="images/clear.GIF" height=5><br>
<blockquote>
<p align="justify"><font face="Verdana" size="2" color="#000080"><b>
<%=message%></b></font>
</blockquote>
<p align="center">
<font face="Verdana" size="3" color="#000080"><b><i>
<a target="_top" href="insight_test.asp?action=multtest">BEGIN TEST</a></i></b></font><br>
<!============================= Multiple Instructions Ends =================================>

<!============================= Multiple Give Test Starts ==================================>
<% case "multtest" %>
<%
'get instructions for this test
nexttest = request.cookies("nexttest")
    sql = "SELECT [Prod_Tests].[Instructions]  FROM Prod_Tests  WHERE ((([Prod_Tests].[TestID])= " & nexttest & "))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
message = rs("Instructions")
%>
<img border="0" height=25 src="images/clear.gif"> </p>
<blockquote>
<p align="justify">
<font face="Verdana" size="3" color="#000080"><b>
<%=message%></b></font>
</blockquote>

<center>
<a href="insight_test.asp?action=delay1">
<img border="0" src="images/proceed.gif"></a></center>

<!============================== Multiple Give Test Ends ===================================>

<%case "delay1" %>
<%
MYMESSAGE = Server.URLEncode("Retrieving Test Questions....Please Wait")
Response.Redirect ("delay.asp?DELAY_TIME=3&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_test.asp?action=multtest2" )
 %>

<!============================= Multiple Give Test2 Starts =================================>
<% case "multtest2" %>

<%
testid = request.cookies("nexttest")
    sql = "SELECT [Prod_TestQuestions].[TestQOrder], [Prod_TestQuestions].[TestQuestion], [Prod_TestQuestions].[TestAns1], [Prod_TestQuestions].[TestAns2], [Prod_TestQuestions].[TestAns3], [Prod_TestQuestions].[TestAns4], [Prod_TestQuestions].[TestAns5], [Prod_TestQuestions].[TestAns6], [Prod_Tests].[PDesc], [Prod_Tests].[TimeLimit], [Prod_Tests].[Vert], [Prod_TestQuestions].[QuestionID]  FROM Prod_Tests INNER JOIN Prod_TestQuestions ON [Prod_Tests].[TestID]=[Prod_TestQuestions].[TestID]  WHERE ((([Prod_TestQuestions].[TestID])= " & testid & "))  ORDER BY [Prod_TestQuestions].[TestQOrder]   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
testname = rs("PDesc")
vertical = rs("Vert")
timelimit = rs("TimeLimit")
If IsNull(timelimit) Then timed = False Else timed = True
%>

<%
If timed = True Then
time1 = timelimit * 60000
time2 = timelimit * 60
bodyinsert = "<body onLoad=settimes()>"
%>

<script type="text/javascript" language="JavaScript">
    <!--
    setTimeout('document.multtest.submit()', <%=time1%>);
    //-->
</SCRIPT>

<script type="text/javascript" language="JavaScript">
<!--
function display()
{
	rtime=etime-ctime;
	if (rtime>60)
		m=parseInt(rtime/60);
	else
		m=0;
	s=parseInt(rtime-m*60);
	if(s<10)
		s="0"+s
	window.status="Time Remaining :  "+m+":"+s
	window.setTimeout("checktime()",1000)
}

function settimes()
{
	var time= new Date();
	hours= time.getHours();
	mins= time.getMinutes();
	secs= time.getSeconds();
	etime=hours*3600+mins*60+secs;
	etime+=<%=time2%>;  
	
	checktime();
}

function checktime()
{
	var time= new Date();
	hours= time.getHours();
	mins= time.getMinutes();
	secs= time.getSeconds();
	ctime=hours*3600+mins*60+secs
	
	display();
}
// -->
</SCRIPT>

<%=bodyinsert%>

<%
Else
End If
%>

<form method="POST" action="insight_test.asp?action=multsubmit" name=multtest>
	<div class="style1">
<center><font face="Verdana" size="3" color="#000080"><b><i><%=testname%></i></b></font></center>
<TABLE BORDER=0 BGCOLOR=#ffffff CELLSPACING=0 width="100%" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" bordercolor="#FFFFFF"><FONT FACE="Arial" COLOR=#000000></FONT>
<hr>

<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof

If Server.HTMLEncode(rs.Fields("TestAns1").Value) = "" Then Q1 = "" Else Q1 = "<input type=radio name='" & rs("QuestionID") & "' value='A'> A. " & Server.HTMLEncode(rs.Fields("TestAns1").Value)
If Server.HTMLEncode(rs.Fields("TestAns2").Value) = "" Then Q2 = "" Else Q2 = "<input type=radio name='" & rs("QuestionID") & "' value='B'> B. " & Server.HTMLEncode(rs.Fields("TestAns2").Value)
If Server.HTMLEncode(rs.Fields("TestAns3").Value) = "" Then Q3 = "" Else Q3 = "<input type=radio name='" & rs("QuestionID") & "' value='C'> C. " & Server.HTMLEncode(rs.Fields("TestAns3").Value)
If Server.HTMLEncode(rs.Fields("TestAns4").Value) = "" Then Q4 = "" Else Q4 = "<input type=radio name='" & rs("QuestionID") & "' value='D'> D. " & Server.HTMLEncode(rs.Fields("TestAns4").Value)
If Server.HTMLEncode(rs.Fields("TestAns5").Value) = "" Then Q5 = "" Else Q5 = "<input type=radio name='" & rs("QuestionID") & "' value='E'> E. " & Server.HTMLEncode(rs.Fields("TestAns5").Value)
If Server.HTMLEncode(rs.Fields("TestAns6").Value) = "" Then Q6 = "" Else Q6 = "<input type=radio name='" & rs("QuestionID") & "' value='F'> F. " & Server.HTMLEncode(rs.Fields("TestAns6").Value)
vertical = rs("Vert")
%>
<%
If vertical = False Then
%>
<TR VALIGN=TOP>
<TD ALIGN=left rowspan="2" valign="top" width="10"><font face="Verdana" size="2"><b><%=Server.HTMLEncode(rs.Fields("TestQOrder").Value)%>.)&nbsp;</b></font></TD>
<TD colspan=6><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=rs("TestQuestion")%><BR></FONT></TD>
</TR>
<TR VALIGN=TOP>
<TD noWrap><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q1%><BR></FONT></TD>
<TD noWrap><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q2%><BR></FONT></TD>
<TD noWrap><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q3%><BR></FONT></TD>
<TD noWrap><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q4%><BR></FONT></TD>
<TD noWrap><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q5%><BR></FONT></TD>
<TD noWrap><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q6%><BR></FONT></TD>
</TR>
<tr><td colspan=7><HR></td></tr>
<%
Else
%>
<TR VALIGN=TOP>
<TD  ALIGN=left rowspan="2" valign="top" width="10"><font face="Verdana" size="2"><b><%=Server.HTMLEncode(rs.Fields("TestQOrder").Value)%>.)&nbsp;</b></font></TD>
<TD colspan=6><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=rs("TestQuestion")%><BR></FONT></TD>
</TR>
<TR><TD><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Q1%><BR></FONT></TD></TR>
<TR><TD></TD><TD><FONT SIZE=2 FACE='Arial' COLOR=#000000><%=Q2%></FONT></TD></TR>
<TR><TD></TD><TD><FONT SIZE=2 FACE='Arial' COLOR=#000000><%=Q3%></FONT></TD></TR>
<TR><TD></TD><TD><FONT SIZE=2 FACE='Arial' COLOR=#000000><%=Q4%></FONT></TD></TR>
<TR><TD></TD><TD><FONT SIZE=2 FACE='Arial' COLOR=#000000><%=Q5%></FONT></TD></TR>
<TR><TD></TD><TD><FONT SIZE=2 FACE='Arial' COLOR=#000000><%=Q6%></FONT></TD></TR>
<tr><td colspan=7><HR></td></tr>
<%
End If
%>
<%
rs.MoveNext
loop
%>
</TBODY>

<TFOOT></TFOOT>

</TABLE>
<input type=image border="0" src="images/proceed.gif" name="next">
</div>
</form>
<!============================== Multiple Give Test2 Ends ==================================>
<!============================== Multiple Submit Starts ====================================>
<% case "multsubmit" %>
<%
profileid = request.cookies("profileid")
testid = request.cookies("nexttest")
'get questionids for this test
    sql = "SELECT [Prod_TestQuestions].[QuestionID]  FROM Prod_TestQuestions  WHERE ((([Prod_TestQuestions].[TestID])= " & testid & "))  ORDER BY [Prod_TestQuestions].[QuestionID]   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If

On Error Resume Next
rs.MoveFirst
do while Not rs.eof

questionid = rs("QuestionID")
If request(questionid) = "" Then answer="na" Else answer=request(questionid)

strSQL = "INSERT INTO Cust_TestResults(ProfileID, QuestionID, TestAnswer)"
strSQL = strSQL & " SELECT "
strSQL = strSQL & "'" & profileid & "' as text1,"    
strSQL = strSQL & "'" & questionid & "' as text2,"
strSQL = strSQL & "'" & answer & "' as text3"
conn.execute(strSQL)

rs.MoveNext
loop

set conn = nothing

MYMESSAGE = Server.URLEncode("Submitting Your Answers....Please Wait")
Response.Redirect ("delay.asp?DELAY_TIME=3&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_test.asp?action=multiple" )
%>

<!=============================== Multiple Submit Ends =====================================>

<!======================================= Next Starts ======================================>
<% case "next" %>
<!======================================= Next Ends ========================================>
<!======================================= Body Ends ========================================>
<% End Select%>

<!======================================= Send Mail Starts ========================================>
<%
SUB sendMail( fromWho, toWho, Subject, HTMLBody )

Dim objCDO 
Dim iConf 
Dim Flds

Const cdoSendUsingPort = 2

Set objCDO = Server.CreateObject("CDO.Message")
Set iConf = Server.CreateObject("CDO.Configuration")

Set Flds = iConf.Fields
With Flds
	.Item(cdoSendUsingMethod) = cdoSendUsingPort
'    .Item(cdoSMTPServer) = "smtp.directionalnsight.com"
    .Item(cdoSMTPServer) = "smtp.ftc-i.net"
	.Item(cdoSMTPServerPort) = 587
	.Item(cdoSMTPconnectiontimeout) = 30	
	.Item(cdoSendUserName) = "gtalford"
	.Item(cdoSendPassword) = "Themas1950"
'	.Item(cdoSendUserName) = "admin@directionalnsight.com"
'	.Item(cdoSendPassword) = "$A1d2m3i4n56"
	.Item(cdosmtpAuthenticate) = 1 
 	'.Item(cdoSMTPusessl) = true 
	.Update 
End With

Set objCDO.Configuration = iConf

objCDO.From = fromwho 
objCDO.To = toWho
objCDO.Subject = Subject 
objCDO.HTMLBody = HTMLBody
objCDO.Send

'Cleanup 
Set ObjCDO = Nothing 
Set iConf = Nothing 
Set Flds = Nothing 

END SUB 

%>


</HTML>