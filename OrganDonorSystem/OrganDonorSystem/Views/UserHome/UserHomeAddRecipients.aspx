<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.Models.Recipient>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeAddRecipients
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UserHomeAddRecipients</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.severity) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.severity) %>
                <%: Html.ValidationMessageFor(model => model.severity) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.orignialID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.orignialID) %>
                <%: Html.ValidationMessageFor(model => model.orignialID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.gender) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.gender) %>
                <%: Html.ValidationMessageFor(model => model.gender) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.age) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.age) %>
                <%: Html.ValidationMessageFor(model => model.age) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.organsOrganID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.organsOrganID) %>
                <%: Html.ValidationMessageFor(model => model.organsOrganID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.organTypeOrganTypeID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.organTypeOrganTypeID) %>
                <%: Html.ValidationMessageFor(model => model.organTypeOrganTypeID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.bloodTypeBloodTypeID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.bloodTypeBloodTypeID) %>
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

