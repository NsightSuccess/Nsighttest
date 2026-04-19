<HTML>
<HEAD>
<TITLE>Directional Insight Intl. Inc.</TITLE>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<META NAME="description" CONTENT="This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs.">
<META NAME="keywords" CONTENT="on-line assessment,Nsight,Insight,Directional Insight International,Aptitude,Aptitude Testing,Personality,Personality Testing,Management,Coaching,Teambuilding needs.">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- #INCLUDE FILE="dsn.txt" -->
<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" NAME="CDO for Windows Library"-->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library"-->
<style type="text/css">
.style1 {
	border-width: 0;
}
</style>
</head>
<body bgColor=#ffffe1 link="#000080" vlink="#000080" alink="#000080" style="margin: 5">
<img alt="" src="gfx/topnav.gif" height="126" width="793"><br >
<a href="default.aspx"><img alt="" src="gfx/btn_home_a.png" class="style1"></a>
<a href="product_information.aspx"><img alt="" src="gfx/btn_product_a.gif" class="style1"></a>
<a href="contact_us.aspx"><img alt="" src="gfx/btn_contactus_a.gif" class="style1"></a>
<a href="insight_login.asp"><img alt="" src="gfx/btn_account_a.gif" class="style1"></a>
<a href="insight_login.asp?action=taketest"><img alt="" src="gfx/btn_taketest_a.gif" class="style1"></a>

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
cocode = request("cocode")
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
cctype = request("cctype")
If request("ccnumber") = "" Then ccnumber = "none" Else ccnumber = request("ccnumber")
If request("ccname") = "" Then ccname = "none" Else ccname = request("ccname")
ccmonth = request("ccmonth")
ccyear = request("ccyear")
Else
cctype = "Purchase Order"
If request("ponumber") = "" Then ccnumber = "no PO given" Else ccnumber = request("ponumber")
ccname = "PO"
ccmonth = " "
ccyear = " "
End If
If request("newsletter") = "" Then newsletter = "0" Else newsletter = 1
If IsNumeric(request("qty")) Then qty = request("qty") Else qty = 1
%>
<SCRIPT type="text/javascript">
<!--
function myopen() 
{
    window.open("pricing.asp","weblink","width=280,height=680");
}
//-->
</SCRIPT>
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
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
<!--
var haveerrors = 0;
function showImage(imagename, imageurl, errors) {
document[imagename].src = imageurl;
if (!haveerrors && errors) haveerrors = errors;
}

function validateForm2(f) {
haveerrors = 0;

(f.email.value.search("@") == -1 || f.email.value.search("[.*]") == -1) // validate email
? showImage("emailerror", "images/emailerror.gif", true)
: showImage("emailerror", "images/blankimage.gif", false);

return (!haveerrors);
}
//  End -->
</script>
<!======================================= Body Starts ========================================>
<!================================== Initial Login Starts ========================================>
<% select case action %>
<% case "start" %>
    <br >
    <br >
<center>
<table border="1" cellpadding="5" cellspacing="5" style="width: 550px; height: 290px">
  <tbody>
  <tr>
    <td valign="middle" align="center">
      <img src="images/ttl_client_login.gif" alt="">
    </td>
    <td bgcolor="#cccc99" width="250">
   <!-- 
