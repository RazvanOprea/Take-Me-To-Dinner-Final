<%@ Page Title="Email Confirmation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterSucces.aspx.cs" Inherits="WebApp.Account.RegisterSucces" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Content/Account.css" />

    <div class="center">
        <br />
        <h2 class="title center"><%: Title %></h2>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <br />
            <p class="center">
                A confirmation email was sent to the email adress used for register. Click <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">here</asp:HyperLink>  to login             
            </p>
        </asp:PlaceHolder>
    </div>
</asp:Content>
