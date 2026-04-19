<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%
Set myMail = CreateObject("CDO.Message")
myMail.Subject = "Sending email with CDO"
myMail.From = "admin@nsightsuccess.com"
myMail.To = "galford@ftc-i.net.com"
myMail.TextBody = "This is a message."
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
'Name or IP of remote SMTP server
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.office365.com"
'Server port
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
myMail.Configuration.Fields.Update
myMail.Send
set myMail = nothing
%>
    </div>
    </form>
</body>
</html>
