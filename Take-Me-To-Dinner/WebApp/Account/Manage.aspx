﻿<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebApp.Account.Manage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link href="../Content/ManageAccount.css?v=3" rel="stylesheet" type="text/css" />
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
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="LinkAddPlace" Text="Add Place" OnClick="LinkAddPlace_Click" Font-Size="Large"
                                CssClass="center" Font-Bold="true" CausesValidation="false" ForeColor="Black" />
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="LinkAdmin" Text="Manage Users" OnClick="LinkAdmin_Click" Font-Size="Large"
                                CssClass="center" Font-Bold="true" CausesValidation="false" ForeColor="Black" />
                        </div>
                    </div>
                    
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
                        <div class="row">
                            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                                <asp:LinkButton runat="server" ID="BecomePartner" Text="Become a partner" Font-Bold="true" Visible="false" OnClick="BecomePartner_Click" ></asp:LinkButton>
                            </div>
                            <div class="col-sm-offset-4 col-sm-8 col-xs-12">
                                <asp:Label ID="lblRequestedSucces" runat="server" Visible="false" />
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
                    <%-- CHANGE PASSWORD --%>
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
                    <%-- ADD PLACE --%>
                    <asp:PlaceHolder runat="server" ID="AddPlaceForm" Visible="false">
                        <h1 class="title center">Add a place</h1>
                        <br /><br />
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1">
                                <asp:TextBox runat="server" ID="PlaceName" CssClass="form-control" placeholder="Place name"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox runat="server" ID="PlaceAdress" CssClass="form-control" placeholder="Adress"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox runat="server" ID="PlaceTelephone" CssClass="form-control" placeholder="Telephone" TextMode="Phone"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1">
                                <asp:TextBox runat="server" ID="PlaceWebsite" CssClass="form-control" placeholder="Website"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox runat="server" ID="PlaceLat" CssClass="form-control" placeholder="Latitude" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox runat="server" ID="PlaceLong" CssClass="form-control" placeholder="Longitude" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1">
                                <asp:Label runat="server" ID="lblPlaceTypes" Text="PLACE TYPE" CssClass="center grey"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlPlaceTypes" DataTextField="Type" DataValueField="IdPlaceType" AutoPostBack="false" 
                                    DataSourceID="ldsTypes" CssClass="form-control"/>
                            </div>
                            <div class="col-sm-3">
                                <asp:Label runat="server" ID="lblPlaceAveragePrice" Text="AVERAGE MENU PRICE" CssClass="center grey"></asp:Label>
                                <asp:TextBox runat="server" ID="PlaceAveragePrice" CssClass="form-control" placeholder="Avg price" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-sm-3 ">
                                <asp:Label runat="server" ID="lblPlaceCities" Text="CHOOSE A CITY" CssClass="center grey"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlPlaceCities" DataTextField="Name" DataValueField="IdCity" AutoPostBack="false" 
                                    DataSourceID="ldsCities" CssClass="form-control"/>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1">
                                <asp:Label runat="server" ID="lblPlaceOpenTime" Text="OPEN TIME" CssClass="center grey"></asp:Label>
                                <asp:TextBox runat="server" ID="PlaceOpenTime" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                            <div class="col-sm-3 col-sm-offset-3">
                                <asp:Label runat="server" ID="lblPlaceCloseTime" Text="CLOSE TIME" CssClass="center grey"></asp:Label>
                                <asp:TextBox runat="server" ID="PlaceCloseTime" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                            
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-9 col-sm-offset-1">
                                <asp:TextBox runat="server" ID="PlaceDescription" CssClass="form-control" TextMode="MultiLine" Rows="3" 
                                    placeholder="Description" Width="100%" MaxLength="300"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1">
                                <asp:Label runat="server" ID="lblPlaceUploadPhoto" Text="MAIN PHOTO" CssClass="center grey" />
                                <asp:FileUpload runat="server" ID="PlaceUploadPhoto"  />
                                <asp:Label runat="server" ID="lblPlaceUploadPhotoMessage" />
                            </div>
                            <div class="col-sm-3 col-sm-offset-3">
                                <asp:Label runat="server" ID="lblPlaceUploadPhotos" Text="OTHER PHOTOS" CssClass="center grey" />
                                <asp:FileUpload runat="server" ID="PlaceUploadPhotos" AllowMultiple="true" />
                                <asp:Label runat="server" ID="lblPlaceUploadPhotosMessage" />
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-sm-5 col-sm-offset-1">
                                <asp:Image runat="server" ID="imgPlaceUploadPhotoPreview" Width="150px" Height="100px" />
                            </div>
                        </div>--%>
                        <br />
                        <div class="row">
                            <div class="col-sm-3 col-sm-offset-1">
                                <asp:Button runat="server" ID="btnAddPlace" Text="Add place" OnClick="btnAddPlace_Click" />
                            </div>
                        </div>
                        
                    </asp:PlaceHolder>
                    <%-- MANAGE USERS --%>
                    <asp:PlaceHolder runat="server" ID="ManageUsersForm" Visible="false">
                        <h1 class="title center">Users</h1>
                        <br /><br />
                        
                        <asp:GridView runat="server" ID="grdUsers" Visible="true" DataKeyNames="Id" DataSourceID="odsUsers" AutoGenerateColumns="false"
                            SkinID="Professional" Font-Name="Verdana"
                            Font-Size="10pt" Cellpadding="4"
                            HeaderStyle-BackColor="#444444"
                            HeaderStyle-ForeColor="White"
                            AlternatingRowStyle-BackColor="#dddddd" CssClass="center"
                            AllowSorting="false"
                            HeaderStyle-HorizontalAlign="Center"
                            OnRowCommand="grdUsers_RowCommand"
                            OnRowDeleting="grdUsers_RowDeleting">
                            <Columns>
                                <asp:CommandField DeleteText="Delete" ShowDeleteButton="true"/>
                                <asp:BoundField DataField="Id" ReadOnly="true" HeaderText="Id User" InsertVisible="false" SortExpression="IdUser" Visible="false">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" ReadOnly="true" HeaderText="Email" >
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EmailConfirmed" ReadOnly="true" HeaderText="Email confirmed" >
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Role">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRole" runat="server" Text='<%# GetUserRole(Eval("Id").ToString())%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnMakePartner" runat="server" CausesValidation="false" CommandName="MakePartner"
                                                Text='<%#GetLinkText(Eval("Id").ToString()) %>' CommandArgument='<%# Eval("Id") %>' Visible='<%# IsButtonVisible(Eval("Id").ToString())%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>
                        
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
    <asp:LinqDataSource
        ID="ldsTypes"
        runat="server"
        ContextTypeName="Business.EntitiesContext"
        TableName="PlacesTypes">
    </asp:LinqDataSource>
    <asp:ObjectDataSource
        ID="odsUsers"
        runat="server"
        TypeName="Business.Managers.UsersManager"
        DataObjectTypeName="Business.AspNetUser"
        SelectMethod="GetAllUsers"
        OnSelecting="odsUsers_Selecting">

    </asp:ObjectDataSource>

</asp:Content>
