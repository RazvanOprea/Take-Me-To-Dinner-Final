<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="Content/SearchPage.css" rel="stylesheet" />

    
    <div class="box">
        <h1 class="header1">TAKE ME TO DINNER</h1>
        <h2 class="header2">Find the best place to eat, drink and have lots of fun tonight.</h2>
        <br />
        <div class="container-4">
            <input type="search" id="search" placeholder="What are you looking for?..." />
            <button class="icon"><i class="fa fa-search"></i></button>
        </div>
    </div>

</asp:Content>
