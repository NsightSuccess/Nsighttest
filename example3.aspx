<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Example3</title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
      <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ProfileID" DataSourceID="SqlDataSource1" Height="50px" Width="350px">
          <Fields>
              <asp:BoundField DataField="Customer" HeaderText="Customer" ReadOnly="True" ShowHeader="False" SortExpression="Customer" />
              <asp:BoundField DataField="Company" HeaderText="Company" ShowHeader="False" SortExpression="Company" />
              <asp:BoundField DataField="CoCode" HeaderText="CoCode" ShowHeader="False" SortExpression="CoCode" />
              <asp:BoundField DataField="Salutation" HeaderText="Salutation" ShowHeader="False" SortExpression="Salutation" />
              <asp:BoundField DataField="Assessment_Profile" HeaderText="Assessment_Profile" ReadOnly="True" ShowHeader="False" SortExpression="Assessment_Profile" />
              <asp:BoundField DataField="Position" HeaderText="Position" ShowHeader="False" SortExpression="Position" />
              <asp:BoundField DataField="PDesc" HeaderText="PDesc" ShowHeader="False" SortExpression="PDesc" />
              <asp:BoundField DataField="DateTaken" HeaderText="DateTaken" ShowHeader="False" SortExpression="DateTaken" />
              <asp:BoundField DataField="pwUsed" HeaderText="pwUsed" ShowHeader="False" SortExpression="pwUsed" />
              <asp:BoundField DataField="ProfileID" HeaderText="ProfileID" ReadOnly="True" ShowHeader="False" SortExpression="ProfileID" />
          </Fields>
      </asp:DetailsView>

      <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="Verbal_ReasoningLabel" runat="server" Text='<%# Eval("[Verbal Reasoning]") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Verbal Reasoning</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="Numerical_ReasoningLabel" runat="server" Text='<%# Eval("[Numerical Reasoning]") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Numerical Reasoning</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="VocabularyLabel" runat="server" Text='<%# Eval("Vocabulary") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Vocabulary</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource5">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="Visual_PerceptionLabel" runat="server" Text='<%# Eval("[Visual Perception]") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Visual Perception</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource6">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="Personality_QuestionnaireLabel" runat="server" Text='<%# Eval("[Personality Questionnaire]") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Personality Questionnaire</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource7">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="Positive_Impressions_QuestionnaireLabel" runat="server" Text='<%# Eval("[Positive Impressions Questionnaire]") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Positive Impressions Questionnaire</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource8">
          <ItemTemplate>
              <tr style="">
                  <td>
                      <asp:Label ID="Reading_ComprehensionLabel" runat="server" Text='<%# Eval("[Reading Comprehension]") %>' />
                  </td>
              </tr>
          </ItemTemplate>
          <LayoutTemplate>
              <table runat="server">
                  <tr runat="server">
                      <td runat="server">
                          <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                              <tr runat="server" style="">
                                  <th runat="server"><br />Reading Comprehension</th>
                              </tr>
                              <tr id="itemPlaceholder" runat="server">
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr runat="server">
                      <td runat="server" style=""></td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:ListView>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [Customer], [Company], [CoCode], [Salutation], [Assessment Profile] AS Assessment_Profile, [Position], [PDesc], [DateTaken], [pwUsed], [ProfileID] FROM [Tester_Profiles] WHERE ([ProfileID] = @ProfileID)">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="" Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] as [Verbal Reasoning] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="" Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Verbal Reasoning" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT TestAnswer AS [Numerical Reasoning] FROM TestResults WHERE (ProfileID = @ProfileID) AND (PDesc = @PDesc)">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="" Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Numerical Reasoning" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] as [Vocabulary] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="" Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Vocabulary" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] as [Visual Perception] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="" Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Visual Perception" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] as [Personality Questionnaire] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="" Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Nsight Personality Questionnaire" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] as [Positive Impressions Questionnaire] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
          <SelectParameters>
              <asp:QueryStringParameter Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Positive Impressions Questionnaire" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:insi40ConnectionString %>" SelectCommand="SELECT [TestAnswer] as [Reading Comprehension] FROM [TestResults] WHERE (([ProfileID] = @ProfileID) AND ([PDesc] = @PDesc))">
          <SelectParameters>
              <asp:QueryStringParameter Name="ProfileID" QueryStringField="profileid3" Type="Int32" />
              <asp:Parameter DefaultValue="Reading Comprehension" Name="PDesc" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  </form>
</body>
</html>
