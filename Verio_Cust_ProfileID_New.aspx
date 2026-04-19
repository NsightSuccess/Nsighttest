<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="VB" %>

<script runat="server">

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Calendar1.Visible = True
    End Sub
    
    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Calendar2.Visible = True
    End Sub
    
    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Calendar3.Visible = True
    End Sub
    
    Protected Sub Calendar1_SelectionChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        TextBox1.Text = Calendar1.SelectedDate.Date
        Calendar1.Visible = False
    End Sub

    Protected Sub Calendar2_SelectionChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        TextBox2.Text = Calendar2.SelectedDate + " 11:59:59 PM"
        Calendar2.Visible = False

    End Sub

    Protected Sub Calendar3_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim i As Integer
        i = Calendar3.SelectedDates.Count - 1
        TextBox1.Text = Calendar3.SelectedDates(0)
        TextBox2.Text = Calendar3.SelectedDates(i) + " 11:59:59 PM"
        Calendar3.Visible = False
    End Sub

</script>

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
<title>Verio_Cust_ProfileID_Viewer</title>
<style type="text/css">
    .style1 {
	text-align: center;
}
    .style3
    {
        width: 100%;
    }
    </style>
</head>
<body bgcolor="#ffffec">&nbsp;
<form id="form1" runat="server">
		<p class="style1">
			<a href="insight_acct.asp?action=vendoracct">
			<img src="images/back.gif" width="122" height="42" alt=""/></a></p>
        <table align="center" class="style3">
            <tr>
                <td align="center">
				    <asp:Calendar ID="Calendar1" runat="server" 
                        onselectionchanged="Calendar1_SelectionChanged1" Visible="False">
                    </asp:Calendar>
                    <br />
                    </td>
                <td align="center">
					<asp:Calendar ID="Calendar3" runat="server" 
                        onselectionchanged="Calendar3_SelectionChanged" 
                        SelectionMode="DayWeekMonth" Visible="False"></asp:Calendar>
                	<%Response.Write(GridView1.Rows.Count.ToString() + " records")%><br />
					<asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/Calendar_scheduleHS.png" onclick="ImageButton3_Click" 
                        style="height: 16px" />
                </td>
                <td align="center">
								<asp:Calendar ID="Calendar2" runat="server" 
                                    onselectionchanged="Calendar2_SelectionChanged1" Visible="False">
                                </asp:Calendar>
                                <br />
                            </td>
            </tr>
        </table>
		<p align="center">
            Start Date: <asp:TextBox id="TextBox1" runat="server" Width="150px" 
                CssClass="style1">1/1/2017</asp:TextBox>
			&nbsp;<asp:ImageButton id="ImageButton1" runat="server" 
                onclick="ImageButton1_Click" ImageUrl="~/Calendar_scheduleHS.png" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="Submit1" type="submit" value="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            End Date: &nbsp;&nbsp;<asp:TextBox id="TextBox2" runat="server" Width="150px" 
                CssClass="style1">12/31/2020 11:59:59 PM</asp:TextBox>
			&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                onclick="ImageButton2_Click" ImageUrl="~/Calendar_scheduleHS.png" />
		&nbsp;&nbsp;&nbsp;
            </p>
			<div class="style1">
				<asp:GridView id="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
				Caption="Verio Test ProfileID Viewer (Time is CST)" CellPadding="4" DataKeyNames="ProfileID" 
				DataSourceID="SqlDataSource1" ForeColor="#333333" PageSize="100" SelectedIndex="0" 
                    HorizontalAlign="Center" style="text-align: left">
				<PagerSettings PageButtonCount="30" Position="Top" />
				<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
				<Columns>
    				<asp:hyperlinkfield DataNavigateUrlFields="ProfileID" DataNavigateUrlFormatString="/insight_mgmt.asp?action=results2&amp;
					ProfileID={0}" DataTextField="ProfileID" DataTextFormatString="{0}" HeaderText="ProfileID" SortExpression="ProfileID" Target="_blank">
<%--    				<asp:hyperlinkfield DataNavigateUrlFields="ProfileID" DataNavigateUrlFormatString="results3.asp?action=results2&amp;
					ProfileID={0}" DataTextField="ProfileID" DataTextFormatString="{0}" HeaderText="ProfileID" SortExpression="ProfileID" Target="_blank">
--%>					</asp:hyperlinkfield>
					<asp:boundfield DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID">
					</asp:boundfield>
					<asp:boundfield DataField="DateTaken" DataFormatString="{0:d}" HeaderText="DateTaken" SortExpression="DateTaken">
					</asp:boundfield>
					<asp:boundfield DataField="DateTaken" DataFormatString="{0:t}" HeaderText="TimeTaken" SortExpression="DateTaken">
					</asp:boundfield>
					<asp:boundfield DataField="Salutation" HeaderText="Salutation" SortExpression="Salutation">
					</asp:boundfield>
					<asp:boundfield DataField="First" HeaderText="First" SortExpression="First">
					</asp:boundfield>
					<asp:boundfield DataField="Last" HeaderText="Last" SortExpression="Last">
					</asp:boundfield>
					<asp:boundfield DataField="pwUsed" HeaderText="pwUsed" SortExpression="pwUsed">
					</asp:boundfield>
					<asp:boundfield DataField="Company" HeaderText="Company" SortExpression="Company">
					</asp:boundfield>
					<asp:boundfield DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
					</asp:boundfield>
					<asp:boundfield DataField="LastName" HeaderText="LastName" SortExpression="LastName">
					</asp:boundfield>
				    <asp:BoundField DataField="PDesc" HeaderText="PDesc" SortExpression="PDesc" />
				</Columns>
				<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
				<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<AlternatingRowStyle BackColor="White" />
			</asp:GridView>
			</div>
		<div class="style1">
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
		
                
                
                
                
                
                SelectCommand="SELECT ProfileID, DateTaken, ProductID, Salutation, First, Last, Email, Position, pwUsed, FirstName, LastName, Company, PDesc FROM ProfileID_Customer WHERE (DateTaken &gt;= @DateTaken) AND (DateTaken &lt;= @DateTaken2) ORDER BY ProfileID DESC">
				<SelectParameters>
					<asp:controlparameter ControlID="TextBox1" Name="DateTaken" PropertyName="Text" Type="DateTime" DefaultValue="01/01/2016"/>
					<asp:controlparameter ControlID="TextBox2" Name="DateTaken2" PropertyName="Text" Type="DateTime" DefaultValue="12/31/2020"/>
				</SelectParameters>
			</asp:SqlDataSource>
		</div>
</form>

</body>

</html>
