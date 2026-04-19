<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>MEMBERS AREA</title>
</head>

<body>
<center>
<table border="1" cellpadding="5" cellspacing="5">
  <tbody>
  <tr>
    <td valign="middle" align="center" style="height: 217px">
      <img src="images/ttl_client_login.gif" alt=""/>
    </td>
    <td bgcolor="#cccc99" class="auto-style1" style="width: 363px; height: 217px">
      <form id="form1" runat="server">
      <b>MEMBERS AREA</b><br>
      <font face="Courier New, Courier, mono" size=2>Email Address:</font><br>
      <font face="Courier">
      	<asp:TextBox id="TextBox1" runat="server" Width="305px"></asp:TextBox>
		  <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
		  </font>&nbsp;<font size=1><br>
      </font><font face="Courier New, Courier, mono" size="2">Password:</font><br>
      <font face="Courier">
      	<asp:TextBox id="TextBox2" runat="server" Width="185px"></asp:TextBox>
		  <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
		  <br></font><br>
      	<br>
      <asp:Button id="Button1" runat="server" PostBackUrl="insight_login.asp?action=sendpw" Text="submit" />
		  <br><br>
      <font face="Verdana" size="1" color="#000000"><b>Forgot your Password?</b>
      If you're the primary account contact, click <a href="insight_login.asp?action=sendpw">here</a>
      and we will email it to you. Otherwise, contact your company's primary
      contact to reconfirm your authorization code.&nbsp;</font><br>
      </form>
    </td>
  </tr>
  </tbody>
</table>
</center>
</body>

</html>
