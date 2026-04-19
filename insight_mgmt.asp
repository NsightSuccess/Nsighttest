
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META NAME="DESCRIPTION" CONTENT="This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs.">
<META NAME="KEYWORDS" CONTENT="on-line assessment,Nsight,Insight,Directional Insight International,Aptitude,Aptitude Testing,Personality,Personality Testing,Management,Coaching,Teambuilding needs.">
<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" NAME="CDO for Windows Library"-->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library"-->
<!-- #INCLUDE FILE="dsn.txt" -->

<%
If request("action") = "" Then action = "start" Else action = request("action")
customerid = request("customerid")
orderid = request("orderid")
productid = request("productid")
todaysdate = FormatDateTime(Date,2)
firstname = replace(request("firstname"),"'","''")
lastname = replace(request("lastname"),"'","''")
If request("company") = "" Then company = "_" Else company = replace(request("company"),"'","''")
address1 = replace(request("address1"),"'","''")
If request("city") = "" Then city = "City" Else city = replace(request("city"),"'","''")
If request("state") = "" Then state = "ST" Else state = replace(request("state"),"'","''")
zipcode = replace(request("zipcode"),"'","''")
If request("country") = "" Then country = "_" Else country = replace(request("country"),"'","''")
area = replace(request("area"),"'","''")
exchange = replace(request("exchange"),"'","''")
number = replace(request("number"),"'","''")
phone1 = area & exchange & number
farea = replace(request("farea"),"'","''")
fexchange = replace(request("fexchange"),"'","''")
fnumber = replace(request("fnumber"),"'","''")
fax = farea & fexchange & fnumber
If ((len(fax)=10)) And (IsNumeric(fax)=True) Then fax = fax Else fax = ""
If fax = "" Then faxnumber = "_" Else faxnumber = fax
email = replace(request("email"),"'","''")
password = replace(request("password"),"'","''")
cctype = request("cctype")
ccnumber = request("ccnumber")
ccname = request("ccname")
ccauth = request("ccauth")
ccmonth = request("ccmonth")
ccyear = request("ccyear")
qty = request("qty")
%>
<%
Function gen_key(digits)

dim char_array(50)
char_array(0) = "0"
char_array(1) = "1"
char_array(2) = "2"
char_array(3) = "3"
char_array(4) = "4"
char_array(5) = "5"
char_array(6) = "6"
char_array(7) = "7"
char_array(8) = "8"
char_array(9) = "9"
char_array(10) = "A"
char_array(11) = "B"
char_array(12) = "C"
char_array(13) = "D"
char_array(14) = "E"
char_array(15) = "F"
char_array(16) = "G"
char_array(17) = "H"
char_array(18) = "I"
char_array(19) = "J"
char_array(20) = "K"
char_array(21) = "L"
char_array(22) = "M"
char_array(23) = "N"
char_array(24) = "O"
char_array(25) = "P"
char_array(26) = "Q"
char_array(27) = "R"
char_array(28) = "S"
char_array(29) = "T"
char_array(30) = "U"
char_array(31) = "V"
char_array(32) = "W"
char_array(33) = "X"
char_array(34) = "Y"
char_array(35) = "Z"

randomize

do while len(output) < digits
num = char_array(Int((35 - 0 + 1) * Rnd + 0))
output = output + num
loop

gen_key = output
End Function
%>
<%
'***** BEGIN FUNCTION AREA *****
Function FormatPhoneNumber(strNumber)
	Dim strInput       ' String to hold our entered number
	Dim strTemp        ' Temporary string to hold our working text
	Dim strCurrentChar ' Var for storing each character for eval.
	Dim I	           ' Looping var
	
	strInput = UCase(strNumber)

	For I = 1 To Len(strInput)
		strCurrentChar = Mid(strInput, I, 1)
		If Asc("0") <= Asc(strCurrentChar) And Asc(strCurrentChar) <= Asc("9") Then
			strTemp = strTemp & strCurrentChar
		End If 
		If Asc("A") <= Asc(strCurrentChar) And Asc(strCurrentChar) <= Asc("Z") Then
			strTemp = strTemp & strCurrentChar
		End If 
	Next 'I
	
	strInput = strTemp
	strTemp = ""
	
	If Len(strInput) = 11 And Left(strInput, 1) = "1" Then
		strInput = Right(strInput, 10)
	End If
	
	If Not Len(strInput) = 10 Then
		Err.Raise 1, "FormatPhoneNumber function", _
			"The phone number to be formatted must be a valid 10 digit US phone number!"


	End If
	
	strTemp = "("                             ' "("
	strTemp = strTemp & Left(strInput, 3)     ' Area code
	strTemp = strTemp & ") "                  ' ") "
	strTemp = strTemp & Mid(strInput, 4, 3)   ' Exchange
	strTemp = strTemp & "-"                   ' "-"
	strTemp = strTemp & Right(strInput, 4)    ' 4 digit part

	FormatPhoneNumber = strTemp