-->  
 <script Language="JavaScript" Type="text/javascript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.email.value == "")
  {
    alert("Please enter a value for the \"email\" field.");
    theForm.email.focus();
    return (false);
  }

  if (theForm.email.value.length > 100)
  {
    alert("Please enter at most 100 characters in the \"email\" field.");
    theForm.email.focus();
    return (false);
  }

  if (theForm.password.value == "")
  {
    alert("Please enter a value for the \"password\" field.");
    theForm.password.focus();
    return (false);
  }

  return (true);
}
//--></script>
 
    
       <!-- <form method="post" action="insight_login.asp?action=logon" lang="JavaScript" target="_self"> -->
	<form method=post action="insight_login.asp?action=logon" name=FrontPage_Form1 onsubmit="return FrontPage_Form1_Validator(this)" language="JavaScript" style="width: 350px">

      <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEMBERS AREA<br />
        </b><br>
      <font face="Courier New, Courier, mono" size=2>Email Address:</font><font color="#ff0000">*</font><br>
      <font face="Courier">
        <input maxlength="100" name="email0" size="50"></font>
      <font size=1><br>
      </font><font face="Courier New, Courier, mono" size="2">Password:</font><font color="#ff0000">*</font><br>
      <font face="Courier">
        <input maxlength="35" name="password0" size="30" 
          type="password"><br />
        </font><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Courier">
      <input type="image" src="images/submit.gif" value="submit" name="I1" align="top" style="text-align: left"></font><br />
      <img src="images/clear.gif" height="15" border="0" alt=""><br>
      <font face="Verdana" size="1" color="#000000"><b>Forgot your Password?</b>
      If you're the primary account contact, click <a href="insight_login.asp?action=sendpw">here</a>
      and we will email it to you.<br />
        &nbsp;</font><br>
      </form>
    </td>
  </tr>
  </tbody>
</table>
&nbsp;</center>
<!================================== Initial Login Ends ======================================>

<!======================================= Signup Starts ======================================>
<% case "signup" %>
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
<script Language="JavaScript" Type="text/javascript"><!--
function FrontPage_Form2_Validator(theForm) {

  if (theForm.firstname.value == "")  {
    alert("Please enter a value for the \"firstname\" field.");
    theForm.firstname.focus();
    return (false);
  }

  if (theForm.lastname.value == "")  {
    alert("Please enter a value for the \"lastname\" field.");
    theForm.lastname.focus();
    return (false);
  }

  if (theForm.address1.value == "")  {
    alert("Please enter a value for the \"address1\" field.");
    theForm.address1.focus();
    return (false);
  }

  if (theForm.city.value == "")  {
    alert("Please enter a value for the \"city\" field.");
    theForm.city.focus();
    return (false);
  }

  if (theForm.area.value == "")  {
    alert("Please enter a value for the \"area\" field.");
    theForm.area.focus();
    return (false);
  }

  if (theForm.area.value.length > 3)  {
    alert("Please enter at most 3 characters in the \"area\" field.");
    theForm.area.focus();
    return (false);
  }

  if (theForm.exchange.value == "")  {
    alert("Please enter a value for the \"exchange\" field.");
    theForm.exchange.focus();
    return (false);
  }

  if (theForm.exchange.value.length > 3)  {
    alert("Please enter at most 3 characters in the \"exchange\" field.");
    theForm.exchange.focus();
    return (false);
  }

  if (theForm.number.value == "")  {
    alert("Please enter a value for the \"number\" field.");
    theForm.number.focus();
    return (false);
  }

  if (theForm.number.value.length > 4)  {
    alert("Please enter at most 4 characters in the \"number\" field.");
    theForm.number.focus();
    return (false);
  }

  if (theForm.email.value == "")  {
    alert("Please enter a value for the \"email\" field.");
    theForm.email.focus();
    return (false);
  }

  if (theForm.email.value.length > 100)  {
    alert("Please enter at most 100 characters in the \"email\" field.");
    theForm.email.focus();
    return (false);
  }

  if (theForm.password.value == "")  {
    alert("Please enter a value for the \"password\" field.");
    theForm.password.focus();
    return (false);
  }

  var radioSelected = false;
  for (i = 0;  i < theForm.method.length;  i++)  {
    if (theForm.method[i].checked)
        radioSelected = true;
  }
  if (!radioSelected)  {
    alert("Please select one of the \"payment method\" options.");
    return (false);
  }

  if (theForm.qty.value == "")  {
    alert("Please enter a value for the \"qty\" field.");
    theForm.qty.focus();
    return (false);
  }
  return (true);
}
//--></script>
<form method=post action="insight_login.asp?action=addclient" name=FrontPage_Form2 onsubmit="return FrontPage_Form2_Validator(this)" language="JavaScript">
<table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#C0C0C0" width="75%">
  <tr>
    <td colspan="2"><p align=justify><font face="Verdana" size="1"><%=rs("Data")%></font></p></td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><b><span style="text-transform: uppercase"><font face="Verdana" size="3" color="#000080">Online Client Registration</font></span> </b><br><font face="Verdana" size="1">(</font><font color="#ff0000">*</font><font face="Verdana" size="1"> denotes required
      field)</font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">First Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier">
        <INPUT name="firstname" size=30> </font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Last Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier">
        <INPUT name="lastname" size=30></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Company Name / 
	CoCode:</font><br><font face="Verdana" size="1">(if applicable)</font></td>
    <td><font size="2" face="Courier"><INPUT name="company" size=35> <INPUT name="cocode" size=10></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Street Address:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier">
        <INPUT name="address1" size=35></font></td>
  </tr>
  <tr>
    <td align="right" nowrap><font face="Verdana" size="1">City,
      State, Zip Code:</font><font color="#ff0000">*</font></td>
    <td nowrap><font size="2" face="Courier">
        <INPUT name="city" size=20><INPUT name="state" size=2 maxlength=2><INPUT name="zipcode" size=6 maxlength=5></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Country:</font></td>
    <td><font size="2" face="Courier"><INPUT name="country" size=25></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Phone Number:</font><font color="#ff0000">*</font></td>
    <td>
	<font face="Courier">
	<input name="Area" size=3 maxlength=3 style="height: 22px"></font>-<font face="Courier"><input name="exchange" size=3 maxlength=3></font>-<font face="Courier"><input name="number" size=4 maxlength=4></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Fax Number:</font></td>
    <td><font face="Courier"><input type=text name=farea size=3 maxlength=3></font>-<font face="Courier"><input type=text name=fexchange size=3 maxlength=3></font>-<font face="Courier"><input type=text name=fnumber size=4 maxlength=4></font></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td>
      <p align="justify"><font face="Verdana" size="1">The following will be your authorization ID and password that will allow you to access the "Account Management
      Page.&quot; If you forget your password, we will email it to this email
      address.</font></p>
    </td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Authorization ID<br>
      (E-Mail Address):</font><font color="#ff0000">*</font></td>
    <td><FONT size=2 face="Courier"> <INPUT name="email" size=50 maxlength="100"> </FONT></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Password:</font><font color="#ff0000">*</font></td>
    <td><FONT size=2 face="Courier">
        <INPUT name="password" size=30 type="password"></FONT></td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><font face="Verdana" size="2" color="#000080"><b>order information</b></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Assessments Options:</font><font color="#ff0000">*</font></td>
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
    </select> </font></td>
  </tr>
  <tr>
    <td align="right">
      <font face="Verdana" size="1">Quantity:</font><font color="#ff0000">*</font></td>
    <td align="left" width="300">
      <font size="2" face="Courier">
        <INPUT name=qty size=8 value="5"> </font><font face="Verdana" size="2">
