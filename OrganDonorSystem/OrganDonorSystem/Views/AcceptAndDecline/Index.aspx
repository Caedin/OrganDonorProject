<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.MatchingViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Page of Matches
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
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
            <td>
                Accept or Decline
            </td>
        </tr>
        <% for(int i=0;i<Model.listOfMatches.Count();i++)
           { %>
            <tr>
                <td >
                  <%: Model.listOfMatches[i].transactionID %>
                </td>
                <td >
                  <%: Model.listOfMatches[i].organID %>
                </td>
                <td >
                  <%: Model.listOfMatches[i].organType %>
                </td >
                <td >
                  <%: Model.listOfMatches[i].recipientID %>
                </td >
                <td >
                  <%: Model.listOfMatches[i].dateMatched %>
                </td >
                <td >
                    <% if(Model.listOfMatches[i].acceptedOrDeclined==null)
                       { %>
                           <%=Html.ActionLink("Accept", "Accept",
                                        "AcceptAndDecline", new {tID = Model.listOfMatches[i].transactionID }, null)%>
                           <%=Html.ActionLink("Decline", "Decline",
                                        "AcceptAndDecline", new {tID = Model.listOfMatches[i].transactionID }, null)%>
                    <% }
                       else
                       { %>
                           <%: Model.listOfMatches[i].acceptedOrDeclined %> 
                    <% } %>
                </td >
            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>