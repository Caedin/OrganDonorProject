<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	RecipientsReport
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>RecipientsReport</h2>

    <form action="/Reports/RecipientsResults" method="get">
    <select name="Recip" >
    <option >   Select State   </option>
    <option > Texas</option>
    <option > Louisiana </option>
    <option > Georgia </option>
    </select>
    <select name="Severe" >
    <option >   Select Severity   </option>
    <option > 1 </option>
    <option > 2 </option>
    </select>
    <p><input type="submit" /></p>
    </form>
    


</asp:Content>
