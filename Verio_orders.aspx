<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="VB" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
<title>Verio_Orders</title>
<style type="text/css">
.style2 {
	text-align: left;
}
.style3 {
	text-align: center;
}
</style>
</head>

<body>

<form id="form1" runat="server" style="height: 607px">
	<div class="style3">
<a href="insight_acct.asp?action=vendoracct">
<img border="0" src="images/BACK.GIF" width="139" height="53"></a><br />
	<asp:GridView id="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" Caption="Verio Orders" CellPadding="3" 
            CellSpacing="1" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" 
            GridLines="None" PageSize="15" SelectedIndex="0" HorizontalAlign="Center" 
            EnableModelValidation="True">
		<PagerSettings Position="TopAndBottom" />
		<RowStyle BackColor="#DEDFDE" ForeColor="Black" />
		<Columns>

            <asp:hyperlinkfield 
                DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="insight_order.asp?from=mgmt&action=receipt&amp;
				OrderID={0}" DataTextField="OrderID" DataTextFormatString="{0}" HeaderText="OrderID" SortExpression="OrderID" Target="_parent">

<%--    		<asp:hyperlinkfield DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="insight_order.asp?from=mgmt&action=receipt&amp;
				OrderID={0}" DataTextField="OrderID" DataTextFormatString="{0}" HeaderText="OrderID" SortExpression="OrderID" Target="_parent">
--%>					
            </asp:hyperlinkfield>

			<asp:boundfield DataField="CustomerID" HeaderText="CustomerID" 
                SortExpression="CustomerID">
			</asp:boundfield>
			<asp:boundfield DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName">
			</asp:boundfield>
			<asp:boundfield DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName">
			</asp:boundfield>
			<asp:boundfield DataField="Company" HeaderText="Company" 
                SortExpression="Company">
			</asp:boundfield>
			<asp:boundfield DataField="CoCode" HeaderText="CoCode" 
                SortExpression="CoCode">
			</asp:boundfield>
			<asp:boundfield DataField="Phone" HeaderText="Phone" 
                SortExpression="Phone">
			</asp:boundfield>
			<asp:boundfield DataField="ProductID" HeaderText="ProductID" 
                SortExpression="ProductID">
			</asp:boundfield>
			<asp:boundfield DataField="OrderDate" HeaderText="OrderDate" 
                SortExpression="OrderDate" DataFormatString="{0:d}">
			</asp:boundfield>
			<asp:boundfield DataField="ccAuth" HeaderText="ccAuth" 
                SortExpression="ccAuth">
			</asp:boundfield>
			<asp:BoundField DataField="Qty" HeaderText="Qty" 
                SortExpression="Qty" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                SortExpression="UnitPrice" />
            <asp:BoundField DataField="Total" HeaderText="Total" 
                SortExpression="Total" />

            <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="Button1" runat="server" 
                        onclientclick="return confirm('Are you sure you want to delete this record?');" 
                        Text="Delete" 
                        CommandName="Delete">Delete
                        </asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>         


		</Columns>
		<FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
		<PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
	</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
            DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" 
            InsertCommand="INSERT INTO [Orders] ([CustomerID], [ProductID], [OrderDate], [ccName], [ccType], [ccNumber], [ccAuth], [ccMonth], [ccYear], [Qty], [UnitPrice], [SalesTax], [Total]) VALUES (@CustomerID, @ProductID, @OrderDate, @ccName, @ccType, @ccNumber, @ccAuth, @ccMonth, @ccYear, @Qty, @UnitPrice, @SalesTax, @Total)" 
            SelectCommand="SELECT dbo.Orders.OrderID, dbo.Orders.CustomerID, dbo.Customers.FirstName, dbo.Customers.LastName, dbo.Customers.Company, dbo.Customers.CoCode, dbo.Customers.Phone, dbo.Orders.ProductID, dbo.Orders.OrderDate, dbo.Orders.ccAuth, dbo.Orders.Qty, dbo.Orders.UnitPrice, dbo.Orders.Total FROM dbo.Orders INNER JOIN dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID ORDER BY dbo.Orders.OrderID DESC" 
            
            
            
            
            
            
            UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [ProductID] = @ProductID, [OrderDate] = @OrderDate, [ccName] = @ccName, [ccType] = @ccType, [ccNumber] = @ccNumber, [ccAuth] = @ccAuth, [ccMonth] = @ccMonth, [ccYear] = @ccYear, [Qty] = @Qty, [UnitPrice] = @UnitPrice, [SalesTax] = @SalesTax, [Total] = @Total WHERE [OrderID] = @OrderID">
		<DeleteParameters>
			<asp:parameter Name="OrderID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:parameter Name="CustomerID" Type="Int32" />
			<asp:parameter Name="ProductID" Type="Int32" />
			<asp:parameter Name="OrderDate" Type="DateTime" />
			<asp:parameter Name="ccName" Type="String" />
			<asp:parameter Name="ccType" Type="String" />
			<asp:parameter Name="ccNumber" Type="String" />
			<asp:parameter Name="ccAuth" Type="String" />
			<asp:parameter Name="ccMonth" Type="String" />
			<asp:parameter Name="ccYear" Type="String" />
			<asp:parameter Name="Qty" Type="Int32" />
			<asp:parameter Name="UnitPrice" Type="Single" />
			<asp:parameter Name="SalesTax" Type="Single" />
			<asp:parameter Name="Total" Type="Single" />
			<asp:parameter Name="OrderID" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:parameter Name="CustomerID" Type="Int32" />
			<asp:parameter Name="ProductID" Type="Int32" />
			<asp:parameter Name="OrderDate" Type="DateTime" />
			<asp:parameter Name="ccName" Type="String" />
			<asp:parameter Name="ccType" Type="String" />
			<asp:parameter Name="ccNumber" Type="String" />
			<asp:parameter Name="ccAuth" Type="String" />
			<asp:parameter Name="ccMonth" Type="String" />
			<asp:parameter Name="ccYear" Type="String" />
			<asp:parameter Name="Qty" Type="Int32" />
			<asp:parameter Name="UnitPrice" Type="Single" />
			<asp:parameter Name="SalesTax" Type="Single" />
			<asp:parameter Name="Total" Type="Single" />
		</InsertParameters>
	</asp:SqlDataSource>
	</div>
</form>

</body>

</html>
