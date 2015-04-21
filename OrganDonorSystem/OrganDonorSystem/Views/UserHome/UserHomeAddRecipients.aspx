<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.Models.Recipient>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeAddRecipients
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add Recipients</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>

            <div class="editor-label">
                <%: Html.Label("Severity") %>
            </div>
            <div class="editor-field">
                 <%: Html.DropDownListFor(model => model.severity, new SelectList(new List<Object> { new { Value = '1', text = "1-Not Severe" }, new { Value = '2', text = "2" }, new { Value = '3', text = "3" }, new { Value = '4', text = "4 - Very Severe" }}, "value", "text", '1'))%>
                <%: Html.ValidationMessageFor(model => model.severity) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Orignial ID") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.orignialID) %>
                <%: Html.ValidationMessageFor(model => model.orignialID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Gender") %>
            </div>
            <div class="editor-field">
                 <%: Html.DropDownListFor(model => model.gender, new SelectList(new List<Object> {new{Value = "M", text = "Male"},new {Value = "F",text="Female"}},"value","text","M")) %>
                <%: Html.ValidationMessageFor(model => model.gender) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Age") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.age) %>
                <%: Html.ValidationMessageFor(model => model.age) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Organ Type") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.organTypeOrganTypeID, (IEnumerable<SelectListItem>)ViewData["organTypes"], "Select One")%>
                <%: Html.ValidationMessageFor(model => model.organTypeOrganTypeID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Blood Type") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.bloodTypeBloodTypeID, (IEnumerable<SelectListItem>)ViewData["listBloodTypes"], "Select One")%>
                <%: Html.ValidationMessageFor(model => model.bloodTypeBloodTypeID) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to Home", "Index") %>
    </div>

</asp:Content>

