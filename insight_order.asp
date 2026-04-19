<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- #INCLUDE FILE="dsn.txt" -->
<%
If request("action") = "" Then action = "next" Else action = request("action")
orderid = request("orderid")
from = request("from")
If from = "acct" Then linkto = "insight_acct.asp?action=status" Else linkto = linkto
If from = "mgmt" Then linkto = "verio_orders.aspx" Else linkto = linkto
If from = "" Then linkto = "insight_acct.asp?action=vendoracct" Else linkto = linkto
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
<TITLE>Customer Receipt</TITLE>
<META NAME="DESCRIPTION" CONTENT="This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs.">
<META NAME="KEYWORDS" CONTENT="on-line assessment,Nsight,Insight,Directional Insight International,Aptitude,Aptitude Testing,Personality,Personality Testing,Management,Coaching,Teambuilding needs.">

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

<BODY bgColor=#ffffff link="#000080" vlink="#000080" alink="#000080">
<!======================================= Body Starts ========================================>
<!===================================== Receipt Starts =======================================>
<% select case action %>
<% case "receipt" %>
<%
On Error Resume Next
'get nsight data
    sql = "SELECT * FROM [Customers] WHERE CustomerID = 1"
    Set rs2 = Server.CreateObject("ADODB.Recordset")
    rs2.Open sql, conn, 3, 3
vaddress1 = rs2("Address1")
vaddress2 = rs2("City") & ", " & UCase(rs2("State")) & " " & rs2("Zip")
vphone = FormatPhoneNumber(rs2("Phone"))
vstate = rs2("State")
taxrate = FormatPercent((rs2("ccNumber")/100))


'get order data and set pending var
    sql = "SELECT [Orders].[OrderID], [Customers].[FirstName], [Customers].[LastName], [Customers].[Company], [Customers].[Address1], [Customers].[City], [Customers].[State], [Customers].[Zip], [Customers].[Phone], [Customers].[Fax], [Customers].[Email], [Customers].[Password], [Products].[PDesc], [Orders].[OrderDate], [Orders].[ccName], [Orders].[ccType], [Orders].[ccNumber], [Orders].[ccAuth], [Orders].[ccMonth], [Orders].[ccYear], [Orders].[Qty], [Orders].[UnitPrice], [Orders].[SalesTax], [Orders].[Total]  FROM Products INNER JOIN (Customers INNER JOIN Orders ON [Customers].[CustomerID]=[Orders].[CustomerID]) ON [Products].[ProductID]=[Orders].[ProductID]  WHERE ((([Orders].[OrderID])= " & orderid & "))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
ccauth = rs("ccAuth")
cctype = rs("ccType")
If cctype = "Purchase Order" Then phrase1 = "We will bill you" Else phrase1 = "Charged to your " & cctype
If rs("Fax") = "_" Then faxnum = "none" Else faxnum = FormatPhoneNumber(rs("Fax"))
ccnumber = Left(rs("ccNumber"),4) & "....." & Right(rs("ccNumber"),4)
If len(rs("OrderID")) = 1 Then orderno = "00000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 2 Then orderno = "0000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 3 Then orderno = "000" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 4 Then orderno = "00" & rs("OrderID") Else orderno = orderno
If len(rs("OrderID")) = 5 Then orderno = "0" & rs("OrderID") Else orderno = orderno
odate = rs("OrderDate")
company = replace(rs("Company"),"_","")
cctype = rs("ccType")
ccexp = rs("ccMonth") & "/" & rs("ccYear")
If cctype = "Purchase Order" Then phrase2 = "" Else phrase2 = "account # " & ccnumber & " exp: " & ccexp
address1 = rs("Address1")
address2 = rs("City") & ", " & UCase(rs("State")) & " " & rs("Zip")
phone = FormatPhoneNumber(rs("Phone"))
fullname = rs("FirstName") & " " & rs("LastName")
email = rs("Email")
pass = rs("Password")
product = rs("PDesc")
qty = rs("Qty")
unitprice = FormatCurrency(rs("UnitPrice"))
ext = FormatCurrency((rs("Qty"))*(rs("UnitPrice")))
salestax = FormatCurrency(rs("SalesTax"))
total = FormatCurrency(rs("Total"))


