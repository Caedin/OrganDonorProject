<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	User Homepage
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Model.userName %>'s Homepage
     <% for (int i = 0; i < Model.numberOfStars; i++)
        { %>
            <asp:Image ID="Star" ImageUrl="~/Content/images/star.png" runat="server"/>
     <% } %>
     </h2>

    <h3>Welcome to your home page! Here you can view all the current Donors, Recipients, and Organs that you have under your account.</h3>
    <ul id="nav">
      <li><a href="/UserHome/UserHomeDonors">Donors</a></li>
      <li><a href="/UserHome/UserHomeRecipients">Recipients</a></li>
      <li><a href="/UserHome/UserHomeOrgans">Organs</a></li>
      <li><a href="/AcceptAndDecline">Matches</a></li>
      <li><a href="/Reports">Reports</a></li>
   </ul>
   <br />
   <br />
   <div class="SummaryParagraph">
        <br />
        <p><b> Your Summary Information:</b></p>
        <p> Number of Donors: <%: Model.numberOfDonors %></p>
        <p> Number of Recipients <%: Model.numberOfRecipients%></p>
        <p> Number of Organs: <%: Model.numberOfOrgans %></p>
        <p> Facility: <%: Model.instName %></p>
        <p> Location: <%: Model.city %>, <%: Model.state %></p>
   </div>


</asp:Content>
