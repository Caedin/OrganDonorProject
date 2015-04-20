<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Login Form</title>
</head>
<body>
<div style="padding:25px">
    <p style="text-align:center">
    Login
    </p>
        <% using (Html.BeginForm("Login", "Login"))
        { %>
    
    
        <label for="UserName">User Name:</label>
        <br />
        <%= Html.TextBox("inputUserName") %>
        
        <br /><br />
            
        <label for="Password">Password:</label>
        <br />
        <%= Html.Password("inputPassword") %>
        
        <br /><br />
        <input type="submit" value="Log In" />
    
    <% } %>
</div>

Don't have an account? <a href="/Login/Register" title="">Register</a>

<br />
<br />
<br />

<asp:Table ID="Table2" runat="server" Height="116px" Width="100%" 
        HorizontalAlign="Justify">
    <asp:TableRow ID="TableRow1" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Names="Impact" Font-Size="XX-Large" ForeColor="White" Height="65px" 
        HorizontalAlign="Left" VerticalAlign="Middle">
        <asp:TableCell ID="TableCell4" runat="server" Width="40%">

         <asp:Image ID="Image1" ImageUrl="~/Content/images/1.jpg" runat="server" Width="400px" Height="160" />

        
</asp:TableCell>
        <asp:TableCell ID="TableCell5" runat="server" Width="10%"> </asp:TableCell>
        <asp:TableCell ID="TableCell6" runat="server" Width="50%">

        <asp:Image ID="MagicBanner" ImageUrl="~/Content/images/2.jpg" runat="server" Width="400px" Height="160" />

        

</asp:TableCell>
    </asp:TableRow>
</asp:Table>

</body>
</html>


</asp:Content>