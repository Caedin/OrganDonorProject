<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.Models.Organ>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeAddOrgans
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UserHomeAddOrgans</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.Label("Organ Type") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.organType_organtypeID, (IEnumerable<SelectListItem>)ViewData["organTypes"], "Select One")%>
                <%: Html.ValidationMessageFor(model => model.organType_organtypeID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Blood Type") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.BloodType_BloodTypeID, (IEnumerable<SelectListItem>)ViewData["listBloodTypes"], "Select One")%>
                <%: Html.ValidationMessageFor(model => model.BloodType_BloodTypeID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Date Acquired") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.dateAqcuired) %>
                <%: Html.ValidationMessageFor(model => model.dateAqcuired) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Expiration Date")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.expirationDate) %>
                <%: Html.ValidationMessageFor(model => model.expirationDate) %>
            </div>
            
            
            <div class="editor-label">
                <%: Html.Label("Original ID") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OriginalID) %>
                <%: Html.ValidationMessageFor(model => model.OriginalID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Currently Available") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.available, new SelectList(new List<Object> { new { Value = true, text = "Yes" }, new { Value = false, text = "No" } }, "value", "text", 1))%>
                <%: Html.ValidationMessageFor(model => model.available) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Recipient ID if not available") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Recipient_RecipientID) %>
                <%: Html.ValidationMessageFor(model => model.Recipient_RecipientID) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