Click <a href="javascript:myopen()">here</a> to see pricing info</font>
    </td>
  </tr>
  <tr>
    <td align="right">
      &nbsp;</td>
    <td align="left">
      <input type="checkbox" name="newsletter" value="-1">
      <font face="Verdana" size="2">Check
      here if you would like to receive our newsletter or be added to our
      mailing list for special offers or new services/products.</font></td>
  </tr>
  <tr>
    <td align="center">
      <p align="center"><input type="image" src="images/submit.gif"  value="add" name="submit" align="top"></td>
    <td align="center">
      <p align="justify"><font face="Verdana" size="1">After submitting this
      form, please wait for it to disappear &amp; your receipt will appear. It
      should only take a moment, depending on network conditions. <b>DO NOT</b>
      hit the submit button again, this will duplicate your order.<BR><BR>If you experience difficulties, please Contact Us or call&nbsp; <b><br>
      800-852-2001
      </b>or <b>817-249-6266</b></font></td>
  </tr>
</table>
</form>
&nbsp;</center>
<!======================================= Signup Ends ========================================>

<!======================================= Logon Starts ======================================>
<% case "logon" %>
<%
email = request("email")
password = request("password")
%>
<%
On Error Resume Next
'check to see if account exists
    sql = "SELECT * FROM Customers  WHERE Email='" & email & "' "
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3
acctexists=rs1("CustomerID")
acctpassword=rs1("Password")

