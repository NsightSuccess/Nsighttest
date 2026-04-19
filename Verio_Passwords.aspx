<%@ Page Language="VB" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><title></title><style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 370px;
        }
    .auto-style1 {
	text-align: center;
}
    </style>
</head><body><p style="text-align: center"><a href="insight_acct.asp?action=vendoracct"><img alt="" src="images/BACK.GIF" style="height: 30px; width: 107px"/></a></p><form id="form1" runat="server"><div>
	</div>
	<table class="style1" style="height: 527px" width="100%"><tr><td align="center" class="style2" valign="top">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
                        
            
            SelectCommand="SELECT PasswordID, CustomerID, ProductID, Password FROM Cust_Passwords WHERE (CustomerID = @CustomerID) ORDER BY ProductID" 
            
            DeleteCommand="DELETE FROM [Cust_Passwords] WHERE [PasswordID] = @PasswordID" 
            InsertCommand="INSERT INTO [Cust_Passwords] ([CustomerID], [ProductID], [Password]) VALUES (@CustomerID, @ProductID, @Password)" 
            
            UpdateCommand="UPDATE [Cust_Passwords] SET [CustomerID] = @CustomerID, [ProductID] = @ProductID, [Password] = @Password WHERE [PasswordID] = @PasswordID">
    <DeleteParameters>
        <asp:Parameter Name="PasswordID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CustomerID" Type="Int32" />
        <asp:Parameter Name="ProductID" Type="Int32" />
        <asp:Parameter Name="Password" Type="String" />
    </InsertParameters>
<SelectParameters>
<asp:ControlParameter ControlID="GridView3" Name="CustomerID" 
                                PropertyName="SelectedValue" Type="Int32" />
</SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="CustomerID" Type="Int32" />
        <asp:Parameter Name="ProductID" Type="Int32" />
        <asp:Parameter Name="Password" Type="String" />
        <asp:Parameter Name="PasswordID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" 
            DataKeyNames="PasswordID">
<Columns>
    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                                SortExpression="CustomerID" />
    <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                                SortExpression="ProductID" />
    <asp:BoundField DataField="Password" HeaderText="Password" 
        SortExpression="Password" />

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
</asp:GridView></td><td valign="top" align="right" style="text-align: center">
<asp:Panel ID="Panel1" runat="server" Height="735px" ScrollBars="Vertical" 
                HorizontalAlign="Center">
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
                            
        
        SelectCommand="SELECT [FirstName], [LastName], [Company], [CustomerID] FROM [Customers] ORDER BY [CustomerID] DESC">
</asp:SqlDataSource>
	<div class="auto-style1">
		<asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
            HorizontalAlign="Center" PageSize="24">
			<AlternatingRowStyle BackColor="White" />
			<Columns>
				<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
				<asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
				<asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
				<asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
				<asp:CommandField ShowSelectButton="True" />
			</Columns>
			<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
			<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
			<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
		</asp:GridView>
	</div>
</asp:Panel></td></tr></table></form></body></html>