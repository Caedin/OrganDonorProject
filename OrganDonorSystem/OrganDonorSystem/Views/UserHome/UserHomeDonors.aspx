﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.UserHomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeDonors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UserHomeDonors</h2>
    <h3>Donors under your account: <%: Model.numberOfDonors %></h3>
    <ul id="nav">
      <li><a href="/UserHome/UserHomeDonors">Donors</a></li>
      <li><a href="/UserHome/UserHomeRecipients">Recipiants</a></li>
      <li><a href="/UserHome/UserHomeOrgans">Organs</a></li>
    </ul>
    <div class="CssTableSmooth" style="float:left;">
        <table>
        <tr>
            <td>
                Donor ID
            </td>
        </tr>
        <% foreach (var ID in Model.DonorsIDs)
           { %>
            <tr>
                <td >
                    <%: ID %>
                </td>
            </tr>
            <% } %>
      </table>
   </div>
</asp:Content>