End Function
'***** END FUNCTION AREA *****
%>
<HTML>
<HEAD>
<TITLE>NSight Management</TITLE>

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

<BODY bgColor=#ffffff link="#000080" vlink="#000080" alink="#000080" 
    style="text-align: center">
<center>
<!======================================= Body Starts ========================================>
<!================================ Company Info Starts =======================================>
<% select case action %>
<% case "companyinfo" %>
<%
' get subscriber text
    sql = "SELECT Data FROM DataFields WHERE DataFieldID=1"
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
%>
<%
'get our info
    sql = "SELECT * FROM Customers WHERE CustomerID = 1"
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3
    If rs1.eof Then
    End If
%>
<%
area=Mid(rs1("Phone") ,1,3 )
exchange=Mid(rs1("Phone") ,4,3 )
number=Mid(rs1("Phone") ,7,4 )

farea=Mid(rs1("Fax") ,1,3 )
fexchange=Mid(rs1("Fax") ,4,3 )
fnumber=Mid(rs1("Fax") ,7,4 )
%>
<center>
<form method=post action="insight_mgmt.asp?action=updatecompany" name=companyupdate onSubmit="return validateForm(this)">
<table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#C0C0C0">
  <tr>
    <td colspan="2" align="center"><b><span style="text-transform: uppercase"><font face="Verdana" size="3" color="#000080"><%=rs1("Company")%> company infoRMATION</font></span></b><br><font face="Verdana" size="1">(</font><font color="#ff0000">*</font><font face="Verdana" size="1"> denotes required
      field).</font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Company Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier"><INPUT name=company size=35 value="<%=rs1("Company")%>"> </font><br>
    <img src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">Street Address:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier"><INPUT name=address1 size=44 value="<%=rs1("Address1")%>"></font><br>
    <img name=address1error src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">City,
      State, Zip Code:</font><font color="#ff0000">*</font></td>
    <td nowrap><font size="2" face="Courier"><INPUT name=city size=29 value="<%=rs1("City")%>"><INPUT name="state" size=2 maxlength=2 value="<%=rs1("State")%>"><INPUT name=zipcode size=6 maxlength=5 value="<%=rs1("Zip")%>"></font><br>
    <img name=ziperror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Phone Number:</font><font color="#ff0000">*</font></td>
    <td>
<font face="Courier">
<input type=text name=area size=3 maxlength=3 value="<%=area%>"></font>-<font face="Courier"><input type=text name=exchange size=3 maxlength=3 value="<%=exchange%>"></font>-<font face="Courier"><input type=text name=number size=4 maxlength=4 value="<%=number%>"></font><br>
    <img name=phoneerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Fax Number:</font><font color="#ff0000">*</font></td>
    <td><font face="Courier"><input type=text name=farea size=3 maxlength=3 value="<%=farea%>"></font>-<font face="Courier"><input type=text name=fexchange size=3 maxlength=3 value="<%=fexchange%>"></font>-<font face="Courier"><input type=text name=fnumber size=4 maxlength=4 value="<%=fnumber%>"></font><br>
    <img name=faxerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td width="300">
      <p align="justify"><font face="Verdana" size="1">This will be the username and password that will allow you to
      access the 'Main Management Page'. If you forget your password it will be emailed to this email
      address.</font></p>
    </td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">E-Mail Address:</font><font color="#ff0000">*</font></td>
    <td><FONT size=2 face="Courier"> <INPUT name=email size=30 value="<%=rs1("Email")%>"> </FONT><br>
    <img name=emailerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Password:</font><font color="#ff0000">*</font></td>
    <td><FONT size=2 face="Courier"><INPUT name=password size=30 value="<%=rs1("Password")%>"></FONT><br>
    <img name=passworderror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="center" colspan="2"><font face="Verdana" size="1">the
      address that receives orders:</font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Notify Email:</font><font color="#ff0000">*</font></td>
    <td><font face="Courier"><INPUT name=ccname size=50 value="<%=rs1("ccName")%>"></font><br>
    <img name=ccnameerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Notify Email #2</font><font color="#ff0000">*</font></td>
    <td><font face="Courier"> <INPUT name=ccnumber size=50 value="<%=rs1("ccNumber")%>"></font><font face="Verdana" size="1"><br>
    <img src="images/blankimage.gif"  height=10 border=0></font></td>
  </tr>
  <tr>
    <td align="center" colspan="2">
      <font face="Verdana" size="1">logon screen message</font>
  </tr>
  <tr>
    <td align="center" colspan="2">
      <textarea name=notes1 rows="6" cols="50"><%=rs("Data")%></textarea>
  </tr>
  <tr>
    <td align="center" colspan="2">
      <p align="center">
      <input type="image" src="images/update.gif"  border=0 value="add" name="I1" align="top">
  </tr>
