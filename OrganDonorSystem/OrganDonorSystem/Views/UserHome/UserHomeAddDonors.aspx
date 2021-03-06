﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OrganDonorSystem.Models.Donor>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UserHomeAddDonors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add Donors</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            
            <div class="editor-label">
                <%: Html.Label("Phone Number") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.phoneNumber) %>
                <%: Html.ValidationMessageFor(model => model.phoneNumber) %>
            </div>
            
            <!--
            <div class="editor-label">
                <%: Html.Label("Registration Date") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.registrationDate) %>
                <%: Html.ValidationMessageFor(model => model.registrationDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("End Date") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.endDate) %>
                <%: Html.ValidationMessageFor(model => model.endDate) %>
            </div>
            -->

            <div class="editor-label">
                <%: Html.Label("Original ID") %>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.originalID) %>
                <%: Html.ValidationMessageFor(model => model.originalID) %>
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
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

