<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="VB" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
<title>Verio_Cust_ProfileID_edit</title>
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

<form id="form1" runat="server">
<div>
		<p class="style3"><a href="insight_acct.asp?action=vendoracct">
<img border="0" src="images/BACK.GIF" width="122" height="42">
		</a></p>
	</div>
	<div class="style2">
	<asp:GridView id="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" Caption="Verio Test ProfileID Editor" 
            DataKeyNames="CustomerID,ProfileID" DataSourceID="SqlDataSource1" 
            CellPadding="4" ForeColor="#333333" SelectedIndex="0" 
            HorizontalAlign="Center" EnableModelValidation="True" PageSize="25">
		<PagerSettings PageButtonCount="30" Position="Top" />
		<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
		<Columns>
			<asp:commandfield ShowSelectButton="True">
			</asp:commandfield>
			<asp:hyperlinkfield DataNavigateUrlFields="ProfileID" DataNavigateUrlFormatString="/insight_mgmt.asp?action=results2&amp;
					ProfileID={0}" DataTextField="ProfileID" DataTextFormatString="{0}" HeaderText="ProfileID" SortExpression="ProfileID" Target="_blank">
			</asp:hyperlinkfield>
			<asp:boundfield DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" Visible="False">
			</asp:boundfield>
			<asp:boundfield DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID">
			</asp:boundfield>
			<asp:boundfield DataField="DateTaken" HeaderText="DateTaken" SortExpression="DateTaken" DataFormatString="{0:d}">
			</asp:boundfield>
			<asp:boundfield DataField="DateTaken" DataFormatString="{0:t}" HeaderText="TimeTaken" SortExpression="DateTaken">
			</asp:boundfield>
			<asp:boundfield DataField="Salutation" HeaderText="Salutation" SortExpression="Salutation">
			</asp:boundfield>
			<asp:boundfield DataField="First" HeaderText="First" SortExpression="First">
			</asp:boundfield>
			<asp:boundfield DataField="Last" HeaderText="Last" SortExpression="Last">
			</asp:boundfield>
			<asp:boundfield DataField="Position" HeaderText="Position" SortExpression="Position">
			</asp:boundfield>
			<asp:boundfield DataField="Email" HeaderText="Email" SortExpression="Email">
			</asp:boundfield>
			<asp:boundfield DataField="pwUsed" HeaderText="pwUsed" SortExpression="pwUsed">
			</asp:boundfield>
			<asp:commandfield ShowEditButton="True">
			</asp:commandfield>

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
		<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
		<PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333" />
		<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
		<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="White" />
	</asp:GridView>
	</div>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
    DeleteCommand="DELETE FROM [Cust_Profiles] WHERE [ProfileID] = @ProfileID" 
    InsertCommand="INSERT INTO [Cust_Profiles] ([CustomerID], [ProductID], [DateTaken], [Salutation], [First], [Last], [Position], [Email], [pwUsed]) VALUES (@CustomerID, @ProductID, @DateTaken, @Salutation, @First, @Last, @Position, @Email, @pwUsed)" 
    SelectCommand="SELECT * FROM [Cust_Profiles] ORDER BY [ProfileID] DESC" 
    
    
    
    
    
    UpdateCommand="UPDATE [Cust_Profiles] SET [CustomerID] = @CustomerID, [ProductID] = @ProductID, [DateTaken] = @DateTaken, [Salutation] = @Salutation, [First] = @First, [Last] = @Last, [Position] = @Position, [Email] = @Email, [pwUsed] = @pwUsed WHERE [ProfileID] = @ProfileID">
		<DeleteParameters>
			<asp:parameter Name="ProfileID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:parameter Name="CustomerID" Type="Int32" />
			<asp:parameter Name="ProductID" Type="Int32" />
			<asp:parameter Name="DateTaken" Type="DateTime" />
			<asp:parameter Name="Salutation" Type="String" />
			<asp:parameter Name="First" Type="String" />
			<asp:parameter Name="Last" Type="String" />
			<asp:parameter Name="Position" Type="String" />
			<asp:parameter Name="Email" Type="String" />
			<asp:parameter Name="pwUsed" Type="String" />
			<asp:parameter Name="ProfileID" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:parameter Name="CustomerID" Type="Int32" />
			<asp:parameter Name="ProductID" Type="Int32" />
			<asp:parameter Name="DateTaken" Type="DateTime" />
			<asp:parameter Name="Salutation" Type="String" />
			<asp:parameter Name="First" Type="String" />
			<asp:parameter Name="Last" Type="String" />
			<asp:parameter Name="Position" Type="String" />
			<asp:parameter Name="Email" Type="String" />
			<asp:parameter Name="pwUsed" Type="String" />
		</InsertParameters>
	</asp:SqlDataSource>
	<br />
	<asp:FormView id="FormView1" runat="server" CellPadding="4" 
    DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" ForeColor="#333333" HorizontalAlign="Center">
		<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
		<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
		<EditItemTemplate>
			CustomerID:
			<asp:label id="CustomerIDLabel1" runat="server" Text='<%# Eval("CustomerID") %>' />
			<br />
			FirstName:
			<asp:textbox id="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
			<br />
			LastName:
			<asp:textbox id="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
			<br />
			Company:
			<asp:textbox id="CompanyTextBox" runat="server" Text='<%# Bind("Company") %>' />
			<br />
			Address1:
			<asp:textbox id="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
			<br />
			City:
			<asp:textbox id="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
			<br />
			State:
			<asp:textbox id="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
			<br />
			Zip:
			<asp:textbox id="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
			<br />
			Phone:
			<asp:textbox id="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
			<br />
			Fax:
			<asp:textbox id="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>' />
			<br />
			Email:
			<asp:textbox id="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
			<br />
			Password:
			<asp:textbox id="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
			<br />
			ccName:
			<asp:textbox id="ccNameTextBox" runat="server" Text='<%# Bind("ccName") %>' />
			<br />
			ccType:
			<asp:textbox id="ccTypeTextBox" runat="server" Text='<%# Bind("ccType") %>' />
			<br />
			ccNumber:
			<asp:textbox id="ccNumberTextBox" runat="server" Text='<%# Bind("ccNumber") %>' />
			<br />
			ccMonth:
			<asp:textbox id="ccMonthTextBox" runat="server" Text='<%# Bind("ccMonth") %>' />
			<br />
			ccYear:
			<asp:textbox id="ccYearTextBox" runat="server" Text='<%# Bind("ccYear") %>' />
			<br />
			Newsletter:
			<asp:checkbox id="NewsletterCheckBox" runat="server" Checked='<%# Bind("Newsletter") %>' />
			<br />
			<asp:linkbutton id="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
			&nbsp;<asp:linkbutton id="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
		</EditItemTemplate>
		<InsertItemTemplate>
			FirstName:
			<asp:textbox id="FirstNameTextBox0" runat="server" 
                Text='<%# Bind("FirstName") %>' />
			<br />
			LastName:
			<asp:textbox id="LastNameTextBox0" runat="server" 
                Text='<%# Bind("LastName") %>' />
			<br />
			Company:
			<asp:textbox id="CompanyTextBox0" runat="server" 
                Text='<%# Bind("Company") %>' />
			<br />
			Address1:
			<asp:textbox id="Address1TextBox0" runat="server" 
                Text='<%# Bind("Address1") %>' />
			<br />
			City:
			<asp:textbox id="CityTextBox0" runat="server" Text='<%# Bind("City") %>' />
			<br />
			State:
			<asp:textbox id="StateTextBox0" runat="server" Text='<%# Bind("State") %>' />
			<br />
			Zip:
			<asp:textbox id="ZipTextBox0" runat="server" Text='<%# Bind("Zip") %>' />
			<br />
			Phone:
			<asp:textbox id="PhoneTextBox0" runat="server" Text='<%# Bind("Phone") %>' />
			<br />
			Fax:
			<asp:textbox id="FaxTextBox0" runat="server" Text='<%# Bind("Fax") %>' />
			<br />
			Email:
			<asp:textbox id="EmailTextBox0" runat="server" Text='<%# Bind("Email") %>' />
			<br />
			Password:
			<asp:textbox id="PasswordTextBox0" runat="server" 
                Text='<%# Bind("Password") %>' />
			<br />
			ccName:
			<asp:textbox id="ccNameTextBox0" runat="server" Text='<%# Bind("ccName") %>' />
			<br />
			ccType:
			<asp:textbox id="ccTypeTextBox0" runat="server" Text='<%# Bind("ccType") %>' />
			<br />
			ccNumber:
			<asp:textbox id="ccNumberTextBox0" runat="server" 
                Text='<%# Bind("ccNumber") %>' />
			<br />
			ccMonth:
			<asp:textbox id="ccMonthTextBox0" runat="server" 
                Text='<%# Bind("ccMonth") %>' />
			<br />
			ccYear:
			<asp:textbox id="ccYearTextBox0" runat="server" Text='<%# Bind("ccYear") %>' />
			<br />
			Newsletter:
			<asp:checkbox id="NewsletterCheckBox0" runat="server" 
                Checked='<%# Bind("Newsletter") %>' />
			<br />
			<asp:linkbutton id="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
			&nbsp;<asp:linkbutton id="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
		</InsertItemTemplate>
		<ItemTemplate>
			Customer Information:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomerID:
			<asp:label id="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
			<br />
			Contact Name:
			<asp:label id="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
			&nbsp;<asp:label id="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
			<br />
			Company:
			<asp:label id="CompanyLabel" runat="server" Text='<%# Bind("Company") %>' />
			<br />
			Address1:
			<asp:label id="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
			<br />
			City:
			<asp:label id="CityLabel" runat="server" Text='<%# Bind("City") %>' />
			, State:
			<asp:label id="StateLabel" runat="server" Text='<%# Bind("State") %>' />
			&nbsp;&nbsp; Zip:
			<asp:label id="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
			<br />
			Phone:
			<asp:label id="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
			&nbsp;&nbsp; Fax:
			<asp:label id="FaxLabel" runat="server" Text='<%# Bind("Fax") %>' />
			<br />
			Email:
			<asp:label id="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
			<br />
			Password:
			<asp:label id="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
			<br />
			<br />
		</ItemTemplate>
		<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
		<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
	</asp:FormView>
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" 
    
    
    
    
    
    SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
		<SelectParameters>
			<asp:controlparameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
</form>

</body>

</html>
