<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeRecipients
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UserHomeRecipients</h2>
    <h3>Recipients under your account: <%: Model.numberOfRecipients %></h3>
    <ul id="nav">
      <li><a href="/UserHome/UserHomeDonors">Donors</a></li>
      <li><a href="/UserHome/UserHomeRecipients">Recipiants</a></li>
      <li><a href="/UserHome/UserHomeOrgans">Organs</a></li>
    </ul>
    <div class="CssTableSmooth" style="float:left;">
        <table >
        <tr>
            <td>
                Rrecipient ID
            </td>
        </tr>
        <% foreach (var ID in Model.RecipientsIDs)
           { %>
            <tr>
                <td >
                    <%: ID %>
                </td>
            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>
