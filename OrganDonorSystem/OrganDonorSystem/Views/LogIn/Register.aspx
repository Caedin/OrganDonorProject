<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.Models.Medical_Personnel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Register
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Register</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.userName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.userName) %>
                <%: Html.ValidationMessageFor(model => model.userName) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.userPassword) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.userPassword) %>
                <%: Html.ValidationMessageFor(model => model.userPassword) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.medicalFacility) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.medicalFacility) %>
                <%: Html.ValidationMessageFor(model => model.medicalFacility) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.contactEmail) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.contactEmail) %>
                <%: Html.ValidationMessageFor(model => model.contactEmail) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.phoneNumber) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.phoneNumber) %>
                <%: Html.ValidationMessageFor(model => model.phoneNumber) %>
            </div>
              
            <div class="editor-label">
                <%: Html.LabelFor(model => model.State_StateID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.State_StateID) %>
                <%: Html.ValidationMessageFor(model => model.State_StateID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.City_CityID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.City_CityID) %>
                <%: Html.ValidationMessageFor(model => model.City_CityID) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to Login", "Index") %>
    </div>

</asp:Content>

