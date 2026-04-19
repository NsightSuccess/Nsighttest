<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- #INCLUDE FILE="dsn.txt" -->
<%
If request("action") = "" Then action = "start" Else action = request("action")
'todaysdate = FormatDateTime(Date,2)
todaysdate = FormatDateTime(now)
firstname = replace(request("firstname"),"'","''")
lastname = replace(request("lastname"),"'","''")
salutation = request("salutation")
position = replace(request("position"),"'","''")
email = request("email")
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
<SCRIPT LANGUAGE="JavaScript">
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
<HTML>
<HEAD>
<TITLE>NSight Profiler</TITLE>
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

    <style type="text/css">
        #Text1 {
            width: 249px;
        }
    </style>

</head>
<BODY bgColor=#ffffff link="#000080" vlink="#000080" alink="#000080">
<!================================== Initial Login Starts ========================================>
<% select case action %>
<% case "getinfo" %>
<%
productid = request.cookies("ProductID")
' get subscriber text
    sql = "SELECT * FROM Products WHERE ProductID = " & productid & ""
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
message = rs("ProfileText")
%>
<center>
 <script Language="JavaScript" Type="text/javascript">
<!--
    function FrontPage_Form1_Validator(theForm) {

        if (theForm.salutation.selectedIndex < 0) {
            alert("Please select one of the \"salutation\" options.");
            theForm.salutation.focus();
            return (false);
        }

        if (theForm.salutation.selectedIndex == 0) {
            alert("The first \"salutation\" option is not a valid selection.  Please choose one of the other options.");
            theForm.salutation.focus();
            return (false);
        }

        if (theForm.firstname.value == "") {
            alert("Please enter a value for the \"firstname\" field.");
            theForm.firstname.focus();
            return (false);
        }

        if (theForm.lastname.value == "") {
            alert("Please enter a value for the \"lastname\" field.");
            theForm.lastname.focus();
            return (false);
        }

        if (theForm.position.value == "") {
            alert("Please enter a value for the \"position\" field.");
            theForm.position.focus();
            return (false);
        }
        return (true);
    }
    //-->
</script>

<form method="POST" action="insight_profile.asp?action=addprofile" name="FrontPage_Form1" onsubmit="return FrontPage_Form1_Validator(this)">
<table border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#C0C0C0">
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><b><span style="text-transform: uppercase"><font face="Verdana" size="3" color="#000080">test
      taker profile data</font></span></b><br><font face="Verdana" size="1">(</font><font color="#ff0000">*</font><font face="Verdana" size="1"> denotes required
      field).</font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Salutation:</font><font color="#ff0000">*</font></td>
    <td>
    <select size="1" name="salutation">
        <option selected>- choose one -</option>
        <option value="Mr.">Mr.</option>
        <option value="Ms.">Ms.</option>
        <option value="Mrs.">Mrs.</option>
        <option value="Dr.">Dr.</option>
      </select></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">First Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier">
    <INPUT name="firstname" size=30></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Last Name:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier">
    <INPUT name="lastname" size=30></font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Position/Title:</font><font color="#ff0000">*</font></td>
    <td><font size="2" face="Courier">
    <INPUT name="position" size=35> </font></td>
  </tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Email Address: </font><font color="#ff0000">&nbsp; </font></td>
    <td><font size="2" face="Courier">
    <INPUT name="email" size=35> </font></td>
  </tr>
  <tr>
    <td align="center" colspan="2">
        &nbsp;</tr>
  <tr>
    <td align="center" colspan="2">
        Note: If you are participating in an Nsight360 test,<br />
        Please enter the name of the person you are evaluating below.</tr>
  <tr>
    <td align="right"><font face="Verdana" size="1">Evaluating: </font><font color="#ff0000">&nbsp; </font></td>
    <td><font size="2" face="Courier">
    <INPUT name="Evaluating" size=35> </font></td>
  </tr>
    <td align="center" colspan="2">
        &nbsp;</tr>
  <tr>
    <td align="center" colspan="2">
      <p align="center"><input type="image" src="images/submit.gif"  border=0 value="add" name="submit" align="top">
  </tr>
  <tr>
    <td align="center" colspan="2" width="420">
      <p align="justify"><font face="Verdana" size="1">Please ensure that you
      have your browser set to accept cookies before you begin. If you have
      never changed any of your default browser settings, you will not need to
      change anything. All browser are set to accept cookies by default. </font>
  </tr>
</table>
<input type="hidden" name="password" value="<%=request.cookies("password")%>">
<input type="hidden" name="productid" value="<%=request.cookies("productid")%>">
</form>
<BR>
</center>
<!======================================= Body Starts ======================================>
<!==================================== Add Profile Starts ==================================>
<% case "addprofile" %>
<%
password = request.cookies("password")
productid = request.cookies("productid")
    sql = "SELECT [Customers].[CustomerID]  FROM Customers INNER JOIN Cust_Passwords ON [Customers].[CustomerID]=[Cust_Passwords].[CustomerID]  WHERE ((([Cust_Passwords].[Password])='" & password & "'))   "
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 3, 3
customerid = rs("CustomerID")

strSQL = "INSERT INTO Cust_Profiles(CustomerID, DateTaken, First, Last, Salutation, Position, email, pwUsed, ProductID, Evaluating)"
strSQL = strSQL & " SELECT "
strSQL = strSQL & "'" & customerid & "' as text1,"    
strSQL = strSQL & "'" & todaysdate & "' as text2,"    
strSQL = strSQL & "'" & firstname & "' as text3,"    
strSQL = strSQL & "'" & lastname & "' as text4,"
strSQL = strSQL & "'" & salutation & "' as text5,"
strSQL = strSQL & "'" & position & "' as text6,"
strSQL = strSQL & "'" & email & "' as text7,"
strSQL = strSQL & "'" & password & "' as text8,"
strSQL = strSQL & "'" & productid & "' as text9,"
strSQL = strSQL & "'" & evaluating & "' as text10"
conn.execute(strSQL)

    sql = "SELECT Max(Cust_Profiles.ProfileID) AS ProfileID FROM Cust_Profiles"
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    rs1.Open sql, conn, 3, 3
profileid = rs1("ProfileID")
response.cookies("profileid") = profileid
session("profileid") = profileid

set conn = nothing

MYMESSAGE = Server.URLEncode("Adding your Profile....Please Wait")
'Response.Redirect ("delay.asp?DELAY_TIME=2&DELAY_MESSAGE=" & MYMESSAGE & "&REDIRECT_URL=insight_test.asp?action=begin" )
Response.Redirect "insight_test.asp?action=begin"
%>
<!===================================== Add Profile Ends ===================================>
<!======================================= Next Starts ======================================>
<% case "next" %>
<!======================================= Next Ends ========================================>
<!======================================= Body Ends ========================================>
<% End Select %>
</BODY>
</HTML>