</table>
</form>
<a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF"></a>
<!================================ Company Info Ends =======================================>
<!===================================== Auth1 Starts ======================================>
<% case "auth1" %>
<%
    sql = "SELECT [Orders].[OrderID], [Orders].[OrderDate], [Orders].[Qty], [Orders].[ProductID], [Customers].[CustomerID], [Customers].[Email], [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Customers].[Phone], [Orders].[ccName], [Orders].[ccNumber], [Orders].[ccMonth], [Orders].[ccYear], [Orders].[SalesTax], [Orders].[Total]  FROM Customers INNER JOIN Orders ON [Customers].[CustomerID]=[Orders].[CustomerID]  WHERE ((([Orders].[ccAuth]) Is Null))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<P>&nbsp;</P>
<center>
<TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0><CAPTION><font face="Verdana" size="3" color="#000080"><span style="text-transform: uppercase"><b>Pending
    Orders, Need Auth</b></span></font></CAPTION>

<THEAD>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Order</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Date</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Name</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Company</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Phone</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">CC Number</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">CC Auth</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Sales Tax</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="1" color="#000080">Total</font></TH>
</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
If rs("Company") = "_" Then company = "none" Else company = rs("Company")
If len(rs("OrderID")) = 1 Then orderno = "00000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 2 Then orderno = "0000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 3 Then orderno = "000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 4 Then orderno = "00" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 5 Then orderno = "0" & rs("OrderID") Else orderno = orderno
If rs("ccName") = "Purchase Order" Then phrase1 = "PO #: " & rs("ccNumber") Else phrase1 = rs("ccNumber") & ", exp " & rs("ccMonth") & "/" & rs("ccYear")  
%>
	<script Language="VBScript" Type="text/vbscript"><!--
function FrontPage_Form2_onsubmit()
  Set theForm = document.FrontPage_Form2

  If (theForm.ccAuth.value = "") Then
    MsgBox "Please enter a value for the ""ccAuth"" field.", 0, "Validation Error"
    theForm.ccAuth.focus()
    FrontPage_Form2_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.ccAuth.value) < 1) Then
    MsgBox "Please enter at least 1 characters in the ""ccAuth"" field.", 0, "Validation Error"
    theForm.ccAuth.focus()
    FrontPage_Form2_onsubmit = False
    Exit Function
  End If
  FrontPage_Form2_onsubmit = True 
End Function
--></script>
    <form method=post action="insight_mgmt.asp?action=auth2" name="FrontPage_Form2">
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="1" color="#000000"><%=orderno%></font>&nbsp;</TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="1" color="#000000"><%=rs("OrderDate")%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 ><font face="Verdana" size="1" color="#000000"><%=rs("FirstName")%>&nbsp; <%=rs("LastName")%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 ><font face="Verdana" size="1" color="#000000"><%=company%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 ><font face="Verdana" size="1" color="#000000"><%=FormatPhoneNumber(rs("Phone"))%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 nowrap ><font face="Verdana" size="1" color="#000000"><%=phrase1%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 ><font face="Verdana" size="1" color="#000000"><font face="Courier">
    <input name="ccAuth" size="8"></font></font><input type="image" src="images/go.gif"  border=0 value="add" name="submit" align="top"><font face="Verdana" size="1" color="#000000"><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="1" color="#000000"><%=FormatCurrency(rs("SalesTax"))%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="1" color="#000000"><%=FormatCurrency(rs("Total"))%><BR></font></TD>
</TR>
<input name="qty" type=hidden value=<%=rs("Qty")%>>
<input name="orderid" type=hidden value=<%=rs("OrderID")%>>
<input name="customerid" type=hidden value=<%=rs("CustomerID")%>>
<input name="email" type=hidden value=<%=rs("Email")%>>
<input name="productid" type=hidden value=<%=rs("ProductID")%>>
</form>
<%
rs.MoveNext
loop%>
</TBODY>
<TFOOT></TFOOT>
</TABLE>
</center>
<a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF"></a>
<!===================================== Auth1 Ends ========================================>
<!================================ Update Company Starts ===================================>
<% case "updatecompany" %>
<%
notes1 = replace(request("notes1"),"'", "''")

