<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApp.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Content/Site.css?v=7" />

    <div class="form-horizontal">
        <br />
        <h1 class="title center">Register</h1>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <br /> <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-sm-offset-4 col-sm-5 col-xs-12" Text="Email" Font-Size="Large"></asp:Label>
            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Enter your Email"></asp:TextBox>  
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-sm-offset-4 col-sm-5" Text="Password" Font-Size="Large"></asp:Label>
            <div class="col-sm-offset-4 col-sm-8">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Enter your Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-sm-offset-4 col-sm-5" Text="Confirm password" Font-Size="Large"></asp:Label>
            <div class="col-sm-offset-4 col-sm-8">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm your Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
            </div>
        </div>
        <p class="text-danger center">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <br />
        <div class="row">
            <div class="col-sm-offset-5 col-sm-7">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" BackColor="#f88e1d"
                    ForeColor="White" Width="130px" Height="50px" />
            </div>
        </div>
    </div>
</asp:Content>
