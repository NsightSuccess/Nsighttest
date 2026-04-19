<%@ Page language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>Test Results</title>
      <style type="text/css">
          #form1 {
              text-align: center;
          }
          .auto-style1 {}
      </style>
</head>
<body>
    <form id="form1" runat="server">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ProfileID" DataValueField="ProfileID">
            </asp:DropDownList>
            <br />
            <asp:DataList ID="DataList6" runat="server" DataKeyField="ProfileID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" style="text-align: left">
                <ItemTemplate>
                    <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                    <br />
                    <asp:Label ID="CompanyLabel" runat="server" Text='<%# Eval("Company") %>' />
                    <br />
                    <asp:Label ID="CoCodeLabel" runat="server" Text='<%# Eval("CoCode") %>' />
                    <br />
                    <asp:Label ID="SalutationLabel" runat="server" Text='<%# Eval("Salutation") %>' />
                    <br />
                    <asp:Label ID="Assessment_ProfileLabel" runat="server" Text='<%# Eval("[Assessment Profile]") %>' />
                    <br />
                    <asp:Label ID="PositionLabel" runat="server" Text='<%# Eval("Position") %>' />
                    <br />
                    <asp:Label ID="PDescLabel" runat="server" Text='<%# Eval("PDesc") %>' />
                    <br />
                    <asp:Label ID="DateTakenLabel" runat="server" Text='<%# Eval("DateTaken") %>' />
                    <br />
                    <asp:Label ID="pwUsedLabel" runat="server" Text='<%# Eval("pwUsed") %>' />
                    <br />
                    <asp:Label ID="ProfileIDLabel" runat="server" Text='<%# Eval("ProfileID") %>' />
                </ItemTemplate>
            </asp:DataList>

        <p class="auto-style1">
        <asp:DataList ID="DataList1" runat="server" Caption="Verbal Reasoning" DataSourceID="SqlDataSource3" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal" Width="600px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList2" runat="server" Caption="Numerical Reasoning" DataSourceID="SqlDataSource4" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal" Width="600px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList3" runat="server" Caption="Vocabulary" datasourceid="SqlDataSource5" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal" Width="600px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList4" runat="server" Caption="Visual Perception" datasourceid="SqlDataSource6" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal" Width="600px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList5" runat="server" Caption="NSight Personality Questionnaire" datasourceid="SqlDataSource7" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal" Width="600px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </p>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [ProfileID] FROM [Cust_Profiles] ORDER BY [ProfileID] DESC"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT * FROM [Tester_Profiles] WHERE ([ProfileID] = @ProfileID) ORDER BY [ProfileID] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                  </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="Verbal Reasoning" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="Numerical Reasoning" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="Vocabulary" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="Visual Perception" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="Nsight Personality Questionnaire" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT ProfileID, First, Last FROM Cust_Profiles WHERE (ProfileID = @ProfileID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProfileID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

      </form>
  </body>
</html>