strSQL = "UPDATE Customers " & _
"SET Customers.Company = '" & company & "', " & _
"Customers.Address1 = '" & address1 & "', " & _
"Customers.City = '" & city & "', " & _
"Customers.State = '" & state & "', " & _
"Customers.Zip = '" & zipcode & "', " & _
"Customers.Phone = '" & phone1 & "', " & _
"Customers.Fax = '" & faxnumber & "', " & _
"Customers.Email = '" & email & "', " & _
"Customers.Password = '" & password & "', " & _
"Customers.ccNumber = '" & ccnumber & "', " & _
"Customers.ccName = '" & ccname & "' " & _
"WHERE (((Customers.CustomerID)=" & 1 & "))"
conn.execute(strSQL)

strSQL = "UPDATE DataFields " & _
"SET DataFields.Data = '" & notes1 & "' " & _
"WHERE (((DataFields.DataFieldID)=" & 1 & "))"
conn.execute(strSQL)

set conn = nothing

MYMESSAGE = Server.URLEncode("Updating your information....Please Wait")
'Response.Redirect ("delay.asp?DELAY_TIME=2&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_acct.asp?action=vendoracct")
Response.Redirect "insight_acct.asp?action=vendoracct"
%>

<!================================= Update Company Ends ====================================>
<!======================================= Auth2 Starts ======================================>
<% case "auth2" %>
<%
On Error Resume Next
'insert cc auth
strSQL = "UPDATE Orders " & _
"SET Orders.ccAuth = '" & ccauth & "' " & _
"WHERE (((Orders.OrderID)=" & orderid & "))"
conn.execute(strSQL)

'add passwords
for x = 1 to qty
newpw=gen_key(8)
strSQL = "INSERT INTO Cust_Passwords(Password, CustomerID, ProductID)"
strSQL = strSQL & " SELECT "
strSQL = strSQL & "'" & newpw & "' as text1,"    
strSQL = strSQL & "'" & customerid & "' as text2,"
strSQL = strSQL & "'" & productid & "' as text3"
conn.execute(strSQL)
next

url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3="http://" & url1 & url2
loginurl=replace(url3,"insight_mgmt.asp","insight_login.asp")

If len(OrderID) = 1 Then orderno = "00000" & OrderID Else orderno = orderno
If len(OrderID) = 2 Then orderno = "0000" & OrderID Else orderno = orderno
If len(OrderID) = 3 Then orderno = "000" & OrderID Else orderno = orderno
If len(OrderID) = 4 Then orderno = "00" & OrderID Else orderno = orderno
If len(OrderID) = 5 Then orderno = "0" & OrderID Else orderno = orderno

HTML1 = "<font face=Verdana size=2 color=#000080><b>We have obtained authorization for your order, and have added your passwords. Please click <a href='" & loginurl & "'>here</a> to login."

'---------------Order Authorization email1 start---------------

fromwho="admin@insightsuccess.com"
towho=email                          'To Customer
Subject = "NSight Order # " & orderno & " has been authorized"          
HTMLBody = HTML1

If toWho <> "" THEN 
'sendMail fromWho, toWho, Subject, HTMLBody 
END IF

'---------------Order Authorization email1 end-----------------
set conn=nothing

MYMESSAGE = Server.URLEncode("Adding Passwords....Please Wait")
'Response.Redirect ("delay.asp?DELAY_TIME=3&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_mgmt.asp?action=auth1")
Response.Redirect "insight_mgmt.asp?action=auth1"
%>
<!======================================= Auth2 Ends ========================================>
<!====================================== Orders Starts ======================================>
<% case "orders" %>
<%
'get all order info
If request("sort") = "" Then sort = "[Orders].[OrderID] DESC" Else sort = request("sort")
    sql = "SELECT [Orders].[OrderID], [Orders].[OrderDate], [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Orders].[Qty], [Orders].[Total]  FROM Customers INNER JOIN Orders ON [Customers].[CustomerID]=[Orders].[CustomerID] ORDER BY " & sort & " "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<%