'check to see if password exists
    sql = "SELECT * FROM Cust_Passwords WHERE Password='" & password & "' "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
pwexists = rs2("CustomerID")
productid = rs2("ProductID")
%>
<%
'=================================1===============
If IsEmpty(pwexists) Then

'=================================2===============
If IsEmpty(acctexists) Then

response.redirect "insight_login.asp?action=badlogon"

Else
'=================================3===============
If password = acctpassword Then

response.cookies("customerid") = acctexists
response.redirect "insight_acct.asp?action=acctmanage"

Else 

response.redirect "insight_login.asp?action=badlogon"

End If

'=================================3===============
End If

'=================================2===============
Else

response.cookies("password") = password
response.cookies("productid") = productid
'response.write "<body onLoad=javascript:myopen('insight_profile.asp?action=getinfo','directories=yes,location=yes,menubar=yes,scrollbars=yes,status=yes,toolbar=yes,resizable=yes')>"
response.redirect "insight_profile.asp?action=getinfo"

End If
'=================================1===============
%>
<!======================================= Logon Ends ========================================>

<!======================================= Send Password Starts ======================================>
<% case "sendpw" %>
<center>
<form method=post action="insight_login.asp?action=sendpw2" name="sendpw" onSubmit="return validateForm2(this)">
<table border="1" cellspacing="0">
  <tr>
    <td colspan="3" width="480"><font face="Verdana" size="2">Enter your email address and we will send you your
      password. This is for the primary account holder only. If you are trying
      to take an assessment, you need to get the password from the company who gave it
      to you.</font>
    </td>
  </tr>
  <tr>
    <td>
      <p align="right"><font face="Verdana" size="2"><b>email address:</b></font></td>
    <td><font face="Courier"><INPUT maxLength=50 name=email size=50></font><br>
    <img  alt=""name=emailerror src="images/blankimage.gif"  height=10 border=0></td>
    <td>
      <center><input type="image" src="images/submit.gif" value="submit" name="submit" align="left"></center>
    </td>
  </tr>
</table>
</form>
    </center>
<!======================================= Send Password Ends ========================================>

<!======================================= Add Client Starts ======================================>
<% case "addclient" %>
<%
' check to see if account exists
    sql = "SELECT * FROM Customers  WHERE Email='" & email & "' "
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3

On Error Resume Next
acctexists=rs1("CustomerID")
%>
<%
If IsEmpty(acctexists) Then

strSQL = "INSERT INTO Customers(FirstName, LastName, Company, CoCode, Address1, City, State, Zip, Email, Password, ccName, ccNumber, ccMonth, ccYear, ccType, Phone, Fax, Newsletter)"
strSQL = strSQL & " SELECT "
strSQL = strSQL & "'" & firstname & "' as text1,"    
strSQL = strSQL & "'" & lastname & "' as text2,"
strSQL = strSQL & "'" & company & "' as text3,"
strSQL = strSQL & "'" & cocode & "' as text4,"
strSQL = strSQL & "'" & address1 & "' as text5,"
strSQL = strSQL & "'" & city & "' as text6,"
strSQL = strSQL & "'" & state & "' as text7,"
strSQL = strSQL & "'" & zipcode & "' as text8,"
strSQL = strSQL & "'" & email & "' as text9,"
strSQL = strSQL & "'" & password & "' as text10,"
strSQL = strSQL & "'" & ccname & "' as text11,"
strSQL = strSQL & "'" & ccnumber & "' as text12,"
strSQL = strSQL & "'" & ccmonth & "' as text13,"
strSQL = strSQL & "'" & ccyear & "' as text14,"
strSQL = strSQL & "'" & cctype & "' as text15,"
strSQL = strSQL & "'" & phone1 & "' as text16,"
strSQL = strSQL & "'" & faxnumber & "' as text17,"
strSQL = strSQL & "'" & newsletter & "' as text18"
conn.execute(strSQL)

'get last customerid
    sql = "SELECT Max([Customers].[CustomerID]) AS LastOfCustomerID  FROM Customers   "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