'message at thee bottom
If IsNull(rs("ccAuth")) Then
message="We will immediately begin reviewing your order. Your order will not be completed until your payment is verified. In some cases, this may delay obtaining your passwords. "
Else message="We have obtained authorization number '" & ccauth & "' for your " & cctype & " card. Your passwords have been added to your account. Thank you for your order!"
End If

%>
<table border="0" width="100%" cellspacing="0" cellpadding="0" height="444">
  <tr>
    <td width="50%" colspan="2" height="90"><img border="0" src="images/clear.GIF" height="1"><img border="0" src="images/twopeps_key.gif" width="85" height="85"></td>
    <td width="50%" colspan="2" align="right" height="90"><font face="Verdana" size="2">
    <b><%=vaddress1%><br><%=vaddress2%><br><%=vphone%></b></font></td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="20"><font face="Verdana" size="3"><b>Order #<%=orderno%></b></font></td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="18"><font face="Verdana" size="2">Placed <%=odate%></font>
    </td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="18"></td>
  </tr>
  <tr>
    <td width="50%" colspan="2" bgcolor="#C0C0C0" height="18"><b><font face="Verdana" size="2">Customer Information</font></b></td>
    <td width="50%" colspan="2" bgcolor="#C0C0C0" height="18"><b><font face="Verdana" size="2">Billing Information</font></b></td>
  </tr>
  <tr>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=fullname%></font></td>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=phrase1%></font></td>
  </tr>
  <tr>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=company%></font></td>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=phrase2%></font></td>
  </tr>
  <tr>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=address1%></font></td>
    <td width="50%" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=address2%></font></td>
    <td width="50%" colspan="2" bgcolor="#C0C0C0"><b><font face="Verdana" size="2">Account
      Information</font> </b></td>
  </tr>
  <tr>
    <td width="50%" colspan="2"><font face="Verdana" size="2"><%=phone%></font></td>
    <td width="50%" colspan="2"><font face="Verdana" size="2">username:
      <i><%=email%></i></font></td>
  </tr>
  <tr>
    <td width="50%" colspan="2"><font face="Verdana" size="2">fax: <%=faxnum%></font></td>
    <td width="50%" colspan="2"><font face="Verdana" size="2">password: <i> <%=pass%></i></font></td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="21">&nbsp;</td>
  </tr>
  <tr>
    <td width="25%" bgcolor="#C0C0C0" height="18"><b><font face="Verdana" size="2">Item</font></b></td>
    <td width="25%" align="center" bgcolor="#C0C0C0" height="18"><b><font face="Verdana" size="2">Qty</font></b></td>
    <td width="25%" align="center" bgcolor="#C0C0C0" height="18"><b><font face="Verdana" size="2">Unit Price</font></b></td>
    <td width="25%" align="center" bgcolor="#C0C0C0" height="18"><b><font face="Verdana" size="2">Total</font></b></td>
  </tr>
  <tr>
    <td width="25%" height="21"><font face="Verdana" size="2"><%=product%></font></td>
    <td width="25%" align="center" height="21"><font face="Verdana" size="2"><%=qty%></font></td>
    <td width="25%" align="center" height="22"><font face="Verdana" size="2"><%=unitprice%></font></td>
    <td width="25%" align="center" height="21"><font face="Verdana" size="2"><%=ext%></font></td>
  </tr>
  <tr>
    <td width="50%" height="54" colspan="2" rowspan="2"></td>
    <td width="25%" align="center" height="26"><font face="Verdana" size="1"><%=vstate%>
      residents <%=taxrate%> sales tax</font></td>
    <td width="25%" align="center" height="26"><font face="Verdana" size="2"><%=salestax%></font></td>
  </tr>
  <tr>
    <td width="25%" align="center" height="28"><font face="Verdana" size="2"><b>Total</b></font></td>
    <td width="25%" align="center" height="28"><font face="Verdana" size="2"><b><%=total%></b></font></td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="44"></td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="50"><font face="Verdana" size="2"><i><%=message%></i></font></td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="21" align="center"><a href="<%=linkto%>"><img border="0" src="images/proceed.gif"></a>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" colspan="4" height="18"><font face="Verdana" size="2">Please print this
      page for your records.</font></td>
  </tr>
</table>
<!======================================= Receipt Ends =======================================>
<!======================================= Next Starts ======================================>
<% case "next" %>
<!======================================= Next Ends ========================================>
<!======================================= Body Ends ========================================>
<% End Select %>
</BODY>
</HTML>