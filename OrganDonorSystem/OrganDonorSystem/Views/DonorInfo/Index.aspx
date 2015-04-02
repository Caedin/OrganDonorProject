<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.DonorInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Donor <%: Model.donorID  %> Information</h2>
       
    <ul id="nav">
        <li><a href="/UserHome/UserHomeDonors">Go Back</a></li>
    </ul>
    <br />
    <br />
    <div class="SummaryParagraph">
        <ul style="list-style-type:none">
        <li>Age: <%: Model.age %></li>
        <li>Gender: <%: Model.gender %></li>
        <li>Phone Number: <%: Model.phone %></li>
        <li>Registration Date: <%: Model.registration %></li>
        </ul>        
   </div>

    
</asp:Content>