customerid = rs2("LastOfCustomerID")
response.cookies("customerid") = customerid
%>
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
'get sales tax and order total
    sql = "SELECT ccNumber, State FROM Customers WHERE CustomerID = 1"
    Set rs6 = Server.CreateObject("ADODB.Recordset")
    rs6.Open sql, conn, 3, 3
If lcase(request("state")) = lcase(rs6("state")) Then taxrate = ( rs6("ccNumber")/100) Else taxrate = 0
ordertotal= ((qty) * (unitprice))
salestax= FormatNumber(((ordertotal) * (taxrate)),2)
ordertotal = (ordertotal + salestax) 

strSQL = "INSERT INTO Orders(OrderDate, ccNumber, ccType, ccName, Qty, ProductID, CustomerID, UnitPrice, SalesTax, Total, ccMonth, ccYear)"
strSQL = strSQL & " SELECT "
strSQL = strSQL & "'" & todaysdate & "' as text1,"    
strSQL = strSQL & "'" & ccnumber & "' as text2,"
strSQL = strSQL & "'" & cctype & "' as text3,"
strSQL = strSQL & "'" & ccname & "' as text4,"
strSQL = strSQL & "'" & qty & "' as text5,"
strSQL = strSQL & "'" & productid & "' as text6,"
strSQL = strSQL & "'" & customerid & "' as text7,"
strSQL = strSQL & "'" & unitprice & "' as text8,"
strSQL = strSQL & "'" & salestax & "' as text9,"
strSQL = strSQL & "'" & ordertotal & "' as text10,"
strSQL = strSQL & "'" & ccmonth & "' as text11,"
strSQL = strSQL & "'" & ccyear & "' as text12"
conn.execute(strSQL)

'get last customerid
    sql = "SELECT Max([Orders].[OrderID]) AS OrderID  FROM Orders "
    Set rs3 = Server.CreateObject("ADODB.Recordset")
    rs3.Open sql, conn, 3, 3
orderid = rs3("OrderID")

'get to email address
    sql = "SELECT ccName, ccNumber FROM Customers WHERE CustomerID = 1"
    Set rs5 = Server.CreateObject("ADODB.Recordset")
    rs5.Open sql, conn, 3, 3
toaddr = rs5("ccName")
toaddr2 = rs5("ccNumber")

If len(rs3("OrderID")) = 1 Then orderno = "00000" & rs3("OrderID") Else orderno = orderno
If len(rs3("OrderID")) = 2 Then orderno = "0000" & rs3("OrderID") Else orderno = orderno
If len(rs3("OrderID")) = 3 Then orderno = "000" & rs3("OrderID") Else orderno = orderno
If len(rs3("OrderID")) = 4 Then orderno = "00" & rs3("OrderID") Else orderno = orderno
If len(rs3("OrderID")) = 5 Then orderno = "0" & rs3("OrderID") Else orderno = orderno

url1=request.servervariables("server_name")
url2=request.servervariables("url")
url3="http://" & url1 & url2
orderurl=replace(url3,"login","order")
urlrcpt=replace(url3,"login","order") & "?action=receipt&from=mgmt&orderid=" & orderid
urlauth=replace(url3,"login","mgmt") & "?action=auth1"

HTML1 = "<font face=Verdana size=2 color=#000080><b>You have received an order. Please proceed <a href='" & urlrcpt & "'>here</a> to view the order. To authorize the order, click <a href='" & urlauth & "'>here</a>.</font>"
HTML2 = "<font face=Verdana size=2 color=#000080><b>Thank you for your NSight order. All orders are processed Monday thru Friday. Orders submitted before 2:00PM central time are processed on that day. Orders processed after 2:00PM central time, or on the weekend, will be processed on the following business day.</p>Your authorization codes will be added upon the authorization of your payment, within 24 hours.</p> To manage your account, please login with your email address, <i>" & email & "</i>, and the password you chose during your account signup. This is where you will be able to retrieve your authorization codes. </b></font>"

'---------------New Order email1 start---------------
fromWho=toaddr2                       'From Penny
toWho=toaddr2                        'To Penny
Subject = "Order #" & orderno
HTMLBody=HTML1

If toWho <> "" THEN 
'sendMail fromWho, toWho, Subject, HTMLBody 

