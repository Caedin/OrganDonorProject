<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeRecipients
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Recipients</h2>
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
                Recipient ID
            </td>
            <td>
                Original ID
            </td>
            <td>
                Date Registered
            </td>
        </tr>
        <% for(int i=0;i<Model.numberOfRecipients;i++)
           { %>
            <tr>
                <td >
                    <a href=""><%: Model.RecipientsIDs[i] %></a>
                </td>
                <td >
                    <%: Model.RepcipientOriginalIDs[i] %>
                </td>
                <td >
                    <%: Model.DatesRegistered[i] %>
                </td >
            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>
