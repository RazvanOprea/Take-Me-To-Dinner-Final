<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="WebApp.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Content/Account.css" />

    <br />
    
    <br />
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <div class=" col-sm-8">
                <h2 class="title"><%:Title %></h2>
            </div>
            <asp:PlaceHolder id="loginForm" runat="server">
                <div class="form-horizontal">
                    <br /><br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass=" col-sm-8" Text="Email" Font-Size="Large"></asp:Label>
                        <div class="col-sm-8">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Enter your Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="text-danger" ErrorMessage="The email field is required." />
                            </div>
                        </div>
                    </div>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <br />
                    <div class="form-group">
                        <div class=" col-sm-8 col-xs-offset-1 col-xs-11">
                            <asp:Button runat="server" OnClick="Forgot" Text="Email Link" CssClass="btn btn-default btn-round" BackColor="#f88e1d"
                                ForeColor="White" Width="130px" Height="50px" />
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                <p class="text-info center">
                    Please check your email to reset your password.
                </p>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