'Cleanup 
Set ObjCDO = Nothing 
Set iConf = Nothing 
Set Flds = Nothing 
END IF
'---------------New Order email1 end-----------------

'---------------New Order email2 start---------------
fromWho=toaddr2						'From Penny
toWho=email							'To Customer
Subject = "Your Nsight Order"
HTMLBody = HTML2

If toWho <> "" THEN 
'sendMail fromWho, toWho, Subject, HTMLBody 

'Cleanup 
Set ObjCDO = Nothing 
Set iConf = Nothing 
Set Flds = Nothing 
END IF

'---------------New Order email2 end-----------------

set conn = nothing

response.redirect "insight_order.asp?action=receipt&orderid=" & orderid

Else
response.redirect "insight_login.asp?action=duplicateacct&customerid=" & rs1("CustomerID")
End If
%>
<!======================================= Add Client Ends ========================================>

<!==================================== Acct Exists Starts ======================================>
<% case "duplicateacct" %>
    <p>
        &nbsp;</p>
<center>
    <b><span style="font-variant: small-caps">
    <font face="Arial" size="4" color="#000080">account exists</font></span></b>
<blockquote>
  <blockquote>
    <blockquote>
    <p align="justify"><font face="Verdana" size="2" color="#000080"><b>You have entered
    an email address that is already registered with Nsight. Please go back to
    the logon page and enter your email address and password if you wish to
    manage your account. You may purchase more assessments from there. If you have
    lost your password, click <a href="insight_login.asp?action=sendpw">here</a>
    to have your username and password emailed to you.</b></font></p>
    </blockquote>
  </blockquote>
</blockquote>
<p align="center">&nbsp;</p>
</center>
<!================================== Acct Exists Ends ========================================>

<!==================================== Badlogon Starts ======================================>
<% case "badlogon" %>
<center>
<b><span style="font-variant: small-caps"><font face="Arial" size="4" color="#000080">invalid logon</font></span></b>
<blockquote>
  <blockquote>
    <blockquote>
    <p align="justify"><font face="Verdana" size="2" color="#000080"><b>You have entered an
    invalid logon. If you are an assessments taker, please check your password and try
    again. If you are a client trying to access your management page, click <a href="insight_login.asp?action=sendpw">here</a>
    to have your username and password emailed to you.</b></font></p>
    </blockquote>
  </blockquote>
</blockquote>
<p align="center">&nbsp;</p>
</center>
<!==================================== Badlogon Ends ========================================>

<!==================================== Send PW2 Starts ======================================>
<% case "sendpw2" %>
<%
'get companies name and email address
    sql = "SELECT ccName, ccNumber, Company, Phone FROM Customers WHERE CustomerID = 1"
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3

fromaddr=rs1("ccNumber")   'Email 2 of Company Acct
phone=rs1("Phone")         'Company #
toaddr=request("email")    'Customer
toaddr2=rs1("ccNumber")    'CC Email 1 of Company Acct

On Error Resume Next
'get password
    'sql = "SELECT * FROM Customers  WHERE Email='" & email & "' "
    sql = "SELECT * FROM Customers  WHERE Email='" & toaddr & "' "
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3

On Error Resume Next
first=rs2("FirstName")
last=rs2("LastName")
pass=rs2("Password")

If IsEmpty(pass) Then
mailbody="We cannot find your email address, " & toaddr & " in our database. Please check that you have not registered with a different email address. If you need further assistance please call us at " & FormatPhoneNumber(phone) &"."
Else
mailbody= "Hello " & first & " " & last & ", your account management password is '" & pass & "'. Enter this without the quotes and you may logon to your account."
End If 

'---------------Password email1 start---------------

fromWho=fromaddr                         'From Penny
toWho=toaddr                             'To Customer
Subject = "Your Nsight Account Password" 
HTMLBody = mailbody
If toWho <> "" THEN 
'sendMail fromWho, toWho, Subject, HTMLBody 

