<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	RecipientsResults
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Current Wait List </h2>
    <p>Organ: <%:Model.result1 %></p>
    <p>Blood Type: <%:Model.result2 %></p>
    <div class="CssTableSmooth">
        <table>
        <tr>
            <td>
                Recipient ID
            </td>
            <td>
                Severity
            </td>
            <td>
                Age
            </td>
            <td>
                Gender
            </td>
            <td>
                Registration Date
            </td>
        </tr>
        

        <% for (int i = 0; i < Model.recipientsWaiting.Count();i++)
           { %>
            <tr>
                <td >
                  <%: Model.recipientsWaiting[i].recepID%>
                </td>
                <td >
                  <%: Model.recipientsWaiting[i].severity%>
                </td>
                <td >
                  <%: Model.recipientsWaiting[i].age%>
                </td>
                <td >
                  <%: Model.recipientsWaiting[i].gender%>
                </td>
                <td >
                  <%: Model.recipientsWaiting[i].waitTime%>
                </td>
            </tr>
            <% } %>
      </table>
   </div>
   
</asp:Content>
