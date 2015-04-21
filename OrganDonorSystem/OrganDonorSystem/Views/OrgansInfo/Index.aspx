<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.OrgansInfoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2>Organ Information</h2>
       
    <ul id="nav">
        <li><a href="/UserHome/UserHomeOrgans">Go Back</a></li>
    </ul>
    <br />
    <br />

    <div class="SummaryParagraph">
        <ul style="list-style-type:none">
        <li>Organ ID: <%: Model.OrganID %></li>
        <li>Original ID: <%: Model.OriginalID %></li>
        <li>Organ Type: <%: Model.organTypeName %></li>
        <li>Blood Type: <%: Model.bloodTypeName %></li>
        <li>Date Organ was obtained: <%: Model.dateAqcuired %></li>
        <li>Date Organ expires: <%: Model.expirationDate %></li>
        <li>Medical Personnel ID organ is assigned to: <%: Model.MedicalPersonnelID %></li>
        <li>Recipient ID if assigned: <%: Model.Recipient_RecipientID %></li>
        </ul>
    </div>
</asp:Content>
