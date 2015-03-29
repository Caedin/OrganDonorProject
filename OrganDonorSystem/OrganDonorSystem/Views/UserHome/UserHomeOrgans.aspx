<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeOrgans
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Organs</h2>
    <h3>Donors under your account: <%: Model.numberOfOrgans %></h3>
    <ul id="nav">
      <li><a href="/UserHome/UserHomeDonors">Donors</a></li>
      <li><a href="/UserHome/UserHomeRecipients">Recipiants</a></li>
      <li><a href="/UserHome/UserHomeOrgans">Organs</a></li>
    </ul>
    <div class="CssTableSmooth" style="float:left;">
        <table>
        <tr>
            <td>
                Organ ID
            </td>
            <td>
                Original ID
            </td>
        </tr>
       <% for(int i=0;i<Model.numberOfOrgans;i++)
           { %>
            <tr>
                <td >
                    <a href=""><%: Model.OrganIDs[i] %></a>
                </td>
                <td >
                    <%: Model.OrganOriginalIDs[i] %>
                </td>
            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>
