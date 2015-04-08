<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.MedicalPersonnelInfoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Donor <%: Model.donorID  %> Information</h2>
    <div class="SummaryParagraph">
        <ul style="list-style-type:none">
        <li>Medical Personnel ID: <%: Model.medicalPersonnelId %></li>
        <li>Medical Facility: <%: Model.medicalFacility %></li>
        <li>User Name: <%: Model.userName %></li>
        <li>Phone Number: <%: Model.phoneNumber %></li>
        <li>Date/Time Created: <%: Model.create_time %></li>
        <li>Email: <%: Model.contactEmail %></li>
        <li>Validated User Value: <%: Model.validatedUser %></li>
        </ul>        
   </div>
</asp:Content>
