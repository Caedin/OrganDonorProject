<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainPageLoginAndRegister.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <asp:Table ID="Table2" runat="server" Height="116px" Width="100%" 
        HorizontalAlign="Justify">
    <asp:TableRow ID="TableRow1" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Names="Impact" Font-Size="XX-Large" ForeColor="White" Height="65px" 
        HorizontalAlign="Left" VerticalAlign="Middle">
        <asp:TableCell ID="TableCell4" runat="server" Width="40%" BackColor="#0033CC">

        Welcome to the University of Houston Organ Donation Center, if you are an authorized user please login

        </asp:TableCell>
        <asp:TableCell ID="TableCell5" runat="server" Width="10%"> </asp:TableCell>
        <asp:TableCell ID="TableCell6" runat="server" Width="50%">

        <asp:Image ID="MagicBanner" ImageUrl="~/Content/images/image11.jpg" runat="server" Width="400px" Height="160" />

        
</asp:TableCell>
    </asp:TableRow>
</asp:Table>

<br />

<asp:Table ID="Table1" runat="server" Height="116px" Width="100%" 
        HorizontalAlign="Justify">
    <asp:TableRow runat="server" BorderColor="#0033CC" 
        BorderStyle="Groove" BorderWidth="5px" Font-Bold="True" Font-Italic="True" 
        Font-Names="Britannic Bold" Font-Size="XX-Large" ForeColor="Red" Height="65px" 
        HorizontalAlign="Center" VerticalAlign="Middle">
        <asp:TableCell ID="TableCell1" runat="server" BorderColor="#0033CC" 
            BorderStyle="Groove" BorderWidth="5px" Width="32%" BackColor="#CCFFFF">
        Why Donate?        </asp:TableCell>
        <asp:TableCell ID="TableCell2" runat="server" Width="2%"> </asp:TableCell>
        <asp:TableCell ID="TableCell3" runat="server" BorderColor="#0033CC" 
            BorderStyle="Groove" BorderWidth="5px" Width="32%" BackColor="#CCFFFF">
        How You Can Help
        </asp:TableCell>
        <asp:TableCell runat="server" Width="2%"></asp:TableCell>
        <asp:TableCell runat="server" Width="32%" BackColor="#CCFFFF" 
            BorderColor="#0033CC" BorderStyle="Groove" BorderWidth="5px">
            Becoming a Donor
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow runat="server" Font-Bold="True" Font-Size="Large" 
        ForeColor="#0033CC" HorizontalAlign="Justify" VerticalAlign="Top">
        <asp:TableCell runat="server">
        <p>Because you may save up to 8 lives through organ donation and enhance many others through tissue donation.</p>
        <p>Last year alone, organ donors made more than 28,000 transplants possible. Another one million people received cornea and other tissue transplants that helped them recover from trauma, bone damage, spinal injuries, burns, hearing impairment and vision loss.</p>
        <p>Unfortunately, thousands die every year waiting for a donor organ that never comes. You have the power to change that.</p>
        </asp:TableCell>
        <asp:TableCell runat="server"></asp:TableCell>
        <asp:TableCell runat="server">
        <p>REGISTER</p>
        &#9642; Make the commitment<br />
        &#9642; Sign up on your state's donor registry.<br />
        <p>INFORM OTHERS</p>
        &#9642; Don't keep your decision a secret.<br />
        &#9642; Share the news<br />
        &#9642; Tell your family and friends about your decision. Share information with them when they have questions.<br />
        &#9642; Speak up<br />
        &#9642; Talk about donation at every opportunity.<br />

        

        </asp:TableCell>
        <asp:TableCell runat="server"></asp:TableCell>
        <asp:TableCell runat="server">
        <p>Organ and tissue donation and transplantation provide a second chance at life for thousands of people each year. 
        You have the opportunity to be one of the individuals who make these miracles happen.</p>
        <p>By deciding to be a donor, you give the gift of hope ... hope for the thousands of individuals 
        awaiting organ transplants and hope for the millions of individuals whose lives could be enhanced through tissue transplants.</p>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<br />
<br />





</asp:Content>

