<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	User Homepage
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Username's Homepage</h2>
    <h3>Welcome to your home page! Here you can view all the current Donors, Recepients, and Organs waiting to be matched you have under your account.</h3>
    <ul id="nav">
      <li><a href="/UserHome/UserHomeDonors">Donors</a></li>
      <li><a href="/UserHome/UserHomeRecipients">Recipiants</a></li>
      <li><a href="/UserHome/UserHomeOrgans">Organs</a></li>
   </ul>
   <br />
   <br />
   <div class="SummaryParagraph">
        <br />
        <p><b> Your Summary Infromation:</b></p>
        <p> FirstName Lastname</p>
        <p> Number of Donors: <%: Model.numberOfDonors %></p>
        <p> Number of Recepients <%: Model.numberOfRecipients%></p>
        <p> Number of Organs: <%: Model.numberOfOrgans %></p>
   </div>


</asp:Content>
