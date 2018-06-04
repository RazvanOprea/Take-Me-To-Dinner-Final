<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>
<%@ Register Assembly="DevExpress.Web.v18.1" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"  >
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css" />
    <%--<link rel="stylesheet" href="Content/SearchPage.css"  type="text/css" />--%>
    <link rel="stylesheet" href="Content/Site2.css" type="text/css" />
    <style type="text/css">
       
      
      
    </style>
    

    
    <%--<div class="box">
        <h1 class="header1" id="head1">TAKE ME TO DINNER</h1>
        <h2 class="header2" id="head2">Find the best place to eat, drink and have lots of fun tonight.</h2>
        <br />
        <div class="container-4">
            
            <asp:DropDownList ID="DropDownListPlaces" runat="server" DataSourceID="ldsCities" DataTextField="Name" DataValueField="IdCity" AppendDataBoundItems="true"
                     CssClass="select"  ToolTip="Select" OnSelectedIndexChanged="DropDownListPlaces_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="" Text="What are you looking for?" ></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>--%>

    <div class="index-content" id="IndexContent">
        <div class="index-search">
            <h3>Search for a Restaurant</h3>
            <%--<asp:DropDownList ID="DropDownListPlaces" runat="server" DataSourceID="ldsCities" DataTextField="Name" DataValueField="IdCity" AppendDataBoundItems="true"
                     CssClass="combobox" OnSelectedIndexChanged="DropDownListPlaces_SelectedIndexChanged" AutoPostBack="True"
                     Width="510px" Height="48px" Font-Size="24px">
                <asp:ListItem Value="" Text="Tap to select a city for your restaurant" ></asp:ListItem>
                
            </asp:DropDownList>--%>
            <dx:ASPxComboBox ID="SearchComboBox" ClientInstanceName="SearchComboBox" CssClass="combobox" runat="server" AutoPostBack="true"
                Width="80%" Height="48px" Font-Size="24px" NullText="Click to select a city" NullTextDisplayMode="UnfocusedAndFocused"
                DataSourceID="ldsCities" ValueField="IdCity" TextField="Name" ShowShadow="true" OnSelectedIndexChanged="SearchComboBox_SelectedIndexChanged">
                <ItemStyle CssClass="index-search-listbox-item" Height="40px" />
                <NullTextStyle CssClass="null-text" />
                <ButtonStyle>
                    <HoverStyle BackColor="Transparent"></HoverStyle>
                </ButtonStyle>
                <DropDownButton>
                    <Image Url="~/Content/Images/SearchPopOut.png"></Image>
                </DropDownButton>
                <Paddings PaddingLeft="15px"></Paddings>
            </dx:ASPxComboBox>
        </div>
    </div>
 

    <%--<input type="search" id="search" placeholder="What are you looking for?..." name="searchPlace" />
            <button type="submit" id="btnSearch" formmethod="post" formaction="/About"  class="icon" ><i class="fa fa-search"></i></button>--%>
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
