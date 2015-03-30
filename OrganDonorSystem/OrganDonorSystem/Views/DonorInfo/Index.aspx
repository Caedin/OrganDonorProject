<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.DonorInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Donor Information</h2>
       
    <div class="CssTableSmooth" style="float:left;">
        <table>
        <tr>
            <td>
                Donor ID
            </td>
            <td>
                Age
            </td>
            <td>
                Gender
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
                3
            </td>
            <td >
                <%: Model.age %>
             </td>
             <td >
                <%: Model.gender %>
             </td>
             <td >
                <%: Model.phone %>
             </td>
             <td >
                <%: Model.registration %>
             </td>
        </tr>
        </table>
    </div>
</asp:Content>

