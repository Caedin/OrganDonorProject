<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	OrgansReport
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Organs Information</h2>
    <br />
    <form action="/Reports/OrganResults" method="get">
    <select name="Organs" >
    <option >   Select Organ Type   </option>
    <option > Heart</option>
    <option > Kidney </option>
    <option > Liver </option>
    <option > Lungs </option>
    <option > Pancreas </option>
    </select>
    <select name="Avail" >
    <option >   Select Availability   </option>
    <option > Available</option>
    <option > Not Available </option>
    </select>
    <p><input type="submit" /></p>
    </form>
    <ul id="nav">
        <li><a href="/Reports/Index">Go Back</a></li>
    </ul>


</asp:Content>
