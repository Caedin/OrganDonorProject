<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <h2>Reports</h2>

    <p>Please select which report you would like to view:</p>
    <br />
    <br />
    <ul>
      <li><a href="/Reports/OrgansReport">Current Organs Available</a></li>
      <li><a href="/Reports/RecipientsReport">Current Recipients Waiting</a></li>
      <li><a href="/Reports/MatchedReport">Matches Completed</a></li>
    </ul> <h2>Index</h2>

</asp:Content>
