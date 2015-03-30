<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.DonorInfoIndexViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Donor Information</h2>
    <!--<h3>Recipients under your account: </h3>-->
    
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
                    Male
                </td>
<td >
                    281-342-1432
                </td>
<td >
                    02/22/2015
                </td>

            </tr>
           
      </table>
   </div>
</asp:Content>