url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3="http://" & url1 & url2
url=url3 & "?action=orders"
%>
<P>&nbsp;</P>
<center>
<TABLE BORDER=1 BGCOLOR=#ffffff><CAPTION><B><font face="Verdana" size="3" color="#000080"><span style="text-transform: uppercase"><a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF" width="54" height="20"></a>Orders<a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF" width="54" height="20"></a></span></font></B></CAPTION>
<THEAD>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=[Orders].[OrderID] DESC"><font face="Verdana" size="2" color="#000080"><b>Order No</b></font></a></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=[Orders].[OrderDate]"><font face="Verdana" size="2" color="#000080"><b>Date</b></font></a></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080"><b>Name (<a href="<%=url%>&sort=[Customers].[FirstName]">first</a>/<a href="<%=url%>&sort=[Customers].[LastName]">last</a>)</b></font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=[Customers].[Company]"><font face="Verdana" size="2" color="#000080"><b>Company</b></font></a></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=[Orders].[Qty]"><font face="Verdana" size="2" color="#000080"><b>Qty</b></font></a></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=[Orders].[Total]"><font face="Verdana" size="2" color="#000080"><b>Total</b></font></a></TH>

</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
If rs("Company") = "_" Then company = "" Else company = rs("Company")
fn = rs("FirstName")
ln = rs("LastName")
fullname = fn & " " & ln
If len(rs("OrderID")) = 1 Then orderno = "00000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 2 Then orderno = "0000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 3 Then orderno = "000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 4 Then orderno = "00" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 5 Then orderno = "0" & rs("OrderID") Else orderno = orderno
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0  align=center><a href="insight_order.asp?from=mgmt&amp;action=receipt&amp;orderid=<%=rs("OrderID")%>"><font face="Verdana" size="2" color="#000000"><%=orderno%></font></a>&nbsp;</TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="2" color="#000000"><%=rs("OrderDate")%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 ><font face="Verdana" size="2" color="#000000"><%=fullname%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0 ><font face="Verdana" size="2" color="#000000"><%=company%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="2" color="#000000"><%=rs("Qty")%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><font face="Verdana" size="2" color="#000000"><%=FormatCurrency(rs("Total"))%><BR></font></TD>

</TR>
<%
rs.MoveNext
loop%>
</TBODY>
<TFOOT></TFOOT>
</TABLE>
<a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF"></a>
</center>
<!====================================== Orders1 Ends =======================================>
<!=================================== Edit Acct1 Starts =====================================>
<% case "editacct1" %>
<%
'get customer list
If request("sort") = "" Then sort = "LastName" Else sort = request("sort")
    sql = "SELECT [Customers].[CustomerID], [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Customers].[Phone]  FROM Customers  WHERE CustomerID > 1 ORDER BY " & sort & " "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<%
url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3="http://" & url1 & url2
url=url3 & "?action=editacct1"
%>
<P>&nbsp;</P>
<center>
<TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0><CAPTION><B><font face="Verdana" size="3" color="#000080"><span style="text-transform: uppercase"><a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF" width="54" height="20"></a>Client List</span></font></B><B><font face="Verdana" size="3" color="#000080"><span style="text-transform: uppercase"><a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF" width="54" height="20"></a></span></font></B></CAPTION>
<THEAD>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080">Edit</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080"><b>Name
  (<a href="<%=url%>&sort=FirstName">first</a>/<a href="<%=url%>&sort=LastName">last</a>)</b></font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=Company"><font face="Verdana" size="2" color="#000080"><b>Company</b></font></a></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><a href="<%=url%>&sort=Phone"><font face="Verdana" size="2" color="#000080"><b>Phone No</b></font></a></TH>
</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof

If rs("Company") = "_" Then company = "" Else company = rs("Company")
fn = rs("FirstName")
ln = rs("LastName")
fullname = fn & " " & ln
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0 align="center" ><a href="insight_mgmt.asp?action=editacct2&customerid=<%=rs("CustomerID")%>"><img border="0" src="images/info1.gif"></a></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=fullname%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=company%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=FormatPhoneNumber(rs("Phone"))%><BR></FONT></TD>

</TR>
<%
rs.MoveNext
loop%>
</TBODY>
<TFOOT></TFOOT>
</TABLE>
<a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF"></a>
</center></center></center>
<!==================================== Edit Acct1 Ends ======================================>
<!=================================== Edit Acct2 Starts =====================================>
<% case "editacct2" %>
<%
    sql = "SELECT * FROM Customers WHERE CustomerID = " & customerid & " "
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3
    If rs1.eof Then
    End If

If rs1("Company") = "_" Then company = "" Else company = rs1("Company")
%>
<%
area=Mid(rs1("Phone") ,1,3 )
exchange=Mid(rs1("Phone") ,4,3 )
number=Mid(rs1("Phone") ,7,4 )

farea=Mid(rs1("Fax") ,1,3 )
fexchange=Mid(rs1("Fax") ,4,3 )
fnumber=Mid(rs1("Fax") ,7,4 )

fn = rs1("FirstName")
ln = rs1("LastName")
fullname = fn & " " & ln

