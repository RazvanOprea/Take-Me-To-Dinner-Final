<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>
<%@ Register Assembly="DevExpress.Web.v18.1" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"  >
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css" />
    <%--<link rel="stylesheet" href="Content/SearchPage.css"  type="text/css" />--%>
    <link rel="stylesheet" href="Content/Site2.css" type="text/css" />
    <style type="text/css">
      .dropdown-cities{
          margin-top: 10px;
          margin-left:70px;
          -webkit-appearance: none;
          background:url(Content/Images/SearchPopOut.png);
          background-position:right;
          background-repeat:no-repeat;
          outline: none !important;
          -webkit-border-radius: 5px;
          -moz-border-radius: 5px;
          border-radius: 5px;
          box-shadow: 0 2px 2px 1px rgba(0, 0, 0, 0.2) !important;
          
      }
      .dropdown-cities:hover, .dropdown-cities:active, .dropdown-cities:focus{
          outline: none !important;         
      }
     
      
     
      
    </style>

    <div class="index-content" id="IndexContent">
        <div class="index-search">
            <h3>Search for a Restaurant</h3>
            <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity" AppendDataBoundItems="true"
                     CssClass="dropdown-cities" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged" AutoPostBack="true"
                     Width="510px" Height="48px" Font-Size="24px">
                <asp:listitem Value="" Text="Select a city for tonight" ></asp:listitem>
            </asp:dropdownlist>

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
