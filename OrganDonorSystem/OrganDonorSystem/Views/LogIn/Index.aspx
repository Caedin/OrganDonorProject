<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title>Login Form</title>
</head>
<body>
    <div>
    
    <% using (Html.BeginForm("Process", "Login"))
       { %>
    
    
        <label for="UserName">User Name:</label>
        <br />
        <%= Html.TextBox("inputUserName") %>
        
        <br /><br />
            
        <label for="Password">Password:</label>
        <br />
        <%= Html.Password("inputPassword") %>
        
        <br /><br />
        
        <input type="submit" value="Process" />
    
    <% } %>
    
    </div>
</body>
</html>


</asp:Content>