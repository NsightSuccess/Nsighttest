<%@ Page Language="VB" MasterPageFile="MasterPage.master" Title="NSightSuccess" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: justify;
            width: 973px;
        }
        .style18
        {
            text-align: left;
        }
        .style19
        {
            width: 100%;
            height: 171px;
        }
    .style20 {
	font-size: large;
	font-weight: bold;
}
        .auto-style3 {
            font-weight: bold;
        }
        .auto-style4 {
            width: 70%;
        }
        .auto-style7 {
            font-family: Calibri;
        }
        .auto-style8 {
            text-align: justify;
            font-family: Calibri;
            font-size: large;
            font-weight: normal;
        }
        .auto-style9 {
            width: 1345px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <h1 class="auto-style3">
        <table align="center" class="auto-style4">
            <tr>
                <td class="auto-style9">
                    <span class="auto-style7">Welcome to GeraldTesting</span><br />
                </td>
            </tr>
            <tr>
                <td style="font-family: Calibri; font-size: large" class="auto-style9">
    <p class="auto-style8">
        This NSight Assessment Center provides clients with online assessment tools developed to address selection, management, coaching and teambuilding needs.</p>
    <p class="auto-style8">
        If you are already a registered user you may click on <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/insight_login.asp">Account Management</asp:HyperLink>&nbsp;or have been invited to complete an on-line assessment, click on 
        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="/insight_login.asp?action=taketest">Take Test</asp:HyperLink>
        . You will need to have an authorization code to proceed.</p>
    <p class="auto-style8">
        Our expertise in organizational assessment offers our clients the assurance of positive, cost-effective information to enhance hiring, training and management effectiveness. Our products and services can be customized for differences in geography, management styles and corporate cultures. Clients can access our library of National Hiring Standards or have their own standards developed.</p>
    <p class="auto-style8">
        We also provide coaching and assessments to individuals regarding their career related needs.</p>
    <p class="auto-style8">
        The investment for the various assessment options can be reviewed on the
        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/product_information.aspx">Product Info</asp:HyperLink>
&nbsp;page.</p>
    <p class="auto-style8">
        If you have any questions about how to utilize this site or to visit with one of our senior associates to discuss your unique needs, please feel free to
        <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/contact_us.aspx">Contact Us</asp:HyperLink>
&nbsp;or call us at <strong>800.852.2001 or 817.707.6266</strong>.</p>
    
                </td>
            </tr>
        </table>
    </h1>
    
</asp:Content>

<asp:Content ID="Content5" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    <div class="style18">
        <table align="center" class="style19">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/gfx/ATPSymbol.gif" style="text-align: center" Height="102px" Width="107px" />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/nsight2/index.htm">Deeper Nsights</asp:HyperLink>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>



