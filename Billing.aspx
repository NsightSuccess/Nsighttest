<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="VB" %>

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
<title>Billing Report</title>

<script type="text/vb" runat="server">

    
    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Calendar3.Visible = True
    End Sub
    

    Protected Sub Calendar3_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim i As Integer
        i = Calendar3.SelectedDates.Count - 1
        TextBox1.Text = Calendar3.SelectedDates(0)
        TextBox2.Text = Calendar3.SelectedDates(i) + " 11:59:59 PM"
        Calendar3.Visible = False
    End Sub

</script>


<style type="text/css">
    .style1 {
	text-align: center;
}
    .style3
    {
        width: 100%;
    }
    .auto-style1 {
	background-color: #FFFBD6;
}
    </style>
</head>


<body>&nbsp;
<form id="form1" runat="server">
        <table class="style3">
            <tr>
                <td align="center">
				    &nbsp;</td>
                <td align="center">
					<asp:Calendar ID="Calendar3" runat="server" BackColor="White" 
                        BorderColor="White" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                        onselectionchanged="Calendar3_SelectionChanged" SelectionMode="DayWeekMonth" 
                        Visible="False" Width="350px" BorderWidth="1px">
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <TitleStyle BackColor="White" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
                    </asp:Calendar>
                	<%Response.Write(GridView1.Rows.Count.ToString() + " records")%>
            <asp:TextBox id="TextBox1" runat="server" Width="150px" 
                CssClass="style1" Visible="False"></asp:TextBox>
			        <asp:TextBox 
                id="TextBox2" runat="server" Width="150px" 
                CssClass="style1" Visible="False"></asp:TextBox>
			        <br />
					<asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="Calendar_scheduleHS.png" onclick="ImageButton3_Click" 
                        style="height: 16px" />
                </td>
                <td align="center">
								&nbsp;</td>
            </tr>
        </table>
			<div class="style1">
				<asp:GridView id="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProfileID" 
				DataSourceID="SqlDataSource1" ForeColor="#333333" PageSize="100" 
                    HorizontalAlign="Center" style="text-align: left">
				<PagerSettings PageButtonCount="30" Position="Top" />
				<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
				<Columns>
					<asp:hyperlinkfield DataNavigateUrlFields="ProfileID" DataNavigateUrlFormatString="/results4.asp?action=results2&amp;
					ProfileID={0}" DataTextField="ProfileID" DataTextFormatString="{0}" HeaderText="PID" 
                        SortExpression="ProfileID" Target="_blank">
					</asp:hyperlinkfield>
					<asp:boundfield DataField="ProductID" HeaderText="TID" 
                        SortExpression="ProductID">
					</asp:boundfield>
					<asp:boundfield DataField="DateTaken" DataFormatString="{0:d}" 
                        HeaderText="Date" SortExpression="DateTaken">
					</asp:boundfield>
					<asp:boundfield DataField="First" HeaderText="First" SortExpression="First">
					</asp:boundfield>
					<asp:boundfield DataField="Last" HeaderText="Last" SortExpression="Last">
					</asp:boundfield>
					<asp:boundfield DataField="Company" HeaderText="Company" SortExpression="Company">
					</asp:boundfield>
					<asp:boundfield DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
					</asp:boundfield>
					<asp:boundfield DataField="LastName" HeaderText="LastName" SortExpression="LastName">
					</asp:boundfield>            <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="Button1" runat="server" 
                        onclientclick="return confirm('Are you sure you want to delete this record?');" 
                        Text="Delete" 
                        CommandName="Delete">Delete
                        </asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>         

					
					
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
		
                
                DeleteCommand="DELETE FROM [Cust_Profiles] WHERE [ProfileID] = @ProfileID" 

                SelectCommand="SELECT ProfileID, DateTaken, ProductID, Salutation, First, Last, Email, Position, pwUsed, FirstName, LastName, Company, PDesc FROM ProfileID_Customer WHERE (DateTaken &gt;= @DateTaken) AND (DateTaken &lt;= @DateTaken2) ORDER BY LastName, ProfileID DESC">
		<DeleteParameters>
			<asp:parameter Name="ProfileID" Type="Int32" />
		</DeleteParameters>
				<SelectParameters>
					<asp:controlparameter ControlID="TextBox1" Name="DateTaken" PropertyName="Text" 
                        Type="DateTime"/>
					<asp:controlparameter ControlID="TextBox2" Name="DateTaken2" PropertyName="Text" Type="DateTime" DefaultValue="12/31/2020"/>
				</SelectParameters>
			</asp:SqlDataSource>
		</div>
</form>

</body>

</html>
