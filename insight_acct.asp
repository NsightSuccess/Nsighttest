<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META NAME="DESCRIPTION" CONTENT="This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs.">
<META NAME="KEYWORDS" CONTENT="on-line assessment,Nsight,Insight,Directional Insight International,Aptitude,Aptitude Testing,Personality,Personality Testing,Management,Coaching,Teambuilding needs.">
<!-- #INCLUDE FILE="dsn.txt" -->
<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" NAME="CDO for Windows Library"-->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library"-->
<%
If request("action") = "" Then action = "start" Else action = request("action")
customerid = request("customerid")
orderid = request("orderid")
qty = request("qty")
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

If request("method") = "cc" Then
cctype = replace(request("cctype"),", ","")
If request("ccnumber") = "," Then ccnumber = "none" Else ccnumber = replace(request("ccnumber"),", ","")
If request("ccname") = "," Then ccname = "none" Else ccname = replace(request("ccname"),", ","")
ccmonth = replace(request("ccmonth"),", ","")
ccyear = replace(request("ccyear"),", ","")

Else
cctype = "Purchase Order"
If request("ponumber") = "" Then ccnumber = "Purchase Order" Else ccnumber = replace(request("ponumber"),"'","''")
ccname = "Purchase Order"
ccmonth = " "
ccyear = " "
End If

productid = request("productid")
%>
<SCRIPT type="text/javascript">
<!--
    function myopen()
    {
        window.open("pricing.asp", "weblink", "width=280,height=680");
    }
    //-->
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
// Preload images
var empty = new Image(); empty.src = "images/fieldempty.gif";
var email = new Image(); email.src = "images/emailerror.gif";
var zipcd = new Image(); zipcd.src = "images/ziperror.gif";
var phone = new Image(); phone.src = "images/phoneerror.gif";

var haveerrors = 0;
function showImage(imagename, imageurl, errors) {
document[imagename].src = imageurl;
if (!haveerrors && errors) haveerrors = errors;
}

