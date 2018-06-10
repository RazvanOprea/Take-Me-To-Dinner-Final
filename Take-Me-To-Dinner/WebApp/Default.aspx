<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>
<%@ Register Assembly="DevExpress.Web.v18.1" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"  >
    
    <link rel="stylesheet" href="Content/SearchPage.css?version=8" type="text/css" />

    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 col-xs-12">
                    <div class="search-container">
                        <div class="blank_row"></div>
                        <h3>Search for a Restaurant</h3>
                        <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity" AppendDataBoundItems="true"
                                CssClass="form-control dropdown-cities center" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged" AutoPostBack="true"
                                Width="80%" Height="48px" OnInit="ddlCities_Init">
                            <asp:listitem Value="" Text="Select a city for tonight..." ></asp:listitem>
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