If farea = "_" Then farea = "" Else farea = farea
%>
<form method=post action="insight_mgmt.asp?action=editacct3" name=update onSubmit="return validateForm2(this)">
<table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" 
    bordercolordark="#C0C0C0" align="center">
  <tr>
    <td colspan="2" align="center"><b><span style="text-transform: uppercase"><font face="Verdana" size="3" color="#000080"><%=fullname%><br> ACCOUNT
      info</font></span></b><br><font face="Verdana" size="1">(</font><font color="#ff0000">*</font><font face="Verdana" size="1"> denotes required
      field).</font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Company Name:</font></td>
    <td><font size="2" face="Courier"><INPUT name=company size=35 value="<%=company%>"> </font><br>
    <img src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">First Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier"><INPUT name=firstname size=25 value="<%=rs1("FirstName")%>"></font><br>
    <img name=firstnameerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">Last Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier"><INPUT name=lastname size=25 value="<%=rs1("LastName")%>"></font><br>
    <img name=lastnameerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">Street Address:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier"><INPUT name=address1 size=35 value="<%=rs1("Address1")%>"></font><br>
    <img name=address1error src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">City,
      State, Zip Code:</font><font color="#ff0000">*</font></td>
    <td nowrap><font size="2" face="Courier"><INPUT name=city size=25 value="<%=rs1("City")%>"><INPUT name="state" size=2 maxlength=2 value="<%=UCase(rs1("State"))%>"><INPUT name=zipcode size=6 maxlength=5 value="<%=rs1("Zip")%>"></font><br>
    <img name=ziperror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Phone Number:</font><font color="#ff0000">*</font></td>
    <td>
<font face="Courier">
<input type=text name=area size=3 maxlength=3 value="<%=area%>"></font>-<font face="Courier"><input type=text name=exchange size=3 maxlength=3 value="<%=exchange%>"></font>-<font face="Courier"><input type=text name=number size=4 maxlength=4 value="<%=number%>"></font><br>
    <img name=phoneerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Fax Number:</font></td>
    <td><font face="Courier"><input type=text name=farea size=3 maxlength=3 value="<%=farea%>"></font>-<font face="Courier"><input type=text name=fexchange size=3 maxlength=3 value="<%=fexchange%>"></font>-<font face="Courier"><input type=text name=fnumber size=4 maxlength=4 value="<%=fnumber%>"></font><br>
    <img src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td width="300">
      <p align="justify"><font face="Verdana" size="1">This will be the username and password that will allow you to
      access the 'Main Management Page'. If you forget your password it will be emailed to this email
      address.</font></p>
    </td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">E-Mail Address:</font><font color="#ff0000">*</font></td>
    <td><FONT size=2 face="Courier"> <INPUT name=email size=30 value="<%=rs1("Email")%>"> </FONT><br>
    <img name=emailerror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Password:</font><font color="#ff0000">*</font></td>
    <td><FONT size=2 face="Courier"><INPUT name=password size=30 value="<%=rs1("Password")%>"></FONT><br>
    <img name=passworderror src="images/blankimage.gif"  height=10 border=0></td>
  </tr>
  <tr>
    <td align="center" colspan="2">
      <p align="center"><input type="image" src="images/submit.gif"  border=0 value="add" name="submit" align="top">
  </tr>
</table>
<input type="hidden" name="customerid" value="<%=customerid%>">
</form>
<a href="insight_mgmt.asp?action=editacct1"><img border="0" src="images/BACK.GIF"></a><br>
<!==================================== Edit Acct2 Ends ======================================>
<!=================================== Edit Acct3 Starts =====================================>
<% case "editacct3" %>
<%
strSQL = "UPDATE Customers " & _
"SET Customers.Company = '" & company & "', " & _
"Customers.FirstName = '" & firstname & "', " & _
"Customers.LastName = '" & lastname & "', " & _
"Customers.Address1 = '" & address1 & "', " & _
"Customers.City = '" & city & "', " & _
"Customers.State = '" & state & "', " & _
"Customers.Zip = '" & zipcode & "', " & _
"Customers.Phone = '" & phone1 & "', " & _
"Customers.Fax = '" & faxnumber & "', " & _
"Customers.Email = '" & email & "', " & _
"Customers.Password = '" & password & "' " & _
"WHERE (((Customers.CustomerID)=" & customerid & "))"
conn.execute(strSQL)

set conn = nothing

