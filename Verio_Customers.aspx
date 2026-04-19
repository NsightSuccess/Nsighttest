<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="VB" %>

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
<title>Verio_Customers</title>
<style type="text/css">
.style1 {
	text-align: center;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<div>
		<div style="width: auto;" class="style1">
			<a href="insight_acct.asp?action=vendoracct">
			<img src="images/BACK.GIF" alt="" style="height: 34px; width: 136px"/></a></div>
		<div>
			<asp:GridView id="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                BorderStyle="None" BorderWidth="1px" Caption="Verio Customers" CellPadding="0" 
                DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" GridLines="Vertical" 
                Height="143px" PageSize="9" SelectedIndex="0" Width="1100px" 
                HorizontalAlign="Center">
		<PagerSettings PageButtonCount="30" Position="TopAndBottom" />
		<RowStyle BackColor="#EEEEEE" ForeColor="Black" />
		<Columns>
			<asp:boundfield DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID">
			</asp:boundfield>
			<asp:boundfield DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
			</asp:boundfield>
			<asp:boundfield DataField="LastName" HeaderText="LastName" SortExpression="LastName">
			</asp:boundfield>
			<asp:boundfield DataField="Company" HeaderText="Company" SortExpression="Company">
			</asp:boundfield>
			<asp:boundfield DataField="CoCode" HeaderText="CoCode" SortExpression="CoCode">
			</asp:boundfield>
			<asp:boundfield DataField="Phone" HeaderText="Phone" SortExpression="Phone">
			</asp:boundfield>
			<asp:boundfield DataField="Address1" HeaderText="Address1" SortExpression="Address1">
			</asp:boundfield>
			<asp:boundfield DataField="City" HeaderText="City" SortExpression="City">
			</asp:boundfield>
			<asp:boundfield DataField="State" HeaderText="State" SortExpression="State">
			</asp:boundfield>
			<asp:boundfield DataField="Zip" HeaderText="Zip" SortExpression="Zip">
			</asp:boundfield>
			<asp:boundfield DataField="Email" HeaderText="Email" SortExpression="Email">
			</asp:boundfield>
			<asp:boundfield DataField="Password" HeaderText="Password" SortExpression="Password">
			</asp:boundfield>
			<asp:commandfield ShowEditButton="True">
			</asp:commandfield>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="Button1" runat="server" 
                        onclientclick="return confirm('Are you sure you want to delete this record?');" 
                        Text="Delete" 
                        CommandName="Delete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>         


		</Columns>
		<FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="#DCDCDC" BorderStyle="None" />
			</asp:GridView>
		</div>
		<div>
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
                SelectCommand="SELECT * FROM [Customers] ORDER BY [CustomerID] DESC" 
                DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" 
                InsertCommand="INSERT INTO [Customers] ([FirstName], [LastName], [Company], [CoCode], [Address1], [City], [State], [Zip], [Phone], [Fax], [Email], [Password], [ccName], [ccType], [ccNumber], [ccMonth], [ccYear], [Newsletter]) VALUES (@FirstName, @LastName, @Company, @Address1, @City, @State, @Zip, @Phone, @Fax, @Email, @Password, @ccName, @ccType, @ccNumber, @ccMonth, @ccYear, @Newsletter)" 
                UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Company] = @Company, [CoCode] = @CoCode, [Address1] = @Address1, [City] = @City, [State] = @State, [Zip] = @Zip, [Phone] = @Phone, [Fax] = @Fax, [Email] = @Email, [Password] = @Password, [ccName] = @ccName, [ccType] = @ccType, [ccNumber] = @ccNumber, [ccMonth] = @ccMonth, [ccYear] = @ccYear, [Newsletter] = @Newsletter WHERE [CustomerID] = @CustomerID">
		<DeleteParameters>
			<asp:parameter Name="CustomerID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:parameter Name="FirstName" Type="String" />
			<asp:parameter Name="LastName" Type="String" />
			<asp:parameter Name="Company" Type="String" />
			<asp:parameter Name="CoCode" Type="String" />
			<asp:parameter Name="Address1" Type="String" />
			<asp:parameter Name="City" Type="String" />
			<asp:parameter Name="State" Type="String" />
			<asp:parameter Name="Zip" Type="String" />
			<asp:parameter Name="Phone" Type="String" />
			<asp:parameter Name="Fax" Type="String" />
			<asp:parameter Name="Email" Type="String" />
			<asp:parameter Name="Password" Type="String" />
			<asp:parameter Name="ccName" Type="String" />
			<asp:parameter Name="ccType" Type="String" />
			<asp:parameter Name="ccNumber" Type="String" />
			<asp:parameter Name="ccMonth" Type="String" />
			<asp:parameter Name="ccYear" Type="String" />
			<asp:parameter Name="Newsletter" Type="Boolean" />
			<asp:parameter Name="CustomerID" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:parameter Name="FirstName" Type="String" />
			<asp:parameter Name="LastName" Type="String" />
			<asp:parameter Name="Company" Type="String" />
			<asp:parameter Name="Address1" Type="String" />
			<asp:parameter Name="City" Type="String" />
			<asp:parameter Name="State" Type="String" />
			<asp:parameter Name="Zip" Type="String" />
			<asp:parameter Name="Phone" Type="String" />
			<asp:parameter Name="Fax" Type="String" />
			<asp:parameter Name="Email" Type="String" />
			<asp:parameter Name="Password" Type="String" />
			<asp:parameter Name="ccName" Type="String" />
			<asp:parameter Name="ccType" Type="String" />
			<asp:parameter Name="ccNumber" Type="String" />
			<asp:parameter Name="ccMonth" Type="String" />
			<asp:parameter Name="ccYear" Type="String" />
			<asp:parameter Name="Newsletter" Type="Boolean" />
		</InsertParameters>
	</asp:SqlDataSource>
		</div>
	</div>
</form>

</body>

</html>
