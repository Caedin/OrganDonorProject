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
</body>
</html>


</asp:Content>