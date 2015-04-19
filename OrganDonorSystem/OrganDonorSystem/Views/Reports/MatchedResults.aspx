<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MatchedResults
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Match Results </h2>
    <p> Year: <%: Model.result1%> </p>
    <p>  Status: <%: Model.result2%>  </p>
    <div class="CssTableSmooth">
        <table>
        <tr>
            <td>
                Transaction ID
            </td>
            <td>
                Organ ID
            </td>
            <td>
                Organ Type
            </td>
            <td>
                Recipient ID
            </td>
            <td>
                Date of Match
            </td>

        </tr>
        

        <% for (int i = 0; i < Model.matchedList.Count();i++)
           { %>
            <tr>
                <td >
                  <%: Model.matchedList[i].transID%>
                </td>
                <td >
                  <%: Model.matchedList[i].organID%>
                </td>
                <td >
                  <%: Model.matchedList[i].organType%>
                </td>
                <td >
                  <%: Model.matchedList[i].recipientID%>
                </td>
                <td >
                  <%: Model.matchedList[i].dateMatched%>
                </td>


            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>
