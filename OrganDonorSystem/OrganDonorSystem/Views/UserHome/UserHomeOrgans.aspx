<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeOrgans
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Organs</h2>
    <h3>Organs under your account: <%: Model.numberOfOrgans %></h3>
    <ul id="nav">
      <li><a href="/UserHome/UserHomeDonors">Donors</a></li>
      <li><a href="/UserHome/UserHomeRecipients">Recipients</a></li>
      <li><a href="/UserHome/UserHomeOrgans">Organs</a></li>
      <li><a href="/UserHome/UserHomeAddOrgans">AddNew</a></li>
    </ul>
    <br />
    <br />
    <br />
    <div class="CssTableSmooth">
        <table>
        <tr>
            <td>
                Organ ID
            </td>
            <td>
                Original ID
            </td>
            <td>
                Expiration Date
            </td>
        </tr>
       <% for(int i=0;i<Model.numberOfOrgans;i++)
           { %>
            <tr>
                <td >
                  <%=Html.ActionLink(Model.addStringPadding(8, Model.theOrgans[i].OrganID.ToString()), "Index", 
                "OrgansInfo", new {dID = Model.theOrgans[i].OrganID}, null) %>
                </td>
                <td >
                    <%: Model.theOrgans[i].OriginalID %>
                </td>
                <td >
                    <%: Model.theOrgans[i].expirationDate %>
                </td>
            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>
