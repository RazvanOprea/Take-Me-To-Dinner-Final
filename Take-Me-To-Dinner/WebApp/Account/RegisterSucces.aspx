<%@ Page Title="Email Confirmation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterSucces.aspx.cs" Inherits="WebApp.Account.RegisterSucces" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <p>
                A confirmation email was sent to the email adress used for register. Click <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">here</asp:HyperLink>  to login             
            </p>
        </asp:PlaceHolder>
    </div>
</asp:Content>
