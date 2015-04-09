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
                <%: Html.LabelFor(model => model.OrganID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OrganID) %>
                <%: Html.ValidationMessageFor(model => model.OrganID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.organType_organtypeID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.organType_organtypeID) %>
                <%: Html.ValidationMessageFor(model => model.organType_organtypeID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.BloodType_BloodTypeID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.BloodType_BloodTypeID) %>
                <%: Html.ValidationMessageFor(model => model.BloodType_BloodTypeID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.dateAqcuired) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.dateAqcuired) %>
                <%: Html.ValidationMessageFor(model => model.dateAqcuired) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.expirationDate) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.expirationDate) %>
                <%: Html.ValidationMessageFor(model => model.expirationDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.MedicalPersonnelID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.MedicalPersonnelID) %>
                <%: Html.ValidationMessageFor(model => model.MedicalPersonnelID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OriginalID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OriginalID) %>
                <%: Html.ValidationMessageFor(model => model.OriginalID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.available) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.available) %>
                <%: Html.ValidationMessageFor(model => model.available) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Recipient_RecipientID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Recipient_RecipientID) %>
                <%: Html.ValidationMessageFor(model => model.Recipient_RecipientID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OriginalID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OriginalID) %>
                <%: Html.ValidationMessageFor(model => model.OriginalID) %>
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

