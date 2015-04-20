<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.ViewModels.ReportsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MatchedReport
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Matched Organs Report</h2>
    <br />
    <form action="/Reports/MatchedResults" method="get">
    <select name="Matched" >
    <option >   Select Year   </option>
    <option > 2000</option>
    <option > 2001 </option>
    <option > 2002 </option>
    <option > 2003 </option>
    <option > 2004</option>
    <option > 2005 </option>
    <option > 2006 </option>
    <option > 2007 </option>
    <option > 2008</option>
    <option > 2009 </option>
    <option > 2010 </option>
    <option > 2011 </option>
    <option > 2012</option>
    <option > 2013 </option>
    <option > 2014 </option>
    <option > 2015 </option>
    </select>
    <select name="Accept" >
    <option >   Select Status   </option>
    <option > Accepted</option>
    <option > Declined </option>
    </select>
    <p><input type="submit" /></p>
    </form>
    <ul id="nav">
        <li><a href="/Reports/Index">Go Back</a></li>
    </ul>

</asp:Content>
