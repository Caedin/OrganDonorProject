<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	RecipientsReport
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Recipients Information </h2>
    <br />
    <form action="/Reports/RecipientsResults" method="get">
    <select name="Organs" >
    <option > Select Organ Needed   </option>
    <option > Heart</option>
    <option > Kidney </option>
    <option > Liver </option>
    <option > Lungs </option>
    <option > Pancreas </option>
    </select>
    <select name="Blood" >
    <option >   Select Blood Type   </option>
    <option > A+</option>
    <option > A- </option>
    <option > AB+ </option>
    <option > AB- </option>
    <option > B+ </option>
    <option > B- </option>
    <option > O+ </option>
    <option > O- </option>
    </select>
    <p><input type="submit" /></p>
    </form>
    <ul id="nav">
        <li><a href="/Reports/Index">Go Back</a></li>
    </ul>


</asp:Content>
