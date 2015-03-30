<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.RecipientInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2>Recipient Information</h2>
        
    <div class="CssTableSmooth" style="float:left;">
        <table>
        <tr>
            <td>
                Recipient ID
            </td>
            <td>
                Severity
            </td>
            <td>
                Organ Needed
            </td>
            <td>
                Age
            </td>
            <td>
                Gender
            </td>
            <td>
                Blood Type
            </td>
            <td>
                Phone Number
            </td>
            <td>
                Registration Date
            </td>
        </tr>
        <tr>
            <td >
                22
            </td>
            <td >
                <%: Model.severity %>
            </td>
            <td >
                <%: Model.organNeeded %>
            </td>
            <td >
                <%: Model.age %>
            </td>
            <td >
                <%: Model.gender %>
            </td>
            <td >
                <%: Model.bloodType %>
            </td>
            <td >
                <%: Model.phone %>
            </td>
            <td >
                <%: Model.registration%>
            </td>
        </tr>
        </table>
   </div>
</asp:Content>
