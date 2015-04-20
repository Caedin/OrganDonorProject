<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	OrganResults
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Organ History </h2>
     <p>Organ: <%: Model.result1%> </p>
     <p>Status: <%:Model.result2 %></p>
     <div class="CssTableSmooth">
        <table>
        <tr>
            <td>
                Organ ID
            </td>
            <td>
                Blood Type
            </td>
            <td>
                Date Obtained
            </td>
            <td>
                Expiration Date
            </td>
        </tr>
        

        <% for (int i = 0; i < Model.availableOrgans.Count();i++)
           { %>
            <tr>
                <td >
                  <%: Model.availableOrgans[i].organID%>
                </td>
                <td >
                  <%: Model.availableOrgans[i].bloodTypeID%>
                </td>
                <td >
                  <%: Model.availableOrgans[i].regDate%>
                </td>
                <td >
                  <%: Model.availableOrgans[i].exp%>
                </td>
            </tr>
            <% } %>
      </table>
   </div>

</asp:Content>
