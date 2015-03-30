<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.RecipientInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2>Recipient Information</h2>
    <!--<h3>Recipients under your account: </h3>-->
    
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
                    4
                </td>
                <td >
                    <%: Model.organNeeded %>
                </td>
<td >
                    45
                </td>
<td >
                    <%: Model.gender %>
                </td>
    <td >
                    Type A
                </td>
                <td >
                    <%: Model.phone %>
                </td>
                <td >
                    12/21/2013
                </td>
            </tr>
           
      </table>
   </div>
</asp:Content>
