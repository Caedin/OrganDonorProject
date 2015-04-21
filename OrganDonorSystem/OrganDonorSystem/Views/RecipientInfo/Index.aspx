<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.RecipientInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2>Recipient Information</h2>
    <ul id="nav">
        <li><a href="/UserHome/UserHomeRecipients">Go Back</a></li>
    </ul>
    <br />
    <br />      
    <div class="SummaryParagraph">
        
        <ul style="list-style-type:none">
        <li>Recipient ID: <%: Model.recipientID %></li>
        <li>Severity Level: <%: Model.severity %></li>
        <li>Organ Needed: <%: Model.organNeeded %></li>
        <li>Age: <%: Model.age %></li>
        <li>Gender: <%: Model.gender %></li>
        <li>Blood Type: <%: Model.bloodType %></li>
        <li>Registration Date: <%: Model.registration %></li>
        </ul>        
   </div>
</asp:Content>
