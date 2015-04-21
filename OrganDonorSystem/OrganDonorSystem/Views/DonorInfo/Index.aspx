<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.DonorInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Donor Information</h2>
       
    <ul id="nav">
        <li><a href="/UserHome/UserHomeDonors">Go Back</a></li>
    </ul>
    <br />
    <br />
    <div class="SummaryParagraph">
        <ul style="list-style-type:none">
        <li>Donor ID: <%: Model.theDonor.DonorID %></li>
        <li>Original ID: <%: Model.theDonor.originalID %></li>
        <li>Age: <%: Model.theDonor.age %></li>
        <li>Gender: <%: Model.theDonor.gender %></li>
        <li>Phone Number: <%: Model.theDonor.phoneNumber %></li>
        <li>Registration Date: <%: Model.theDonor.registrationDate %></li>
        </ul>        
   </div>

    
</asp:Content>