MYMESSAGE = Server.URLEncode("Updating the information....Please Wait")
'Response.Redirect ("delay.asp?DELAY_TIME=2&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_acct.asp?action=vendoracct")
Response.Redirect "insight_acct.asp?action=vendoracct"
%>
<!==================================== Edit Acct3 Ends ======================================>
<!================================== Test Results Starts ===================================>
<% case "testresults" %>
<%
If request("sort") = "" Then sort = "[Cust_Profiles].[DateTaken] DESC" Else sort = request("sort")
    sql = "SELECT [Cust_Profiles].[DateTaken], [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Cust_Profiles].[First], [Cust_Profiles].[Last], Count([Cust_TestResults].[TestResultsID]) AS CountOfTestResultsID, [Cust_Profiles].[ProfileID] FROM (Cust_Profiles INNER JOIN Customers ON [Cust_Profiles].[CustomerID]=[Customers].[CustomerID]) INNER JOIN Cust_TestResults ON [Cust_Profiles].[ProfileID]=[Cust_TestResults].[ProfileID] GROUP BY [Cust_Profiles].[DateTaken], [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Cust_Profiles].[First], [Cust_Profiles].[Last], [Cust_Profiles].[ProfileID] ORDER BY " & sort & " "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
%>
<%
url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3="http://" & url1 & url2
url=url3 & "?action=testresults"
%>
<center>
<TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0><CAPTION><B><font face="Verdana" size="3" color="#000080">Profile
    Results</font></B></CAPTION>

<THEAD>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 rowspan="2" >&nbsp;</TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 rowspan="2" ><font face="Verdana" size="2" color="#000080"><a href="<%=url%>&sort=[Cust_Profiles].[DateTaken] DESC">Date</a><br>Taken</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 colspan="2" ><font face="Verdana" size="2" color="#000080">Customer</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080">Profile</font></TH>

</TR>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080">Name (<a href="<%=url%>&sort=[Customers].[FirstName]">First</a>/<a href="<%=url%>&sort=[Customers].[LastName]">Last</a>)</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080"><a href="<%=url%>&sort=[Customers].[Company]">Company</a></font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 ><font face="Verdana" size="2" color="#000080">Name (<a href="<%=url%>&sort=[Cust_Profiles].[First]">First</a>/<a href="<%=url%>&sort=[Cust_Profiles].[Last]">Last</a>)</font></TH>

</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
name = rs("FirstName") & " " & rs("LastName")
company = Replace(rs("Company"),"_","")
pname = rs("First") & " " & rs("Last")
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><FONT SIZE=2 FACE="Arial" COLOR=#000000><a href="insight_mgmt.asp?action=results2&amp;profileid=<%=rs("ProfileID")%>"><img border="0" src="images/go.gif"></a><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=rs("DateTaken")%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=name%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=company%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=pname%><BR></FONT></TD>
</TR>
<%
rs.MoveNext
loop
%>
</TBODY>
<TFOOT></TFOOT>
</TABLE>
<a href="insight_acct.asp?action=vendoracct"><img border="0" src="images/BACK.GIF"></a>
<br>
</center>
<!=================================== Test Results Ends ====================================>
<!==================================== Results2 Starts ======================================>
<% case "results2" %>
<center>

<%
profileid = request("profileid")
    sql = "SELECT [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Customers].[CoCode], [Cust_Profiles].[Position], [Cust_Profiles].[DateTaken], [Cust_Profiles].[pwUsed],[Cust_Profiles].[Salutation], [Cust_Profiles].[First], [Cust_Profiles].[Last], [Products].[PDesc]  FROM Products INNER JOIN (Customers INNER JOIN Cust_Profiles ON [Customers].[CustomerID]=[Cust_Profiles].[CustomerID]) ON [Products].[ProductID]=[Cust_Profiles].[ProductID]  WHERE ((([Cust_Profiles].[ProfileID])= " & profileid & "))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
ccompany = replace(rs("Company"),"_","-no company-")
ccompany2 = trim(rs("Company"))
cocode= trim(rs("CoCode"))
cname = trim(rs("FirstName") & " " & rs("LastName"))
pname = trim(rs("First") & " " & rs("Last"))
pdate = trim(rs("DateTaken"))
product = trim(rs("PDesc"))
sal = trim(rs("Salutation"))
If (rs("Position") = "") OR (IsNull(rs("Position"))) Then pos = "" Else pos = rs("Position")
pos1=trim(rs("Position"))
pwused = trim(rs("pwUsed"))
FileName="\results2\tobescored.txt"
FileName2="\results2\"+pwused+".txt"
Const ForReading = 1, ForWriting = 2, ForAppending = 8
  Dim fso, f, fc
  Set fso = Server.CreateObject("Scripting.FileSystemObject")
  set f = fso.CreateTextFile(Server.MapPath(FileName), True)

  f.writeline cname
  f.writeline ccompany2
  f.writeline cocode
  f.writeline sal
  f.writeline pname
  f.writeline pos1
  f.writeline product
  f.writeline pdate
  f.writeline pwused
  f.writeline profileid
  f.writeline