'Cleanup 
Set ObjCDO = Nothing 
Set iConf = Nothing 
Set Flds = Nothing 
END IF
'---------------Password email1 end-----------------
%>
<center>
<b><span style="font-variant: small-caps"><font face="Arial" size="4" color="#000080">password sent</font></span></b>
<blockquote>
  <blockquote>
    <blockquote>
    <p align="justify"><font face="Verdana" size="2" color="#000080"><b>We have
    sent you an email to your <i><%=email%></i> address that contains your password. Please wait a moment for this
    message to arrive, it may take a few minutes depending on network
    conditions. You may then proceed to the user logon screen, click <a href="insight_login.asp"> here</a> to
    continue.</b></font></p>
    </blockquote>
  </blockquote>
</blockquote>
<p align="center">&nbsp;</p>
</center>
<!==================================== Send PW2 Ends ========================================>

<!======================================= Next Starts ======================================>
<% case "taketest" %>
<center>
<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <div align="center"><font size="4">
          <br />
          Test Taker Login </font></div>
    </td>
  </tr>
</table>
<table width="90%" border="0" cellspacing="5" cellpadding="5">
  <tr> 
    <td width="64%" height="242"> 
      <p><font size="2">If you require special accommodations or are uncomfortable 
        working on computers, please Contact Us before proceeding so that we may 
        accommodate you in another manner. Simple keystrokes and point-and-click 
        operations are all that are required to respond to NSight assessment questions.</font></p>
      <p><font size="2"> Upon your acceptance of the following terms, please proceed 
        by entering the authorization code. Otherwise, Contact Us before proceeding. 
        Thank you in advance for the time you will spend responding to the assessment 
        questions.</font></p>
      <p><font size="2"> In consideration for being permitted to complete NSight, 
        I agree to hold the company which is scoring and evaluating it, as well 
        as the company that may have requested me to complete it, free and harmless 
        from all liability and any actions or causes of actions of every kind, 
        nature and description arising out of, or incidental to my taking, participating 
        in, or being administered NSight. If I am completing the NSight at the 
        request of my current or prospective employer, I further understand that 
        my answers may be evaluated and that the results of this questionnaire 
        may be shared with the company or agency that requested its completion, 
        to assist them in making an informed decision. I acknowledge that I have 
        been made aware of the purpose for completing NSight and I authorize the 
        results to be given directly to the company that has requested it. </font></p>
    
<script Language="JavaScript" Type="text/javascript"><!--
function FrontPage_Form4_Validator(theForm)
{

  if (theForm.password.value == "")
  {
    alert("Please enter a value for the \"password\" field.");
    theForm.password.focus();
    return (false);
  }

  if (theForm.password.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"password\" field.");
    theForm.password.focus();
    return (false);
  }
  return (true);
}
//--></script>

<form method="POST" action="insight_login.asp?action=logon" name="FrontPage_Form4" target="_self" onsubmit="return FrontPage_Form4_Validator(this)" language="JavaScript">
        <p align="left">Authorization ID:<font color="#ff0000"> *</font>&nbsp;
        <input type="text" name="password" size="20">&nbsp;&nbsp;&nbsp;
        <input type="submit" value="Submit" name="B1"></p>
      <p></p>
</form>
      <p>
      <font face="Verdana" size="1" color="#000000"><b>Forgot your authorization code?</b>
      If you're the primary account contact, click 
	  <a href="insight_login.asp?action=sendpw" target="_self">here</a>
      and we will email it to you. Otherwise, contact your company's primary
      contact to reconfirm your authorization code.</font></p>
      </td>
  </tr>
</table>
</center>
<!======================================= Next Ends ========================================>

<!======================================= Next Starts ======================================>
<% case "next" %>
<!======================================= Next Ends ========================================>

<!======================================= Body Ends ========================================>
<% End Select %>

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
 	.Item(cdoSMTPServer) = "localhost"
	.Item(cdoSMTPServerPort) = 25 
	.Item(cdoSMTPconnectiontimeout) = 60	
	.Update 
End With

Set objCDO.Configuration = iConf

objCDO.From = fromWho 
objCDO.To = toWho
'objCDO.Cc = Cc 
objCDO.Subject = Subject 
'objCDO.TextBody = Body 
objCDO.HTMLBody = HTMLBody
objCDO.Send

END SUB 

%>
</body>
</HTML>