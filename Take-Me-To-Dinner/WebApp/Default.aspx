<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>
<%@ Register Assembly="DevExpress.Web.v18.1" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"  >
    
    <link rel="stylesheet" href="Content/SearchPage.css?version=4" type="text/css" />
    <%--<div class="index-content" id="IndexContent">
        <div class="index-search">
            <h3>Search for a Restaurant</h3>
            <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity" AppendDataBoundItems="true"
                     CssClass="dropdown-cities" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged" AutoPostBack="true"
                     Width="510px" Height="48px" Font-Size="24px">
                <asp:listitem Value="" Text="Select a city for tonight" ></asp:listitem>
            </asp:dropdownlist>
        </div>
    </div>--%>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                    <div class="search-container">
                        <br />
                        <h3>Search for a Restaurant</h3>
                        <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity" AppendDataBoundItems="true"
                                CssClass="dropdown-cities center" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged" AutoPostBack="true"
                                Width="80%" Height="48px" Font-Size="24px">
                            <asp:listitem Value="" Text="Select a city for tonight" ></asp:listitem>
                        </asp:dropdownlist>
                    </div>
            </div>
        </div>
    </div>
 
<asp:LinqDataSource 
    ID="ldsPlaces" 
    runat="server" 
    ContextTypeName="Business.EntitiesContext" 
    TableName="Places">
</asp:LinqDataSource>

<asp:LinqDataSource
    ID="ldsCities"
    runat="server"
    ContextTypeName="Business.EntitiesContext"
    TableName="Cities">
</asp:LinqDataSource>


</asp:Content>