%>
  
<table border="1" width="550" cellspacing="0">
  <tr>
    <td colspan="2" align="center" width="398"><font face="Verdana" size="2" color="#000080"><b><i>Profile Results for <%=pname%></i></b></font></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Customer</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=cname%></font></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Company</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=ccompany%></font></td>
  </tr>  
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>CoCode</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=cocode%></font></td>
  </tr>

  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Assessment Profile</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=sal%>&nbsp;<%=pname%></font></td>
  </tr>
    <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Position</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=pos%></font></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Assessment Taken</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><i><%=product%></i></font></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Date Taken</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=pdate%></font></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>Auth Code Used</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=pwused%></font></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="2" color="#000080"><b>ProfileID</b>: </font></td>
    <td><font face="Verdana" size="2" color="#000080"><%=profileid%></font></td>
  </tr>
</table>
	<br>
	<a href="https://nsightazure.azurewebsites.net/results2/tobescored.txt">Score this Test</a><br><br>
<%
    sql = "SELECT [Prod_Tests].[TestID], [Prod_Tests].[PDesc]  FROM (Products INNER JOIN Cust_Profiles ON [Products].[ProductID]=[Cust_Profiles].[ProductID]) INNER JOIN (Prod_Tests INNER JOIN Prod_Detail ON [Prod_Tests].[TestID]=[Prod_Detail].[TestID]) ON [Products].[ProductID]=[Prod_Detail].[ProductID]  WHERE ((([Cust_Profiles].[ProfileID])= " & profileid & ")) ORDER BY sorder  "
    Set rs3 = Server.CreateObject("ADODB.Recordset")
    rs3.Open sql, conn, 3, 3
%>
<%
On Error Resume Next
rs3.MoveFirst
do while Not rs3.eof
testid = rs3("TestID")
x=0
y=0
f.write rs3("PDesc")
f.writeline
%>
<%
    sql = "SELECT [Prod_TestQuestions].[TestQOrder], [Cust_TestResults].[TestAnswer]  FROM Prod_TestQuestions INNER JOIN Cust_TestResults ON [Prod_TestQuestions].[QuestionID]=[Cust_TestResults].[QuestionID]  WHERE ((([Cust_TestResults].[ProfileID])= " & profileid & ") And (([Prod_TestQuestions].[TestID])= " & testid & "))  ORDER BY [Prod_TestQuestions].[TestQOrder]   "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
    If rs2.eof Then
    End If
%>
<TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0 width="450"><FONT FACE="Arial" COLOR=#000000></FONT>
<THEAD><tr>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 valign="middle" align="center" colspan=10><font face="Verdana" size="2" color="#000080"><%=rs3("PDesc")%></font>&nbsp;</TH>
</THEAD><TBODY>
<%
On Error Resume Next
rs2.MoveFirst
do while Not rs2.eof
x = x + 1
y = y + 1
If x = 10 Then row = "</tr>" Else row = ""
If x = 10 Then x = 0 Else x = x
if y = 11 then y = 1

%>
<%
if cInt(rs2("TestQOrder")) < 10 then
num="0"&rs2("TestQOrder")
%>
<TD BORDERCOLOR=#c0c0c0  align=center valign="middle" nowrap="nowrap"><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=(num)%>) <%=rs2("TestAnswer")%></FONT><br /></TD><%=row%>
<%else%>
<TD BORDERCOLOR=#c0c0c0  align=center valign="middle"><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=rs2("TestQOrder")%>) <%=rs2("TestAnswer")%></FONT><br /></TD><%=row%>
<%end if%>

<%
f.writeline rs2("TestAnswer")
rs2.MoveNext
loop
f.writeline
%>
</TBODY>
</TABLE>
<img border="0" height=15 src="images/clear.GIF"><br>
<%
rs3.MoveNext
loop
f.Close

Set fso = Server.CreateObject("Scripting.FileSystemObject")
fso.CopyFile (Server.MapPath(FileName)), (Server.MapPath(FileName2))
%>

</center>
<!===================================== Results2 Ends ========================================>


<!======================================= Next Starts ======================================>
<% case "next" %>
<!======================================= Next Ends ========================================>
<!======================================= Body Ends ========================================>
<% End Select %>

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

objCDO.From = fromWho 
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

</BODY>
</HTML>