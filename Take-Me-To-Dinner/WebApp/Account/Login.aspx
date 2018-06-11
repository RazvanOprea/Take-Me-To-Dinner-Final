<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Account.Login" Async="true" %>

<%--<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>--%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Content/Site.css?v=8" />


    <div class="form-horizontal">
        <br />
        <h1 class="title center">Login</h1>
        <br /><br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-sm-offset-4 col-sm-5 col-xs-12" Text="Email" Font-Size="Large"></asp:Label>
            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Enter your Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-sm-offset-4 col-sm-5 col-xs-12" Text="Password" Font-Size="Large"></asp:Label>
            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Enter your Password"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
            </div>
        </div>
        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
            <div class="col-sm-offset-5 col-sm-7 text-danger">
                <asp:Literal runat="server" ID="FailureText" />
            </div>
        </asp:PlaceHolder>
        <br />
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <div class="checkbox">
                    <asp:CheckBox runat="server" ID="RememberMe" />
                    <asp:Label runat="server" AssociatedControlID="RememberMe" Text="Remember me?" Font-Size="Medium"></asp:Label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default submit" BackColor="#f88e1d"
                    ForeColor="White" Width="130px" Height="50px" />
            </div>
        </div>
    </div>
    <div class="col-sm-offset-5 col-sm-7">
        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" Text="Register as a new user" Visible="false"></asp:HyperLink>
    </div>
    <div class="col-sm-offset-5 col-sm-7">             
        <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled" Text="&nbsp;Forgot password?"></asp:HyperLink>           
    </div>


        <%--<div class="col-sm-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>--%>
  
</asp:Content>
