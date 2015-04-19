<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	OrgansReport
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2>Organs Information</h2>
   
    
    <form action="/Reports/OrganResults" method="get">
    <select name="Organs" >
    <option >   Select Organ Type   </option>
    <option > Heart</option>
    <option > Lungs </option>
    <option > Kidney </option>
    <option > Liver </option>
    </select>
    <select name="Blood" >
    <option >   Select Blood Type   </option>
    <option > O+</option>
    <option > O- </option>
    <option > A- </option>
    <option > A+ </option>
    </select>
    
    <select name="Avail" >
    <option >   Select Availability   </option>
    <option > Available</option>
    <option > Not Available </option>
    </select>
    <p><input type="submit" /></p>
    </form>
    

</asp:Content>
