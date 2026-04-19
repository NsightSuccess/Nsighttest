<%@ Page language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>LocalScore Test Results</title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
        <asp:DetailsView ID="DetailsView1" runat="server" Width="350px" AutoGenerateRows="False" DataKeyNames="ProfileID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" GridLines="None" style="text-align: left" >
            <Fields>
                <asp:BoundField DataField="Customer" ShowHeader="False" />
                <asp:BoundField DataField="Company" ShowHeader="False" />
                <asp:BoundField DataField="CoCode" ShowHeader="False" />
                <asp:BoundField DataField="Salutation" ShowHeader="False" />
                <asp:BoundField DataField="Assessment Profile" ShowHeader="False" />
                <asp:BoundField DataField="Position" ShowHeader="False" />
                <asp:BoundField DataField="PDesc" ShowHeader="False" />
                <asp:BoundField DataField="DateTaken" ShowHeader="False" />
                <asp:BoundField DataField="pwUsed" ShowHeader="False" />
                <asp:BoundField DataField="ProfileID" ShowHeader="False" />
            </Fields>
        </asp:DetailsView>
        </p>
        <p>
        <asp:DataList ID="DataList1" runat="server" Caption="Verbal Reasoning" DataSourceID="SqlDataSource3" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="350px" style="text-align: center" >
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList2" runat="server" Caption="Numerical Reasoning" DataSourceID="SqlDataSource4" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="350px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList3" runat="server" Caption="Vocabulary" datasourceid="SqlDataSource5" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="350px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
            </ItemTemplate>
        </asp:DataList>
        </p>
        <p>
        <asp:DataList ID="DataList4" runat="server" Caption="Visual Perception" datasourceid="SqlDataSource6" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="350px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
            </ItemTemplate>
        </asp:DataList>
        </p>
       <p>
        <asp:DataList ID="DataList5" runat="server" Caption="NSight Personality Questionnaire" datasourceid="SqlDataSource7" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="350px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
            </ItemTemplate>
        </asp:DataList>
        </p>
       <p>
        <asp:DataList ID="DataList6" runat="server" Caption="Nsight Positive Impressions Questionnaire" datasourceid="SqlDataSource8" HorizontalAlign="Center" RepeatColumns="1" ShowFooter="False" ShowHeader="False" Width="350px" style="text-align: center">
            <ItemTemplate>
                <asp:Label ID="TestAnswerLabel" runat="server" Text='<%# Eval("TestAnswer") %>' />
            </ItemTemplate>
        </asp:DataList>
        </p>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [ProfileID] FROM [Cust_Profiles] ORDER BY [ProfileID] DESC"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT Customer, Company, CoCode, Salutation, [Assessment Profile], Position, PDesc, DateTaken, pwUsed, ProfileID FROM Tester_Profiles WHERE (ProfileID = @ProfileID3) ORDER BY ProfileID DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProfileID3" QueryStringField="profileid3" />
                  </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT TestAnswer FROM TestResults WHERE (ProfileID = @ProfileID3) AND (PDesc = @PDesc) ORDER BY TestResultsID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="ProfileID3" QueryStringField="ProfileID3" />
                    <asp:Parameter DefaultValue="Verbal Reasoning" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID3) AND ([PDesc] = @PDesc)) ORDER BY TestResultsID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="ProfileID3" QueryStringField="ProfileID3" />
                    <asp:Parameter DefaultValue="Numerical Reasoning" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID3) AND ([PDesc] = @PDesc)) ORDER BY TestResultsID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="ProfileID3" QueryStringField="ProfileID3" />
                    <asp:Parameter DefaultValue="Vocabulary" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID3) AND ([PDesc] = @PDesc)) ORDER BY TestResultsID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="ProfileID3" QueryStringField="ProfileID3" />
                    <asp:Parameter DefaultValue="Visual Perception" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID3) AND ([PDesc] = @PDesc)) ORDER BY TestResultsID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="ProfileID3" QueryStringField="ProfileID3" />
                    <asp:Parameter DefaultValue="Nsight Personality Questionnaire" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] FROM [TestResults] WHERE (([ProfileID] = @ProfileID3) AND ([PDesc] = @PDesc)) ORDER BY TestResultsID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="ProfileID3" QueryStringField="ProfileID3" />
                    <asp:Parameter DefaultValue="Positive Impressions Questionnaire" Name="PDesc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

      </form>
  </body>
</html>