function validateForm2(f) {
haveerrors = 0;

(f.firstname.value.length < 1) // validate first name length
? showImage("firstnameerror", "images/fieldempty.gif", true)   // no semi-colon after this line!
: showImage("firstnameerror", "images/blankimage.gif", false); // true = errors, false = no errors

(f.lastname.value.length < 1) // validate last name length
? showImage("lastnameerror", "images/fieldempty.gif", true)
: showImage("lastnameerror", "images/blankimage.gif", false);

(f.address1.value.length < 4) // validate address
? showImage("address1error", "images/fieldempty.gif", true)
: showImage("address1error", "images/blankimage.gif", false);

(f.password.value.length < 1) // validate password
? showImage("passworderror", "images/fieldempty.gif", true)
: showImage("passworderror", "images/blankimage.gif", false);

(f.zipcode.value.length != 5) // validate zip code length
? showImage("ziperror", "images/ziperror.gif", true)
: showImage("ziperror", "images/blankimage.gif", false);

phonenumlength = f.area.value.length + 
f.exchange.value.length + f.number.value.length;

(phonenumlength != 10) // validate phone number length
? showImage("phoneerror", "images/phoneerror.gif", true)
: showImage("phoneerror", "images/blankimage.gif", false);

(f.email.value.search("@") == -1 || f.email.value.search("[.*]") == -1) // validate email
? showImage("emailerror", "images/emailerror.gif", true)
: showImage("emailerror", "images/blankimage.gif", false);

return (!haveerrors);
}
//  End -->
</script>
<HTML>
<HEAD>
<TITLE>NSightAzure Account</TITLE>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
        .auto-style1 {
            font-size: xx-small;
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
<BODY bgColor=#ffffe1 link="#000080" vlink="#000080" alink="#000080">
<center>
<!======================================= Body Starts ========================================>
<!================================ Acct Management Starts =======================================>
<% select case action %>
<% case "acctmanage" %>
<%
If customerid = 1 Then

Response.Redirect "insight_acct.asp?action=vendoracct"

End If
%>
<%
'get current clients info
    sql = "SELECT * FROM Customers WHERE CustomerID= " & customerid & " "
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3

On Error Resume Next
fn = rs1("FirstName")
ln = rs1("LastName")
fullname = fn & " " & ln
%>
<p>&nbsp;</p>
<b><u>
<font face="Verdana" size="3" color="#000000">
<span style="text-transform: uppercase">
<%=fullname%>'s <BR>Account Management Page 
    <br />
    </span></font></u></b><br>
<form method=post action="insight_acct.asp?action=editacct"><input type="image" src="images/acct-1.gif"  border=0><input type="hidden" name="customerid" value="<%=customerid%>"></form>
<form method=post action="insight_acct.asp?action=status"><input type="image" src="images/acct-2.gif"  border=0><input type="hidden" name="customerid" value="<%=customerid%>"></form>
<form method=post action="insight_acct.asp?action=viewpw"><input type="image" src="images/acct-3.gif"  border=0><input type="hidden" name="customerid" value="<%=customerid%>"></form>
<form method=post action="insight_acct.asp?action=results"><input type="image" src="images/acct-4.gif"  border=0><input type="hidden" name="customerid" value="<%=customerid%>"></form>
<form method=post action="insight_acct.asp?action=buymore1"><input type="image" src="images/acct-6.gif"  border=0><input type="hidden" name="customerid" value="<%=customerid%>"></form>
<a href="insight_login.asp"><img border="0" src="images/BACK.GIF"></a><br>
<!================================ Acct Management Ends =======================================>
<!================================== Vendor Account Starts ====================================>
<% case "vendoracct" %>
<%
'get comapny info
    sql = "SELECT * FROM Customers WHERE CustomerID = 1"
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3
company=rs1("Company")
%>
<p>&nbsp;</p>
<font face="Verdana" size="3"><b><u>
<span style="text-transform: uppercase"><%=company%>&nbsp;Management Page</span></u></b></font><br>
<img border="0" height=25 src="images/blankimage.gif"><br>
<font face="Verdana" size="2" color="#000080"><b>
<a href="insight_mgmt.asp?action=companyinfo">Change Company Info</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="insight_mgmt.asp?action=auth1">Authorize Pending Orders</a><br>
<br>
<br>
<a href="Verio_Customers.aspx">View/Edit Customer Accounts</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="Verio_Cust_ProfileID_New1.aspx">View Profile Assessment Results</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="Verio_Cust_ProfileID_edit.aspx">Edit Profile Assessment Results Old</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="Verio_orders.aspx">View/Edit Past Orders</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="Verio_Passwords.aspx">Edit/Delete Authorization Codes</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="insight_login.asp?action=signup">Register New Customer</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<a href="billing.aspx" target="_blank">Billing Report</a><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
<img border="0" src="images/blankimage.gif" height="8"><br>
</b>
<br>
<font face="Verdana" size="2" color="#000080"><b>
<img border="0" src="images/blankimage.gif" height="25"><br>
<a href="insight_login.asp"><img border="0" src="images/BACK.GIF"></a>

<!================================== Vendor Account Ends ======================================>
<!===================================== Status Starts ======================================>
<% case "status" %>
<%
    sql = "SELECT [Orders].[OrderDate], [Orders].[Total], [Orders].[Qty], [Orders].[ccNumber], [Orders].[ccAuth], [Orders].[OrderID], [Products].[PDesc]  FROM Products INNER JOIN Orders ON [Products].[ProductID]=[Orders].[ProductID]  WHERE ((([Orders].[CustomerID])= " & customerid & ")) ORDER BY OrderID DESC  "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<%
'get current clients info
    sql = "SELECT * FROM Customers WHERE CustomerID= " & customerid & " "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3

On Error Resume Next
fn = rs2("FirstName")
ln = rs2("LastName")
%> 
<p>&nbsp;</p>
<center>
<font face="Verdana" size="2" color="#000080"><b><span style="text-transform: uppercase">
Orders for <%=fn%>&nbsp;<%=ln%></span></b></font><br>
<TABLE BORDER=1 BGCOLOR=#ffffff cellspacing=3><FONT FACE="Arial" COLOR=#000000></FONT>
<THEAD>
<TR>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">order</span></font></td>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">Date</span></font></td>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">qty</span></font></td>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">Product</span></font></td>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">Total</span></font></td>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">Credit
  Card</span></font></td>
<td BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><span style="text-transform: uppercase">Auth</span></font></td>

</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
If IsNull(rs("ccAuth")) Then auth = "<i><font color=red>pending</font></i>" Else auth = rs("ccAuth")
If len(rs("OrderID")) = 1 Then orderno = "00000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 2 Then orderno = "0000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 3 Then orderno = "000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 4 Then orderno = "00" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 5 Then orderno = "0" & rs("OrderID") Else orderno = orderno
ccnum = Left(rs("ccNumber"),4) & " ... " & Right(rs("ccNumber"),4)
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#FFFFFF  ALIGN=RIGHT><font face="Verdana" size="2" color="#000000"><a href="insight_order.asp?from=acct&action=receipt&orderid=<%=rs("OrderID")%>"><%=orderno%></a></font>&nbsp;</TD>
<TD BORDERCOLOR=#FFFFFF  ALIGN=RIGHT><font face="Verdana" size="2" color="#000000"><%=rs("OrderDate")%></font>&nbsp;</TD>
<TD BORDERCOLOR=#FFFFFF  align=center><font face="Verdana" size="2" color="#000000"><%=rs("Qty")%></font>&nbsp;</TD>
<TD BORDERCOLOR=#FFFFFF  align=center><font face="Verdana" size="2" color="#000000"><%=rs("PDesc")%></font>&nbsp;</TD>
<TD BORDERCOLOR=#FFFFFF  align=center><font face="Verdana" size="2" color="#000000"><%=FormatCurrency(rs("Total"))%></font>&nbsp;</TD>
<TD BORDERCOLOR=#FFFFFF ><font face="Verdana" size="2" color="#000000"><%=ccnum%></font>&nbsp;</TD>
<TD BORDERCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000000"><%=auth%></font>&nbsp;</TD>

</TR>
<%
rs.MoveNext
loop%>
</TBODY>
<TFOOT></TFOOT>
</TABLE>
<a href="insight_acct.asp?action=acctmanage"><img border="0" src="images/BACK.GIF"></a>
</center>
<!===================================== Status Ends ========================================>
<!================================ View Passwords Starts ===================================>
<% case "viewpw" %>
<center>
<%
    sql = "SELECT * FROM [Products]"
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
%>
<%
On Error Resume Next
rs2.MoveFirst
do while Not rs2.eof
prodid = rs2("ProductID")
x=0
%>
<%
On Error Resume Next
    sql = "SELECT [Cust_Passwords].[Password]  FROM Cust_Passwords  WHERE ((([Cust_Passwords].[ProductID])=" & prodid & ") And (([Cust_Passwords].[CustomerID])= " & customerid & "))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3

    sql = "SELECT Count([Cust_Passwords].[PasswordID]) AS CountOfPasswordID  FROM Cust_Passwords  WHERE ((([Cust_Passwords].[ProductID])= " & prodid & ") And (([Cust_Passwords].[CustomerID])= " & customerid & "))   "
    Set rs3 = Server.CreateObject("ADODB.Recordset")
    rs3.Open sql, conn, 3, 3
count = rs3("CountOfPasswordID")
If count > 0 Then
message = count & " authorization codes available"
Else
message = "no authorization codes available for this test" 
End If
%>
<b><font face="Verdana" size="2" color="#000080"><i><%=rs2("PDesc")%></i></font></b>
<TABLE BORDER=1 BGCOLOR=#ffffff cellpadding="2" width="360"><FONT FACE="Arial" COLOR=#000000></FONT>
<THEAD>
<TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 colspan=5><font face="Verdana" size="1" color="#000080"><%=message%></font>&nbsp;</TH>
</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
x = x + 1
pass = rs("Password")
If x = 5 Then row = "</tr>" Else row = ""
If x = 5 Then x = 0 Else x = x
%>
<TD BORDERCOLOR=#c0c0c0  ALIGN=center><font face="Courier" size="2" color="#000000"><%=pass%><BR></font></TD>
<%=row%>
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
<blockquote><blockquote><blockquote>
    <p align="justify">Hint: You may copy the authorization code and paste it into an email to the prospective assessment taker. To copy the code, simply highlight it, then choose EDIT > COPY on your browser, it then may be pasted wherever you like.</blockquote></blockquote></blockquote>
<a href="insight_acct.asp?action=acctmanage"><img border="0" src="images/BACK.GIF"></a>
<br>
</center>
<!================================= View Passwords Ends ====================================>
<!================================== Update Acct Starts ====================================>
<% case "updateacct" %>
<%
strSQL = "UPDATE Customers " & _
"SET Customers.Company = '" & company & "', " & _
"Customers.Address1 = '" & address1 & "', " & _
"Customers.FirstName = '" & firstname & "', " & _
"Customers.LastName = '" & lastname & "', " & _
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

MYMESSAGE = Server.URLEncode("Updating your information....Please Wait")
'Response.Redirect ("delay.asp?DELAY_TIME=2&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_acct.asp?action=acctmanage&customerid="&customerid )
Response.Redirect ("insight_acct.asp?action=acctmanage&customerid="&customerid )
%>
<!=================================== Update Acct Ends =====================================>
<!=================================== Edit Acct Starts =====================================>
<% case "editacct" %>
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
<%
'cc type list
    sql = "SELECT ccTypes  FROM ccInfo  WHERE  ccTypes Is Not Null ORDER BY ccTypeOrder "
    Set rs55 = Server.CreateObject("ADODB.Recordset")
    rs55.Open sql, conn, 3, 3
    If rs55.eof Then
    End If
%>
<%
'cc month list
    sql = "SELECT ccMonth  FROM ccInfo  WHERE  ccMonth Is Not Null "
    Set rs66 = Server.CreateObject("ADODB.Recordset")
    rs66.Open sql, conn, 3, 3
    If rs66.eof Then
    End If
%>
<%
'cc year list
    sql = "SELECT ccYear  FROM ccInfo  WHERE  ccYear Is Not Null "
    Set rs77 = Server.CreateObject("ADODB.Recordset")
    rs77.Open sql, conn, 3, 3
    If rs77.eof Then
    End If
%>
<center>
<form method=post action="insight_acct.asp?action=updateacct" name=companyupdate onSubmit="return validateForm2(this)">
<table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#C0C0C0">
  <tr>
    <td colspan="2" align="center"><b><span style="text-transform: uppercase"><font face="Verdana" size="3" color="#000080"><%=fullname%><br> ACCOUNT
      information</font></span></b><br><font face="Verdana" size="1">(</font><font color="#ff0000">*</font><font face="Verdana" size="1"> denotes required
      field).</font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Company Name:<br>
      (if applicable)</font></td>
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
      access the 'Account Management Page'. If you forget your password it will be emailed to this email
      address.</font></p>
    </td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Authorization ID&nbsp;<br>
      (E-Mail Address):</font><font color="#ff0000">*</font></td>
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
<a href="insight_acct.asp?action=acctmanage"><img border="0" src="images/BACK.GIF"></a>
<!==================================== Edit Acct Ends ======================================>
<!=================================== Buy More1 Starts ======================================>
<% case "buymore1" %>
<%
' get subscriber text
    sql = "SELECT Data FROM DataFields WHERE DataFieldID=1"
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3

' get Test Types
    sql = "SELECT * FROM Products "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
    If rs2.eof Then
    End If

'cc type list
    sql = "SELECT ccTypes  FROM ccInfo  WHERE  ccTypes Is Not Null ORDER BY ccTypeOrder "
    Set rs55 = Server.CreateObject("ADODB.Recordset")
    rs55.Open sql, conn, 3, 3
    If rs55.eof Then
    End If

'cc month list
    sql = "SELECT ccMonth  FROM ccInfo  WHERE  ccMonth Is Not Null "
    Set rs66 = Server.CreateObject("ADODB.Recordset")
    rs66.Open sql, conn, 3, 3
    If rs66.eof Then
    End If

'cc year list
    sql = "SELECT ccYear  FROM ccInfo  WHERE  ccYear Is Not Null "
    Set rs77 = Server.CreateObject("ADODB.Recordset")
    rs77.Open sql, conn, 3, 3
    If rs77.eof Then
    End If
%>


<center>
<p>&nbsp;</p>
    <script Language="VBScript" Type="text/vbscript"><!--
function FrontPage_Form7_onsubmit()
  Set theForm = document.FrontPage_Form7

  radioSelected = False
  For i = 0 to theForm.method.length - 1
    If (theForm.method.item(i).checked) Then
        radioSelected = True
    End If
  Next
  If (Not radioSelected) Then
    MsgBox "Please select one of the ""payment method"" options.", 0, "Validation Error"
    FrontPage_Form7_onsubmit = False
    Exit Function
  End If

  If (theForm.qty.value = "") Then
    MsgBox "Please enter a value for the ""qty"" field.", 0, "Validation Error"
    theForm.qty.focus()
    FrontPage_Form7_onsubmit = False
    Exit Function
  End If
  FrontPage_Form7_onsubmit = True 
End Function
--></script><!--webbot BOT="GeneratedScript" endspan --><form method="POST" action="insight_acct.asp?action=buymore2" name="FrontPage_Form7">
<table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#C0C0C0" width="70%">
  <tr>
    <td colspan="2" align="center"><b><span style="text-transform: uppercase"><font face="Verdana" size="3" color="#000080">order
      more Assessments</font></span></b></td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><font face="Verdana" size="2" color="#000080"><b>order information</b></font></td>
  </tr>

  <tr>
    <td colspan="2" align="center">
      <p align="justify"><font face="Verdana" size="2">If you wish to purchase
      more than one type of assessment, simply repeat this step after placing
      this order.</font></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">Assessment
      Options:</font><font color="#ff0000">*</font></td>
    <td> <font face="Courier" size="2">
    <select name="productid" size="1">
<%
On Error Resume Next
rs2.MoveFirst
do while Not rs2.eof
%>
            <option value="<%=rs2("ProductID")%>"><%=rs2("PDesc")%></option>
<%
rs2.MoveNext
loop
%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp; Please select the type test to be ordered</font></td>
  </tr>
  <tr>
    <td align="right">
      <font face="Verdana" size="1">Quantity:</font><font color="#ff0000">*</font></td>
    <td align="left">
      <font size="2" face="Courier">
        <INPUT name=qty size=15 value="5"> </font><font face="Verdana" size="2">Enter desired quanity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; click
      <a href="Javascript:myopen()"pricing.asp","","width=300,height=942,resizable=yes,scrollbars=yes")">here</a>
      to see pricing info</font></td>
  </tr>
  <tr>
    <td align="center">
      <p align="center" class="auto-style1">click here to<p align="center"><input type="image" src="images/submit.gif"  border=0 value="add" name="submit" align="top"><p align="center" class="auto-style1">place order</td>
    <td align="center">
      <p align="justify"><font face="Verdana" size="1">After submitting this
      form, please wait for it to disappear &amp; your receipt will appear. It
      should only take a moment, depending on network conditions. <b>
          <br />
          DO NOT</b>
      hit the submit button again, this will duplicate your order.</font><p align="justify"><font face="Verdana" size="1">
            <br />
            If you experience difficulties, please contact us at 800-852-2001 or 817-249-6266</font></td>
  </tr>
</table>
<input type="hidden" name="customerid" value="<%=customerid%>"><input type="hidden" name="ccname" value="<%=rs3("ccName")%>"><input type="hidden" name="ccnumber" value="<%=rs3("ccNumber")%>"><input type="hidden" name="cctype" value="<%=rs3("ccType")%>"><input type="hidden" name="ccmonth" value="<%=rs3("ccMonth")%>"><input type="hidden" name="ccyear" value="<%=rs3("ccYear")%>"><input type="hidden" name="email" value="<%=rs3("Email")%>">
</form>
<a href="insight_acct.asp?action=acctmanage"><img border="0" src="images/BACK.GIF"></a><br>
</center>
<!==================================== Buy More1 Ends =======================================>
<!=================================== Buy More2 Starts ======================================>
<% case "buymore2" %>
<%
q = (qty + 2) - 2
'get unitprice
    sql = "SELECT [Prod_Prices].[Qty], [Prod_Prices].[Qty2], [Prod_Prices].[UnitPrice]  FROM Prod_Prices  WHERE ((([Prod_Prices].[ProductID])= " & productid & "))   "
    Set rs4 = Server.CreateObject("ADODB.Recordset")
    rs4.Open sql, conn, 3, 3
    If rs4.eof Then
    End If
%>
<%
On Error Resume Next
rs4.MoveFirst
do while Not rs4.eof
qty1 = rs4("Qty") 
qty2 = rs4("Qty2") 
price = rs4("UnitPrice")
If (q => qty1) And (q =< qty2) Then unitprice = price Else unitprice = unitprice
If (q => qty1) And  IsNull(rs4("Qty2")) Then unitprice = price Else unitprice = unitprice
rs4.MoveNext
loop
%>
<%
'get to email address
    sql = "SELECT ccName, ccNumber FROM Customers WHERE CustomerID = 1"
    Set rs5 = Server.CreateObject("ADODB.Recordset")
    rs5.Open sql, conn, 3, 3
toaddr = rs5("ccName")
toaddr2 = rs5("ccNumber")

'get sales tax and order total
    sql = "SELECT ccNumber, State FROM Customers WHERE CustomerID = 1"
    Set rs6 = Server.CreateObject("ADODB.Recordset")
    rs6.Open sql, conn, 3, 3
If lcase(request("state")) = lcase(rs6("state")) Then taxrate = ( rs6("ccNumber")/100) Else taxrate = 0
ordertotal= ((qty) * (unitprice))
salestax= FormatNumber(((ordertotal) * (taxrate)),2)
ordertotal = (ordertotal + salestax) 

strSQL = "INSERT INTO Orders(OrderDate, ccNumber, ccType, ccName, Qty, UnitPrice, SalesTax, Total, CustomerID, ProductID, ccMonth, ccYear)"
strSQL = strSQL & " SELECT "
strSQL = strSQL & "'" & todaysdate & "' as text1,"    
strSQL = strSQL & "'" & ccnumber & "' as text2,"
strSQL = strSQL & "'" & cctype & "' as text3,"
strSQL = strSQL & "'" & ccname & "' as text4,"
strSQL = strSQL & "'" & qty & "' as text5,"
strSQL = strSQL & "'" & unitprice & "' as text6,"
strSQL = strSQL & "'" & salestax & "' as text7,"
strSQL = strSQL & "'" & ordertotal & "' as text8,"
strSQL = strSQL & "'" & customerid & "' as text9,"
strSQL = strSQL & "'" & productid & "' as text10,"
strSQL = strSQL & "'" & ccmonth & "' as text11,"
strSQL = strSQL & "'" & ccyear & "' as text12"
conn.execute(strSQL)

'get last orderid
    sql = "SELECT Max([Orders].[OrderID]) AS LastOfOrderID  FROM Orders   "
    Set rs3 = Server.CreateObject("ADODB.Recordset")
    rs3.Open sql, conn, 3, 3
orderid = rs3("LastOfOrderID")

If len(OrderID) = 1 Then orderno = "00000" & OrderID Else orderno = orderno
If len(OrderID) = 2 Then orderno = "0000" & OrderID Else orderno = orderno
If len(OrderID) = 3 Then orderno = "000" & OrderID Else orderno = orderno
If len(OrderID) = 4 Then orderno = "00" & OrderID Else orderno = orderno
If len(OrderID) = 5 Then orderno = "0" & OrderID Else orderno = orderno

url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3="http://" & url1 & url2
orderurl=replace(url3,"acct","order")
urlrcpt=replace(url3,"acct","order") & "?action=receipt&from=mgmt&orderid=" & orderid
urlauth=replace(url3,"acct","mgmt") & "?action=auth1"

HTML1 = "<font face=Verdana size=2 color=#000080><b>You have received an order. Please proceed <a href='" & urlrcpt & "'>here</a> to view the order. To authorize the order, click <a href='" & urlauth & "'>here</a>.</font>"
HTML2 = "<font face=Verdana size=2 color=#000080><b>Thank you for your NSight order. All orders are processed Monday thru Friday. Orders submitted before 5:00PM central time are processed on that day. Orders processed after 5:00PM central time, or on the weekend, will be processed on the following business day.</p>Your profile passwords will be added upon the authorization of your payment, within 24 hours.</p> To manage your account, please login with your email address, <i>" & email & "</i>, and the password you chose during your account signup. This is where you will be able to retrieve your profile passwords, once authorized. </b></font>"

'---------------Order email2 start---------------

fromWho=toaddr2
toWho=email                           'To Customer
Subject = "Your Nsight Order"
HTMLBody = HTML2                           

If toWho <> "" THEN 
'sendMail fromWho, toWho, Subject, HTMLBody 
END IF

'---------------Order email1 end-----------------

'---------------Order email1 start---------------

fromWho=toaddr2
toWho=toaddr2                        'To Penny
Subject = "Order #" & orderno
HTMLBody=HTML1

If toWho <> "" THEN 
'sendMail fromWho, toWho, Subject, HTMLBody 
END IF

'---------------Order email1 end-----------------

set conn = nothing

MYMESSAGE = Server.URLEncode("Creating your receipt....Please Wait")
'Response.Redirect ("delay.asp?DELAY_TIME=2&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_order.asp?action=receipt&from=acct&orderid="& orderid )
Response.Redirect ("insight_order.asp?action=receipt&from=acct&orderid="& orderid )
%>

<!==================================== Buy More2 Ends =======================================>
<!==================================== Results Starts ======================================>
<% case "results" %>
<%
'get list of test takers for this client
If request("sort") = "" Then sort = "[Cust_Profiles].[DateTaken] DESC" Else sort = request("sort")
    sql = "SELECT [Cust_Profiles].[ProfileID], [Cust_Profiles].[CustomerID], [Cust_Profiles].[First], [Cust_Profiles].[Last], [Cust_Profiles].[DateTaken], [Cust_Profiles].[Email], [Products].[PDesc]  FROM Products INNER JOIN Cust_Profiles ON [Products].[ProductID]=[Cust_Profiles].[ProductID] WHERE CustomerID= " & customerid & " ORDER BY " & sort & " "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
    If rs.eof Then
    End If
%>
<%
url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3=request.servervariables("QUERY_STRING")
url="http://" &url1 & url2 & "?action=results"
%>
<center>
<%
    sql = "SELECT [Products].[PDesc], Count([Cust_Profiles].[ProfileID]) AS CountOfProfileID  FROM Products INNER JOIN Cust_Profiles ON [Products].[ProductID]=[Cust_Profiles].[ProductID] WHERE CustomerID = " & customerid & "  GROUP BY [Products].[PDesc]   "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
    If rs2.eof Then
    End If
%>
    <br />
    <span class="style1">Assessment Profiles TakenProfiles Taken</span><TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0 width="80%"><FONT FACE="Arial" COLOR=#000000></FONT>
<THEAD><TR>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 nowrap ><font face="Verdana" size="2" 
        color="#000080" style="font-size: x-small">Assessment</font></TH>
<TH BGCOLOR=#FFFFFF BORDERCOLOR=#000000 width="52" align="center" ><font face="Verdana" size="1" color="#000080">&nbsp;Profiles Used</font></TH></TR></THEAD>
<TBODY>
<%
On Error Resume Next
rs2.MoveFirst
do while Not rs2.eof
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0 nowrap ><font face="Verdana" size="2" color="#000080"><%=Server.HTMLEncode(rs2.Fields("PDesc").Value)%><BR></font></TD>
<TD BORDERCOLOR=#c0c0c0  align=center width="52"><font face="Verdana" size="2" color="#000080"><%=Server.HTMLEncode(rs2.Fields("CountOfProfileID").Value)%><BR></font></TD>
</TR>
<%
rs2.MoveNext
loop
%>
</TBODY>
</TABLE>
<img border="0" src="images/clear.GIF" height=20><br>
<TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0 width="80%">
<THEAD><TR>
<TH BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><a href="<%=url%>&amp;sort=[Cust_Profiles].[CustomerID]">Profile ID</a>
<TH BGCOLOR=#FFFFFF ><font face="Verdana" size="2" color="#000080">Name (<a href="<%=url%>&amp;sort=[Cust_Profiles].[First]">First</a>/<a href="<%=url%>&amp;sort=[Cust_Profiles].[Last]">Last</a>)</font></TH>
<TH BGCOLOR=#FFFFFF ><font face="Verdana" size="2" color="#000080"><a href="<%=url%>&amp;sort=[Cust_Profiles].[DateTaken] DESC">Date</a></font></TH>
<TH BGCOLOR=#FFFFFF align="center" ><font face="Verdana" size="2" color="#000080"><a href="<%=url%>&amp;sort=[Products].[PDesc] DESC">Test</a>
</font></TH>
</TR>
</THEAD>
<TBODY>
<%
On Error Resume Next
rs.MoveFirst
do while Not rs.eof
name = rs("First") & " " & rs("Last")
%>
<TR VALIGN=TOP>
<TD BORDERCOLOR=#c0c0c0 align="center" ><FONT SIZE=2 FACE="Arial" COLOR=#000000>
<a href='/insight_mgmt3.asp?action=results2&ProfileID=<%=Server.HTMLEncode(rs.Fields("ProfileID").Value)%>' target="_blank"><%=Server.HTMLEncode(rs.Fields("ProfileID").Value)%></a><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=name%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0  ALIGN=RIGHT><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Server.HTMLEncode(rs.Fields("DateTaken").Value)%><BR></FONT></TD>
<TD BORDERCOLOR=#c0c0c0 align="center" ><FONT SIZE=2 FACE="Arial" COLOR=#000000><%=Server.HTMLEncode(rs.Fields("PDesc").Value)%><BR></FONT></TD>
</TR>
<%
rs.MoveNext
loop%>
</TBODY>
</TABLE>
<a href="insight_acct.asp?action=acctmanage"><img border="0" src="images/BACK.GIF"></a><br>
</center>
<!===================================== Results Ends =======================================>
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

'cleanup
Set ObjCDO = Nothing 
Set iConf = Nothing 
Set Flds = Nothing 

END SUB 

%>
</BODY>