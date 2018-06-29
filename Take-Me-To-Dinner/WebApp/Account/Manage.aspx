<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebApp.Account.Manage" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link href="../Content/ManageAccount.css?v=2" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function pageLoad() {
            $('.body-content').hide().show();
        }
    </script>
    <div class="container main-container">
        <br />
        <div class="row">
            <div class="col-sm-3">
                <div class="custom-container">
                    <div class="subtitle center">My Account</div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="LinkProfile" Text="My profile" OnClick="LinkProfile_Click" Font-Size="Large"
                                CssClass="center" Font-Bold="true" CausesValidation="false" ForeColor="Black"/>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="LinkPassword" Text="Change password" OnClick="LinkPassword_Click" Font-Size="Large"
                                CssClass="center" Font-Bold="true" CausesValidation="false" ForeColor="Black" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
            <div class="col-sm-9">
                <div class="custom-container">
                    <asp:PlaceHolder runat="server" ID="ProfileForm" Visible="true">
                        <h1 class="title center">Profile</h1>
                        <br /><br />
                        <div class="row">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-sm-offset-4 col-sm-5 col-xs-12" Text="Email"></asp:Label>
                            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Enter your Email" 
                                        ReadOnly="true"></asp:TextBox>  
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                        CssClass="text-danger" ErrorMessage="The email field is required." ValidationGroup="ProfileFormGroup" />
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <asp:Label runat="server" AssociatedControlID="Role" CssClass="col-sm-offset-4 col-sm-5 col-xs-12" Text="Role"></asp:Label>
                            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user-secret" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="Role" CssClass="form-control" placeholder="Enter your Role" 
                                        ReadOnly="true"></asp:TextBox>  
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Role"
                                        CssClass="text-danger" ErrorMessage="The role field is required." ValidationGroup="ProfileFormGroup" />
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                                <asp:Label runat="server" ID="lblCities" Text="City" Font-Bold="true"></asp:Label>
                                <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity"
                                        CssClass="form-control dropdown-cities" AutoPostBack="false" Width="320px" >
                                </asp:dropdownlist>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                                <asp:Label runat="server" ID="lblRating" Text="Minimum rating" Font-Bold="true"></asp:Label>
                                <asp:dropdownlist id="ddlRating" runat="server" CssClass="form-control" AutoPostBack="false" Width="320px" >
                                    <asp:ListItem Text="1" Value="1" Selected="True" />
                                    <asp:ListItem Text="2" Value="2" />
                                    <asp:ListItem Text="3" Value="3" />
                                    <asp:ListItem Text="4" Value="4" />
                                    <asp:ListItem Text="5" Value="5" />
                                </asp:dropdownlist>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-offset-4 col-sm-3 col-xs-12">
                                <asp:Label runat="server" AssociatedControlID="txtMinPrice" Text="Min price"></asp:Label>
                                <asp:TextBox runat="server" ID="txtMinPrice" CssClass="form-control" placeholder="Min" TextMode="Number" Width="100px"></asp:TextBox>  
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMinPrice"
                                    CssClass="text-danger" ErrorMessage="The min price field is required." ValidationGroup="ProfileFormGroup" />
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <asp:Label runat="server" AssociatedControlID="txtMinPrice" Text="Max price" ></asp:Label>
                                <asp:TextBox runat="server" ID="txtMaxPrice" CssClass="form-control" placeholder="Max" TextMode="Number" Width="100px" ></asp:TextBox>  
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMaxPrice"
                                    CssClass="text-danger" ErrorMessage="The max price field is required." ValidationGroup="ProfileFormGroup" />
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-sm-offset-4 col-sm-3">
                                <asp:Label ID="SuccesMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                <asp:Button runat="server" ID="btnUpdateProfile" Text="Update" CssClass="btn btn-default" BackColor="#f88e1d"
                                    ForeColor="White" Width="100px" Height="40px" ValidationGroup="ProfileFormGroup" OnClick="btnUpdateProfile_Click" />
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <asp:Button runat="server" ID="btnResetProfile" Text="Reset" CssClass="btn btn-default" BackColor="#f7f7f7" 
                                    BorderWidth="1px" BorderStyle="Solid" BorderColor="#C0C0C0" Width="100px" Height="40px" ValidationGroup="ProfileFormGroup"
                                    OnClick="btnResetProfile_Click" CausesValidation="false"/>
                            </div>
                        </div>
                        <div class="row">
                            <asp:CompareValidator runat="server" ControlToValidate="txtMinPrice" ControlToCompare="txtMaxPrice" Operator="LessThan" 
                                    ErrorMessage="The min price cannot be greater than max price." ValidationGroup="ProfileFormGroup" Type="Integer"/>
                            <asp:CompareValidator runat="server" ControlToValidate="txtMaxPrice" ValueToCompare="100" Operator="LessThanEqual"
                                ErrorMessage="The max price cannot be greater than 100." ValidationGroup="ProfileFormGroup" Type="Integer" />
                            <asp:CompareValidator runat="server" ControlToValidate="txtMinPrice" ValueToCompare="0" Operator="GreaterThanEqual"
                                ErrorMessage="The min price cannot be lower than 0." ValidationGroup="ProfileFormGroup" Type="Integer" />
                        </div>
                        
                    </asp:PlaceHolder>
                    <%-- SOME DELIMITATION --%>
                    <asp:PlaceHolder runat="server" ID="ChangePasswordForm" Visible="false">
                        <h1 class="title center">Change Password</h1>
                        <br /><br />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="CurrentPassword" CssClass="col-sm-offset-4 col-sm-5" Text="Current password"></asp:Label>
                            <div class="col-sm-offset-4 col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" placeholder="Enter current Password" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The current password field is required." ValidationGroup="ChangePasswordForm" />
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="NewPassword" CssClass="col-sm-offset-4 col-sm-5" Text="New password"></asp:Label>
                            <div class="col-sm-offset-4 col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" placeholder="Enter new Password" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="ChangePasswordForm" />
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ConfirmNewPassword" CssClass="col-sm-offset-4 col-sm-5" Text="Confirm new password"></asp:Label>
                            <div class="col-sm-offset-4 col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm your Password" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm new password field is required." />
                                    <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match." ValidationGroup="ChangePasswordForm" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePasswordForm" OnClick="ChangePassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                        <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorMessage" />
                        </p>
                     
                        
                    </asp:PlaceHolder>

                </div>
            </div>
        </div>
        
    </div>

    <asp:LinqDataSource
        ID="ldsCities"
        runat="server"
        ContextTypeName="Business.EntitiesContext"
        TableName="Cities">
    </asp:LinqDataSource>
    <%--<div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                   
                </dl>
            </div>
        </div>
    </div>--%>

</asp:Content>
